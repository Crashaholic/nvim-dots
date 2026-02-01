return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = {
		"L3MON4D3/LuaSnip",
	},
	opts = {
		snippets = {
			preset = "luasnip",
		},
		sources = {
			default = { "lsp", "snippets", "buffer" },
		},
		keymap = {
			preset = "default",
		},
	},
}
