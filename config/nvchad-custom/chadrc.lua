local M = {}

M.ui = {
   theme = "tokyodark",
   changed_themes = {
      tokyodark = {
         base_30 = {
            black = "#1a1b26",
            darker_black = "#141520"
         },
         base_16 = {
            base00 = "#1a1b26"
         }
      },
   },
   hl_override = {
      DiffAdd = { fg = "#95c561" },
      DiffChange = { fg = "#7199ee" },
      IndentBlanklineChar = { fg = "#1f202b" }, -- 5% lighter than bg
      WinSeperator = { fg = "#242530" } -- 10% lighter than bg
   }
}

M.plugins = {
   remove = {
      "max397574/better-escape.nvim"
   },
   user = {
      ["goolord/alpha-nvim"] = {
         disable = false,
      }
   },
   override = {
      ["akinsho/bufferline.nvim"] = {
         options = {
            custom_areas = {
               right = function() end
            }
         }
      }
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      }
   }
}

M.mappings = require "custom.mappings"
return M
