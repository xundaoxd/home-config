require('diffview').setup({
    view = {
        merge_tool = {
            layout = 'diff1_plain'
        }
    }
})

vim.keymap.set('n', '<leader>dfo', ':DiffviewOpen<CR>', { silent = true, remap = false })
vim.keymap.set('n', '<leader>dfc', ':DiffviewClose<CR>', { silent = true, remap = false })
vim.keymap.set('n', '<leader>dfh', ':DiffviewFileHistory<CR>', { silent = true, remap = false })

