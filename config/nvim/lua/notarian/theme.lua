-- require("aura").setup({
--   override_terminal_colors = false
-- })

require("rose-pine").setup({
    variant = 'main',
	dark_variant = 'dawn',
	highlight_groups = {
		NvimTreeNormal = { fg = "text", bg = "surface" },
		IndentBlanklineChar = { fg = "overlay", nocombine = true },
    },
    dim_inactive_windows = false,
    extend_background_behind_borders = true,
    styles = {
        bold = true,
        italic = true,
        transparency = false,
    },
    groups = {
        border = "highlight_med",
    }
})

vim.cmd("colorscheme rose-pine")
