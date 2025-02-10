-- == === === === === ===
-- |     Plugins here    |
-- === === === === === ===
-- Using vim-plug in Lua
vim.cmd([[
    call plug#begin(stdpath('config') . '/plugins')
    source ~/.config/nvim/plugins.vim
    call plug#end()
]])

-- == == ==
-- Vim Configurations
-- == == ==
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.encoding = "UTF-8"

vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.shiftwidth = 4

vim.opt.autoindent = true
vim.opt.number = true
vim.opt.whichwrap:append("<,>,[,]")

vim.opt.showmode = false

vim.opt.termguicolors = true

-- Save files using Control-S
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })

require('navigation')
require('aesthetics')
require('completion')
require('git')
