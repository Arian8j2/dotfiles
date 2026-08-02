return {
    "dlyongemallo/diffview.nvim",
    opts = {
        enhanced_diff_hl = true,
    },
    keys = {
        { "<leader>do", "<cmd>DiffviewOpen<enter>" },
        { "<leader>ds", "<cmd>DiffviewOpen --staged<enter>" },
        { "<leader>dc", "<cmd>DiffviewClose<enter>" },
        { "<leader>de", "<cmd>DiffviewToggleFiles<enter>" },
    },
    init = function()
        vim.opt.fillchars = vim.opt.fillchars + 'diff:╱'
    end,
}
