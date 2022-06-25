local opt = vim.opt
local g = vim.g
local api = vim.api
local affect_alacritty_background = false

g.mapleader = ","
opt.shiftwidth = 4
opt.tabstop = 4
opt.clipboard = ""

local function get_sed_alacritty_command(properties)
   local queries = {}
   for property, value in pairs(properties) do
      local query = "sed -i 's/\\(%s: \\).*/\\1%s/g' ~/.config/alacritty/horizon-dark.yml";
      table.insert(queries, string.format(query, property, value))
   end

   queries[1] = "silent !"..queries[1]
   return table.concat(queries, " && ")
end

local function change_alacritty_background(on_enter_background, on_leave_background)
   local function normalize_color(color)
      return string.format("\"\\%s\"", color)
   end

   local group = api.nvim_create_augroup("ChangeAlacrittyBackgroundColor", { clear = true })
   api.nvim_create_autocmd("VimEnter", {
      command = get_sed_alacritty_command({ background = normalize_color(on_enter_background) }),
      group = group
   })
   api.nvim_create_autocmd("VimLeavePre", {
      command = get_sed_alacritty_command({ background = normalize_color(on_leave_background) }),
      group = group
   })
end

if affect_alacritty_background then
   change_alacritty_background("#171b20", "#1c1e26")
end
