-- ~/.config/nvim/lua/config/nvimtree.lua

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 20,
    side = "left",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

