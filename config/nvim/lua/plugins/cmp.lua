return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "onsails/lspkind.nvim"
  },
  config = function()
    local cmp = require("cmp")
    local kind = require("lspkind")

    local config = {
      snippet = {
        expand = function() end
      },
      mapping = {
        ["<tab>"] = cmp.mapping.select_next_item(),
        ["<cr>"] = cmp.mapping.confirm()
      },
      sources = {
        { name = "nvim_lsp" }
      },
      formatting = {
        format = kind.cmp_format({ max_width = 50 })
      }
    }

    cmp.setup(config)
  end
}
