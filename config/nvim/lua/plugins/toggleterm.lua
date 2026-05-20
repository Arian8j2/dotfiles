return {
    "akinsho/toggleterm.nvim",
    opts = {
        direction = "float",
        float_opts = {
            border = "curved"
        },
        highlights = {
            NormalFloat = {
                link = "TelescopeNormal"
            },
            FloatBorder = {
                link = "TelescopeBorder"
            }
        }
    },
    keys = {
        { "<A-c>", "<C-\\><C-n>",            mode = "t" },
        { "<C-j>", "<cmd>ToggleTerm<enter>", mode = "t" },
        { "<C-j>", "<cmd>1ToggleTerm<enter>" }
    }
}
