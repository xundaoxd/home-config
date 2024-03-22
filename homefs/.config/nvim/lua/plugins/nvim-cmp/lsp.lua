require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd', 'cmake',
        'pyright', 'pylsp',
        'html', 'tsserver', 'cssls', 'emmet_language_server',
        'bashls', 'awk_ls',
        'dockerls', 'docker_compose_language_service',
        'jsonls', 'yamlls',
    },
    automatic_installation = true
})
require('mason-lspconfig').setup_handlers({
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup({})
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    end
})

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format)

