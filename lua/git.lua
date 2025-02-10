-- Neogit --
-- vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })

local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
keymap('n', '<leader>gg', ':Neogit kind=floating<cr>', opts)
keymap('n', '<leader>gc', ':Neogit open=\'commit\' kind=floating<cr>', opts)


