local lsp_servers = {'clangd', 'cmake', 'pylsp', 'bashls'}

local lspformatter = require('lsp-format')
lspformatter.setup()

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
            space = 4,
            prefix = ''
        }
    }
)

local on_attach = function(client, bufnr)
    lspformatter.on_attach(client)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>df', vim.lsp.buf.formatting, bufopts)
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lspconfig = require('lspconfig')
for _, val in pairs(lsp_servers) do
    lspconfig[val].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

