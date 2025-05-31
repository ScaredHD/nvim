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
    s('class', {
      t('class '), i(1), t(' {'),
      t({ '', 'public:' }),
      t({ '', '\t' }), i(2),
      t({ '', 'private:' }),
      t({ '', '\t' }), i(3),
      t({ '', '}' })
    }),

    s('test', {
      i(1, 'TEST('),
      i(2, 'TestSuiteName'),
      i(3, ', '),
      i(4, 'TestName')
    })
  }
)
