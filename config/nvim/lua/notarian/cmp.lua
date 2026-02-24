require("blink.cmp").setup({
    completion = {
        keyword = { range = "full" },
        documentation = {
            auto_show = true
        }
    },
    keymap = {
        ["<CR>"] = { "select_and_accept", "fallback" },
    },
    fuzzy = {
        implementation = "lua",
    }
})
