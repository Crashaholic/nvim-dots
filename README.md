# Crash's init.vim
## Update: 11/02/2025
Wow. I barely even use Neovim anymore.

This newer commit tries to refresh some of the stuff used in the original config.

The configs have also been adapted to use Lua instead of Vimscript, given that it seems to be the more widely adopted approach these days. There may be some carelessness during the adaptation and caused some of the key mapping to be omitted.

I did consider trying to get out of using CoC, however, the convenience that CoC brings is just too powerful, and absolutely saves the hassle of having to go around, finding the right LSP tools that I would lose from replacing CoC.

As much as I wanted to shift to using my own LSP set of plugins, I just do not want to spend the time to do it. So CoC it is...

To get CCLS working, based on my current WSL2 setup:
```
sudo snap install ccls --classic
```

As it stands right now:
|Old Plugin|New Plugin|
|--|--|
|fugitive|Neogit|
|airline|lualine|
|NERDTree|nvim-tree|

## Original Desc
This Neovim config is intended for C++ development.

I use Neovim on my phone via Termux, which allows me to write code on the go when I am away from my PC (which is slowly becoming more and more often). However, it is not really intended for building since I still am learning how some of these tools work, especially [ccls](https://github.com/MaskRay/ccls).

I am considering shifting to Android development, also with Termux and utilizing [BuildAPKs](https://github.com/BuildAPKs/buildAPKs), which means that this config might soon work for both Java and C++. Exciting.

## Plugins
_**Note that this list could be out-of-date. Its hard to maintain this list when the plugins on here is ever-changing.**_

| Plugin name | Purpose | Notes |
|--|--|--|
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)| Pretties up the status line | -- |
| [CoC](https://github.com/neoclide/coc.nvim)| Completion and LSP client |--|
| [nvim-tree](https://github.com/nvim-tree/nvim-tree)| Navigation | Much less used ever since Telescope was introduced to my set up |
| [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)|Navigation|`<leader>f` all the way|
| [auto-pairs](https://github.com/jiangmiao/auto-pairs)|Auto closing of quotes and braces |--|
| [vim-tags](https://github.com/szw/vim-tags)|Tag generation|--|
| [Tagbar](https://github.com/preservim/tagbar)|Tag navigation|--|
| [vim-fugitive](https://github.com/tpope/vim-fugitive)   |Git integration|--|
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)|Buffer navigation|--|
| [vim-tasklist](https://github.com/chauncey-garrett/vim-tasklist)   |TODO list navigation|Left TODOs everywhere and couldnt find them, so I got this plugin to find them. INSTALLED AS `Plug 'chauncey-garrett/vim-tasklist'`.|

# Vim settings

```vim
set encoding=UTF-8

set tabstop=4
set noexpandtab
set shiftwidth=4

set autoindent
set number

" Makes Vim go to next line when end of line and right-arrow
" or previous line when beginning of line and left-arrow
set whichwrap+=<,>,[,]

set noshowmode
```

# Keybindings

|Mode|Keybind|Action|
|--|--|--|
|Normal 	|\<C-s\> 			|Writes file|
|Insert 	|\<C-s\> 			|Writes file|
|Visual 	|\<C-s\>  			|Writes file|
|Normal 	|\<leader\>q		|Close Buffer|
|Insert 	|\<C-Space\>		|Trigger Completion \[COC\]|
|Normal 	|K 					|Show Documentation \[COC\]|
|Insert     |\<Tab\> 			|Trigger Completion \[COC\]|
|Normal     |\<leader\>F 	    |Toggle nvim-tree \[nvim-tree\]|
|Normal 	|\<leader\>f 	    |Focus nvim-tree \[nvim-tree\]|
|Normal     |\<leader\>b\]      |Cycle Next \[bufferline\]|
|Normal     |\<leader\>b\[      |Cycle Prev \[bufferline\]|
|Normal     |\<C-f\> 			|Find File \[Telescope\]|
|Normal     |\<leader\>tg		|Live Grep \[Telescope\]|
|Normal     |\<leader\>tb		|Buffers \[Telescope\]|
|Normal     |\<leader\>th		|Help Tags \[Telescope\]|
|Normal 	|\<F8\> 			|Toggle Tagbar \[Tagbar\]| 
|Normal 	|\<leader\>tl 		|Task List \[TaskList\]|
 
