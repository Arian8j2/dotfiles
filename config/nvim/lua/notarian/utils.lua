-- buffer delete
vim.keymap.set("n", "<leader>gx", function()
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        local info = vim.fn.getbufinfo(bufnr)[1]
        local is_term = string.find(info.name, "term://")
        if info.hidden == 1 and not is_term then
            require("bufdelete").bufdelete(bufnr)
        end
    end
end);

-- avoid scrolling when switching buffers
vim.api.nvim_exec([[
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
]], true)
