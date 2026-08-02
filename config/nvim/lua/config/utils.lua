-- highlight trail whitespaces (yanked from johnfrankmorgan/whitespace.nvim)
local highlight_name = "TrailWhitespace"
vim.api.nvim_set_hl(0, highlight_name, { bg = "#ff6767" })

local function should_highlight()
    if vim.bo.filetype == "" or vim.bo.buftype == "nofile" or vim.bo.buftype == "terminal" then
        return false
    end
    return true
end

local function highlight_whitespace()
    if should_highlight() then
        local command = string.format([[match %s /\s\+$/]], highlight_name)
        vim.cmd(command)
    else
        vim.cmd("match")
    end
end

vim.api.nvim_create_augroup("whitespace_highlight", { clear = true })
vim.api.nvim_create_autocmd(
    { "BufWrite", "BufEnter" },
    { group = "whitespace_highlight", pattern = "*", callback = highlight_whitespace }
)
-- only highlight when i stop inserting
vim.api.nvim_create_autocmd(
    "InsertEnter",
    {
        group = "whitespace_highlight",
        pattern = "*",
        callback = function()
            vim.cmd("match")
        end
    }
)


-- avoid scrolling when switching buffers
vim.api.nvim_exec2([[
" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif
]], {})


local ns = vim.api.nvim_create_namespace("fribidi-buffer")
vim.keymap.set("n", "<leader>fa", function()
    local bufnr = vim.api.nvim_get_current_buf()

    -- Toggle off
    if vim.b[bufnr].fribidi_buffer_enabled then
        vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
        vim.b[bufnr].fribidi_buffer_enabled = false
        return
    end

    -- Toggle on
    if vim.fn.executable("fribidi") ~= 1 then
        vim.notify("fribidi executable not found", vim.log.levels.ERROR)
        return
    end

    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local input = table.concat(lines, "\n")

    local out = vim.fn.systemlist({
        "fribidi",
        "--nopad",
        "--nobreak",
        "--charset",
        "UTF-8",
    }, input, 1)

    if vim.v.shell_error ~= 0 then
        vim.notify("fribidi failed: " .. table.concat(out, "\n"), vim.log.levels.ERROR)
        return
    end

    vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

    for i, original in ipairs(lines) do
        local rendered = out[i]

        -- Skip empty lines and lines FriBidi did not change.
        -- Remove `and rendered ~= original` if you want a virtual line under every line.
        if rendered and original:match("%S") and rendered ~= original then
            vim.api.nvim_buf_set_extmark(bufnr, ns, i - 1, 0, {
                virt_lines = {
                    { { rendered, "Comment" } },
                },
                virt_lines_above = false,
            })
        end
    end

    vim.b[bufnr].fribidi_buffer_enabled = true
end)
