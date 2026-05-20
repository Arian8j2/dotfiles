return {
    -- completion engine
    "saghen/blink.cmp",
    branch = "v1",
    event = "InsertEnter",
    opts = {
        completion = {
            keyword = { range = "full" },
            list = {
                selection = {
                    preselect = true
                }
            },
            documentation = {
                auto_show = true
            }
        },
        keymap = {
            ["<CR>"] = { "accept", "fallback" },
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning",
            download = false
        }
    }
}
