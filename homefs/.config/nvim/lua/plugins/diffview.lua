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
    init = function()
        vim.keymap.set('n', '<leader>do', '<cmd>DiffviewOpen<cr>')
        vim.keymap.set('n', '<leader>dc', '<cmd>DiffviewClose<cr>')
        vim.keymap.set('n', '<leader>dh', '<cmd>DiffviewFileHistory<cr>')
    end,
}
