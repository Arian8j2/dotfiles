local plugins = {
   remove = {
      "max397574/better-escape.nvim"
   },
   user = {
      ["goolord/alpha-nvim"] = {
         disable = false,
      },
      ["nmac427/guess-indent.nvim"] = {
         config = function()
            require("guess-indent").setup()
         end
      }
   },
   override = {
      ["akinsho/bufferline.nvim"] = {
         options = {
            custom_areas = {
               right = function() end
            }
         }
      },
      ["lukas-reineke/indent-blankline.nvim"] = {
         show_current_context = false,
         show_current_context_start = false
      }
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.lsp.config",
      }
   }
}

return plugins
