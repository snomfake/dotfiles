return {
  "lukas-reineke/indent-blankline.nvim",
  commit = "29be0919b91fb59eca9e90690d76014233392bef",
  config = function()
    local ibl = require("ibl")

    local config = {
      scope = {
        enabled = false,
        show_start = false,
        show_end = false
      }
    }

    ibl.setup(config)
  end
}
