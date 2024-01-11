local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup()

vim.keymap.set('n', 'ff', builtin.find_files)
vim.keymap.set('n', 'fg', builtin.live_grep)
vim.keymap.set('n', 'fb', builtin.current_buffer_fuzzy_find)

