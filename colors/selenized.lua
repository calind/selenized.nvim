-- Copyright © 2023 Calin Don. All Rights Reserved.

-- lua port of the selenized color scheme
-- see: https://github.com/jan-warchol/selenized
-- with updated values from https://github.com/jan-warchol/selenized/blob/9efeaac1b95a151d5ada36f17f7c4d5c8c3f0741/the-values.md

_G.selenized = _G.selenized or {}

local cmd = vim.cmd
local g = vim.g
local fn = vim.fn

local background = vim.o.background or 'dark'

local none = 'none'
local colors = {
    dark = {
        bg_0       = '#103c48',
        bg_1       = '#174956',
        bg_2       = '#325b66',
        dim_0      = '#72898f',
        fg_0       = '#adbcbc',
        fg_1       = '#cad8d9',
        bg_15      = '#14404b', -- bg_1 12% darker for subtle highlighting of embedded, selectable blocks
        dim_1      = '#90998f', -- yellowish dim_0 for things like autocomplete previews
        red        = '#fa5750',
        green      = '#75b938',
        yellow     = '#dbb32d',
        blue       = '#4695f7',
        magenta    = '#f275be',
        cyan       = '#41c7b9',
        orange     = '#ed8649',
        violet     = '#af88eb',
        br_red     = '#ff665c',
        br_green   = '#84c747',
        br_yellow  = '#ebc13d',
        br_blue    = '#58a3ff',
        br_magenta = '#ff84cd',
        br_cyan    = '#53d6c7',
        br_orange  = '#fd9456',
        br_violet  = '#bd96fa',
    },
    light = {
        bg_0       = '#fbf3db',
        bg_1       = '#e9e4d0',
        bg_2       = '#cfcebe',
        dim_0      = '#909995',
        fg_0       = '#53676d',
        fg_1       = '#3a4d53',
        dim_1      = '#909995', -- TODO: yellowish dim_0 for things like autocomplete previews
        bg_15      = '#e9e4d0', -- TODO: bg_1 12% darker for subtle highlighting of embedded, selectable blocks
        red        = '#d2212d',
        green      = '#489100',
        yellow     = '#ad8900',
        blue       = '#0072d4',
        magenta    = '#ca4898',
        cyan       = '#009c8f',
        orange     = '#c25d1e',
        violet     = '#8762c6',
        br_red     = '#cc1729',
        br_green   = '#428b00',
        br_yellow  = '#a78300',
        br_blue    = '#006dce',
        br_magenta = '#c44392',
        br_cyan    = '#00978a',
        br_orange  = '#bc5819',
        br_violet  = '#825dc0',
        deep_dark  = '#181818',
    }
}
_G.selenized.color_scheme = colors
_G.selenized.colors = colors[background]

local highlight = function(group, hi)
    hi = hi or {}
    if type(hi) == 'string' then
        cmd.hi(string.format('link %s %s', group, hi))
        return
    end
    local format = ''

    if hi.fg then
        format = format .. ' guifg=' .. hi.fg
    end
    if hi.bg then
        format = format .. ' guibg=' .. hi.bg
    end
    if hi.guisp then
        format = format .. ' guisp=' .. hi.guisp
    end
    if hi.style then
        format = format .. ' gui=' .. hi.style
    end

    cmd.hi(group .. ' ' .. format)
end

---@diagnostic disable-next-line: redefined-local
local highlights = function(colors)
    cmd.hi('clear')
    if fn.exists('syntax_on') then
        cmd.syntax('reset')
    end

    g.colors_name                  = 'selenized'

    g.terminal_color_0             = colors.bg_1
    g.terminal_color_1             = colors.red
    g.terminal_color_2             = colors.green
    g.terminal_color_3             = colors.yellow
    g.terminal_color_4             = colors.blue
    g.terminal_color_5             = colors.magenta
    g.terminal_color_6             = colors.cyan
    g.terminal_color_7             = colors.dim_0
    g.terminal_color_8             = colors.bg_2
    g.terminal_color_9             = colors.br_red
    g.terminal_color_10            = colors.br_green
    g.terminal_color_11            = colors.br_yellow
    g.terminal_color_12            = colors.br_blue
    g.terminal_color_13            = colors.br_magenta
    g.terminal_color_14            = colors.br_cyan
    g.terminal_color_15            = colors.fg_1

    local hi                       = {}
    hi['Normal']                   = { fg = colors.fg_0, bg = colors.bg_0, guisp = none, style = none }

    hi['IncSearch']                = { fg = colors.orange, bg = none, guisp = none, style = 'reverse' }
    hi['Search']                   = { fg = colors.yellow, bg = none, guisp = none, style = 'reverse' }
    hi['QuickFixLine']             = 'Search'
    hi['Visual']                   = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['MatchParen']               = { fg = colors.br_yellow, bg = colors.bg_2, guisp = none, style = 'bold' }
    hi['Cursor']                   = { fg = none, bg = none, guisp = none, style = 'reverse' }
    hi['lCursor']                  = 'Cursor'
    hi['CursorLine']               = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['CursorColumn']             = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['Folded']                   = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['ColorColumn']              = { fg = none, bg = colors.bg_2, guisp = none, style = none }
    hi['LineNr']                   = { fg = colors.dim_0, bg = colors.bg_1, guisp = none, style = none }
    hi['CursorLineNr']             = { fg = colors.fg_1, bg = colors.bg_1, guisp = none, style = none }
    hi['WinSeparator']             = { fg = colors.dim_0, bg = colors.dim_0, guisp = none, style = none }
    hi['StatusLine']               = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['StatusLineNC']             = { fg = none, bg = colors.bg_2, guisp = none, style = none }
    hi['StatusLineTerm']           = 'StatusLine'
    hi['StatusLineTermNC']         = 'StatusLineNC'
    hi['TabLineSel']               = { fg = colors.fg_1, bg = colors.bg_2, guisp = none, style = none }
    hi['TabLine']                  = { fg = colors.fg_0, bg = colors.bg_1, guisp = none, style = none }
    hi['TabLineFill']              = { fg = colors.fg_0, bg = colors.bg_1, guisp = none, style = none }
    hi['ToolbarButton']            = { fg = none, bg = none, guisp = none, style = 'reverse' }
    hi['ToolbarLine']              = { fg = none, bg = colors.bg_2, guisp = none, style = none }
    hi['Pmenu']                    = { fg = colors.dim_0, bg = colors.bg_1, guisp = none, style = none }
    hi['PmenuSel']                 = { fg = none, bg = colors.bg_2, guisp = none, style = none }
    hi['PmenuThumb']               = { fg = none, bg = colors.dim_0, guisp = none, style = none }
    hi['PmenuSbar']                = { fg = none, bg = colors.bg_2, guisp = none, style = none }
    hi['DiffAdd']                  = { fg = colors.green, bg = colors.bg_1, guisp = none, style = none }
    hi['DiffChange']               = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['DiffDelete']               = { fg = colors.red, bg = colors.bg_1, guisp = none, style = none }
    hi['DiffText']                 = { fg = colors.bg_1, bg = colors.yellow, guisp = none, style = none }
    hi['Comment']                  = { fg = colors.dim_0, bg = none, guisp = none, style = 'italic' }
    hi['Constant']                 = { fg = colors.cyan, bg = none, guisp = none, style = none }
    hi['String']                   = 'Constant'
    hi['Number']                   = 'Constant'
    hi['Boolean']                  = 'Constant'
    hi['Character']                = 'Constant'
    hi['Float']                    = 'Constant'
    hi['Identifier']               = { fg = colors.br_blue, bg = none, guisp = none, style = none }
    hi['Function']                 = 'Identifier'
    hi['Statement']                = { fg = colors.br_yellow, bg = none, guisp = none, style = none }
    hi['Conditional']              = 'Statement'
    hi['Repeat']                   = 'Statement'
    hi['Keyword']                  = 'Statement'
    hi['Label']                    = 'Statement'
    hi['Exception']                = 'Statement'
    hi['Operator']                 = 'Statement'
    hi['PreProc']                  = { fg = colors.orange, bg = none, guisp = none, style = none }
    hi['Define']                   = 'PreProc'
    hi['PreCondit']                = 'PreProc'
    hi['Include']                  = 'PreProc'
    hi['Macro']                    = 'Include'
    hi['Type']                     = { fg = colors.green, bg = none, guisp = none, style = none }
    hi['Typedef']                  = 'Type'
    hi['StorageClass']             = 'Type'
    hi['Structure']                = 'Type'
    hi['Special']                  = { fg = colors.red, bg = none, guisp = none, style = none }
    hi['SpecialChar']              = 'Special'
    hi['Delimiter']                = 'Special'
    hi['SpecialComment']           = 'Special'
    hi['Debug']                    = 'Special'
    hi['Tag']                      = 'Special'
    hi['Error']                    = { fg = colors.red, bg = none, guisp = none, style = 'bold' }
    hi['Todo']                     = { fg = colors.magenta, bg = none, guisp = none, style = 'bold' }
    hi['Underlined']               = { fg = colors.violet, bg = none, guisp = none, style = 'underline' }
    hi['Ignore']                   = { fg = colors.bg_2, bg = none, guisp = none, style = none }
    hi['VimCommand']               = { fg = colors.yellow, bg = none, guisp = none, style = none }
    hi['RubyDefine']               = { fg = colors.fg_1, bg = none, guisp = none, style = 'bold' }

    hi['Terminal']                 = { fg = none, bg = none, guisp = none, style = none }
    hi['Conceal']                  = { fg = none, bg = none, guisp = none, style = none }
    hi['Directory']                = { fg = none, bg = none, guisp = none, style = none }
    hi['EndOfBuffer']              = { fg = none, bg = none, guisp = none, style = none }
    hi['ErrorMsg']                 = { fg = none, bg = none, guisp = none, style = none }
    hi['FoldColumn']               = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['ModeMsg']                  = { fg = none, bg = none, guisp = none, style = none }
    hi['MoreMsg']                  = { fg = none, bg = none, guisp = none, style = none }
    hi['NonText']                  = { fg = none, bg = none, guisp = none, style = none }
    hi['Question']                 = { fg = none, bg = none, guisp = none, style = none }
    hi['SignColumn']               = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['SpecialKey']               = { fg = none, bg = none, guisp = none, style = none }
    hi['SpellBad']                 = { fg = none, bg = none, guisp = colors.red, style = 'undercurl' }
    hi['SpellCap']                 = { fg = none, bg = none, guisp = colors.red, style = 'undercurl' }
    hi['SpellLocal']               = { fg = none, bg = none, guisp = colors.yellow, style = 'undercurl' }
    hi['SpellRare']                = { fg = none, bg = none, guisp = colors.cyan, style = 'undercurl' }
    hi['Title']                    = { fg = none, bg = none, guisp = none, style = none }
    hi['VisualNOS']                = { fg = none, bg = none, guisp = none, style = none }
    hi['WarningMsg']               = { fg = none, bg = none, guisp = none, style = none }
    hi['WildMenu']                 = { fg = none, bg = none, guisp = none, style = none }
    hi['FloatBorder']              = { fg = colors.bg_1, bg = none, guisp = none, style = none }
    hi['NormalFloat']              = { fg = colors.dim_0, bg = colors.bg_0, guisp = none, style = none }
    hi['FloatTitle']               = { fg = colors.dim_0, bg = colors.bg_0, guisp = none, style = none }
    hi['WinBar']                   = { fg = colors.dim_0, bg = colors.bg_0, guisp = none, style = none }

    hi['Suggestion']               = { fg = colors.dim_1, bg = none, guisp = none, style = 'italic' }

    -- vim Copilot
    hi['CopilotSuggestion']        = 'Suggestion'

    -- Built-in diagnostic
    hi['DiagnosticError']          = { fg = colors.red, bg = hi['SignColumn'].bg }
    hi['DiagnosticHint']           = { fg = colors.yellow, bg = hi['SignColumn'].bg }
    hi['DiagnosticInfo']           = { fg = colors.cyan, bg = hi['SignColumn'].bg }
    hi['DiagnosticWarn']           = { fg = colors.cyan, bg = hi['SignColumn'].bg }

    hi['DiagnosticUnderlineError'] = { style = 'underline', guisp = hi['DiagnosticError'].fg }
    hi['DiagnosticUnderlineHint']  = { style = 'underline', guisp = hi['DiagnosticWarn'].fg }
    hi['DiagnosticUnderlineInfo']  = { style = 'underline', guisp = hi['DiagnosticInfo'].fg }
    hi['DiagnosticUnderlineWarn']  = { style = 'underline', guisp = hi['DiagnosticHint'].fg }

    -- Built-in LSP
    hi['LspReferenceText']         = { bg = colors.bg_1 }
    hi['LspReferenceRead']         = 'LspReferenceText'
    hi['LspReferenceWrite']        = 'LspReferenceText'

    hi['LspInfoBorder']            = 'FloatBorder'

    -- nvim-cmp highlight groups
    hi['CmpItemKindClass']         = 'Type'
    hi['CmpItemKindColor']         = 'Special'
    hi['CmpItemKindConstant']      = 'Constant'
    hi['CmpItemKindConstructor']   = 'Type'
    hi['CmpItemKindEnum']          = 'Structure'
    hi['CmpItemKindEnumMember']    = 'Structure'
    hi['CmpItemKindEvent']         = 'Exception'
    hi['CmpItemKindField']         = 'Structure'
    hi['CmpItemKindFile']          = 'Tag'
    hi['CmpItemKindFolder']        = 'Directory'
    hi['CmpItemKindFunction']      = 'Function'
    hi['CmpItemKindInterface']     = 'Structure'
    hi['CmpItemKindKeyword']       = 'Keyword'
    hi['CmpItemKindMethod']        = 'Function'
    hi['CmpItemKindModule']        = 'Structure'
    hi['CmpItemKindOperator']      = 'Operator'
    hi['CmpItemKindProperty']      = 'Structure'
    hi['CmpItemKindReference']     = 'Tag'
    hi['CmpItemKindSnippet']       = 'Special'
    hi['CmpItemKindStruct']        = 'Structure'
    hi['CmpItemKindText']          = 'Statement'
    hi['CmpItemKindTypeParameter'] = 'Type'
    hi['CmpItemKindUnit']          = 'Special'
    hi['CmpItemKindValue']         = 'Identifier'
    hi['CmpItemKindVariable']      = 'Delimiter'
    hi['CmpItemKindCopilot']       = 'Structure'

    -- Git Signs
    hi['GitSignsAdd']              = { fg = colors.green, bg = colors.bg_1 }
    hi['GitSignsDelete']           = { fg = colors.red, bg = colors.bg_1 }
    hi['GitSignsChange']           = { fg = colors.blue, bg = colors.bg_1 }

    hi['ColorColumn']              = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['WinSeparator']             = { fg = colors.bg_2, bg = none, guisp = none, style = 'bold' }

    hi['@variable.builtin']        = { fg = colors.green }
    -- improve HTML and Markdown editing
    hi['@text.emphasis']           = { style = 'italic' }
    hi['@text.strong']             = { style = 'bold' }
    hi['@text.title']              = { fg = colors.fg_1, style = 'bold' }
    hi['@text.literal']            = { bg = colors.bg_1 }
    hi['@text.uri']                = hi['Underlined']
    hi['@text.codeblock']          = { bg = colors.bg_15 }

    for group, highlights in pairs(hi) do
        highlight(group, highlights)
    end
    _G.selenized.colors = colors
end
highlights(colors[background])
