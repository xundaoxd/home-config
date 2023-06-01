local utils = require('utils')
local common = require('plugins.nvim-cmp.common')

local lsp_setup = function(lsp, opts)
    opts = utils.merge_tables({
        capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function(client, bufnr)
            local opts = { buffer = bufnr }
            vim.keymap.set('n', '<leader>gd', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', '<leader>gD', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)

            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

            vim.keymap.set('n', '<leader>gl', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '<leader>[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', '<leader>]d', vim.diagnostic.goto_next, opts)

            vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format({async = true}) end, opts)

            require('lsp_signature').on_attach({
                bind = true,
                handler_opts = {
                    border = 'rounded'
                },
                padding = ' '
            }, bufnr)
        end,
    }, opts)
    require('lspconfig')[lsp].setup(opts)
end

for _, v in pairs(common.lsp_mason) do
    lsp_setup(v.lsp, v.lsp_opts)
end

