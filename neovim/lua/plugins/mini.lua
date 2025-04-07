local minifiles_toggle = function()
  if not MiniFiles.close() then
    MiniFiles.open()
  end
end
vim.keymap.set('n', '-', minifiles_toggle, {})

return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    --gS to split args to separate lines and the same to join them back to the same line
    require('mini.splitjoin').setup()

    --file explorer
    -- <, > to trim file explorer to right and left
    -- normal y, d, a, c motions work to move files around
    -- = to sync changes made to tree with FS
    require('mini.files').setup {
      mappings = {
        close = 'q',
        go_in = 'L',
        go_in_plus = '',
        go_out = 'H',
        go_out_plus = '',
        mark_goto = "'",
        mark_set = 'm',
        reset = '<BS>',
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = '=',
        trim_left = '<',
        trim_right = '>',
      },
      windows = {
        preview = true,
        width_preview = 65,
      },
    }

    -- Simple and easy statusline.
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
