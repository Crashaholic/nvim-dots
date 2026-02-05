vim.opt.encoding="UTF-8"

vim.opt.expandtab=false
vim.opt.tabstop=4
vim.opt.shiftwidth=4

vim.opt.autoindent=true
vim.opt.number=true

-- wrap when at beginning or end of a line
vim.opt.whichwrap="bs<>[]hl"

vim.opt.showmode=false

vim.opt.termguicolors = true

-- disable mouse, i dont see the need
vim.opt.mouse=""

-- for using system clipboard
vim.opt.clipboard = "unnamedplus"

vim.o.winborder="single"

vim.o.signcolumn="yes"

vim.cmd.colorscheme="retrobox"

vim.api.nvim_create_user_command('TTab',
	function(opts)
		local current = vim.bo.tabstop

		if current == 4 then
			vim.bo.tabstop = 2
			vim.bo.shiftwidth = 2
			print("Indent set to 2 spaces (buffer)")
		else
			vim.bo.tabstop = 4
			vim.bo.shiftwidth = 4
			print("Indent set to 4 spaces (buffer)")
		end
	end
, {}
)

vim.api.nvim_create_user_command('DefMakefileDir',
	function(opts)
		local user_input = vim.fn.input("Where is makefile?: ")
		if user_input ~= "" then
			vim.w.makefile_dir = user_input
		end
	end
, {}
)

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

