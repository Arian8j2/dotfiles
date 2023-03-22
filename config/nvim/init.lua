vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = ","
vim.o.background = "dark"
vim.opt.termguicolors = true
vim.bo.swapfile = false
vim.o.signcolumn = "yes"
vim.o.list = true
vim.o.listchars = "extends:▸,tab:  "
vim.o.wrap = false

vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<C-c>", "<cmd>noh<enter>", { silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { silent = true })
vim.keymap.set("x", "p", "p:let @+=@0<CR>:let @\"=@0<CR>", { silent = true })
vim.opt.undofile = true
vim.opt.laststatus = 0
vim.opt.fillchars = { vert = "▏" }
vim.g.omni_sql_no_default_maps = "<leader>c"

require("packer").init({
    snapshot = vim.fn.stdpath("config") .. "/plugin/snapshot.json",
    snapshot_path = vim.fn.stdpath("config") .. "/plugin"
})
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
    use("JASONews/glow-hover.nvim")
    use("johnfrankmorgan/whitespace.nvim")
    use("j-hui/fidget.nvim")
    use("ziontee113/SelectEase")

    -- status line
    use("nvim-lualine/lualine.nvim")

    -- theme
    use("nvim-treesitter/nvim-treesitter")
    use("folke/tokyonight.nvim")
    use("Arian8j2/aura.nvim")

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
    use("onsails/lspkind.nvim")

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
require("myconfigs.lsp")
require("myconfigs.file-tree")
require("myconfigs.bufferline")
require("myconfigs.telescope")
require("myconfigs.theme")
