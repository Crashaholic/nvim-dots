" == === === === === ===
" |     Plugins here    |
" === === === === === ===

" uses vim-plug
call plug#begin(stdpath('data') . '/plugged')

source ~/.config/nvim/plugins.vim

call plug#end()



"     == == ==
" Vim Configurations
"     == == ==

set encoding=UTF-8

set tabstop=4
set noexpandtab
set shiftwidth=4

set autoindent
set number
set whichwrap+=<,>,[,]

set noshowmode

" Save files using Control-S
nnoremap <c-s> :w <CR>
inoremap <c-s> <Esc> :w <CR>
vnoremap <c-s> <Esc> :w <CR>

" == Status Line ==
source ~/.config/nvim/configs/statusline.vim

" == Completion ==
source ~/.config/nvim/configs/completion.vim 

" == Colors ==
source ~/.config/nvim/configs/colr.vim

" == Navigation ==
source ~/.config/nvim/configs/navigation.vim

" == colorizer ==
lua require 'colorizer'.setup()

