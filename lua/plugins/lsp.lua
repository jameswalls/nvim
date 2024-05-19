return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"j-hui/fidget.nvim",
			opts = {
				notification = {
					window = {
						winblend = 0,
						max_width = 50,
						max_height = 5,
						align = "top"
					}
				}
			}
		},
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
				end
				map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
				map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
				map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
				map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
				map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
				map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
				map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
				map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
				map('K', vim.lsp.buf.hover, 'Hover Documentation')
				map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = 'LuaJIT' },
						workspace = {
							checkThirdParty = false,
							library = { vim.env.VIMRUNTIME },
						},
						completion = {
							callSnippet = 'Replace',
						},
						diagnostics = { disable = { 'missing-fields' } },
					},
				},
			},
			pylsp = {
				settings = {
					pylsp = {
						configurationSources = {"flake8"},
						plugins = {
							pycodestyle = {
								ignore = { "E501" },
								flake8 = {
									enabled = true,
									exclude = { "*/.ipynb_checkpoints/*" },
									ignore = { "E722", "E501"},
								}
							},
							jedi_completion = {
								enabled = true,
								include_function_objects = false,
								include_class_objects = false,
							}
						}
					}
				}
			},
		rust_analyzer = {},
		}

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua",
		})

		require("mason-tool-installer").setup { ensure_installed = ensure_installed }

		local border = {
			{"╭", "FloatBorder"},
			{"─", "FloatBorder"},
			{"╮", "FloatBorder"},
			{"│", "FloatBorder"},
			{"╯", "FloatBorder"},
			{"─", "FloatBorder"},
			{"╰", "FloatBorder"},
			{"│", "FloatBorder"},
		}

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

					server.handlers = {
						["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
						["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
					}
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end
}
