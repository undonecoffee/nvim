vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = false
-- vim.opt.spell = false

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ spec = { { import = "plugins" } } })

-- require 'misc.horizontalRuler'
require("options")
require("autocommands")

require("keybinds.general")
require("keybinds.betterharpoon")
require("keybinds.files")
require("keybinds.ai")
require("keybinds.buffers")

require("macros.javascript")
require("macros.markdown")
require("macros.chattriggers")

require("snippets.javascript")
require("snippets.chattriggers")
require("snippets.typst")
require("snippets.all")

-- set spell
-- hi SpellBad cterm=underline ctermbg=white gui=underline guifg=black

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.typ",
	callback = function()
		vim.cmd([[
        setlocal wrapmargin=10
        setlocal formatoptions+=t
        setlocal linebreak
        ]])
	end,
})

vim.cmd("highlight MatchParen NONE")
-- vim.cmd 'LspStop'
vim.diagnostic.config({
	virtual_text = false, -- disable inline text
	underline = false, -- disable underlines
	signs = false, -- disable gutter signs
	update_in_insert = false,
})
