local trouble = require('trouble')

trouble.setup({
    action_keys = {
        cancel = '<esc>',
        refresh = 'r',
        jump_close = '<CR>',
        next = '<TAB>',
        previous = '<S-TAB>',
    }
})

-- lsp
vim.keymap.set('n', 'gd', function() trouble.toggle('lsp_definitions') end)
vim.keymap.set('n', 'gr', function() trouble.toggle('lsp_references') end)

