if vim.g.vscode then
    require "ljp.options"
    require "ljp.vscode-keymaps"
else
    require "ljp.keymaps"
    require "ljp.lazy"
    require "ljp.options"
    vim.cmd[[colorscheme tokyonight]]
end
