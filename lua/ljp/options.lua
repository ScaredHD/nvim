local opt = vim.opt
local cmd = vim.cmd

opt.number = true
opt.relativenumber = true

opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true

opt.smartcase = true
opt.ignorecase = true

opt.timeoutlen = 500

cmd[[colorscheme tokyonight]]
