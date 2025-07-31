-- ~/.config/nvim/lua/core/options.lua

local opt = vim.opt

-- General
opt.mouse = "" -- Enable mouse
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.swapfile = false -- No swap files
opt.backup = false -- No backup files
opt.undofile = true -- Persistent undo
opt.termguicolors = true -- True color support
opt.updatetime = 300 -- Faster completion
opt.timeoutlen = 500 -- Shorter timeout for mapped sequences

-- UI
opt.number = true -- Line numbers
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true -- Highlight current line
opt.signcolumn = "yes" -- Always show signcolumn
opt.scrolloff = 8 -- Keep lines above/below cursor
opt.sidescrolloff = 8

-- Tabs & Indent
opt.tabstop = 2 -- Spaces per tab
opt.shiftwidth = 2 -- Indent size
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Smart indentation

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false -- Don't highlight after search

-- Split behavior
opt.splitbelow = true
opt.splitright = true

-- Wrap
opt.wrap = false -- No line wrap

-- Better completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- Invisible chars (optional)
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·", nbsp = "␣" }
