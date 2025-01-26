return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local tree = require("nvim-tree")

    local config = {
      renderer = {
        root_folder_label = false
      }
    }

    tree.setup(config)
  end
}
