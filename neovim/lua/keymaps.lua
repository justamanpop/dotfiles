-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

--control j,k for escape so i don't leave home row
vim.keymap.set({ 'n', 'i', 'v' }, '<C-j>', '<Esc>')

--semicolon to colon for fast command
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')

--capital L and H to get to start or end of line instead of harder to reach $ and ^
vim.keymap.set({ 'n', 'v' }, 'L', '$')
vim.keymap.set({ 'n', 'v' }, 'H', '^')

--delete into blackhole register so it does not fill yank reg
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')

--force myself to stay on home row and not use arrow keys
vim.keymap.set({ 'n', 'v' }, '<up>', '<nop>')
vim.keymap.set({ 'n', 'v' }, '<down>', '<nop>')
vim.keymap.set({ 'n', 'v' }, '<left>', '<nop>')
vim.keymap.set({ 'n', 'v' }, '<right>', '<nop>')

-- highlight on search is set, so have it cleared on pressing <Esc>/<C-j> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-j>', '<cmd>nohl<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with just <Esc>/<C-j>. Default needs you to press <C-\><C-n>
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n>')

--writes buffer to file
vim.keymap.set({ 'n', 'v' }, '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<Esc><cmd>w<CR>i')

--close curr window
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>')
vim.keymap.set('i', '<M-q>', '<Esc><cmd>q<CR>')

--open new tab
vim.keymap.set('n', '<C-t>', ':tabnew<CR>')

--tab nav
vim.keymap.set({ 'n', 'v' }, '<leader>l', 'gt')
vim.keymap.set({ 'n', 'v' }, '<leader>h', 'gT')
vim.keymap.set('i', '<M-l>', '<Esc>gt')
vim.keymap.set('i', '<M-h>', '<Esc>gT')

--switch to first terminal tab found
vim.keymap.set('n', '<leader>0', function()
  for i = 0, vim.fn.tabpagenr '$' - 1, 1 do
    local buffs = vim.fn.tabpagebuflist(i + 1)
    for _, buff in pairs(buffs) do
      local buffName = vim.fn.bufname(buff)
      if buffName:sub(1, 7) == 'term://' then
        vim.cmd(string.format('tabn %d', i + 1))
        return
      end
    end
  end
  vim.api.nvim_err_writeln 'No terminal tab found'
end)

for i = 1, 10, 1 do
  vim.keymap.set('n', string.format('<leader>%d', i), string.format(':tabn %d<cr>', i))
end

-- like in VSCode or AndroidStudio, control space for code action menu
vim.keymap.set({ 'n', 'v' }, '<C-Space>', vim.lsp.buf.code_action)
vim.keymap.set('i', '<C-Space>', vim.lsp.buf.code_action)

--quickfix nav
vim.keymap.set({ 'n', 'v' }, '<leader>p', ':cprev<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>n', ':cnext<CR>')

-- tmux shortcuts
vim.keymap.set('n', '<leader><left>', '<cmd>tmux previous-window<CR><silent>')
vim.keymap.set('n', '<leader><right>', '<cmd>tmux next-window<CR><silent>')
