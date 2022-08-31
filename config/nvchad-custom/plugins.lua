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
      },
      ["neovim/nvim-lspconfig"] = {
         config = function()
            require "plugins.configs.lspconfig"
            require "custom.lsp.config"
         end
      },
   },
   override = {
      ["lukas-reineke/indent-blankline.nvim"] = {
         char = "▏",
         show_current_context = false,
         show_current_context_start = false
      },
      ["kyazdani42/nvim-tree.lua"] = {
         view = {
            adaptive_size = false
         }
      },
      ["NvChad/ui"] = {
         tabufline = {
            overriden_modules = function()
               return {
                  buttons = function()
                     return ""
                  end,
               }
            end
         },
      }
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.lsp.config",
      }
   }
}

return plugins
