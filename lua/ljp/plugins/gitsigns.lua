return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '^' },
      changedelete = { text = '~' },
    },
    current_line_blame = false,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      map('n', ']h', gs.next_hunk, 'Next hunk')
      map('n', '[h', gs.prev_hunk, 'Previous hunk')
      map('n', '<leader>gs', gs.stage_hunk, 'Git stage hunk')
      map('n', '<leader>gr', gs.reset_hunk, 'Git reset hunk')
      map('n', '<leader>gS', gs.stage_buffer, 'Git stage buffer')
      map('n', '<leader>gu', gs.undo_stage_hunk, 'Git undo stage hunk')
      map('n', '<leader>gR', gs.reset_buffer, 'Git reset buffer')
      map('n', '<leader>gp', gs.preview_hunk, 'Git preview hunk')
      map('n', '<leader>gb', gs.blame_line, 'Git blame line')
      map('n', '<leader>gd', gs.diffthis, 'Git diff this')
      map('n', '<leader>gD', function()
        gs.diffthis('~')
      end, 'Git diff against ~')
      map('n', '<leader>gt', gs.toggle_deleted, 'Git toggle deleted')
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'Git select hunk')
    end,
  },
}
