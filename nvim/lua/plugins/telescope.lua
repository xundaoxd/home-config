require('telescope').setup()

vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files(require('telescope.themes').get_dropdown()) end)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags)

