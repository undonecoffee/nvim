vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.clipboard = "unnamedplus"

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
