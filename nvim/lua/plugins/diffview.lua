require('diffview').setup({
    view = {
        default = {
            layout = 'diff2_horizontal',
        },
        merge_tool = {
            disable_diagnostics = true,
        }
    }
})

vim.keymap.set('n', '<leader>dfo', ':DiffviewOpen<CR>', {})
vim.keymap.set('n', '<leader>dfc', ':DiffviewClose<CR>', {})
vim.keymap.set('n', '<leader>dfh', ':DiffviewFileHistory<CR>', {})

