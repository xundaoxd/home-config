require('telescope').setup()

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers)

