require("diffview").setup({
    enhanced_diff_hl = true,
})
vim.opt.fillchars = vim.opt.fillchars + 'diff:╱'
vim.keymap.set({ "n" }, "<leader>do", "<cmd>DiffviewOpen<enter>")
vim.keymap.set({ "n" }, "<leader>dc", "<cmd>DiffviewClose<enter>")
