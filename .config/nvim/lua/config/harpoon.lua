local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():append()
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

for i = 1, 9 do
	vim.keymap.set("n", "<C-" .. i .. ">", function()
		harpoon:list():select(i)
	end, { desc = "Harpoon file " .. i })
end

vim.keymap.set("n", "<C-0>", function()
	harpoon:list():select(10)
end, { desc = "Harpoon file 10" })

vim.keymap.set("n", "<leader>hf", function()
	require("telescope").extensions.harpoon.marks()
end, { desc = "Harpoon fuzzy file jump" })
