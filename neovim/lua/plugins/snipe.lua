-- use D to delete recent buffers you don't want to keep up, specially handy for temporary scratch pad stuff
-- maybe try using this more than tabs, feels easier to navigate

return {
  'leath-dub/snipe.nvim',
  keys = {
    {
      "<leader>'",
      function()
        require('snipe').open_buffer_menu()
      end,
      desc = 'Open Snipe buffer menu',
    },
  },
  opts = {
    ui = {
      position = 'center',
    },
    navigate = {
      cancel_snipe = '<C-j>',
    },
    sort = 'last',
  },
}
