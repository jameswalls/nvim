require("nord").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = false, -- Configure the colors used when opening a `:terminal` in Neovim
  diff = { mode = "bg" }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
  borders = true, -- Enable the border between verticaly split windows visible
  errors = { mode = "bg" }, -- Display mode for errors and diagnostics
                            -- values : [bg|fg|none]
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = false },
    keywords = {},
    functions = {},
    variables = {},

    -- To customize lualine/bufferline
    bufferline = {
      current = {},
      modified = { italic = true },
    },
  },

  -- colorblind mode
  -- see https://github.com/EdenEast/nightfox.nvim#colorblind
  -- simulation mode has not been implemented yet.
  colorblind = {
    enable = false,
    preserve_background = false,
    severity = {
      protan = 0.0,
      deutan = 0.0,
      tritan = 0.0,
    },
  },

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with all highlights and the colorScheme table
  --- polar_night = {
  ---   origin = "#2E3440", -- nord0
  ---   bright = "#3B4252", -- nord1
  ---   brighter = "#434C5E", -- nord2
  ---   brightest = "#4C566A", -- nord3
  ---   light = "#616E88", -- out of palette
  --- },
  --- snow_storm = {
  ---   origin = "#D8DEE9", -- nord4
  ---   brighter = "#E5E9F0", -- nord5
  ---   brightest = "#ECEFF4", -- nord6
  --- },
  --- frost = {
  ---   polar_water = "#8FBCBB", -- nord7
  ---   ice = "#88C0D0", -- nord8
  ---   artic_water = "#81A1C1", -- nord9
  ---   artic_ocean = "#5E81AC", -- nord10
  --- },
  --- aurora = {
  ---   red = "#BF616A", -- nord11
  ---   orange = "#D08770", -- nord12
  ---   yellow = "#EBCB8B", -- nord13
  ---   green = "#A3BE8C", -- nord14
  ---   purple = "#B48EAD", -- nord15
  --- },
  -- none = "NONE",

  on_highlights = function(hi, c)
	hi["@operator"] = { fg = c.frost.polar_water }
	hi["@variable.builtin"] = { fg = c.snow_storm.origin }
	hi["@field"] = { fg = c.frost.ice }
	hi["@constant"] = { fg = c.aurora.yellow }
  end,
})

vim.cmd.colorscheme "nord"
