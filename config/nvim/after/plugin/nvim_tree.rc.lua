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

vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<enter>", { silent = true })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<enter>", { silent = true })
