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

vim.keymap.set('n', 'dfo', '<cmd>DiffviewOpen<CR>')
vim.keymap.set('n', 'dfc', '<cmd>DiffviewClose<CR>')
vim.keymap.set('n', 'dfh', '<cmd>DiffviewFileHistory<CR>')

