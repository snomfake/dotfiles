local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
	{ "windwp/nvim-autopairs" },
	{ "folke/tokyonight.nvim" },
	{ "ray-x/lsp_signature.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"hrsh7th/nvim-cmp",
		commit = "09ff53f",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"onsails/lspkind.nvim"
		}
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons"
		}
	},
	{ "nvimdev/lspsaga.nvim" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "nvim-lualine/lualine.nvim" },
	{ "akinsho/bufferline.nvim" },
	{ "lewis6991/gitsigns.nvim" },
	{ "kdheepak/lazygit.nvim" }
}
