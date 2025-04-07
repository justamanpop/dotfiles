-- gc, gb - comment/block comment selection of lines. gcc, gbc for doing it for current line without selecting
-- gco gcO - insert comment below and above current line

-- Use `opts = {}` to force a plugin to be loaded.
--  This is equivalent to:
--    require('Comment').setup({})
return { 'numToStr/Comment.nvim', opts = {} }
