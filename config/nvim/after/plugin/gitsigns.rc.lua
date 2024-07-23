require("gitsigns").setup({
    signs = {
        delete = { text = "┃" },
        topdelete = { text = "┃" },
        changedelete = { text = "┆" }
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local opts = { buffer = bufnr }

        vim.keymap.set({ "n", "v" }, "<leader>ha", ":Gitsigns stage_hunk<CR>", opts)
        vim.keymap.set({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
        vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, opts)
        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts)
        vim.keymap.set("n", "<leader>hb", function() gs.blame_line({ full = false }) end, opts)
        vim.keymap.set("n", "<leader>hd", gs.diffthis, opts)
    end
})
