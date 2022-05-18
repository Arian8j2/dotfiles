local opt = vim.opt
local g = vim.g
local map = nvchad.map
local cmd = vim.api.nvim_command

vim.keymap.del("n", "<C-c>")
vim.keymap.del("t", "jk")
vim.keymap.del("n", "<leader>x")

g.mapleader = ","
g.toggle_theme_icon = ""
opt.shiftwidth = 4
opt.tabstop = 4
opt.clipboard = ""

map("n", "<C-l>", ":BufferLineCycleNext <CR>", { silent = true })
map("n", "<C-h>", ":BufferLineCyclePrev <CR>", { silent = true })
map("t", "<leader>c", "<C-\\><C-n>", { silent = true })

-- have to remap this one again to update it's leader key, idk why
map("n", "<leader>x", function()
   nvchad.close_buffer()
end)

for i = 1, 9 do
   map(
      {"n", "i"},
      string.format("<A-%d>", i),
      string.format("<cmd> :BufferLineGoToBuffer %d <CR>", i),
      { silent = true }
   )
end

local indents = {
   lua = 3,
   typescriptreact = 2,
   typescript = 2,
   cpp = 4
}

for lang, indent in pairs(indents) do
   cmd(string.format("autocmd FileType %s set tabstop=%d|set shiftwidth=%d", lang, indent, indent))
end

map("n", "<leader>hp", ":Gitsigns preview_hunk <CR>")
map("n", "<leader>hr", ":Gitsigns reset_hunk <CR>")
map("n", "<leader>hd", ":Gitsigns diffthis <CR>")
