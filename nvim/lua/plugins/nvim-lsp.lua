vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
            space = 4,
            prefix = ''
        }
    }
)

require('lsp-format').setup()

local on_attach = function(client, bufnr)
    require('lsp_signature').on_attach({
        bind = true,
        handler_opts = {
            border = 'rounded'
        }
    }, bufnr)

    require('lsp-format').on_attach(client)

    local bufopts = { remap=false, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'd[', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', 'd]', vim.diagnostic.goto_next, bufopts)

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>fm', vim.lsp.buf.formatting, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local function lsp_setup(lp)
    require('lspconfig')[lp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

local lsps = require('plugins.common').lsp2server
vim.tbl_map(lsp_setup, vim.tbl_keys(lsps))

