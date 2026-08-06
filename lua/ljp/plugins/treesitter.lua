return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master", -- main is an incompatible rewrite without nvim-treesitter.configs
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "cpp", "lua", "javascript", "html", "hlsl" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
