require('close_buffers').setup()

vim.keymap.set('n', '<leader>th', function() require('close_buffers').delete({type = 'hidden'}) end, { silent = true, remap = false })
vim.keymap.set('n', '<leader>tc', function() require('close_buffers').delete({type = 'this'}) end, { silent = true, remap = false })

