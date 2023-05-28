require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    -- JoosepAlviste/nvim-ts-context-commentstring
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
})
