local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.add_snippets(
  'cpp',
  {
    s("ternary", {
      -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
      i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
    })
  }
)
