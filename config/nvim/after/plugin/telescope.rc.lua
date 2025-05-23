local theme = {
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
}

local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
telescope.setup({
    defaults = theme,
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

-- telescope keybinds
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fl", builtin.spell_suggest, {})
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fw", require("telescope").extensions.live_grep_args.live_grep_args, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, {})
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>fg", builtin.git_status, {})
