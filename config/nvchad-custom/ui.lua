local _, changed_themes = pcall(require, "custom.changed_themes")
local ui = {
   changed_themes = changed_themes,
   hl_override = {
      DiffAdd = { fg = "#95c561" },
      DiffChange = { fg = "#7199ee" },
   }
}

return ui
