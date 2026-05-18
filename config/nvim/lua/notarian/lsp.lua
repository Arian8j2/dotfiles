require("mason").setup()
require("mason-lspconfig").setup()

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>le", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>lg", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    end
})

-- configure rust analyzer setting by .rust-analyzer.json file in workspace
local function get_project_rustanalyzer_settings()
    local handle = io.open(vim.fn.resolve(vim.fn.getcwd() .. '/./.rust-analyzer.json'))
    if not handle then
        return {}
    end
    local out = handle:read("*a")
    handle:close()
    local config = vim.json.decode(out)
    if type(config) == "table" then
        return config
    end
    return {}
end
vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = get_project_rustanalyzer_settings()
    }
})

vim.lsp.config("tailwindcss", {
    filetypes = { "html", "css", "sass", "typescript", "typescriptreact", "vue", "svelte" }
})

-- configure rust-analyzer lsp even if it's not installed by mason
-- you can install rust_analyzer via rustup by running:
--   `rustup component add rust-analyzer`
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("clangd")

-- make the lua server aware of Neovim runtime files
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                },
            }
        }
    }
})

vim.api.nvim_create_user_command("LspDisable", function()
    -- Stop all active LSP clients
    for _, client in pairs(vim.lsp.get_clients()) do
        client.stop()
    end

    -- Prevent new LSP clients from starting in this session
    vim.g.lsp_disabled = true
    vim.lsp.start = function() end

    -- Remove lspconfig autocommands if present
    pcall(vim.api.nvim_del_augroup_by_name, "lspconfig")
end, {})
