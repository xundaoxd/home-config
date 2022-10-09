local gs = require('gitsigns')
gs.setup()

local opts = {silent = true, remap = false}
vim.keymap.set({ 'n', 'v' }, '<leader>hh', gs.preview_hunk, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>hk', gs.prev_hunk, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>hj', gs.next_hunk, opts)

