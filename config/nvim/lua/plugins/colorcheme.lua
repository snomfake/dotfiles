return {
  "folke/tokyonight.nvim",
  config = function()
    local colors = require("tokyonight")

    local function highlight_telescope(hl, c)
      hl.TelescopeNormal = {
        fg = c.fg_dark,
        bg = c.bg_dark
      }
      hl.TelescopeBorder = {
        fg = c.blue,
        bg = c.bg_dark
      }
      hl.TelescopePromptNormal = {
        fg = c.fg,
        bg = c.bg_dark
      }
      hl.TelescopePromptBorder = {
        fg = c.blue,
        bg = c.bg_dark
      }
      hl.TelescopePromptTitle = {
        fg = c.fg,
        bg = c.bg_dark
      }
      hl.TelescopeResultTitle = {
        fg = c.fg_dark,
        bg = c.bg_dark
      }
      hl.TelescopePreviewTitle = {
        fg = c.fg_dark,
        bg = c.bg_dark
      }
    end

    local config = {
      style = "night",
      styles = {
        comments = { italic = false },
        keywords = { italic = false }
      },
      on_highlights = function(hl, c)
        highlight_telescope(hl, c)
      end
    }
    colors.setup(config)
    vim.cmd[[colorscheme tokyonight]]
  end
}
