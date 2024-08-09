vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        repo,
        "--branch=stable",
        lazypath,
    }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
        config = function()
            require "options"
        end,
    },

    { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
    require "mappings"
end)

vim.o.wrap = false
vim.o.winbar = " "
vim.o.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.opt.colorcolumn = "120"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.scriptencoding = "UTF-8"
vim.opt.encoding = "UTF-8"
vim.opt.fileencoding = "UTF-8"
vim.opt.smarttab = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append { "**" }
vim.opt.wildignore:append { "*/node_modules/*" }
vim.opt.termguicolors = true
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.formatoptions:append { "r" }
vim.opt.backup = false
vim.opt.swapfile = false

-- Neovide configs
if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font Propo:h10"
    vim.opt.linespace = 0
    vim.g.neovide_scale_factor = 1.0
    vim.g.neovide_text_gamma = 0.8
    vim.g.neovide_text_contrast = 0.1
    vim.g.neovide_position_animation_length = 0.05
    vim.g.neovide_scroll_animation_length = 0.1
    vim.g.neovide_scroll_animation_far_lines = 0.1
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_underline_stroke_scale = 0.5
    vim.g.neovide_theme = "auto"
    vim.g.experimental_layer_grouping = false
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_refresh_rate_idle = 5
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_profiler = false
    vim.g.neovide_input_ime = true
    vim.g.neovide_cursor_animation_length = 0.13
    vim.g.neovide_cursor_trail_size = 0.1
    vim.g.neovide_cursor_antialiasing = false
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
    -- vim.g.neovide_transparency = 0.9
    -- vim.cmd('set arabic')
    -- vim.cmd('set rightleft')

    -- the IME Input
    local function set_ime(args)
        if args.event:match "Enter$" then
            vim.g.neovide_input_ime = true
        else
            vim.g.neovide_input_ime = false
        end
    end

    local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

    vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
        group = ime_input,
        pattern = "*",
        callback = set_ime,
    })

    vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
        group = ime_input,
        pattern = "[/\\?]",
        callback = set_ime,
    })
end
