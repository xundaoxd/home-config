local on_attach = function(client, bufnr)
    local bufopts = { remap=false, silent=true, buffer=bufnr }
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    if vim.lsp.buf.format then
        vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format({async = true}) end, bufopts)
    else
        vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.formatting() end, bufopts)
    end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function lsp_setup(lp)
    require('lspconfig')[lp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

local lsps = require('plugins.common').lsp2server
vim.tbl_map(lsp_setup, vim.tbl_keys(lsps))

