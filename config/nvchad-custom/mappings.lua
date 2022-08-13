local M = {}

local function termcodes(str)
   return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.disabled = {
   t = {
      ["<C-x>"] = "",
      ["<A-i>"] = "",
      ["<A-h>"] = "",
      ["<A-v>"] = "",
   },
   n = {
      ["<leader>h"] = "",
      ["<leader>v"] = "",
      ["<A-i>"] = "",
      ["<A-h>"] = "",
      ["<A-v>"] = "",
      ["<leader>/"] = ""
   },
}

M.general = {
   i = {
      ["<C-s>"] = { "<cmd> w <CR>", "save file" },
   },

   n = {
      ["<C-l>"] = { ":BufferLineCycleNext <CR>", "  cycle next buffer" },
      ["<C-h>"] = { ":BufferLineCyclePrev <CR>", "  cycle prev buffer" },
      ["<C-c>"] = { ":noh <CR>", "Clear highlights" },
   },

   t = {
      ["<A-c>"] = { termcodes "<C-\\><C-N>", "   escape terminal mode" }
   }
}

M.nvterm = {
   n = {
      ["<C-j>"] = {
         function()
            require("nvterm.terminal").toggle "horizontal"
         end,
         "   toggle horizontal term",
      }
   },
   t = {
      ["<C-j>"] = {
         function()
            require("nvterm.terminal").toggle "horizontal"
         end,
         "   toggle horizontal term",
      }
   }
}

M.gitsigns = {
   n = {
      ["<leader>hp"] = { ":Gitsigns preview_hunk <CR>", "Git preview hunk" },
      ["<leader>hr"] = { ":Gitsigns reset_hunk <CR>", "Git reset hunk" },
      ["<leader>hd"] = { ":Gitsigns diffthis <CR>", "Git diff"}
   }
}

return M
