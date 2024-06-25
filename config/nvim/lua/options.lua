require "nvchad.options"

-- add yours here!

local o = vim.o
local opt = vim.opt

o.cursorlineopt = "both" -- to enable cursorline!
o.cursorline = true
o.wrap = false
o.winbar = " "
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
vim.scriptencoding = "UTF-8"
opt.encoding = "UTF-8"
opt.fileencoding = "UTF-8"
opt.smarttab = true
opt.backspace = { "start", "eol", "indent" }
opt.path:append { "**" }
opt.wildignore:append { "*/node_modules/*" }
opt.termguicolors = true
opt.hlsearch = true
opt.showcmd = true
opt.cmdheight = 0
opt.formatoptions:append { "r" }
opt.backup = false
opt.swapfile = false
