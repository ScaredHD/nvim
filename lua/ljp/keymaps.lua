
local map = vim.keymap.set
---------------------- Normal mode key maps ----------------------
vim.g.mapleader = ' '
map('n', '<space>', '<nop>', {noremap = true, silent = true})
map('n', '<leader>k', '<nop>', {noremap = true, silent = true})

-- Basic windows-like shortcuts
map('n', '<c-s>', ':w<cr>', {noremap = true, silent = true})
map('n', '<leader>v', '<c-v>', {noremap = true, silent = true})
map('n', '<leader>w', '<c-w>', {noremap = true, silent = true})
map('n', '<c-w>', ':q<cr>', {noremap = true, silent = true})


-- Moving around windows 
map('n', '<c-j>', '<c-w>j', {noremap = true, silent = true})
map('n', '<c-k>', '<c-w>k', {noremap = true, silent = true})
map('n', '<c-h>', '<c-w>h', {noremap = true, silent = true})
map('n', '<c-l>', '<c-w>l', {noremap = true, silent = true})

-- Clear search highlight
map('n', '<c-n>', ':noh<cr>', {noremap = true, silent = true})

-- Move line up and down
map('n', '<a-j>', ':m+1<cr>', {noremap = true, silent = true})
map('n', '<a-k>', ':m-2<cr>', {noremap = true, silent = true})

-- Copy line up and down
map('n', '<a-s-j>', 'm`yyp``j', {noremap = true, silent = true})
map('n', '<a-s-k>', 'm`yyP``k', {noremap = true, silent = true})

-- Jump to bracket
map('n', 'K', '%', {noremap = true, silent = true})

---------------------- Insert mode key maps ----------------------
map('i', 'jk', '<esc>', {noremap = true, silent = true, nowait = true})

-- Cursor movement
map('i', '<a-j>', '<down>', {noremap = true, silent = true})
map('i', '<a-k>', '<up>', {noremap = true, silent = true})
map('i', '<a-h>', '<left>', {noremap = true, silent = true})
map('i', '<a-l>', '<right>', {noremap = true, silent = true})
map('i', '<a-w>', '<c-o>w', {noremap = true, silent = true})
map('i', '<a-b>', '<c-o>b', {noremap = true, silent = true})
map('i', '<a-o>', '<end>', {silent = true})
vim.cmd([[noremap <expr> <silent> <home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^']])
vim.cmd([[imap <silent> <a-u> <c-o><home>]])  -- Smart home


-- Ctrl+Backspace to delete a word
map('i', '<c-h>', '<c-w>', {silent = true})

-- Recover point
map('i', '<c-u>', '<c-g>u<c-u>', {noremap = true})
map('i', '<c-w>', '<c-g>u<c-w>', {noremap = true})

---------------------- Visual mode key maps ----------------------


