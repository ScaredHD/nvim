
---------------------- Normal mode key maps ----------------------
vim.g.mapleader = ' '
vim.keymap.set('n', '<space>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>k', '<nop>', {noremap = true, silent = true})

-- Basic windows-like shortcuts
vim.keymap.set('n', '<c-s>', ':w<cr>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>v', '<c-v>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>w', '<c-w>', {noremap = true, silent = true})
vim.keymap.set('n', '<c-w>', ':q<cr>', {noremap = true, silent = true})


-- Moving around windows 
vim.keymap.set('n', '<c-j>', '<c-w>j', {noremap = true, silent = true})
vim.keymap.set('n', '<c-k>', '<c-w>k', {noremap = true, silent = true})
vim.keymap.set('n', '<c-h>', '<c-w>h', {noremap = true, silent = true})
vim.keymap.set('n', '<c-l>', '<c-w>l', {noremap = true, silent = true})

-- Clear search highlight
vim.keymap.set('n', '<c-n>', ':noh', {noremap = true, silent = true})

-- Move line up and down
vim.keymap.set('n', '<a-j>', ':m+1<cr>', {noremap = true, silent = true})
vim.keymap.set('n', '<a-k>', ':m-2<cr>', {noremap = true, silent = true})

-- Copy line up and down
vim.keymap.set('n', '<a-s-j>', 'm`yyp``j', {noremap = true, silent = true})
vim.keymap.set('n', '<a-s-k>', 'm`yyP``k', {noremap = true, silent = true})

-- Jump to bracket
vim.keymap.set('n', 'K', '%', {noremap = true, silent = true})

---------------------- Insert mode key maps ----------------------
vim.keymap.set('i', 'jk', '<esc>', {noremap = true, silent = true, nowait = true})

-- Cursor movement
vim.keymap.set('i', '<a-j>', '<down>', {noremap = true, silent = true})
vim.keymap.set('i', '<a-k>', '<up>', {noremap = true, silent = true})
vim.keymap.set('i', '<a-h>', '<left>', {noremap = true, silent = true})
vim.keymap.set('i', '<a-l>', '<right>', {noremap = true, silent = true})
vim.keymap.set('i', '<a-w>', '<c-o>w', {noremap = true, silent = true})
vim.keymap.set('i', '<a-b>', '<c-o>b', {noremap = true, silent = true})
vim.keymap.set('i', '<a-o>', '<end>', {silent = true})
vim.cmd([[noremap <expr> <silent> <home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^']])
vim.cmd([[imap <silent> <a-u> <c-o><home>]])  -- Smart home


-- Ctrl+Backspace to delete a word
vim.keymap.set('i', '<c-h>', '<c-w>', {silent = true})

-- Recover point
vim.keymap.set('i', '<c-u>', '<c-g>u<c-u>', {noremap = true})
vim.keymap.set('i', '<c-w>', '<c-g>u<c-w>', {noremap = true})

---------------------- Visual mode key maps ----------------------


