return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      require 'ljp.snippets.languages.cpp'
    end
  },
  'saadparwaiz1/cmp_luasnip'
}
