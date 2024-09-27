-- @return string: list of lsp clients attached to current buffer
local function lsp_clients()
    local names = {}
    -- buffer 0 is always current buffer
    for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
        table.insert(names, server.name)
    end
    return table.concat(names, ", ")
end

require("lualine").setup({
    extensions = { "nvim-tree" },
    options = {
        component_separators = '|',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { { "mode", separator = { left = '' }, right_padding = 2 } },
        lualine_b = { "branch", "filename" },
        lualine_c = { "diff", "macro_recording" },
        lualine_x = { "diagnostics" },
        lualine_y = { lsp_clients, "filetype", "progress", "searchcount" },
        lualine_z = { { "location", separator = { right = '' }, left_padding = 2 } }
    }
})
