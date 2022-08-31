local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local _, servers = pcall(require, "custom.lsp.server_names")

for _, lsp in ipairs(servers) do
   local setup_args = {
      on_attach = on_attach,
      capabilities = capabilities,
   }

   if lsp == "emmet_ls" then
      setup_args["filetypes"] = { "typescriptreact", "svelte" }
   end

   lspconfig[lsp].setup(setup_args)
end
