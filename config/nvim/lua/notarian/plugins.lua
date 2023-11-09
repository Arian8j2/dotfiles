require("packer").init({
    -- snapshot = vim.fn.stdpath("config") .. "/plugin/snapshot.json",
    snapshot_path = vim.fn.stdpath("config") .. "/plugin"
})

require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use("nvim-lua/plenary.nvim") -- popular utils and dependency to many plguins

    use("numToStr/Comment.nvim") -- easily comment code
    use({
        "JoosepAlviste/nvim-ts-context-commentstring", -- fix commenting in jsx,tsx files
        requires = { "nvim-treesitter/nvim-treesitter", "numToStr/Comment.nvim" }
    })

    use({
        "windwp/nvim-autopairs",
        event = "BufRead",
        config = function() require("nvim-autopairs").setup() end
    })

    use("Arian8j2/indent-o-matic") -- manage indent size
    use("lukas-reineke/indent-blankline.nvim") -- beatifull indent characters

    use("lewis6991/gitsigns.nvim")
    use("akinsho/toggleterm.nvim") -- lightweight terminal emulator in nvim

    use({ "RishabhRD/nvim-cheat.sh", requires = { "RishabhRD/popfix" }}) -- cool cheatsheet searcher

    use("sindrets/diffview.nvim") -- beatifull git diff view
    use("norcalli/nvim-colorizer.lua") -- highlight colors
    use("JASONews/glow-hover.nvim") -- beatifull lsp hover using glow
    use("johnfrankmorgan/whitespace.nvim")
    use({ "j-hui/fidget.nvim", tag = "legacy" }) -- cool lsp loading animation

    use({ "MunifTanjim/prettier.nvim", requires = { "jose-elias-alvarez/null-ls.nvim" }}) -- better formatter for css, html, tsx, ...

    use("nvim-lualine/lualine.nvim") -- status line

    use("nvim-treesitter/nvim-treesitter") -- best highlighter in world
    -- use("folke/tokyonight.nvim") -- tokyonight theme
    -- use("/home/arian/Projects/aura.nvim") -- aura theme
    use({ "rose-pine/neovim", as = "rose-pine" })

    use("neovim/nvim-lspconfig")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("dcampos/nvim-snippy")
    use("dcampos/cmp-snippy")

    use("hrsh7th/cmp-path") -- auto complete paths
    use("hrsh7th/cmp-calc") -- auto complete math equations

    use({ "williamboman/mason.nvim", requires = { "williamboman/mason-lspconfig.nvim" }}) -- lsp, dap, linter, formatter server manager
    use("onsails/lspkind.nvim") -- cool icons for lsp hover

    use("nvim-tree/nvim-web-devicons")
    use("nvim-tree/nvim-tree.lua") -- file browser

    use("akinsho/bufferline.nvim") -- tabs
    use("famiu/bufdelete.nvim") -- functions for delete tabs

    use("nvim-telescope/telescope.nvim")

    use("mfussenegger/nvim-dap") -- debugger
    use("rcarriga/nvim-dap-ui") -- debugger cool ui

    use({
        "kylechui/nvim-surround",
        event = "BufRead",
        config = function() require("nvim-surround").setup({}) end
    })

    use({ -- cool mode for focus on single file code
        "folke/zen-mode.nvim",
        event = "BufRead",
        config = function() require("zen-mode").setup({}) end
    })

    use("lambdalisue/suda.vim") -- sudo write and read files
end)
