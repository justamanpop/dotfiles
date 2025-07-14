-- [[ Configure and install plugins]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- git plugin
	require("plugins.fugitive"),

	-- comment/block comment helper
	require("plugins.comment"),

	-- Adds git related signs to the gutter, as well as utilities for managing changes
	require("plugins.gitsigns"),

	--when you type a sequence of chars that's not a complete mapping, which key shows a popup with possible completions and what they map to
	require("plugins.which_key"),

	--picker, TODO customize later
	require("plugins.telescope"),

	-- LSP Configuration & Plugins
	require("plugins.lspconfig"),

	-- Autoformat
	require("plugins.conform"),

	-- Autocompletion
	require("plugins.cmp"),

	--installs and sets colorscheme (currently tokyonight)
	require("color_scheme"),

	-- Highlight todo, notes, etc in comments
	require("plugins.todo_comments"),

	-- Collection of various small independent plugins/modules for small stuff, + mini.files as file explorer
	require("plugins.mini"),

	-- Highlight, edit, and navigate code
	require("plugins.treesitter"),

	-- Shows function/class/context of current line of code near top of the view window
	require("plugins.treesitter_context"),

	-- auto fills in closing brackets and quotes when opened
	require("plugins.autopairs"),

	--opens small window with recently opened files and lets you navigate to any of them
	require("plugins.snipe"),

	--comes with kickstart, enable if you want
	-- require 'kickstart.plugins.debug',
})
