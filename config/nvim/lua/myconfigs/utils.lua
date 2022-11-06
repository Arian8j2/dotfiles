require("Comment").setup()
require("nvim-autopairs").setup()
require("guess-indent").setup()

require("indent_blankline").setup({
    char = "┆",
    char_blankline = "",
    show_first_indent_level = false
})

-- git signs
vim.cmd("set fillchars+=diff:/") -- diffview.nvim diagonal lines

require("gitsigns").setup({
    signs = {
        delete = { text = "┃" },
        topdelete = { text = "┃" },
        changedelete = { text = "┆" }
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local opts = { buffer = bufnr }

        vim.keymap.set({"n", "v"}, "<leader>hs", ":Gitsigns stage_hunk<CR>", opts)
        vim.keymap.set({"n", "v"}, "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts)
        vim.keymap.set("n", "<leader>hb", function() gs.blame_line({ full=true }) end, opts)
        vim.keymap.set("n", "<leader>hd", gs.diffthis, opts)
    end
})

-- terminal
require("toggleterm").setup({
    size = 15,
})
vim.keymap.set("t", "<A-c>", "<C-\\><C-n>")
vim.keymap.set({"n", "t"}, "<C-j>", "<cmd>ToggleTerm direction=horizontal<enter>")
vim.keymap.set({"n", "t"}, "<C-f>", "<cmd>ToggleTerm direction=float<enter>")

-- cheat sh
vim.keymap.set("n", "<leader>fc", "<cmd>Cheat<enter>")
