require("mason").setup()
require("mason-lspconfig").setup()

local on_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<leader>le", function() vim.diagnostic.open_float() end, bufopts)
    vim.keymap.set("n", "<leader>lg", "<cmd>lua vim.diagnostic.goto_next()<CR>", bufopts)
end

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = "rounded"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
function configure_lsp(server_name)
    require("lspconfig")[server_name].setup({
        on_attach = on_attach,
        capabilities = capabilities
    })
end

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


-- configure rust-analyzer lsp even if it's not installed by mason
-- you can install rust_analyzer via rustup by running:
--   `rustup component add rust-analyzer`
require("lspconfig")["rust_analyzer"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = get_project_rustanalyzer_settings()
    }
})

configure_lsp("clangd")
configure_lsp("dartls")

require("mason-lspconfig").setup_handlers({
    configure_lsp,
    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup({
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
            capabilities = capabilities,
            on_attach = on_attach
        })
    end,
})

-- auto completion
local snippy = require("snippy")
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local lspkind = require('lspkind')
local cmp = require("cmp")
cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = '...',
            before = function(_, vim_item)
                if vim_item.menu then
                    vim_item.menu = string.sub(vim_item.menu, 1, 20)
                end
                return vim_item
            end
        })
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif snippy.can_expand_or_advance() then
                snippy.expand_or_advance()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif snippy.can_jump(-1) then
                snippy.previous()
            else
                fallback()
            end
        end, { "i", "s" }),
    }),

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "calc" },
        { name = "path" },
        { name = "buffer" }
    }),

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    snippet = {
        expand = function(args)
            require("snippy").expand_snippet(args.body)
        end
    },
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
