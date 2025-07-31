-- ~/.config/nvim/lua/config/lsp.lua
local lsp_config = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local blink_cmp = require("blink.cmp")

local capabilities = blink_cmp.get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local map = vim.keymap.set

	map("n", "gd", vim.lsp.buf.definition, opts)
	map("n", "gr", vim.lsp.buf.references, opts)
	map("n", "K", vim.lsp.buf.hover, opts)
	map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	map("n", "<leader>rn", vim.lsp.buf.rename, opts)
	map("n", "<leader>e", vim.diagnostic.open_float, opts)
	map("n", "[d", vim.diagnostic.goto_prev, opts)
	map("n", "]d", vim.diagnostic.goto_next, opts)
end

-- 👇 First setup Mason
mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- 👇 Then setup mason-lspconfig
mason_lspconfig.setup({})

-- 👇 Now it's safe to call setup_handlers
local servers = mason_lspconfig.get_installed_servers()

for _, server_name in ipairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	if server_name == "lua_ls" then
		opts.settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				diagnostics = { globals = { "vim" } },
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = { enable = false },
			},
		}
		opts.root_dir = require("lspconfig.util").find_git_ancestor
	end

	lsp_config[server_name].setup(opts)
end
