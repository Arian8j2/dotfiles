require("onedark").setup({
    style = "darker"
})
vim.cmd("colorscheme onedark")

-- setuping theme overwrites this for some reason
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "@lsp.type.typeAlias.rust", { link = "@type" })
