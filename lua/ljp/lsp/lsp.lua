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
      ensure_installed = { 'lua_ls', 'clangd', 'pyright', 'slangd' },
    },
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local function collect_valid_locations(result)
        local locations = result and (vim.islist(result) and result or { result }) or {}
        local valid_locations = {}

        for _, location in ipairs(locations) do
          local uri = location.uri or location.targetUri
          local range = location.range or location.targetSelectionRange

          if uri and range and range.start and range['end'] then
            table.insert(valid_locations, location)
          end
        end

        return valid_locations
      end

      local function goto_locations_safe(method, opts)
        opts = opts or {}

        local bufnr = vim.api.nvim_get_current_buf()
        local clients = vim.lsp.get_clients { method = method, bufnr = bufnr }
        if vim.tbl_isempty(clients) then
          return
        end

        local remaining = #clients
        local all_items = {}
        local all_locations = {}
        local title = 'LSP locations'

        local function finalize()
          if vim.tbl_isempty(all_locations) then
            return
          end

          if opts.on_list then
            opts.on_list {
              title = title,
              items = all_items,
              context = { bufnr = bufnr, method = method },
            }
            return
          end

          if #all_locations == 1 then
            local target = all_locations[1]
            vim.lsp.util.show_document(target.location, target.offset_encoding, {
              reuse_win = opts.reuse_win,
              focus = true,
            })
            return
          end

          if opts.loclist then
            vim.fn.setloclist(0, {}, ' ', { title = title, items = all_items })
            vim.cmd.lopen()
          else
            vim.fn.setqflist({}, ' ', { title = title, items = all_items })
            vim.cmd('botright copen')
          end
        end

        for _, client in ipairs(clients) do
          local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
          client:request(method, params, function(_, result)
            local valid_locations = collect_valid_locations(result)

            for _, location in ipairs(valid_locations) do
              table.insert(all_locations, {
                location = location,
                offset_encoding = client.offset_encoding,
              })
            end

            if not vim.tbl_isempty(valid_locations) then
              vim.list_extend(
                all_items,
                vim.lsp.util.locations_to_items(valid_locations, client.offset_encoding)
              )
            end

            remaining = remaining - 1
            if remaining == 0 then
              finalize()
            end
          end, bufnr)
        end
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('ljp-lsp-keymaps', { clear = true }),
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          local map = function(lhs, rhs, desc)
            vim.keymap.set('n', lhs, rhs, { buffer = event.buf, desc = desc })
          end
          local map_if_supported = function(lhs, rhs, desc, method)
            if client and client:supports_method(method) then
              map(lhs, rhs, desc)
            end
          end

          map_if_supported('gd', function()
            goto_locations_safe('textDocument/definition', { reuse_win = true })
          end, 'LSP: Goto Definition', 'textDocument/definition')
          map_if_supported('gD', function()
            goto_locations_safe('textDocument/declaration', { reuse_win = true })
          end, 'LSP: Goto Declaration', 'textDocument/declaration')
          map_if_supported('gR', function()
            goto_locations_safe('textDocument/references')
          end, 'LSP: Goto References', 'textDocument/references')
          map_if_supported('gi', function()
            goto_locations_safe('textDocument/implementation', { reuse_win = true })
          end, 'LSP: Goto Implementation', 'textDocument/implementation')
          map_if_supported('gt', function()
            goto_locations_safe('textDocument/typeDefinition', { reuse_win = true })
          end, 'LSP: Goto Type Definition', 'textDocument/typeDefinition')
          map_if_supported('K', vim.lsp.buf.hover, 'LSP: Hover', 'textDocument/hover')
          map_if_supported('<leader>lk', vim.lsp.buf.signature_help, 'LSP: Signature Help', 'textDocument/signatureHelp')
          map_if_supported('<leader>lr', vim.lsp.buf.rename, 'LSP: Rename', 'textDocument/rename')
          map_if_supported('<leader>la', vim.lsp.buf.code_action, 'LSP: Code Action', 'textDocument/codeAction')
          map_if_supported('<leader>lf', function()
            vim.lsp.buf.format { async = true }
          end, 'LSP: Format Buffer', 'textDocument/formatting')
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

      local mason_bin = vim.fs.joinpath(vim.fn.stdpath('data'), 'mason', 'bin')
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
        slangd = {
          cmd = vim.fn.has('win32') == 1
            and { vim.fs.joinpath(mason_bin, 'slangd.cmd') }
            or { 'slangd' },
          root_markers = { '.git' },
          workspace_required = false,
        },
      }

      local function attach_loaded_buffers(server)
        local config = vim.deepcopy(vim.lsp.config[server] or {})
        if not config.filetypes then
          return
        end

        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buftype == '' then
            if vim.tbl_contains(config.filetypes, vim.bo[bufnr].filetype) then
              vim.lsp.start(config, {
                bufnr = bufnr,
                silent = true,
                _root_markers = config.root_markers,
              })
            end
          end
        end
      end

      for server, config in pairs(servers) do
        config.capabilities = capabilities
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
        attach_loaded_buffers(server)
      end
    end
  }
}
