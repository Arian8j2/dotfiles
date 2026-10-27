-- Terminal 2 is for AI agents: in normal mode, <C-d>/<C-u>/gg/G send the
-- agent's own scroll keys so it scrolls its history (Claude Code fullscreen
-- and opencode share PageUp/PageDown; top/bottom differ, so send both).
local AI_TERM = 2

local keys = {
    page_up = "\27[5~",
    page_down = "\27[6~",
    top = "\27[1;5H\27[H",   -- Ctrl+Home (Claude Code), Home (opencode)
    bottom = "\27[1;5F\27[F" -- Ctrl+End (Claude Code), End (opencode)
}

return {
    "akinsho/toggleterm.nvim",
    opts = {
        direction = "float",
        float_opts = {
            border = "curved"
        },
        highlights = {
            NormalFloat = {
                link = "TelescopeNormal"
            },
            FloatBorder = {
                link = "TelescopeBorder"
            }
        },
        on_create = function(term)
            if term.id ~= AI_TERM then
                return
            end
            local function send(seq)
                return function() vim.api.nvim_chan_send(term.job_id, seq) end
            end
            local opts = { buffer = term.bufnr }
            vim.keymap.set("n", "<C-d>", send(keys.page_down), opts)
            vim.keymap.set("n", "<C-u>", send(keys.page_up), opts)
            vim.keymap.set("n", "gg", send(keys.top), opts)
            vim.keymap.set("n", "G", send(keys.bottom), opts)
        end
    },
    keys = {
        { "<A-c>", "<C-\\><C-n>",            mode = "t" },
        { "<C-j>", "<cmd>ToggleTerm<enter>", mode = "t" },
        { "<C-j>", "<cmd>1ToggleTerm<enter>" },
        { "<C-k>", "<cmd>2ToggleTerm<enter>" }
    }
}
