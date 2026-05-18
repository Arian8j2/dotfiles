require("toggleterm").setup({
    direction = "float",
    float_opts = {
        border = "curved"
    },
    highlights = {
        NormalFloat = {
            link = "TelescopeNormal"
        },
        FloatBorder = {
            link = "TelescopeBorder"
        }
    }
})

vim.keymap.set("t", "<A-c>", "<C-\\><C-n>")
vim.keymap.set({ "t" }, "<C-j>", "<cmd>ToggleTerm<enter>")
vim.keymap.set({ "n" }, "<C-j>", "<cmd>1ToggleTerm<enter>")

local Terminal = require("toggleterm.terminal").Terminal
local opencode = Terminal:new({
    cmd = "opencode --port",
    count = 2,
    on_create = function(term)
        local opts = { buffer = term.bufnr }
        vim.keymap.set("n", "<C-u>", function()
            require("opencode").command("session.half.page.up")
        end, vim.tbl_extend("force", opts, { desc = "Scroll up half page" }))

        vim.keymap.set("n", "<C-d>", function()
            require("opencode").command("session.half.page.down")
        end, vim.tbl_extend("force", opts, { desc = "Scroll down half page" }))

        vim.keymap.set("n", "gg", function()
            require("opencode").command("session.first")
        end, vim.tbl_extend("force", opts, { desc = "Go to first message" }))

        vim.keymap.set("n", "G", function()
            require("opencode").command("session.last")
        end, vim.tbl_extend("force", opts, { desc = "Go to last message" }))
        -- for some reason require('opencode.terminal').setup(win.window) didn't work
    end,
})
vim.g.opencode_opts = {
    server = {
        start = function()
            opencode:toggle()
        end,
        toggle = function()
            opencode:toggle()
        end,
    },
}
vim.keymap.set({ "n", "t" }, "<C-k>", function() opencode:toggle() end)
