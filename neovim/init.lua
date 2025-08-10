--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used). That's why I keep it here instead of in options.lua or smth
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Setting general options ]]
require("options")

-- [[ Setting general keymaps ]]
require("keymaps")

-- [[ Setting general autocommands ]]
require("autocommands")

-- [[ Install `lazy.nvim` plugin manager ]]
require("lazy_setup")

-- [[ Configure and install plugins using lazy ]]
require("lazy_plugins")
require("post_lazy_plugins")

-- [[ Anyting related to creating or customizing file types in neovim ]]
require("filetypes")

-- [[ Local plugins I create or modify just for me ]]
require("custom.plugins.my_timer")
require("custom.plugins.floating_terminal")
require("custom.plugins.strike_through")
require("custom.plugins.update_aws_creds")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
