local opt = vim.opt

opt.encoding = "utf-8"      -- encoding
opt.number = true           -- show numbers
opt.expandtab = true        -- us space with tabs
opt.scrolloff = 10          -- scroll
opt.ignorecase = true       -- ignore case
opt.smarttab = true         -- file type tab
opt.shiftwidth = 2          -- size space
opt.tabstop = 2             -- size tab
opt.wrap = false            -- off the next line
opt.iskeyword:append("-")   -- ignore symb `-` on removal 
opt.laststatus = 3          -- statusline on top of all windows
opt.swapfile = false        -- disable swap file
opt.termguicolors = true    -- us terminal colors
opt.cursorline = true       -- on cursor line
