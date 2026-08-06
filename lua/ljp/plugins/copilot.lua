return {
  "zbirenbaum/copilot.lua",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = false,
          accept_word = false,
          accept_line = false,
        },
      },
    })
  end,
}
