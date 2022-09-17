local lsp_servers = {'clangd', 'cmake', 'pylsp'}

local lspformatter = require('lsp-format')
lspformatter.setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lspconfig = require('lspconfig')
for _, val in pairs(lsp_servers) do
    lspconfig[val].setup({
        on_attach = lspformatter.on_attach,
        capabilities = capabilities,
    })
end

