local common = require('plugins.nvim-lsp.common')

local lsp_setup = function(lsp_config)
    for _, v in pairs(lsp_config) do
        local lsp = v.lsp
        local opts = v.lsp_opts
        opts = vim.tbl_deep_extend('force', {
            capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
            on_attach = function(client, bufnr)
                local opts = { buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

                vim.keymap.set({'n', 'i'}, '<A-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set({'n', 'i'}, '<C-k>', vim.lsp.buf.hover, opts)

                vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<leader>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)

                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format({async = true}) end, opts)
            end,
        }, opts or {})
        require('lspconfig')[lsp].setup(opts)
    end
end
lsp_setup(common.lsp_mason)

require('symbols-outline').setup()
vim.keymap.set('n', '<leader>sm', '<cmd>SymbolsOutline<CR>')

