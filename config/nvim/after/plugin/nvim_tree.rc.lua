vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    view = {
        adaptive_size = false,
        width = 25
    },
    renderer = {
        indent_markers = {
            enable = true
        }
    },
    update_focused_file = {
        enable = true
    }
})

-- auto close nvim tree when is only buffer left
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd "quit"
        end
    end
})

vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<enter>", { silent = true })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<enter>", { silent = true })
