return {
    "dlyongemallo/diffview.nvim",
    opts = {
        enhanced_diff_hl = true,
    },
    keys = {
        { "<leader>do", "<cmd>DiffviewOpen<enter>" },
        { "<leader>dc", "<cmd>DiffviewClose<enter>" },
    },
    init = function()
        vim.opt.fillchars = vim.opt.fillchars + 'diff:╱'
    end,
}
