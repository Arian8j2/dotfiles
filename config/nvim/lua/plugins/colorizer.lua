return {
    -- color highlighter
    "catgoose/nvim-colorizer.lua",
    opts = {
        lazy_load = true,
        options = {
            parsers = {
                names = {
                    enable = false
                },
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
    },
    event = "BufEnter"
}
