local toggleStrikeThrough = function()
  local curr_line = vim.api.nvim_get_current_line()
  local no_strike_through_line = ''
  for i = 1, #curr_line do
    local c = curr_line:sub(i, i)
    if c:match '%w' or c == '.' or c == ' ' or c == ',' or c == '-' then
      no_strike_through_line = no_strike_through_line .. c
    end
  end
  if #curr_line == #no_strike_through_line then
    vim.cmd 's/./&̶/g'
    vim.cmd 'nohl'
  else
    vim.api.nvim_set_current_line(no_strike_through_line)
  end
end
vim.api.nvim_create_user_command('ToggleStrikeThrough', toggleStrikeThrough, {})
vim.keymap.set('n', '<leader>co', ':ToggleStrikeThrough<cr>')
