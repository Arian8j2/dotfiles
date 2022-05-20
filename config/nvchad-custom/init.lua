local opt = vim.opt
local g = vim.g
local map = nvchad.map
local cmd = vim.api.nvim_command

g.mapleader = ","
opt.shiftwidth = 4
opt.tabstop = 4
opt.clipboard = ""

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
