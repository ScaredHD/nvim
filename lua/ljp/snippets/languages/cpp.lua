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

    s('tp', {
      t('template<'),i(0),t('>')
    }),

    s('tn', {
      t('typename ')
    }),

    s('np', {
      t('nullptr')
    }),

    s('dt', {
      t('decltype('), i(0), t(')')
    }),

    s('mv', {
      t('std::move('), i(0), t(')')
    }),

    s('fw', {
      t('std::forward<'), i(1), t('>('), i(0), t(')')
    }),

    s('sp', {
      t('std::shared_ptr<'), i(1), t('> '), i(0)
    }),

    s('up', {
      t('std::unique_ptr<'), i(1), t('> '), i(0)
    }),

  }
)
