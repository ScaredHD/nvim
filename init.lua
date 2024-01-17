if vim.g.vscode then
    require "ljp.keymaps"
    require "ljp.options"
else
    require "ljp.keymaps"
    require "ljp.lazy"
    require "ljp.options"
    vim.cmd[[colorscheme tokyonight]]
end
