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

ls.filetype_extend("plaintex", {"tex"})

local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

-- exampe of a multiline snippet

-- ls.add_snippets("tex", {
  -- s("template", fmta([[
  -- <> <>
  -- ]], {i(1), i(0)}, {
    -- indent_string = ""
  -- }))
-- })


ls.add_snippets("tex", {
  s("template", fmta([[
\documentclass[11pt]{article}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{listings}
\usepackage[utf8]{inputenc}
\usepackage{parskip}
\usepackage{hyperref}
\usepackage{bookmark}
\usepackage[linguistics]{forest}
\usepackage{tikz}

\usepackage{amsmath}
\usepackage{amsthm}
\usepackage{amssymb}
\usepackage{enumitem}

\usepackage{import}
\usepackage{pdfpages}
\usepackage{transparent}
\usepackage{xcolor}

\newtheorem{all}{Theorem}[section]
\newtheorem{corollary}[all]{Corollary}
\newtheorem{lemma}[all]{Lemma}
\newtheorem{definition}[all]{Definition}
\newtheorem{exercise}[all]{Exercise}
\newtheorem{proposition}[all]{Proposition}
\newtheorem{example}[all]{Example}
\newtheorem{theorem}{Theorem}

\newenvironment{lecture}[1]{
\t\section{\MakeUppercase{#1}}
\t\vspace{-0.5em}
\t\hrule
\t\vspace{1em}
\t\begin{list}{}{
\t\t\setlength{\leftmargin}{1.5em}
\t}
\t\item[]
}{
\t\end{list}
}

\title{<>}
\author{Jake Ginesin}
\date{}

\begin{document}
\maketitle
<>
\end{document}
  ]], {i(1), i(0)}, {
    indent_string = ""
  }))
})

ls.add_snippets("tex", {
  s("template-math", fmta([[
\documentclass[11pt]{article}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{amsthm} 
\usepackage{fullpage}
\usepackage{listings}
\usepackage[utf8]{inputenc}
\usepackage{parskip}
\usepackage{hyperref}
\usepackage{bookmark}
\usepackage[linguistics]{forest}
\usepackage{tikz}

\usepackage{enumitem}
\usepackage{euler}
\usepackage{libertine}

\usepackage{import}
\usepackage{pdfpages}
\usepackage{transparent}
\usepackage{xcolor}

\newtheoremstyle{definitionstyle}
{}
{}
{\normalfont}
{}
{\bfseries}
{:}
{0.5em}
{}

\theoremstyle{definitionstyle}
\newtheorem{definition}{Definition}[section]

\newtheorem{all}{Theorem}[section]
\newtheorem{corollary}[all]{Corollary}
\newtheorem{lemma}[all]{Lemma}
\newtheorem{exercise}[all]{Exercise}
\newtheorem{proposition}[all]{Proposition}
\newtheorem{example}[all]{Example}
\newtheorem{theorem}{Theorem}

\title{<>}
\author{Jake Ginesin}
\date{}

\begin{document}
\maketitle
	<>
\end{document}
  ]], {i(1), i(0)}, {
    indent_string = ""
  }))
})

-- ----


ls.add_snippets("tex", {
  s({trig = "ita", dscr = "Expands 'tii' into LaTeX's textit{} command."},
    fmta("\\textit{<>}",
      {
        d(1, get_visual),
      }
    )
  ),


  -- s({trig = "ff"},
  -- fmta(
    -- "\\frac{<>}{<>}",
    -- {
      -- i(1),
      -- i(2),
    -- }
  -- ),
  -- {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
-- ),

})

