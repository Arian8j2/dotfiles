require("whitespace-nvim").setup({
    highlight = "ExtraWhitespace"
})

vim.cmd([[
    augroup whitespace_nvim
        autocmd!
        autocmd InsertEnter * match
        autocmd BufWrite * lua require('whitespace-nvim').highlight()
    augroup END
]])

vim.cmd([[ hi ExtraWhitespace guibg=#ff6767 ]])
