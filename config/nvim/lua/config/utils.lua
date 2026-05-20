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
