local cmp = require("cmp")
local lspkind = require "lspkind"

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" }
	},
	formatting = {
		format = lspkind.cmp_format({ wirth_text = false, maxwidth = 50 })
	},
	mapping = {
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
		["<CR>"] = cmp.mapping(cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}))
	}
})
