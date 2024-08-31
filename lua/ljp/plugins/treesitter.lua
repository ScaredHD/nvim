return {
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-context',
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
              ['ap'] = '@parameter.outer',
              ['ip'] = '@parameter.inner',
              ['ab'] = '@block.outer',
            },

            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V',  -- linewise
              ['@class.outer'] = 'V',     -- blockwise
            },
          },

          swap = {
            enable = true,
            swap_next = {
              ["<leader>al"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>ah"] = "@parameter.inner",
            },
          },
        }
      }
    end
  },
  'nvim-treesitter/nvim-treesitter-refactor',
}
