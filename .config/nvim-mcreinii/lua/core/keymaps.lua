-- ~/.config/nvim/lua/core/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- File operations
map("n", "<leader>w", ":w<CR>", opts) -- Save
map("n", "<leader>q", ":q<CR>", opts) -- Quit
map("n", "<leader>qq", ":q!<CR>", opts) -- Force quit
map("n", "<leader>Q", ":qa!<CR>", opts) -- Force quit all

-- Buffer navigation
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bd<CR>", opts) -- Close buffer

-- Clear search highlight
map("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Split management
map("n", "<leader>sv", ":vsplit<CR>", opts)
map("n", "<leader>sh", ":split<CR>", opts)
map("n", "<leader>se", "<C-w>=", opts)

-- Move current line or selection up/down with Alt-j/k
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Keep selection on indent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Center curson on scroll
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- NvimTree toggle
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fG", ":Telescope git_files<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- Lsp
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
