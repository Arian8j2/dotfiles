require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
})

require("aura").setup({
  override_terminal_colors = false
})

-- require("tokyonight").setup({
--     on_highlights = function(highlights, colors)
--         highlights.NvimTreeFolderIcon = { bg = colors.none, fg = colors.blue }
--     end
-- })

vim.cmd("colorscheme aura")
