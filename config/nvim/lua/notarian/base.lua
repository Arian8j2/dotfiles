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
vim.opt.undofile = true
vim.opt.laststatus = 0
vim.opt.fillchars = { vert = "▏" }
vim.g.omni_sql_no_default_maps = "<leader>c"

vim.keymap.set("n", "<C-c>", "<cmd>noh<enter>", { silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { silent = true })
vim.keymap.set("x", "p", "p:let @+=@0<CR>:let @\"=@0<CR>", { silent = true })
vim.keymap.set("n", "<leader>fc", "<cmd>Cheat<enter>")
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>")
