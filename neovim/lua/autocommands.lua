-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "md", "markdown" },
	callback = function()
		vim.schedule(function()
			local macro = vim.api.nvim_replace_termcodes("i# <C-r>%<Esc>T#ldt(", true, false, true)
			vim.cmd(string.format('let @t="%s"', macro))
		end)
	end,
})

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	pattern = "*.ts",
-- 	callback = function()
-- 		local current_file = vim.api.nvim_buf_get_name(0)
-- 		local cwd = vim.fn.getcwd()
-- 		vim.cmd(string.format("!cd %s && cat %s | prettierd %s", cwd, current_file, current_file, {}))
-- 	end,
-- })
