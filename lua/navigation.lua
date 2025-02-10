vim.api.nvim_set_keymap('n', '<leader>q', ':bp<cr>:bd #<cr>', {noremap=true, silent=true})

-- nvim-tree --
require("nvim-tree").setup()

vim.api.nvim_set_keymap('n', '<leader>f', ':NvimTreeFocus<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>F', ':NvimTreeToggle<cr>', {noremap=true, silent=true})

-- Make :bd and :q behave as usual when tree is visible
vim.api.nvim_create_autocmd({'BufEnter', 'QuitPre'}, {
  nested = false,
  callback = function(e)
    local tree = require('nvim-tree.api').tree

    -- Nothing to do if tree is not opened
    if not tree.is_visible() then
      return
    end

    -- How many focusable windows do we have? (excluding e.g. incline status window)
    local winCount = 0
    for _,winId in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(winId).focusable then
        winCount = winCount + 1
      end
    end

    -- We want to quit and only one window besides tree is left
    if e.event == 'QuitPre' and winCount == 2 then
      vim.api.nvim_cmd({cmd = 'qall'}, {})
    end

    -- :bd was probably issued an only tree window is left
    -- Behave as if tree was closed (see `:h :bd`)
    if e.event == 'BufEnter' and winCount == 1 then
      -- Required to avoid "Vim:E444: Cannot close last window"
      vim.defer_fn(function()
        -- close nvim-tree: will go to the last buffer used before closing
        tree.toggle({find_file = true, focus = true})
        -- re-open nivm-tree
        tree.toggle({find_file = true, focus = false})
      end, 10)
    end
  end
})

-- Telescope --
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope find_files<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>tg', ':Telescope live_grep<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>tb', ':Telescope buffers<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>th', ':Telescope help_tags<cr>', {noremap=true, silent=true})

-- vim-tags --
vim.cmd[[
let g:vim_tags_auto_generate = 1
let g:vim_tags_main_file = 'tags'
]]

-- bufferline.nvim -- 
require("bufferline").setup {
options = {
	diagnostics = "coc",
	diagnostics_update_in_insert = false,
	diagnostics_indicator = function(count, level, diagnostics_dict, context)
	return "("..count..")"
end,
separator_style = "thick",
offsets = {
	{
			filetype = "NvimTree",
			text = "File Explorer",
			highlight = "Directory",
			text_align = "left"
	}
	}
}
}

vim.api.nvim_set_keymap('n', '<leader>b]', ':BufferLineCycleNext<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>b[', ':BufferLineCyclePrev<cr>', {noremap=true, silent=true})

require('neogit').setup()

-- Tagbar --
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<cr>', {noremap=true, silent=true})

-- vim-tasklist --

vim.cmd[[
nnoremap <leader>tl :TaskList<cr>
command Todo TaskList

" This is specifies the position of the window to be opened.
" By default it will open at on top. 
" 0 = Open on top, 1 = Open on the bottom
let g:tlWindowPosition = 1

" This is the list of tokens to search for 
" Default is 'FIXME TODO XXX'. 
" The results are groupped and displayed in the order that they appear.
let g:tlTokenList = ['FIXME', 'TODO', 'XXX', 'HACK']
]]


