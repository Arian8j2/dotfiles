local null_ls = require("null-ls")
null_ls.setup()

local prettier = require("prettier")
local supported_filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
}

prettier.setup({
    bin = "prettierd",
    filetypes = supported_filetypes,
})

vim.keymap.set({"n", "v"}, "<leader>pf", ":Prettier<CR>", { silent = true })
