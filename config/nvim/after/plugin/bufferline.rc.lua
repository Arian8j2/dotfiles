require("bufferline").setup({
    options = {
        show_close_icon = false,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = false
            }
        }
    }
})

vim.keymap.set("n", "<leader>x", "<cmd>Bdelete<enter>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>BufferLineCycleNext<enter>")
vim.keymap.set("n", "<C-h>", "<cmd>BufferLineCyclePrev<enter>")
