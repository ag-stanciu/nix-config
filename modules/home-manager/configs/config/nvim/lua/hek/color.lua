local ok, tokyo = pcall(require, 'tokyonight')
if not ok then
    return
end

local M = {}

-- colors
tokyo.setup({
    style = "night",
    plugins = {
        auto = true,
    },
    -- transparent = true,
    styles = {
        floats = "transparent"
    },
    on_highlights = function(hl, c)
        -- Normals.
        hl.TelescopePromptNormal = { bg = c.bg, }
        hl.TelescopeResultsNormal = { bg = c.bg_dark, }
        hl.TelescopePreviewNormal = { bg = c.bg_dark, }

        --     -- Selection.
        hl.TelescopeSelection = { bg = c.bg_highlight, fg = c.fg, bold = true, }
        hl.TelescopeSelectionCaret = { fg = c.blue7, bg = c.bg_highlight, bold = true }

        --     -- Titles.
        hl.TelescopePreviewTitle = { bg = c.blue7, fg = c.black, bold = true, }
        hl.TelescopeResultsTitle = { bg = c.blue7, fg = c.black, bold = true, }
        hl.TelescopePromptTitle = { bg = c.blue7, fg = c.black, bold = true, }
        hl.TelescopeTitle = { bg = c.orange, fg = c.black, bold = true, }

        -- Borders.
        -- hl.TelescopeBorder = { fg = c.bg_popup, bg = c.bg_popup, }
        hl.TelescopePromptBorder = { bg = c.bg, fg = c.blue7, }
        hl.TelescopeResultsBorder = { bg = c.bg_dark, fg = c.blue7, }
        hl.TelescopePreviewBorder = { bg = c.bg_dark, fg = c.blue7, }

        -- Misc.
        hl.TelescopePromptPrefix = { bg = c.bg, fg = c.blue7, }

        hl.PopupNormal = { bg = c.bg_dark, }
        hl.PopupBorder = { bg = c.bg_dark, fg = c.blue7, }
        hl.NormalFloat = { bg = c.bg_dark, }
        hl.FloatBorder = { bg = c.bg_dark, fg = c.blue7 }

        hl.Pmenu = { link = 'PopupNormal' }
        hl.PmenuSel = { bg = c.blue7 }
        hl.PmenuBorder = { link = 'PopupBorder' }
        hl.PmenuDocBorder = { bg = c.bg_dark, fg = c.blue7 }

        hl.CmpItemAbbrDeprecated = { fg = c.comment, bg = "NONE", strikethrough = true }
        hl.CmpItemAbbrMatch = { fg = c.blue, bg = "NONE", bold = true }
        hl.CmpItemAbbrMatchFuzzy = { fg = c.blue, bg = "NONE", bold = true }
        hl.CmpItemMenu = { fg = c.purple, bg = "NONE", italic = true }

        hl.CmpItemKindField = { fg = c.fg, bg = c.red }
        hl.CmpItemKindProperty = { fg = c.fg, bg = c.red }
        hl.CmpItemKindEvent = { fg = c.fg, bg = c.red }

        hl.CmpItemKindText = { fg = c.fg, bg = c.green2 }
        hl.CmpItemKindEnum = { fg = c.fg, bg = c.green2 }
        hl.CmpItemKindKeyword = { fg = c.fg, bg = c.green2 }

        hl.CmpItemKindConstant = { fg = c.fg, bg = c.magenta2 }
        hl.CmpItemKindConstructor = { fg = c.fg, bg = c.magenta2 }
        hl.CmpItemKindReference = { fg = c.fg, bg = c.magenta2 }

        hl.CmpItemKindFunction = { fg = c.fg, bg = c.purple }
        hl.CmpItemKindStruct = { fg = c.fg, bg = c.purple }
        hl.CmpItemKindClass = { fg = c.fg, bg = c.purple }
        hl.CmpItemKindModule = { fg = c.fg, bg = c.purple }
        hl.CmpItemKindOperator = { fg = c.fg, bg = c.purple }

        hl.CmpItemKindVariable = { fg = c.fg_dark, bg = c.dark3 }
        hl.CmpItemKindFile = { fg = c.fg_dark, bg = c.dark3 }

        hl.CmpItemKindUnit = { fg = c.fg, bg = c.yellow }
        hl.CmpItemKindSnippet = { fg = c.fg, bg = c.yellow }
        hl.CmpItemKindFolder = { fg = c.fg, bg = c.yellow }

        hl.CmpItemKindMethod = { fg = c.fg, bg = c.blue }
        hl.CmpItemKindValue = { fg = c.fg, bg = c.blue }
        hl.CmpItemKindEnumMember = { fg = c.fg, bg = c.blue }

        hl.CmpItemKindInterface = { fg = c.fg, bg = c.blue2 }
        hl.CmpItemKindColor = { fg = c.fg, bg = c.blue2 }
        hl.CmpItemKindTypeParameter = { fg = c.fg, bg = c.blue2 }
    end,
})
local colorscheme = require("tokyonight.colors").setup()
-- local util = require("tokyonight.util")
-- local grey9 = util.darken(colorscheme.bg_highlight, 0.5)
-- local dark_red = util.darken(colorscheme.red, 0.5)
vim.cmd("colorscheme tokyonight-night")

local colors = vim.tbl_deep_extend("force", colorscheme, {
    statusline_bg = colorscheme.bg_statusline,
    statusline_div = colorscheme.bg_statusline,
    statusline_text = colorscheme.fg,
    grey9 = colorscheme.bg_highlight,
    dark_red = colorscheme.red,
    -- bg_dark = "#2e3440",
    -- gray = colorscheme.terminal_black,
})

-- everforest
-- require("everforest").setup({
--     background = "hard",
--     on_highlights = function(hl, palette)
--         hl.TelescopePromptNormal = { bg = palette.bg, }
--         hl.TelescopeResultsNormal = { bg = palette.bg, }
--         hl.TelescopePreviewNormal = { bg = palette.bg, }
--
--         --     -- Selection.
--         hl.TelescopeSelection = { bg = palette.bg1, fg = palette.fg, bold = true, }
--         hl.TelescopeSelectionCaret = { fg = palette.blue7, bg = palette.bg1, bold = true }
--
--         --     -- Titles.
--         hl.TelescopePreviewTitle = { bg = palette.blue, fg = palette.bg1, bold = true, }
--         hl.TelescopeResultsTitle = { bg = palette.blue, fg = palette.bg1, bold = true, }
--         hl.TelescopePromptTitle = { bg = palette.blue, fg = palette.bg1, bold = true, }
--         hl.TelescopeTitle = { bg = palette.orange, fg = palette.bg1, bold = true, }
--
--         -- Borders.
--         -- hl.TelescopeBorder = { fg = palette.bg_popup, bg = palette.bg_popup, }
--         hl.TelescopePromptBorder = { bg = palette.bg, fg = palette.blue, }
--         hl.TelescopeResultsBorder = { bg = palette.bg_dark, fg = palette.blue, }
--         hl.TelescopePreviewBorder = { bg = palette.bg_dark, fg = palette.blue, }
--
--         -- Mispalette.
--         hl.TelescopePromptPrefix = { bg = palette.bg, fg = palette.blue7, }
--
--         hl.PopupNormal = { bg = palette.bg_dark, }
--         hl.PopupBorder = { bg = palette.bg_dark, fg = palette.blue7, }
--         hl.NormalFloat = { bg = palette.bg_dark, }
--         hl.FloatBorder = { bg = palette.bg_dark, fg = palette.blue7 }
--
--         hl.Pmenu = { link = 'PopupNormal' }
--         hl.PmenuSel = { bg = palette.blue }
--         hl.PmenuBorder = { link = 'PopupBorder' }
--         hl.PmenuDocBorder = { bg = palette.bg, fg = palette.blue }
--
--
--         hl.CmpItemAbbrDeprecated = { fg = palette.comment, bg = "NONE", strikethrough = true }
--         hl.CmpItemAbbrMatch = { fg = palette.blue, bg = "NONE", bold = true }
--         hl.CmpItemAbbrMatchFuzzy = { fg = palette.blue, bg = "NONE", bold = true }
--         hl.CmpItemMenu = { fg = palette.purple, bg = "NONE", italic = true }
--
--         hl.CmpItemKindField = { fg = palette.fg, bg = palette.red }
--         hl.CmpItemKindProperty = { fg = palette.fg, bg = palette.red }
--         hl.CmpItemKindEvent = { fg = palette.fg, bg = palette.red }
--
--         hl.CmpItemKindText = { fg = palette.fg, bg = palette.green }
--         hl.CmpItemKindEnum = { fg = palette.fg, bg = palette.green }
--         hl.CmpItemKindKeyword = { fg = palette.fg, bg = palette.green }
--
--         hl.CmpItemKindConstant = { fg = palette.fg, bg = palette.magenta }
--         hl.CmpItemKindConstructor = { fg = palette.fg, bg = palette.magenta }
--         hl.CmpItemKindReference = { fg = palette.fg, bg = palette.magenta }
--
--         hl.CmpItemKindFunction = { fg = palette.fg, bg = palette.purple }
--         hl.CmpItemKindStruct = { fg = palette.fg, bg = palette.purple }
--         hl.CmpItemKindClass = { fg = palette.fg, bg = palette.purple }
--         hl.CmpItemKindModule = { fg = palette.fg, bg = palette.purple }
--         hl.CmpItemKindOperator = { fg = palette.fg, bg = palette.purple }
--
--         hl.CmpItemKindVariable = { fg = palette.fg_dark, bg = palette.dark3 }
--         hl.CmpItemKindFile = { fg = palette.fg_dark, bg = palette.dark3 }
--
--         hl.CmpItemKindUnit = { fg = palette.fg, bg = palette.yellow }
--         hl.CmpItemKindSnippet = { fg = palette.fg, bg = palette.yellow }
--         hl.CmpItemKindFolder = { fg = palette.fg, bg = palette.yellow }
--
--         hl.CmpItemKindMethod = { fg = palette.fg, bg = palette.blue }
--         hl.CmpItemKindValue = { fg = palette.fg, bg = palette.blue }
--         hl.CmpItemKindEnumMember = { fg = palette.fg, bg = palette.blue }
--
--         hl.CmpItemKindInterface = { fg = palette.fg, bg = palette.blue }
--         hl.CmpItemKindColor = { fg = palette.fg, bg = palette.blue }
--         hl.CmpItemKindTypeParameter = { fg = palette.fg, bg = palette.blue }
--     end,
-- })
-- vim.cmd("colorscheme everforest")
-- local conf = require("everforest").config
-- local colorscheme = require("everforest.colours").generate_palette(conf, "dark")
-- -- vim.print(vim.inspect(colorscheme))
-- local colors = vim.tbl_deep_extend("force", colorscheme, {
--     bg = colorscheme.bg0,
--     statusline_bg = colorscheme.bg0,
--     statusline_div = colorscheme.bg,
--     statusline_text = colorscheme.fg,
--     grey9 = colorscheme.grey0,
--     dark_red = colorscheme.red1,
--     bg_dark = colorscheme.bg1,
--     -- gray = colorscheme.terminal_black,
-- })

-- require("poimandres").setup({
--     style = "storm",
--     transparent = true,
-- })
-- local colorscheme = require("poimandres.colors").setup({
--     style = "storm",
--     transparent = "true"
-- })
-- local colors = vim.tbl_deep_extend("force", colorscheme, {
--     statusline_bg = colorscheme.bg,
--     statusline_div = colorscheme.bg,
--     statusline_text = colorscheme.fg,
--     grey9 = colorscheme.darkerGray,
--     dark_red = colorscheme.hotRed,
--     bg_dark = colorscheme.focus,
--     bg = colorscheme.bg,
--     -- gray = colorscheme.terminal_black,
-- })
-- vim.cmd("colorscheme poimandres-storm")

M.colors = colors
return M
