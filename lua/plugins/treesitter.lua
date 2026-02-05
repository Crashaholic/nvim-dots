return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- runs only on install/update
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"css",
			"diff",
			"go",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"regex",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
		},
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	},
}
