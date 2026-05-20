return {
    -- highly extendable fuzzy finder over lists
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },

        -- use ripgrep arguments directly in telescope ui
        { "nvim-telescope/telescope-live-grep-args.nvim" }
    },
    config = function()
        local telescope = require("telescope")
        local lga_actions = require("telescope-live-grep-args.actions")
        telescope.setup({
            defaults = {
                prompt_prefix = "   ",
                selection_caret = "  ",
                entry_prefix = "  ",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },

                    vertical = {
                        mirror = false,
                    },

                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                path_display = { "filename_first", "truncate" }
            },
            extensions = {
                live_grep_args = {
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                        }
                    }
                }
            }
        })
        telescope.load_extension("live_grep_args")
    end,
    keys = {
        { "<leader>fl", function() require("telescope.builtin").spell_suggest() end, },
        { "<leader>ff", function() require("telescope.builtin").find_files() end, },
        { "<leader>fo", function() require("telescope.builtin").oldfiles() end, },
        { "<leader>fw", function() require("telescope").extensions.live_grep_args.live_grep_args() end, },
        { "<leader>fq", function() require("telescope.builtin").resume() end, },
        { "<leader>fr", function() require("telescope.builtin").lsp_references() end, },
        { "<leader>fi", function() require("telescope.builtin").lsp_implementations() end, },
        { "<leader>fs", function() require("telescope.builtin").lsp_document_symbols() end, },
        { "<leader>fg", function() require("telescope.builtin").git_status() end, }
    }
}
