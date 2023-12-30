-- number
vim.wo.number = true

-- encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.autoindent = true

-- no line wraping
vim.opt.wrap = false

-- scroll off
vim.opt.scrolloff = 10

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- ignor `-` on removal
vim.opt.iskeyword:append("-")

-- appearance
vim.opt.termguicolors = true
vim.opt.cursorline = true
