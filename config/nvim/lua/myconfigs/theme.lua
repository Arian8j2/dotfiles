vim.cmd("colorscheme aura")
vim.cmd("hi IndentBlanklineSpaceChar guifg=#edecee")
vim.cmd("hi IndentBlanklineSpaceCharBlankline guifg=#edecee")

require("nvim-treesitter.configs").setup({
    highlight = { enable = true }
})

-- require("tokyonight").setup({
--     on_highlights = function(highlights, colors)
--         highlights.NvimTreeFolderIcon = { bg = colors.none, fg = colors.blue }
--     end
-- })
