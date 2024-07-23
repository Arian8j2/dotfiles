require("packer").init({
    -- snapshot = vim.fn.stdpath("config") .. "/plugin/snapshot.json",
    snapshot_path = vim.fn.stdpath("config") .. "/plugin"
})

require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- popular utils and dependency to many plguins
    use("nvim-lua/plenary.nvim")

    -- comment code
    use("numToStr/Comment.nvim")

    -- fix commenting in jsx,tsx files
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- auto add pairs to quotes, double quotes, parentheses, ...
    use({
        "windwp/nvim-autopairs",
        event = "BufRead",
        config = function() require("nvim-autopairs").setup() end
    })

    -- manage indent size
    use("Arian8j2/indent-o-matic")

    -- indent characters
    use("lukas-reineke/indent-blankline.nvim")

    -- git decorations and hotkeys
    use("lewis6991/gitsigns.nvim")

    -- toggle floating terminal window buffer
    use("akinsho/toggleterm.nvim")

    -- color highlighter
    use("norcalli/nvim-colorizer.lua")

    -- use glow to make lsp hover more beautiful
    use("Arian8j2/glow-hover.nvim")

    -- make trailing whitespaces more visible
    use("johnfrankmorgan/whitespace.nvim")

    -- cool lsp loading animation
    use("j-hui/fidget.nvim")

    -- status line
    use("nvim-lualine/lualine.nvim")

    -- common it's treesitter
    use("nvim-treesitter/nvim-treesitter")

    -- theme
    use({ "rose-pine/neovim", as = "rose-pine" })

    -- neovim lsp configs
    use("neovim/nvim-lspconfig")

    -- auto completion engine
    use("hrsh7th/nvim-cmp")

    -- nvim-cmp source for neovim's built-in lsp
    use("hrsh7th/cmp-nvim-lsp")

    -- nvim-cmp source for neovim lua api
    use("hrsh7th/cmp-nvim-lua")

    -- snippet manager
    use("dcampos/nvim-snippy")

    -- nvim-cmp source for nvim-snippy
    use("dcampos/cmp-snippy")

    -- nvim-cmp source for filesystem paths
    use("hrsh7th/cmp-path")

    -- nvim-cmp source for math calculation
    use("hrsh7th/cmp-calc")

    -- package manager for lsp, dap, linter, formatter
    use("williamboman/mason.nvim")

    -- automatically configure lsp servers that are acquired from mason
    use("williamboman/mason-lspconfig.nvim")

    -- formatter manager
    use("stevearc/conform.nvim")

    -- cool icons in lsp completion menu
    use("onsails/lspkind.nvim")

    -- file tree
    use("nvim-tree/nvim-tree.lua")

    -- adds file icons to file tree and some other plugins
    use("nvim-tree/nvim-web-devicons")

    -- handle buffers more easilly
    use("akinsho/bufferline.nvim")

    -- delete buffers more easilly
    use("famiu/bufdelete.nvim")

    -- highly extendable fuzzy finder over lists
    use("nvim-telescope/telescope.nvim")

    -- add/change/delete surrounding delimiter pairs
    use({
        "kylechui/nvim-surround",
        event = "BufRead",
        config = function() require("nvim-surround").setup() end
    })

    -- cool mode for focusing on only code and not get distracted
    use({
        "folke/zen-mode.nvim",
        event = "BufRead",
        config = function() require("zen-mode").setup({}) end
    })

    -- read and write to files with sudo
    use("lambdalisue/suda.vim")
end)
