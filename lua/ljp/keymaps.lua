local map = vim.keymap.set
vim.g.mapleader = ' '

map('i', 'jk', '<esc>', { noremap = true, silent = true, nowait = true })

map('n', '<space>', '<nop>', { noremap = true, silent = true })

-- Basic windows-like shortcuts
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>')
map({ 'i', 'x', 'n', 's' }, '<C-w>', ':q<cr>', { noremap = true, silent = true })
map('n', '<leader>w', '<C-w>', { noremap = true, silent = true })

-- Better up/down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Reuse capital letters
map({ 'n', 'x', 'o'}, 'H', '^', { noremap = true, silent = true })
map({ 'n', 'x', 'o'}, 'L', '$', { noremap = true, silent = true })
map({ 'n', 'x', 'o'}, 'M', '%', { noremap = true, silent = true })

-- Moving around windows
map('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
map('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })

-- Clear search highlight
map('n', '<Esc>', '<Esc>:noh<cr>', { noremap = true, silent = true })

-- Move line up and down
map('n', '<A-j>', '<cmd>m .+1<cr>==', { noremap = true, silent = true })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { noremap = true, silent = true })
map('v', '<A-j>', ":m '>+1<cr>gv=g,v", { noremap = true, silent = true })
map('v', '<A-k>', ":m '<-2<cr>gv=gv", { noremap = true, silent = true })

-- Copy line up and down
map('n', '<A-S-j>', 'm`yyp``j', { noremap = true, silent = true })
map('n', '<A-S-k>', 'm`yyP``k', { noremap = true, silent = true })

-- Cursor movement in insert mode
map('i', '<A-j>', '<down>', { noremap = true, silent = true })
map('i', '<A-k>', '<up>', { noremap = true, silent = true })
map('i', '<A-h>', '<left>', { noremap = true, silent = true })
map('i', '<A-l>', '<right>', { noremap = true, silent = true })
map('i', '<A-o>', '<end>', { noremap = true, silent = true })
-- Smart home
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
map('i', '?', '?<C-g>u', { noremap = true, silent = true })
map('i', '!', '!<C-g>u', { noremap = true, silent = true })