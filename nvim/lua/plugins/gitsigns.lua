local gs = require('gitsigns')
gs.setup()

local opts = {silent = true, remap = false}
vim.keymap.set({ 'n', 'v' }, '<leader>hh', gs.preview_hunk, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>hk', gs.prev_hunk, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>hj', gs.next_hunk, opts)

vim.keymap.set({ 'n', 'v' }, '<leader>hs', gs.stage_buffer, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>hu', gs.undo_stage_hunk, opts)

vim.keymap.set({ 'n', 'v' }, '<leader>hr', gs.reset_buffer, opts)

