" This init file is for the Qt version of Neovim
" Decided to get nvim on my PC and will be sticking with the Qt version
" It has click detection + functionality, which is almost the same as
" how it acts on Termux. So I'm more used to it
" Even so, I have no idea how to get NodeJS up and running on my PC
" So I'm just gonna have it here as a... uh... commodity?
" 
" I dunno.

" For Right click functionality
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>

" To have the clipboard work both on Nvim and Windows
set clipboard=unnamedplus

" Mouse clicking
set mouse=a
"vmap <LeftRelease> "*ygv

" bufferline.nvim looks a lot better anyways
GuiTabline 0

" Change the font, forgot where I found this to be very honest
GuiFont! JetbrainsMono Nerd Font:h10
