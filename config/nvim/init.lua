vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = ","
vim.o.background = "dark"
vim.opt.termguicolors = true
vim.bo.swapfile = false
vim.o.signcolumn = "yes"

vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<C-c>", "<cmd>noh<enter>", { silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { silent = true })
vim.keymap.set("x", "p", "p:let @+=@0<CR>:let @\"=@0<CR>", { silent = true })
vim.opt.undofile = true
vim.opt.laststatus = 0

require("packer").startup(function(use)
    -- utils
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("numToStr/Comment.nvim")
    use("windwp/nvim-autopairs")
    use("Darazaki/indent-o-matic")
    use("lukas-reineke/indent-blankline.nvim")
    use("lewis6991/gitsigns.nvim")
    use("akinsho/toggleterm.nvim")
    use("RishabhRD/popfix")
    use("RishabhRD/nvim-cheat.sh")
    use("sindrets/diffview.nvim")
    use("norcalli/nvim-colorizer.lua")

    -- theme
    use("folke/tokyonight.nvim")
    use("nvim-treesitter/nvim-treesitter")

    -- auto completion
    use("neovim/nvim-lspconfig")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("dcampos/nvim-snippy")
    use("dcampos/cmp-snippy")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-calc")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- file tree
    use("nvim-tree/nvim-web-devicons")
    use("nvim-tree/nvim-tree.lua")

    -- bufferline
    use("akinsho/bufferline.nvim")
    use("famiu/bufdelete.nvim")

    -- telescope
    use("nvim-telescope/telescope.nvim")
end)

require("myconfigs.utils")
require("myconfigs.theme")
require("myconfigs.lsp")
require("myconfigs.file-tree")
require("myconfigs.bufferline")
require("myconfigs.telescope")

vim.cmd("colorscheme tokyonight")
vim.cmd("colorscheme tokyonight-night")

-- TODO: fix cursor flicker in rust-analyzer
