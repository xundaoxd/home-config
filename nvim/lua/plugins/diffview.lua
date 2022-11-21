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

vim.keymap.set('n', '<leader>dfo', ':DiffviewOpen<CR>', { silent = true, remap = false })
vim.keymap.set('n', '<leader>dfc', ':DiffviewClose<CR>', { silent = true, remap = false })
vim.keymap.set('n', '<leader>dfh', ':DiffviewFileHistory<CR>', { silent = true, remap = false })

