require("nvim-treesitter.configs").setup({
	ensure_installed = { "python", "lua", "html", "htmldjango", "dockerfile", "markdown" },
	sync_install = true,
	highlight = {
		enable = true
	}
})
