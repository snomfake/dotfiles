return {
  "willothy/nvim-cokeline",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local cokeline = require("cokeline")
    local colors = require("tokyonight.colors").setup()

    local config = {
      default_hl = {
        fg = function(buf)
          if buf.is_focused then
            return colors.fg
          else
            return colors.fg_dark
          end
        end
      },
      components = {
        {
          text = function(buf) return "   " .. buf.devicon.icon .. " " end,
          fg = function(buf) return buf.devicon.color end
        },
        {
          text = function(buf) return buf.filename .. " " end
        },
        {
          text = function(buf)
            if buf.is_modified then
              return " 󰧞 "
            else
              return "   "
            end
          end,
          fg = function(buf)
            if buf.is_modified then
              return colors.green
            end
          end
        }
      },
      sidebar = {
        filetype = { "NvimTree" },
        components = {
          {
            text = "           Explorer",
            fg = colors.fg,
            bg = "#16161e",
            style = "bold"
          }
        }
      }
    }
    cokeline.setup(config)
  end
}
