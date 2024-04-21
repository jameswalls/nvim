vim.diagnostic.config({
	virtual_text = false
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end

		local telescope = require("telescope.builtin")
		map('gd', telescope.lsp_definitions, '[G]oto [D]efinition')
		map('gr', function() telescope.lsp_references({ show_line = false }) end, '[G]oto [R]eferences')
		map('gI', telescope.lsp_implementations, '[G]oto [I]mplementation')
		map('td', telescope.lsp_type_definitions, 'Type [D]efinition')
		map('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
		map('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
		map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
		map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
		map('K', vim.lsp.buf.hover, 'Hover Documentation')
		map("H", vim.lsp.buf.signature_help, "Signature Help")
		map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
		map("<leader>e", vim.diagnostic.open_float, "Display Line diagnostics")
	end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

local servers = {
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
	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = 'LuaJIT' },
				workspace = {
					checkThirdParty = false,
					-- library = {
					-- 	'${3rd}/luv/library',
					-- 	unpack(vim.api.nvim_get_runtime_file('', true)),
					-- },
					-- If lua_ls is really slow on your computer, you can try this instead:
					library = { vim.env.VIMRUNTIME },
				},
				completion = {
					callSnippet = 'Replace',
				},
				diagnostics = { disable = { 'missing-fields' } },
			},
		},
	},
}

require('mason').setup()

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
	'stylua', -- Used to format lua code
})

require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require('mason-lspconfig').setup {
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
			require('lspconfig')[server_name].setup(server)
		end,
	},
}

require('lspkind').init({
    -- DEPRECATED (use mode instead): enables text annotations
    --
    -- default: true
    -- with_text = true,

    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = 'symbol_text',

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "󰉿",
      Method = "󰆧",
      Function = "󰊕",
      Constructor = "",
      Field = "󰜢",
      Variable = "󰀫",
      Class = "󰠱",
      Interface = "",
      Module = "",
      Property = "󰜢",
      Unit = "󰑭",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "󰈇",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "󰙅",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "",
    },
})
