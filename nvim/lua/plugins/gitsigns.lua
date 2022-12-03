local gs = require('gitsigns')
gs.setup()

local opts = {silent = true, remap = false}
vim.keymap.set('n', '<leader>hh', gs.preview_hunk, opts)
vim.keymap.set('n', '<leader>hk', gs.prev_hunk, opts)
vim.keymap.set('n', '<leader>hj', gs.next_hunk, opts)


vim.keymap.set('n', '<leader>hr', gs.reset_hunk, opts)
vim.keymap.set('n', '<leader>hs', gs.stage_hunk, opts)
vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, opts)

vim.keymap.set('n', '<leader>hhr', gs.reset_buffer, opts)
vim.keymap.set('n', '<leader>hhs', gs.stage_buffer, opts)

