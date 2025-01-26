return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local telescope = require("telescope")

    local config = {
      defaults = {
        file_ignore_patterns = { ".git/", "venv/", "__pycache__" },
        prompt_prefix = "󰭎 ",
        selection_caret = " ",
        entry_prefix = " ",
        sorting_strategy = "ascending"
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
          layout_config = { height = 15 }
        }
      }
    }

    telescope.setup(config)
  end
}
