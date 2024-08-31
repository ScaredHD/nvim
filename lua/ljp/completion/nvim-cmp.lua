return {
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  {
    'hrsh7th/nvim-cmp',

    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },

        mapping = {
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
              end
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<A-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ['<A-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ['<A-b>'] = cmp.mapping.scroll_docs(-4),
          ['<A-f>'] = cmp.mapping.scroll_docs(4),

          -- toggle suggestion menu
          ['<A-i>'] = cmp.mapping({
            i = function()
              if cmp.visible() then
                cmp.abort()
              else
                cmp.complete()
              end
            end,
            c = function()
              if cmp.visible() then
                cmp.close()
              else
                cmp.complete()
              end
            end
          }),

          ['<A-n>'] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<A-p>'] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },

        sources = cmp.config.sources({
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'buffer' }
        })
      }

      cmp.setup.cmdline(
        { '/', '?' },
        { mapping = cmp.mapping.preset.cmdline(), sources = { { name = 'buffer' } } }
      )

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }, { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require 'lspconfig'.clangd.setup {
        capabilities = capabilities
      }
    end,

    enabled = function()
      local context = require 'cmp.config.context'
      if vim.api.nvim_get_mode().mode == 'c' then
        return true
      else
        return not context.in_treesitter_capture 'comment'
            and not context.in_syntax_group 'Comment'
      end
    end
  }
}
