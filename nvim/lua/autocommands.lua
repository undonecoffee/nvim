vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

vim.o.clipboard = "unnamedplus"
-- vim.env.DISPLAY = ":0" -- So so much pain just for this one line to fix it. no clue why this was ever an issue or why neovim defualted to :1 sometimes or why the display has anything to do with the clipboard
-- vim.env.XAUTHORITY = "/run/user/1000/xauth_Rtsjkf" -- Why does this even change i have no clue how this works. cachyos is dumb.
-- in your init.lua
vim.api.nvim_create_autocmd("VimResume", {
    callback = function()
        local xauth = vim.fn.system("$(ls -t /run/user/1000/xauth_* 2>/dev/null | head -1)"):gsub("%s+", "")
        vim.env.XAUTHORITY = xauth
    end,
})

--  See `:help lua-guide-autocommands`
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
})

-- vim.api.nvim_create_autocmd('BufEnter', {
--     pattern = '*',
--     callback = function()
--         vim.cmd 'highlight ArrowOperator guifg=Blue ctermfg=Blue'
--         vim.cmd "syntax match ArrowOperator '=>'"
--     end,
-- })

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.expand("%") == "" then
            vim.cmd("enew") -- Create a new empty buffer
            vim.o.clipboard = "unnamedplus"
            vim.opt_local.buftype = "nofile"
            vim.opt_local.bufhidden = "wipe"
            vim.opt_local.swapfile = false
            vim.cmd("setlocal nonumber norelativenumber")
            vim.api.nvim_buf_set_lines(0, 0, -1, false, {
                " ", -- Use this instead!
                -- ' hi! use <space>sr to open yazi first. Or use my better harpoon to go to an old file. This message is from nvim/lua/autocommands.lua so go there to remove it. ',
            })
        end
    end,
})
