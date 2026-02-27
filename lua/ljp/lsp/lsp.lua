return {
  {
    'williamboman/mason.nvim',
    config = function()
      require 'mason'.setup {}
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { 'lua_ls', 'clangd', 'pyright' },
    },
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('ljp-lsp-keymaps', { clear = true }),
        callback = function(event)
          local map = function(lhs, rhs, desc)
            vim.keymap.set('n', lhs, rhs, { buffer = event.buf, desc = desc })
          end

          map('gd', vim.lsp.buf.definition, 'LSP: Goto Definition')
          map('gD', vim.lsp.buf.declaration, 'LSP: Goto Declaration')
          map('gR', vim.lsp.buf.references, 'LSP: Goto References')
          map('gi', vim.lsp.buf.implementation, 'LSP: Goto Implementation')
          map('gt', vim.lsp.buf.type_definition, 'LSP: Goto Type Definition')
          map('K', vim.lsp.buf.hover, 'LSP: Hover')
          map('<leader>lk', vim.lsp.buf.signature_help, 'LSP: Signature Help')
          map('<leader>lr', vim.lsp.buf.rename, 'LSP: Rename')
          map('<leader>la', vim.lsp.buf.code_action, 'LSP: Code Action')
          map('<leader>lf', function()
            vim.lsp.buf.format { async = true }
          end, 'LSP: Format Buffer')
          map('[d', vim.diagnostic.goto_prev, 'Diagnostics: Prev')
          map(']d', vim.diagnostic.goto_next, 'Diagnostics: Next')
          map('<leader>ld', vim.diagnostic.open_float, 'Diagnostics: Float')
          map('<leader>ls', vim.diagnostic.setloclist, 'Diagnostics: Loclist')
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_blink, blink = pcall(require, 'blink.cmp')
      if ok_blink and blink.get_lsp_capabilities then
        capabilities = blink.get_lsp_capabilities(capabilities)
      end

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { 'vim' } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
        clangd = {},
        pyright = {},
      }

      for server, config in pairs(servers) do
        config.capabilities = capabilities
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end
  }
}
