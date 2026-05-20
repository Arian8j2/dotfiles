return {
    -- handle buffers more easilly
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
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

    },
    config = function(_, opts)
        require("bufferline").setup(opts)
        vim.keymap.set("n", "<C-l>", "<cmd>BufferLineCycleNext<enter>")
        vim.keymap.set("n", "<C-h>", "<cmd>BufferLineCyclePrev<enter>")
    end
}
