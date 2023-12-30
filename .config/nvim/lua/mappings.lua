local opts = { noremap = true, silent = true }

-- increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- delete a word backwards
vim.keymap.set("n", "db", "vb\"_d")

-- select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- copy(only visual mode)
vim.keymap.set("x", "<C-c>", "\"+Y")

-- buffer
vim.keymap.set("n", "<C-w>", "<cmd>bw<cr>")
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>")

-- telescope
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)

-- lazygit
vim.keymap.set("n", "<C-l>", "<cmd>LazyGit<cr>", opts)

-- lspsaga
vim.keymap.set("n", "t", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
vim.keymap.set("n", "g", "<cmd>Lspsaga peek_definition<cr>", opts)
