return {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        view = {
            default = {
                layout = 'diff2_horizontal',
            },
            merge_tool = {
                disable_diagnostics = true,
            }
        }
    },
    lazy = true,
    keys = {
        { '<leader>do', '<cmd>DiffviewOpen<cr>' },
        { '<leader>dc', '<cmd>DiffviewClose<cr>' },
        { '<leader>dh', '<cmd>DiffviewFileHistory<cr>' },
    },
}
