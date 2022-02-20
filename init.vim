" == === === === === ===
" |     Plugins here    |
" === === === === === ===

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Airline for a different looking status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Might get rid of nerdtree soon...
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" CoC is just completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Gives nice looking icons in Vim :)
Plug 'ryanoasis/vim-devicons'

" For Auto-Braces
Plug 'jiangmiao/auto-pairs'

" Removed fzf because Telescope has a much better
" out-of-the-box experience
" ripgrep gives live-grep experience
Plug 'BurntSushi/ripgrep' 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Working with Vim tags
Plug 'preservim/tagbar'
Plug 'szw/vim-tags'

" Highlighting :D
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Not even sure if this works :/
Plug 'Shougo/echodoc.vim'

" Git plugin that is...
Plug 'tpope/vim-fugitive'

" Colors
Plug 'shaunsingh/nord.nvim'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)

" Honestly a really cool plugin
" Makes the bufferline at the top look like 'tabs'
Plug 'akinsho/bufferline.nvim'

" Tracking to dos everywhere
Plug 'chauncey-garrett/vim-tasklist'

call plug#end()



"     == == ==
" Vim Configurations
"     == == ==

set encoding=UTF-8

set tabstop=4
set noexpandtab
set shiftwidth=4

set number

set whichwrap+=<,>,[,]

set list lcs=tab:\\ 

set noshowmode

"     == == ==
" vim-airline configs
"     == == ==

" Draw Powerline fonts in airline
" ... why is this disabled by default?
let g:airline_powerline_fonts = 1

" Adds a tabline at the top
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]

" Customize vim airline per filetype
" 'nerdtree'  - Hide nerdtree status line
" 'list'      - Only show file type plus current line number out of total
let g:airline_filetype_overrides = {
  \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', ''), '' ],
  \ 'list': [ '%y', '%l/%L'],
  \ }
" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])

" Use the minimalist theme to not let eyes be blasted by colors
let g:airline_theme = 'minimalist'

let g:airline#extensions#whitespace#enabled = 0

let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : ':',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : ' ',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }

" Custom separators for airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" Characters taken straight from Spaceline src
" https://github.com/glepnir/spaceline.vim/blob/master/autoload/spaceline/seperator.vim
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_alt_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'





"  == == ==
"  NERDTree
"  == == ==

nnoremap <F4>   :NERDTree <CR>
nnoremap <A-w>  :NERDTreeToggle <CR>
nnoremap <A-e>  :NERDTreeFocus <CR>

" Start NERDTree when Vim is started without file arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" let NERDTreeMapOpenInTab='<ENTER>'

nnoremap <leader>q :bp<cr>:bd #<cr>



" == == ==
"    CoC
" == == ==

function! s:show_documentation() 
	if (index(['vim','help'], &filetype) >= 0) 
		execute 'h '.expand('<cword>') 
	elseif (coc#rpc#ready()) 
		call CocActionAsync('doHover') 
	else 
		execute '!' . &keywordprg . " " . expand('<cword>') 
	endif 
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use tab for trigger completion with characters ahead and navigate. 
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by 
" other plugin before putting this into your config. 
inoremap <silent><expr> <TAB> 
			\ pumvisible() ? "\<C-n>" : 
			\ <SID>check_back_space() ? "\<TAB>" : 
			\ coc#refresh() 
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>" 

function! s:check_back_space() abort 
	let col = col('.') - 1 
	return !col || getline('.')[col - 1] =~# '\s' 
endfunction 

" Make <CR> auto-select the first completion item and notify coc.nvim to 
" format on enter, <cr> could be remapped by other vim plugin 
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() 
							\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>" 


" Symbol renaming. 
nnoremap <silent> rn <Plug>(coc-rename) 



" == == ==
" Telescope
" == == ==

" Find files using Telescope command-line sugar.
nnoremap <leader>tf :Telescope find_files<cr>
nnoremap <leader>tg :Telescope live_grep<cr>
nnoremap <leader>tb :Telescope buffers<cr>
nnoremap <leader>th :Telescope help_tags<cr>



"     == == ==
" vim-tags configs
"     == == ==
let g:vim_tags_auto_generate = 1
let g:vim_tags_main_file = 'tags'



" == == ==
" echodoc configs
" == == ==

" Or, you could use neovim's floating text feature.
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'



" == == == 
" its all nord
" == == ==
colorscheme nord



" == == ==
" bufferline configs
" == == ==
set termguicolors
lua << EOF
require("bufferline").setup{
options = {
	diagnostics = "coc",
	diagnostics_update_in_insert = false,
	diagnostics_indicator = function(count, level, diagnostics_dict, context)
	return "("..count..")"
end,
	separator_style = "slant",
}
}
EOF


"
"
"
" Opening the Task List
nnoremap <leader>tl :TaskList<cr>



"
"
"



" This is specifies the position of the window to be opened.
" By default it will open at on top. 
" 0 = Open on top, 1 = Open on the bottom
let g:tlWindowPosition = 1

" This is the list of tokens to search for 
" Default is 'FIXME TODO XXX'. 
" The results are groupped and displayed in the order that they appear.
let g:tlTokenList = ['FIXME', 'TODO', 'XXX', 'HACK']



"  == == ==
" QoL mappings
"  == == ==

" Save files using Control-S
nnoremap <c-s> :w <CR>
inoremap <c-s> <Esc> :w <CR>

" Quit program quickly
nnoremap <silent> ee :wq <CR>
nnoremap <silent> ex :q! <CR>
