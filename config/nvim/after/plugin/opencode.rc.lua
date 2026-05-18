vim.keymap.set({ "n", "x" }, "<leader>oa", function()
    require("opencode").prompt("@this: ")
    vim.cmd("2ToggleTerm")
end,
    { desc = "Ask opencode…" })
vim.keymap.set({ "n", "x" }, "<leader>ox", function() require("opencode").select() end,
    { desc = "Execute opencode action…" })
