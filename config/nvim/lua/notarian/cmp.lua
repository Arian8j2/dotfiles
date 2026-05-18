require("blink.cmp").setup({
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
        implementation = "lua",
    }
})
