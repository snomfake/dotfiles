return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim"
  },
  config = function()
    local lsp = require("lspconfig")
    local mason = require("mason")

    local function on_attach(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.cmd [[augroup LspFormatting]]
        vim.cmd [[autocmd! * <buffer>]]
        vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format ()]]
        vim.cmd [[augroup END]]
      end
    end

    local jedi_config = {
      on_attach = on_attach,
      settings = {
        init_options = {
          diagnostics = { enable = false }
        }
      }
    }

    local ruff_config = {}

    lsp["jedi_language_server"].setup(jedi_config)
    lsp["ruff"].setup(ruff_config)

    mason.setup()
  end
}
