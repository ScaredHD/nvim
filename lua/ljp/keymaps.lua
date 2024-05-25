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

<<<<<<< HEAD
-- Reuse capital letters
=======
-- Remap of home(^) and end($)
>>>>>>> fix
map({ 'n', 'x', 'o'}, 'H', '^', { noremap = true, silent = true })
map({ 'n', 'x', 'o'}, 'L', '$', { noremap = true, silent = true })
map({ 'n', 'x', 'o'}, 'M', '%', { noremap = true, silent = true })

-- moving around windows
map('n', '<c-j>', '<c-w>j', { noremap = true, silent = true })
map('n', '<c-k>', '<c-w>k', { noremap = true, silent = true })
map('n', '<c-l>', '<c-w>l', { noremap = true, silent = true })
map('n', '<c-h>', '<c-w>h', { noremap = true, silent = true })

-- clear search highlight
map('n', '<esc>', '<esc>:noh<cr>', { noremap = true, silent = true })

-- move line up and down
map('n', '<a-j>', '<cmd>m .+1<cr>==', { noremap = true, silent = true })
map('n', '<a-k>', '<cmd>m .-2<cr>==', { noremap = true, silent = true })
map('v', '<a-j>', ":m '>+1<cr>gv=g,v", { noremap = true, silent = true })
map('v', '<a-k>', ":m '<-2<cr>gv=gv", { noremap = true, silent = true })

-- copy line up and down
map('n', '<a-s-j>', 'm`yyp``j', { noremap = true, silent = true })
map('n', '<a-s-k>', 'm`yyp``k', { noremap = true, silent = true })

-- cursor movement in insert mode
map('i', '<a-j>', '<down>', { noremap = true, silent = true })
map('i', '<a-k>', '<up>', { noremap = true, silent = true })
map('i', '<a-h>', '<left>', { noremap = true, silent = true })
map('i', '<a-l>', '<right>', { noremap = true, silent = true })
map('i', '<a-o>', '<end>', { noremap = true, silent = true })
-- smart home
vim.cmd([[noremap <expr> <silent> <home> col('.') == match(getline('.'),'\s')+1 ? '0' : '^']])
vim.cmd([[imap <silent> <a-u> <c-o><home>]])

-- ctrl+backspace to delete a word
map('i', '<c-h>', '<c-w>', { noremap = true, silent = true })

-- recover point
map('i', '<c-u>', '<c-g>u<c-u>', { noremap = true, silent = true })
map('i', '<c-w>', '<c-g>u<c-w>', { noremap = true, silent = true })
map('i', ',', ',<c-g>u', { noremap = true, silent = true })
map('i', '.', '.<c-g>u', { noremap = true, silent = true })
map('i', ';', ';<c-g>u', { noremap = true, silent = true })
map('i', '?', '?<c-g>u', { noremap = true, silent = true })
map('i', '!', '!<C-g>u', { noremap = true, silent = true })