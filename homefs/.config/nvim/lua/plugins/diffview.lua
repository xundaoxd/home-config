local diffview = require('diffview')
diffview.setup({
    view = {
        default = {
            layout = 'diff2_horizontal',
        },
        merge_tool = {
            disable_diagnostics = true,
        }
    }
})

vim.keymap.set('n', 'do', '<cmd>DiffviewOpen<CR>')
vim.keymap.set('n', 'dc', '<cmd>DiffviewClose<CR>')
vim.keymap.set('n', 'dh', '<cmd>DiffviewFileHistory<CR>')

