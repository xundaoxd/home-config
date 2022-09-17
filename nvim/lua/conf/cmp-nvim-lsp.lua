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

local mason_packages = { 'clangd', 'pyright', 'lua-language-server', 'bash-language-server', 'cmake-language-server' }
local lsp_servers = { 'clangd', 'pyright', 'sumneko_lua', 'bashls', 'cmake' }

require('mason-tool-installer').setup({
    ensure_installed = mason_packages,
    run_on_start = false,
})

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

