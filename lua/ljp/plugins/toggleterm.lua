return {
  'akinsho/toggleterm.nvim', 
  version = "*", 
  opts = {
    open_mapping = [[<c-\>]],
    shell = "pwsh.exe"
  },
  keys = {
    { '<F5>', 
      function() 
        require('ljp.utils.build-run').build_and_run()
      end,
      desc = "Build and run C++ in ToggleTerm"
    }
  }
  

}
