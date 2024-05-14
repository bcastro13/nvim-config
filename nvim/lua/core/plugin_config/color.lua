require("onedarkpro").setup({
	highlights = {
		Visual = { bg = "#333333" },
		DiagnosticUnderlineError = { fg = "#FF0000", undercurl = true, italic = true },
		SpellBad = { fg = "#FF0000", sp = "#FF0000", undercurl = true },
		SpellCap = { fg = "#FF0000", sp = "#FF0000", undercurl = true },
		SpellLocal = { fg = "#FF0000", sp = "#FF0000", undercurl = true },
		SpellRare = { fg = "#FF0000", sp = "#FF0000", undercurl = true },
	},
})

vim.cmd("colorscheme onedark_dark")
