return {
	"JMarkin/gentags.lua",
	cond = vim.fn.executable("ctags") == 1,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	opts = {}
}
