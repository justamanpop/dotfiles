--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used). That's why I keep it here instead of in options.lua or smth
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]
require 'options'

-- [[ Setting keymaps ]]
require 'keymaps'

-- [[ Setting autocommands ]]
require 'autocommands'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-setup'

-- [[ Configure and install plugins using lazy]]
require 'lazy-plugins'

-- [[ Anyting related to creating or customizing file types in neovim]]
require 'filetypes'

-- [[ Local plugins I create or modify just for me ]]
require 'custom.plugins.my_timer'
require 'custom.plugins.floating_terminal'
require 'custom.plugins.strike_through'

vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})
vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
