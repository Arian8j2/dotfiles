require("blink.cmp").setup({
    completion = {
        keyword = { range = "full" },
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
