require("Comment").setup()
require("nvim-autopairs").setup()

-- buffer delete
vim.keymap.set("n", "<leader>gx", function()
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        local info = vim.fn.getbufinfo(bufnr)[1]
        local is_term = string.find(info.name, "term://")
        if info.hidden == 1 and not is_term then
            require("bufdelete").bufdelete(bufnr)
        end
    end
end);

-- detect indent
require("indent-o-matic").setup({
    max_lines = 2048,
    standard_widths = { 2, 4, 8 },
    skip_multiline = true
})

-- indent blank line
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

        vim.keymap.set({"n", "v"}, "<leader>ha", ":Gitsigns stage_hunk<CR>", opts)
        vim.keymap.set({"n", "v"}, "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
        vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, opts)
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
