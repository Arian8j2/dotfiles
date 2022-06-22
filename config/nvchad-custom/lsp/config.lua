local M = {}
local _, servers = pcall(require, "custom.lsp.server_names")

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
      }
   end
end

return M
