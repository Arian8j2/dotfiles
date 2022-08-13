local M = {}
local _, servers = pcall(require, "custom.lsp.server_names")

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   for _, lsp in ipairs(servers) do
      local setup_args = {
         on_attach = attach,
         capabilities = capabilities,
      }

      if lsp == "emmet_ls" then
         setup_args["filetypes"] = { "typescriptreact", "svelte" }
      end

      lspconfig[lsp].setup(setup_args)
   end
end

return M
