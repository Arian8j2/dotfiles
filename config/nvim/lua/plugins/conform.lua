return {
    -- formatter manager
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            python = { "ruff_format" },
            typescriptreact = { "prettier" },
            js = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            css = { "prettier" },
            toml = { "taplo" },
            asm = { "asmfmt" }
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
    keys = {
        { "<leader>lf", require("conform").format, mode = { "n", "v" } }
    }
}
