local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():append()
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-t>", function()
	harpoon:list():select(1)
end)

vim.keymap.set("n", "<leader>hf", function()
	require("telescope").extensions.harpoon.marks()
end, { desc = "Harpoon fuzzy file jump" })
