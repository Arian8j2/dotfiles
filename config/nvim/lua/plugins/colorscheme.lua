return {
    "navarasu/onedark.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        style = "darker"
    },
    config = function(_, opts)
        require("onedark").setup(opts)
        vim.cmd("colorscheme onedark")
        vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })
        vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "FloatBorder" })
        vim.api.nvim_set_hl(0, "@lsp.type.typeAlias.rust", { link = "@type" })
    end
}
