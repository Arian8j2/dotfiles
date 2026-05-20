return {
    -- delete buffers more easilly
    "famiu/bufdelete.nvim",
    config = function()
        vim.keymap.set("n", "<leader>x", "<cmd>Bdelete<enter>")

        -- delete all buffer except one that is focused
        vim.keymap.set("n", "<leader>gx", function()
            for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                local info = vim.fn.getbufinfo(bufnr)[1]
                local is_term = string.find(info.name, "term://")
                if info.hidden == 1 and not is_term then
                    require("bufdelete").bufdelete(bufnr)
                end
            end
        end);
    end
}
