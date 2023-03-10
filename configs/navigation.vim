nnoremap <leader>q :bp<cr>:bd #<cr>

"  == == ==
"  NERDTree
"  == == ==

nnoremap <leader><F4>  :NERDTreeToggle <CR>
nnoremap <leader><F5>  :NERDTreeFocus <CR>

" Start NERDTree when Vim is started without file arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" == == ==
" Telescope
" == == ==

" Find files using Telescope command-line sugar.
" nnoremap <leader>tf :Telescope find_files<cr>
nnoremap <C-f> :Telescope find_files<cr>
nnoremap <leader>tg :Telescope live_grep<cr>
nnoremap <leader>tb :Telescope buffers<cr>
nnoremap <leader>th :Telescope help_tags<cr>

"     == == ==
" vim-tags configs
"     == == ==
let g:vim_tags_auto_generate = 1
let g:vim_tags_main_file = 'tags'

" == == ==
" bufferline configs
" == == ==
set termguicolors
lua << EOF
require("bufferline").setup {
options = {
	diagnostics = "coc",
	diagnostics_update_in_insert = false,
	diagnostics_indicator = function(count, level, diagnostics_dict, context)
	return "("..count..")"
end,
separator_style = "slant",
offsets = {
	{
			filetype = "NERDTree",
			text = "File Explorer",
			highlight = "Directory",
			text_align = "left"
	}
	}
}
}
EOF

nnoremap <silent>b] :BufferLineCycleNext<CR>
nnoremap <silent>b[ :BufferLineCyclePrev<CR>

" == Tagbar ==
nnoremap <silent><F8> :TagbarToggle

" == vim-tasklist ==
"
" Opening the Task List
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



