-- require("aura").setup({
--   override_terminal_colors = false
-- })

require("rose-pine").setup({
    variant = 'main',
	dark_variant = 'dawn',
	highlight_groups = {
		NvimTreeNormal = { fg = "text", bg = "surface" },
		IndentBlanklineChar = { fg = "overlay", nocombine = true },
    }
})

vim.cmd("colorscheme rose-pine")
