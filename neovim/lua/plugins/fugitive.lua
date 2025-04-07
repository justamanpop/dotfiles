-- :G open the fugitive UI for git
-- cc in UI to create a commit, :x to save and commit after typing a message in the following window
-- s to stage, u to unstage, X to undo a change
-- I to go chunk by chunk in a file and choose which ones to stage
-- = to see diff for a particular change
-- :GPush to push

--git blame
vim.keymap.set('n', '<leader>gb', '<cmd>G blame<CR>')

return 'tpope/vim-fugitive'
