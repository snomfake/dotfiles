local map = vim.keymap.set
local opts = { noremap = true, silent = true, nowait = true }

map("n", "db", "vb\"_d")                               -- delete backword
map("n", "<c-a>", "ggVG")                              -- select all
map("n", "<esc>", ":nohl<cr>", opts)                   -- off highlight

map("n", "<c-h>", "<c-w>W")                            -- change window(right)
map("n", "<c-l>", "<c-w>w")                            -- change window(left)

map("n", "<c-w>", ":bw<cr>", opts)                     -- close buffer
map("n", "<tab>", "<Plug>(cokeline-focus-next)", opts) -- next buffer

map("n", "<a-1>", ":NvimTreeToggle<cr>", opts)         -- toggle explorer
map("n", "<c-p>", ":Telescope find_files<cr>", opts)   -- find files
