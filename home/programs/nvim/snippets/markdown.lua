local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local line_begin = require("luasnip.extras.expand_conditions").line_begin

ls.add_snippets("markdown", {
  s("date", {
    t("# "), f(function() return os.date("%y-%m-%d") end, {}),
    t({ "", "- " }),
  }),

  -- s({
      -- trig = [[\v(https?://(?:www\.)?([-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b[-a-zA-Z0-9()@:%_\+.~#?&//=]*))]],
      -- regTrig     = true,        
      -- wordTrig    = false,       
    -- },
    -- fmt("[{}]({})", {
      -- f(function(_, snip) return snip.captures[2] end),
      -- f(function(_, snip) return snip.captures[1] end),
    -- })
  -- ),
    
  s({
    trig = [[%f[%S](https?://([^/%s]+)[^%s]*)]],
    regTrig  = true,
    wordTrig = false,
  }, fmt("[{}]({})", {
       -- link text   → host
       f(function(_, snip) return snip.captures[2] end),
       -- link target → full url
       f(function(_, snip) return snip.captures[1] end),
  }))


})
-- local ls = require('luasnip')
-- local fmt = require('luasnip.extras.fmt').fmt
-- local fmta = require('luasnip.extras.fmt').fmta
-- local rep = require('luasnip.extras').rep
-- local dl = require('luasnip.extras').dynamic_lambda
-- local l = require('luasnip.extras').lambda
-- local autosnippet = ls.extend_decorator.apply(s, { snippetType = 'autosnippet' })

-- -- some shorthands...
-- local s = ls.snippet
-- local n = ls.snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node

-- ls.config.set_config({
  -- history = true,
  -- -- treesitter-hl has 100, use something higher (default is 200).
  -- ext_base_prio = 200,
  -- -- minimal increase in priority.
  -- ext_prio_increase = 1,
  -- enable_autosnippets = true,
  -- store_selection_keys = '<Tab>',
-- })

-- vim.keymap.set({ 'i', 's' }, '<C-l>', function()
  -- if ls.choice_active() then ls.change_choice(1) end
-- end)

-- vim.keymap.set({ 'i', 's' }, '<C-h>', function()
  -- if ls.choice_active() then ls.change_choice(-1) end
-- end)

-- local function get_line_iter(str)
  -- if str:sub(-1) ~= '\n' then str = str .. '\n' end

  -- return str:gmatch('(.-)\n')
-- end
-- local function box_trim_lines(str)
  -- local new_str = ''

  -- for line in get_line_iter(str) do
    -- line = line:gsub('^%s+', '')
    -- line = string.gsub(line, '%s+$', '')
    -- new_str = new_str .. '\n' .. line
  -- end

  -- return new_str
-- end

-- -- local return_filename = function()
-- --   return vim.fn.fnamemodify(vim.fn.expand('%'), ':p')
-- -- end

-- local return_filename = function()
  -- -- return vim.fn.fnamemodify(vim.fn.expand('%'), ':p')
  -- local filename = vim.fn.fnamemodify(vim.fn.expand('%'), ':p')
  -- local home_dir = vim.fn.expand('~')
  -- if filename:sub(1, #home_dir) == home_dir then filename = '~/' .. filename:sub(#home_dir + 2) end
  -- return filename
-- end

-- local date = function() return { os.date('%Y-%m-%d') } end

-- local fulldate = function() return { os.date('%a, %b %Y/%m/%d - %H:%M:%S') } end

-- -- lua print(os.date("%a, %b %Y/%m/%d - %H:%M:%S"))

-- local get_visual = function(args, parent)
  -- if #parent.snippet.env.SELECT_RAW > 0 then
    -- return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  -- else -- If SELECT_RAW is empty, return a blank insert node
    -- return sn(nil, i(1))
  -- end
-- end

-- local filename = function() return { vim.fn.expand('%:p') } end

-- local clipboard = function() return { vim.fn.getreg('+') } end

-- -- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
-- local function bash(_, _, command)
  -- local file = io.popen(command, 'r')
  -- local res = {}
  -- for line in file:lines() do
    -- table.insert(res, line)
  -- end
  -- return res
-- end

-- local function get_port_snip(args)
  -- if #args < 1 and not args[1][1] then return n(nil, t('hello world')) end

  -- local type = args[1][1]
  -- local indent = '      '

  -- if type == 'NodePort' or type == 'LoadBalancer' then
    -- return n(
      -- nil,
      -- fmt(
        -- box_trim_lines([[
        -- - port: {}
          -- {}targetPort: {}
          -- {}nodePort: {}
        -- ]]),
        -- {
          -- i(1, '30000'),
          -- indent,
          -- i(2, '80'),
          -- indent,
          -- i(3, '30000'),
        -- }
      -- )
    -- )
  -- end

  -- if type == 'ClusterIP' then
    -- return n(
      -- nil,
      -- fmt(
        -- [[
        -- - port: {}
        -- {}targetPort: {}
        -- ]],
        -- {
          -- i(1, '30000'),
          -- indent,
          -- i(2, '80'),
        -- }
      -- )
    -- )
  -- end
-- end

-- ls.add_snippets(nil, {

  -- markdown = {
    -- s({
      -- trig = 'link',
      -- namr = 'markdown_link [selection]',
      -- dscr = 'Create markdown link [txt](url) Select description + TAB',
    -- }, {
      -- t('['),
      -- i(1),
      -- t(']('),
      -- d(2, get_visual),
      -- t(')'),
      -- i(0),
    -- }),

    -- s({
      -- trig = 't',
      -- namr = 'check list',
      -- desc = 'Create item of a checklist',
    -- }, fmt('- [{}] {}', { c(2, { t(' '), t('-'), t('') }), i(1, 'task') })),

    -- autosnippet(
      -- {
        -- trig = 'qw',
        -- name = 'trig',
        -- dscr = 'inline code',
      -- },
      -- fmt(
        -- [[
    -- `<>` <>
    -- ]],
        -- { d(1, get_visual), i(0) },
        -- { delimiters = '<>' }
      -- )
    -- ),

    -- s({
      -- trig = 'code',
      -- namr = 'markdown_code_fenced',
      -- desc = 'code backsticks',
      -- priority = 2000,
    -- }, {
      -- t('```'),
      -- i(1, 'Lang'),
      -- t({ '', '' }),
      -- d(2, get_visual),
      -- t({ '', '```', '' }),
      -- i(0),
    -- }),

    -- s({
      -- trig = 'meta',
      -- namr = 'Metadata',
      -- dscr = 'Yaml metadata format for markdown',
    -- }, {
      -- t({ '---', 'title: ' }),
      -- i(1, 'note_title'),
      -- t({ '', 'author: ' }),
      -- i(2, 'author'),
      -- t({ '', 'date: ' }),
      -- f(date, {}),
      -- t({ '', 'cathegories: [' }),
      -- i(3, ''),
      -- t({ ']', 'lastmod: ' }),
      -- f(date, {}),
      -- t({ '', 'tags: [' }),
      -- i(4),
      -- t({ ']', 'comments: true', '---', '' }),
      -- i(0),
    -- }),

    -- s({
      -- trig = '_skel',
      -- namr = 'File_skeleton',
      -- dscr = 'File header (dynamic)',
    -- }, {
      -- t({ '---', 'File: ' }),
      -- f(return_filename, {}),
      -- t({ '', 'Last Change: ' }),
      -- f(fulldate, {}),
      -- t({ '', 'tags: [' }),
      -- i(1),
      -- t({ ']', '---', '' }),
      -- i(0),
    -- }),
  -- },
-- })
