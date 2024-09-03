-- This file is automatically loaded by plugins.core
vim.g.mapleader = ' '

local opt = vim.opt

opt.autowrite = true          -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.confirm = true            -- Confirm to save changes before exiting modified buffer
opt.cursorline = true         -- Enable highlighting of the current line
opt.expandtab = true          -- Use spaces instead of tabs
opt.ignorecase = true         -- Ignore case
opt.inccommand = "nosplit"    -- preview incremental substitute
opt.laststatus = 3            -- global statusline
opt.list = true               -- Show some invisible characters (tabs...
opt.mouse = "a"               -- Enable mouse mode
opt.number = true             -- Print line number
opt.swapfile = false
opt.pumheight = 10            -- Maximum number of entries in a popup
opt.relativenumber = false    -- Relative line numbers
opt.scrolloff = 6             -- Lines of context
opt.shiftround = true         -- Round indent
opt.shiftwidth = 2            -- Size of an indent
opt.sidescrolloff = 8         -- Columns of context
opt.signcolumn = "yes"        -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true          -- Don't ignore case with capitals
opt.smartindent = true        -- Insert indents automatically
opt.tabstop = 2               -- Number of spaces tabs count for
opt.termguicolors = true      -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200      -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.winminwidth = 5       -- Minimum window width

-- yank highlight
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=300})
augroup END
]]