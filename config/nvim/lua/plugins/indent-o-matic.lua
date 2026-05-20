return {
    -- manage indent size
    "Arian8j2/indent-o-matic",
    event = "BufEnter",
    opts = {
        max_lines = 1024,
        default_width = 4,
        standard_widths = { 2, 4, 8 },
        skip_multiline = true,

        filetype_typescriptreact = {
            default_width = 2
        },

        filetype_typesript = {
            default_width = 2
        },

        filetype_yaml = {
            forced_width = 2
        },

        filetype_make = {
            forced_width = 4,
            after_indent_callback = function()
                vim.bo.expandtab = false
            end
        }
    }
}
