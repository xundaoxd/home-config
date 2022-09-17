require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    install_root_dir = vim.fn.stdpath('config')..'/pack/mason',
})

local servers = {'clangd', 'cmake'}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lspconfig = require('lspconfig')
for _, val in pairs(servers) do
    lspconfig[val].setup({
        capabilities = capabilities,
    })
end

