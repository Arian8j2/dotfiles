require("toggleterm").setup({
    size = 15,
})

vim.keymap.set("t", "<A-c>", "<C-\\><C-n>")
vim.keymap.set({"n", "t"}, "<C-f>", "<cmd>ToggleTerm direction=horizontal<enter>")
vim.keymap.set({"n", "t"}, "<C-j>", "<cmd>ToggleTerm direction=float<enter>")
