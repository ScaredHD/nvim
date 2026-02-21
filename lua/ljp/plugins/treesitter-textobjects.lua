return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,
      },
      move = {
        set_jumps = true,
      },
    })

    local select = require("nvim-treesitter-textobjects.select")
    local move = require("nvim-treesitter-textobjects.move")
    local swap = require("nvim-treesitter-textobjects.swap")

    local function ts_select(capture)
      return function()
        select.select_textobject(capture, "textobjects")
      end
    end

    vim.keymap.set({ "x", "o" }, "af", ts_select("@function.outer"), { desc = "TS Function Outer" })
    vim.keymap.set({ "x", "o" }, "if", ts_select("@function.inner"), { desc = "TS Function Inner" })
    vim.keymap.set({ "x", "o" }, "ac", ts_select("@class.outer"), { desc = "TS Class Outer" })
    vim.keymap.set({ "x", "o" }, "ic", ts_select("@class.inner"), { desc = "TS Class Inner" })
    vim.keymap.set({ "x", "o" }, "al", ts_select("@loop.outer"), { desc = "TS Loop Outer" })
    vim.keymap.set({ "x", "o" }, "il", ts_select("@loop.inner"), { desc = "TS Loop Inner" })
    vim.keymap.set({ "x", "o" }, "ai", ts_select("@conditional.outer"), { desc = "TS Conditional Outer" })
    vim.keymap.set({ "x", "o" }, "ii", ts_select("@conditional.inner"), { desc = "TS Conditional Inner" })
    vim.keymap.set({ "x", "o" }, "aa", ts_select("@parameter.outer"), { desc = "TS Parameter Outer" })
    vim.keymap.set({ "x", "o" }, "ia", ts_select("@parameter.inner"), { desc = "TS Parameter Inner" })
    vim.keymap.set({ "x", "o" }, "ab", ts_select("@block.outer"), { desc = "TS Block Outer" })
    vim.keymap.set({ "x", "o" }, "ib", ts_select("@block.inner"), { desc = "TS Block Inner" })

    vim.keymap.set({ "n", "x", "o" }, "]m", function()
      move.goto_next_start("@function.outer", "textobjects")
    end, { desc = "Next Function Start" })
    vim.keymap.set({ "n", "x", "o" }, "]]", function()
      move.goto_next_start("@class.outer", "textobjects")
    end, { desc = "Next Class Start" })
    vim.keymap.set({ "n", "x", "o" }, "]M", function()
      move.goto_next_end("@function.outer", "textobjects")
    end, { desc = "Next Function End" })
    vim.keymap.set({ "n", "x", "o" }, "][", function()
      move.goto_next_end("@class.outer", "textobjects")
    end, { desc = "Next Class End" })
    vim.keymap.set({ "n", "x", "o" }, "[m", function()
      move.goto_previous_start("@function.outer", "textobjects")
    end, { desc = "Prev Function Start" })
    vim.keymap.set({ "n", "x", "o" }, "[[", function()
      move.goto_previous_start("@class.outer", "textobjects")
    end, { desc = "Prev Class Start" })
    vim.keymap.set({ "n", "x", "o" }, "[M", function()
      move.goto_previous_end("@function.outer", "textobjects")
    end, { desc = "Prev Function End" })
    vim.keymap.set({ "n", "x", "o" }, "[]", function()
      move.goto_previous_end("@class.outer", "textobjects")
    end, { desc = "Prev Class End" })

    vim.keymap.set("n", "<leader>a", function()
      swap.swap_next("@parameter.inner")
    end, { desc = "Swap Param Next" })
    vim.keymap.set("n", "<leader>A", function()
      swap.swap_previous("@parameter.inner")
    end, { desc = "Swap Param Prev" })
  end,
}
