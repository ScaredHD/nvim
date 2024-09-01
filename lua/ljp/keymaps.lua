local map = vim.keymap.set
vim.g.mapleader = ' '

map('i', 'jk', '<Esc>', { noremap = true, silent = true, nowait = true })

map('n', '<Space>', '<nop>', { noremap = true, silent = true })

map('n', '<C-j>', 'i<cr><Esc>^', { noremap = true, silent = true })

-- Clear search highlight
map('n', '<Esc>', '<Esc>:noh<cr>', { noremap = true, silent = true })


-- Basic windows-like shortcuts
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><Esc>')
map({ 'i', 'x', 'n', 's' }, '<C-w>', ':q!<cr>', { noremap = true, silent = true })
map('n', '<leader>w', '<C-w>', { noremap = true, silent = true })

-- Better up/down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Reuse some capital letters
map({ 'n', 'x', 'o' }, 'H', '^', { noremap = true, silent = true })
map({ 'n', 'x', 'o' }, 'L', '$', { noremap = true, silent = true })
map({ 'n', 'x', 'o' }, 'M', '%', { noremap = true, silent = true })

map('n', 'Y', 'y$', { noremap = true, silent = true })
map('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
map('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
map('n', 'n', 'nzzzv', { noremap = true, silent = true })
map('n', 'N', 'Nzzzv', { noremap = true, silent = true })
map('x', '<leader>p', '"_dp', { noremap = true, silent = true })

-- Move line up and down
map('n', '<A-down>', '<cmd>m .+1<cr>==', { noremap = true, silent = true })
map('n', '<A-up>', '<cmd>m .-2<cr>==', { noremap = true, silent = true })
map('v', '<A-down>', ":m '>+1<cr>gv=gv", { noremap = true, silent = true })
map('v', '<A-up>', ":m '<-2<cr>gv=gv", { noremap = true, silent = true })
map('v', 'J', ":m '>+1<cr>gv=gv", { noremap = true, silent = true })
map('v', 'K', ":m '<-2<cr>gv=gv", { noremap = true, silent = true })


-- Copy line up and down
map('n', '<A-S-down>', 'm`yyp``j', { noremap = true, silent = true })
map('n', '<A-S-up>', 'm`yyP``k', { noremap = true, silent = true })

-- Cursor movement in insert mode
map('i', '<A-h>', '<left>', { noremap = true, silent = true })
map('i', '<A-l>', '<right>', { noremap = true, silent = true })
map('i', '<A-o>', '<end>', { noremap = true, silent = true })
vim.cmd([[noremap <expr> <silent> <home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^']])
vim.cmd([[imap <silent> <A-u> <C-o><home>]])

-- Ctrl+Backspace to delete a word
map('i', '<C-h>', '<C-w>', { noremap = true, silent = true })

-- Recover point
map('i', '<C-u>', '<C-g>u<C-u>', { noremap = true, silent = true })
map('i', '<C-w>', '<C-g>u<C-w>', { noremap = true, silent = true })
map('i', ',', ',<C-g>u', { noremap = true, silent = true })
map('i', '.', '.<C-g>u', { noremap = true, silent = true })
map('i', ';', ';<C-g>u', { noremap = true, silent = true })
map('i', '(', '(<C-g>u', { noremap = true, silent = true })
map('i', '[', '[<C-g>u', { noremap = true, silent = true })
map('i', '{', '{<C-g>u', { noremap = true, silent = true })
map('i', '?', '?<C-g>u', { noremap = true, silent = true })
map('i', '!', '!<C-g>u', { noremap = true, silent = true })


-- Plugins
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })
map('n', '<leader>m', '<cmd>Mason<cr>', { desc = 'Mason' })

map({ 'n', 'i' }, '<A-n>', '<nop>', { silent = true })
map({ 'n', 'i' }, '<A-p>', '<nop>', { silent = true })
map({ 'v', 'o' }, 'ap', '<nop>', { silent = true })
map({ 'v', 'o' }, 'ip', '<nop>', { silent = true })
map({ 'v', 'o' }, 'ab', '<nop>', { silent = true })
