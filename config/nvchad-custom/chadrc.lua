local M = {}

M.options = {
   user = function()
      require("custom.init")
   end
}

M.ui = require("custom.ui")
M.plugins = require("custom.plugins")
M.mappings = require("custom.mappings")

return M
