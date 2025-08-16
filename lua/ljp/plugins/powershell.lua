return {
  "TheLeoP/powershell.nvim",
  config = function()
    require("powershell").setup({
      bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
      shell = "powershell"
    })
  end
}