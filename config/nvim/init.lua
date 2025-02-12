-- imports
require("options")
require("mappings")
require("lazy_nvim")

-- highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = "200"
    })
  end
})

-- disable auto commenting new lines
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o"
})

-- auto formatting("python")
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "*.py",
  group = vim.api.nvim_create_augroup("format", { clear = true }),
  callback = function()
    vim.cmd [[silent !black %]]
  end
})
