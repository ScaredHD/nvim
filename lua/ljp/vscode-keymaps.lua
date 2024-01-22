local map = vim.keymap.set
local vscode = require('vscode-neovim')

-- Moving around windows
map('n', '<C-j>', 'vscode.call()', { noremap = true, silent = true })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
map('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })

-- Move line up and down
map('n', '<A-j>', '<cmd>m .+1<cr>==', { noremap = true, silent = true })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { noremap = true, silent = true })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { noremap = true, silent = true })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { noremap = true, silent = true })
map('v', '<A-j>', ":m '>+1<cr>gv=g,v", { noremap = true, silent = true })
map('v', '<A-k>', ":m '<-2<cr>gv=gv", { noremap = true, silent = true })