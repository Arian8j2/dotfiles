return {
    -- don't like plugins that do thousand different things but couldn't find better alternative for some small things
    "nvim-mini/mini.nvim",
    version = "*",
    config = function()
        -- comment keybinds
        require("mini.comment").setup()

        -- deleting buffers without fucking up the window layouts
        require("mini.bufremove").setup()
        vim.keymap.set("n", "<leader>x", function()
            local bufnr = vim.api.nvim_get_current_buf()
            MiniBufremove.delete(bufnr)
        end)

        -- delete all buffer except one that is focused
        vim.keymap.set("n", "<leader>gx", function()
            for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                local info = vim.fn.getbufinfo(bufnr)[1]
                local is_term = string.find(info.name, "term://")
                if info.hidden == 1 and not is_term then
                    MiniBufremove.delete(bufnr)
                end
            end
        end);

        -- automatic insert of ', ", [, ... pair
        require("mini.pairs").setup()
    end
}
