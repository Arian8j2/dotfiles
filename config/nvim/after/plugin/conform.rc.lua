require("conform").setup({
    formatters_by_ft = {
        python = { "ruff_format" },
        typescriptreact = { "prettier" },
        toml = { "taplo" },
        asm = { "asmfmt" }
    },
    default_format_opts = {
        lsp_format = "prefer",
    },
})

vim.keymap.set({"n", "v"}, "<leader>lf", require("conform").format)
