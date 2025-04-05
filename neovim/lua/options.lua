-- See `:help vim.opt`
--  For more options, you can see `:help option-list`

-- if you have nerd font icons installed
vim.g.have_nerd_font = true

--show line numbers by default, and make it relative
vim.opt.number = true
vim.opt.relativenumber = true
--
-- Allow mouse
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
--
-- Sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent, which means for wrapped lines, it starts at the same indent as the actual start of line
vim.opt.breakindent = true
--
-- Saves undo history with a file so that even on exit and re-entering it remembers previous state
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease Tpdate time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- with these, cursor automatically goes to the split window on the right (vsplit) or bottom (horizontal split)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor. Enabling list makes it show tab and EOL.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Lightly shades which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.confirm = true
