return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local line = require("lualine")
    local colors = require("tokyonight.colors").setup()

    local config = {
      options = {
        component_separators = "",
        section_separators = "",
        theme = {
          normal = { c = { fg = colors.fg, bg = colors.bg_dark } },
          inactive = { c = { fg = colors.f, bg = colors.bg_dark } }
        }
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_z = {},
        lualine_x = {},
        lualine_c = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_z = {},
        lualine_x = {},
        lualine_c = {},
      }
    }

    local function insert_left(cmp)
      table.insert(config.sections.lualine_c, cmp)
    end

    local function insert_right(cmp)
      table.insert(config.sections.lualine_x, cmp)
    end

    insert_left({
      function()
        return ""
      end,
      color = function()
        local mode_color = {
          n = colors.green,
          i = colors.red,
          v = colors.blue,
          [''] = colors.blue,
          V = colors.blue,
          c = colors.magenta,
          no = colors.red,
          s = colors.orange,
          S = colors.orange,
          [''] = colors.orange,
          ic = colors.yellow,
          R = colors.violet,
          Rv = colors.violet,
          cv = colors.red,
          ce = colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ['r?'] = colors.cyan,
          ['!'] = colors.red,
          t = colors.red
        }
        return { fg = mode_color[vim.fn.mode()], gui = "bold" }
      end,
      padding = { right = 2, left = 1}
    })

    insert_left({
      "branch",
      icon = "",
      color = { fg = colors.fg, bg = colors.bg_dark, gui = "bold" }
    })
      
    insert_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symblos = { error = " ", warn = " ", info = " "},
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan }
      }
    })

    insert_right({
      "location",
      color = { fg = colors.fg_dark }
    })

    insert_right({
      "encoding"
    })

    insert_right({
      "filetype"
    })

    line.setup(config)
  end
}
