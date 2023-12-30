require("telescope").setup({
	defaults = {
		no_ignore = false,
		hidden = true
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
			layout_config = { height = 20 }
		}
	}
})
