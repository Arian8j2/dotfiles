require("lualine").setup({
    extensions = { "nvim-tree" },
    options = {
        component_separators = '|',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {{"mode", separator = { left = '' }, right_padding = 2 }},
        lualine_b = {"branch", "filename"},
        lualine_c = {"diff"},
        lualine_x = {"diagnostics"},
        lualine_y = {"filetype", "progress"},
        lualine_z = {{"location", separator = { right = '' }, left_padding = 2}}
    }
})
