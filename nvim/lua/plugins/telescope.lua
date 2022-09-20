require('telescope').setup()

vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files(require('telescope.themes').get_dropdown()) end)
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown()) end)
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers(require('telescope.themes').get_dropdown()) end)
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags(require('telescope.themes').get_dropdown()) end)

