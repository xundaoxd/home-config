local common = require('plugins.nvim-lsp.common')

local lsp_setup = function(lsp_config)
    for _, v in pairs(lsp_config) do
        local lsp = v.lsp
        local opts = v.lsp_opts
        opts = vim.tbl_deep_extend('force', {
            capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
            on_attach = function(client, bufnr)
                local opts = { buffer = bufnr }
                vim.keymap.set('n', '<leader>gd', '<cmd>Lspsaga finder def+ref+imp<CR>', opts)

                vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format({async = true}) end, opts)

                vim.keymap.set('n', '<leader>sh', '<cmd>Lspsaga hover_doc<CR>', opts)
                vim.keymap.set('n', '<leader>sd', '<cmd>Lspsaga show_buf_diagnostics<CR>', opts)

                require('lsp_signature').on_attach({
                    bind = true,
                    handler_opts = {
                        border = 'rounded'
                    },
                    padding = ' '
                }, bufnr)
            end,
        }, opts or {})
        require('lspconfig')[lsp].setup(opts)
    end
end
lsp_setup(common.lsp_mason)

local lspsaga = require('lspsaga')
lspsaga.setup({
    symbol_in_winbar = {
        enable = true
    },
    finder = {
        keys = {
            toggle_or_open = '<CR>',
            quit = {'q', '<ESC>'},
        },
    },
    diagnostic = {
        keys = {
            toggle_or_jump = '<CR>',
            quit = {'q', '<ESC>'},
        },
    },
    outline = {
        win_width = 36,
        close_after_jump = true,
        keys = {
            toggle_or_jump = '<CR>',
            quit = {'q', '<ESC>'},
        },
    },
})
vim.keymap.set('n', '<F3>', '<cmd>Lspsaga outline<CR>', {})

