require("toggleterm").setup({
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
})

vim.keymap.set("t", "<A-c>", "<C-\\><C-n>")
vim.keymap.set({ "n", "t" }, "<C-j>", "<cmd>ToggleTerm direction=float<enter>")
