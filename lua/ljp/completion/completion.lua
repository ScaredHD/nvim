return {
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  {
    'hrsh7th/nvim-cmp',

    config = function()
      local cmp = require 'cmp'
      local ls = require 'luasnip'
      local copilot = require 'copilot.suggestion'

      cmp.setup {
        snippet = {
          expand = function(args)
            ls.lsp_expand(args.body)
          end
        },

        completion = {
          completeopt = 'menu,menuone,noinsert',
          keyword_length = 2,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = {
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            elseif copilot.is_visible() then
              copilot.accept_line()
            elseif ls.expandable() then
              ls.expand()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if copilot.is_visible() then
              copilot.accept()
            end
          end, { 'i', 's' }),

          ['<A-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }, {'i', 's'}),
          ['<A-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }, {'i', 's'}),

          ['<A-n>'] = cmp.mapping(function(fallback) 
            if ls.locally_jumpable(1) then
              ls.jump(1)
            end
          end, {'i', 's'}),

          ['<A-p>'] = cmp.mapping(function(fallback)
            if ls.locally_jumpable(-1) then
              ls.jump(-1)
            end
          end, {'i', 's'}),

          ['<A-u>'] = cmp.mapping.scroll_docs(-4),
          ['<A-d>'] = cmp.mapping.scroll_docs(4),

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
            end,
          }),

        },

        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
          { name = 'buffer' },
          { name = 'path' },
        })
      }

      cmp.setup.cmdline(
        { '/', '?' },
        { mapping = cmp.mapping.preset.cmdline(), sources = { { name = 'buffer' } } }
      )

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
    end
  }
}
