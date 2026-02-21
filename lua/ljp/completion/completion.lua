return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
      snippets = { preset = 'luasnip' },
      completion = {
        list = { selection = { preselect = false, auto_insert = false } },
        menu = { border = 'rounded' },
        documentation = { auto_show = true, window = { border = 'rounded' } },
      },
      keymap = {
        preset = 'none',
        ['<Tab>'] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.accept()
            end
            local ok, copilot = pcall(require, 'copilot.suggestion')
            if ok and copilot.is_visible() then
              copilot.accept_line()
              return true
            end
          end,
          'snippet_forward',
          'fallback',
        },
        ['<S-Tab>'] = {
          function()
            local ok, copilot = pcall(require, 'copilot.suggestion')
            if ok and copilot.is_visible() then
              copilot.accept()
              return true
            end
          end,
          'snippet_backward',
          'fallback',
        },
        ['<A-j>'] = { 'select_next', 'fallback' },
        ['<A-k>'] = { 'select_prev', 'fallback' },
        ['<A-n>'] = { 'snippet_forward', 'fallback' },
        ['<A-p>'] = { 'snippet_backward', 'fallback' },
        ['<A-u>'] = { 'scroll_documentation_up', 'fallback' },
        ['<A-d>'] = { 'scroll_documentation_down', 'fallback' },
        ['<A-i>'] = { 'show', 'hide' },
      },
      sources = {
        default = { 'lsp', 'snippets', 'buffer', 'path' },
        providers = {
          buffer = { min_keyword_length = 2 },
        },
      },
      cmdline = {
        enabled = true,
        keymap = {
          preset = 'cmdline',
          ['<Tab>'] = { 'accept', 'show', 'fallback' },
          ['<A-j>'] = { 'select_next', 'fallback' },
          ['<A-k>'] = { 'select_prev', 'fallback' },
          ['<A-i>'] = { 'show', 'hide' },
        },
        completion = { menu = { auto_show = true } },
        sources = function()
          local cmd_type = vim.fn.getcmdtype()
          if cmd_type == '/' or cmd_type == '?' then
            return { 'buffer' }
          end
          if cmd_type == ':' or cmd_type == '@' then
            return { 'cmdline', 'path' }
          end
          return {}
        end,
      },
    },
  },
}
