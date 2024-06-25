-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
    theme = "gruvbox",
    transparency = true,

    statusline = {
        theme = "minimal",
        separator_style = "round",
    },

    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
        NvDashAscii = {
            fg = "yellow",
            bg = "NONE",
        },
        NvDashButtons = {
            fg = "light_grey",
            bg = "NONE",
        },
    },

    cmp = {
        icons = true,
        lspkind_text = true,
        style = "default",
        border_color = "sun",
        selected_item_bg = "colored",
    },

    telescope = {
        style = "bordered",
    },

    nvdash = {
        load_on_startup = true,
    },

    tabufline = {
        order = {
            "treeOffset",
            "buffers",
            "tabs",
            "btns",
        },
        modules = nil,
    },

    hl_add = {
        WinBar = { bg = "none" },
        WinBarNc = { bg = "none" },
    },

    cheatsheet = {
        theme = "grid",
    },
}

M.base46 = {
    integrations = { "navic" },
}

return M
