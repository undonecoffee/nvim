vim.keymap.set('n', '<Esc>', function()
    vim.cmd 'silent nohlsearch'
    vim.cmd 'echo " "'
end)

vim.keymap.set('n', '<leader>m', ':Telescope man_pages<CR>')

-- vim.api.nvim_create_user_command('2', 'w', {})
vim.keymap.set('n', '<leader>w', ':q<CR>')
vim.keymap.set('n', '<leader>r', ':%s/')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<leader>seo', ':OmniPreview start<CR>')
vim.keymap.set('n', '<leader>ser', ':!typst compile % --format pdf<CR>')
vim.keymap.set('n', '<leader>set', ':!typst compile % --format png<CR>')
vim.keymap.set('n', 'zj', '1z=')

vim.keymap.set('n', 'L', ':normal! J<CR>')
vim.keymap.set('n', 'J', '<C-e>')
vim.keymap.set('n', 'K', '<C-y>')

vim.keymap.set('n', 'H', '<C-^>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<A-j>', '<C-e>j', { noremap = true, silent = true })
-- vim.keymap.set('n', '<A-k>', '<C-y>k', { noremap = true, silent = true })

-- vim.keymap.set('v', 'r', 'y:%s/<C-r>"//gc<left><left><left>', { noremap = true, silent = false })

vim.keymap.set('n', 'U', '<C-r>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-r>', 'U', { noremap = true, silent = true })

-- vim.keymap.set('v', '"', 'oi"gvola"gvl', { noremap = true, silent = true })
-- vim.keymap.set('v', '`', 'oi`gvola`gvl', { noremap = true, silent = true })
-- vim.keymap.set('v', "'", "oi'gvola'gvl", { noremap = true, silent = true })
-- vim.keymap.set('v', '{', 'oi{gvola}gvl', { noremap = true, silent = true })
-- vim.keymap.set('v', '(', 'oi(gvola)gvl', { noremap = true, silent = true })
-- vim.keymap.set('v', '[', 'oi[gvola]gvl', { noremap = true, silent = true })

-- vim.keymap.set('v', '"', 'di""hp', { noremap = true, silent = true })
-- vim.keymap.set('v', '`', 'di``hp', { noremap = true, silent = true })
-- vim.keymap.set('v', "'", "di''hp", { noremap = true, silent = true })
-- vim.keymap.set('v', '{', 'di{}hp', { noremap = true, silent = true })
-- vim.keymap.set('v', '(', 'di()hp', { noremap = true, silent = true })
-- vim.keymap.set('v', '[', 'di[]hp', { noremap = true, silent = true })
--
-- vim.keymap.set('n', 'zb', function()
--     vim.cmd 'CodeCompanionChat'
--     -- vim.cmd 'normal! '
--     vim.cmd 'startinsert'
-- end)
--
-- vim.keymap.set('n', 'zn', function()
--     vim.cmd 'CodeCompanionChat'
--     vim.cmd 'normal! iin neovim is there a way to '
--     vim.cmd 'startinsert'
-- end)
--
-- vim.keymap.set({ 'n', 'v' }, 'zt', ':CodeCompanion ')
-- -- vim.keymap.set('n', 'zb', ':CodeCompanionChat')
