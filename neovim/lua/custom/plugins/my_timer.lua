local function formattedTime(timeInSeconds)
  local minutes = timeInSeconds / 60
  local seconds = timeInSeconds % 60
  local hours = 0
  if minutes > 60 then
    hours = minutes / 60
    minutes = minutes % 60
    return string.format('%02d:%02d:%02d', hours, minutes, seconds)
  end
  return string.format('%02d:%02d', minutes, seconds)
end
local function createBufferAndWindow(timeInSeconds)
  TimerBuff = vim.api.nvim_create_buf(false, true)
  TimerWin = vim.api.nvim_open_win(TimerBuff, false, {
    relative = 'editor',
    anchor = 'SE',
    row = vim.api.nvim_win_get_height(vim.api.nvim_get_current_win()) - 1,
    col = vim.api.nvim_win_get_width(vim.api.nvim_get_current_win()) - 1,
    border = 'single',
    width = timeInSeconds > 60 * 100 and 8 or 5,
    height = 1,
    style = 'minimal',
  })
end

local function clearBufferAndWindow()
  if TimerWin ~= nil and vim.api.nvim_win_is_valid(TimerWin) then
    vim.api.nvim_win_close(TimerWin, true)
  end
  if TimerBuff ~= nil and vim.api.nvim_buf_is_valid(TimerBuff) then
    vim.api.nvim_buf_delete(TimerBuff, { force = true })
  end
end

local function endOfTimer()
  Timer:stop()
  Timer:close()
  vim.fn.system { 'paplay', '/usr/share/sounds/freedesktop/stereo/complete.oga' }
  local timerEndNotifyBuf = vim.api.nvim_create_buf(false, true)
  local timerEndNotifyWin = vim.api.nvim_open_win(timerEndNotifyBuf, false, {
    relative = 'editor',
    row = vim.api.nvim_win_get_height(vim.api.nvim_get_current_win()) / 2,
    col = vim.api.nvim_win_get_width(vim.api.nvim_get_current_win()) / 2,
    border = 'single',
    width = 13,
    height = 3,
    style = 'minimal',
  })
  vim.api.nvim_buf_set_lines(timerEndNotifyBuf, 1, 1, false, {
    'Take a break!',
  })
  vim.api.nvim_buf_add_highlight(timerEndNotifyBuf, -1, 'Title', 1, 0, -1)
  local oneTimeTimer = vim.uv.new_timer()
  oneTimeTimer:start(
    5000,
    0,
    vim.schedule_wrap(function()
      oneTimeTimer:stop()
      oneTimeTimer:close()
      vim.api.nvim_win_close(timerEndNotifyWin, true)
      vim.api.nvim_buf_delete(timerEndNotifyBuf, { force = true })
    end)
  )
end

function StartTimer()
  if (Timer ~= nil) and not Timer:is_closing() then
    Timer:stop()
    Timer:close()
  end
  Timer = vim.uv.new_timer()
  Timer:start(
    0,
    1000,
    vim.schedule_wrap(function()
      vim.api.nvim_buf_set_lines(TimerBuff, 0, -1, false, {
        formattedTime(TimeInSeconds),
      })
      vim.cmd 'redraw'
      TimeInSeconds = TimeInSeconds - 1
      -- when timer hits zero
      if TimeInSeconds < 0 then
        endOfTimer()
        return
      end
    end)
  )
end

function PauseTimer()
  if not Timer:is_closing() then
    Timer:stop()
    Timer:close()
  end
end

function RemoveTimer()
  if not Timer:is_closing() then
    Timer:stop()
    Timer:close()
  end
  clearBufferAndWindow()
end

function TimerSetup(timeInSeconds)
  if TimerBuff == nil or TimerWin == nil or not vim.api.nvim_win_is_valid(TimerWin) then
    clearBufferAndWindow()
    createBufferAndWindow(tonumber(timeInSeconds))
  end
  TimeInSeconds = timeInSeconds
  StartTimer()
end

vim.api.nvim_create_augroup('Timer', { clear = true })

vim.api.nvim_create_autocmd('TabLeave', {
  desc = 'Closes timer window when leaving tab',
  group = 'Timer',
  callback = function()
    if TimerWin ~= nil and vim.api.nvim_win_is_valid(TimerWin) then
      vim.api.nvim_win_close(TimerWin, true)
    end
  end,
})

vim.api.nvim_create_autocmd('TabEnter', {
  desc = 'Opens timer window when entering different tab',
  group = 'Timer',
  callback = function()
    if TimerBuff ~= nil and vim.api.nvim_buf_is_valid(TimerBuff) then
      TimerWin = vim.api.nvim_open_win(TimerBuff, false, {
        relative = 'editor',
        anchor = 'SE',
        row = vim.api.nvim_win_get_height(vim.api.nvim_get_current_win()) - 1,
        col = vim.api.nvim_win_get_width(vim.api.nvim_get_current_win()) - 1,
        border = 'single',
        width = 5,
        height = 1,
      })
      vim.wo[TimerWin].number = false
      vim.wo[TimerWin].relativenumber = false
      vim.wo[TimerWin].signcolumn = 'no'
    end
  end,
})

vim.api.nvim_create_user_command('StartTimer', function(opts)
  if #opts.fargs == 0 then
    opts.fargs = { '5' }
  end

  local number_input = tonumber(opts.fargs[1])
  if number_input == nil then
    vim.api.nvim_err_writeln 'Please enter valid number as input'
    return
  end
  TimerSetup(number_input)
end, { nargs = '?' })

vim.api.nvim_create_user_command('RemoveTimer', function()
  RemoveTimer()
end, {})

vim.api.nvim_create_user_command('PauseTimer', function()
  PauseTimer()
end, {})

vim.api.nvim_create_user_command('ResumeTimer', function()
  StartTimer()
end, {})
