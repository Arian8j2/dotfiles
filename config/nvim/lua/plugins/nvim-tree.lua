return {
    -- file tree
    "nvim-tree/nvim-tree.lua",
    opts = {
        view = {
            adaptive_size = true,
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

    },
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    keys = {
        { "<C-n>",     "<cmd>NvimTreeToggle<enter>" },
        { "<leader>e", "<cmd>NvimTreeFocus<enter>" }
    }
}
