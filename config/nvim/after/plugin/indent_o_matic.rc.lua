vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.expandtab = true

require("indent-o-matic").setup({
    max_lines = 1024,
    forced_default_width = 4,
    standard_widths = { 2, 4, 8 },
    skip_multiline = true,

    filetype_typescriptreact = {
        forced_default_width = 2
    },

    filetype_typesript = {
        forced_default_width = 2
    },

    filetype_yaml = {
        forced_default_width = 2,
        standard_widths = { 2 }
    },

    filetype_nix = {
        forced_default_width = 2
    },
})
