local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('lualine').setup {
      options = {
        theme = 'palenight',
      },
    }
  end
}


return M
