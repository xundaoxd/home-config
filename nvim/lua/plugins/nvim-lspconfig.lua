local on_attach = function(client, bufnr)
    require('lsp-format').on_attach(client)

    local bufopts = { remap=false, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.definition, bufopts)

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
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
