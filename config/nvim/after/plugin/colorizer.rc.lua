require("colorizer").setup({
    lazy_load = true,
    options = {
        parsers = {
            css = true,
            css_fn = true,
            tailwind = {
                enable = true,
                update_names = true,
                lsp = {
                    enable = true,
                    disable_document_color = true,
                },
            },
        }
    }
})
