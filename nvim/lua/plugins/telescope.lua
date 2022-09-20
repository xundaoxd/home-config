require('telescope').setup()

local dropdown = require('telescope.themes').get_dropdown()
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files(dropdown) end)
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep(dropdown) end)
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers(dropdown) end)
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags(dropdown) end)

