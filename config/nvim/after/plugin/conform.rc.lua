require("conform").setup({
    formatters_by_ft = {
        python = { "ruff_format" },
        typescriptreact = { "prettier" },

        -- use lsp formatter for other filetypes
        ["_"] = {
            lsp_format = "prefer"
        }
    },
})

vim.keymap.set("n", "<leader>lf", require("conform").format)
