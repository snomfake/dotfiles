local lsp_nvim = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

local function on_attach(client, bufnr)
  require("lsp_signature").on_attach({}, bufnr)
end

local servers = { "pyright", "lua_ls", "emmet_ls" }

for _, lsp in ipairs(servers) do
	lsp_nvim[lsp].setup({
		capabilities = capabilities,
		on_attach = on_attach
	})
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		update_in_insert = false
	})
