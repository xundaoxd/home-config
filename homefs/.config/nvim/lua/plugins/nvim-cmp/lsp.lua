-- mason
local mason = require('mason')
mason.setup({
    install_root_dir = vim.fn.stdpath('config')..'/pack/mason'
})
if vim.fn.empty(vim.fn.glob(vim.fn.stdpath('config')..'/pack/mason/bin')) > 0 then
    require('mason.api.command').MasonInstall({
            'clangd', 'cmake-language-server',
            'pyright',
            'bash-language-server', 'shellcheck', 'awk-language-server', 
            'opencl-language-server',
            'dockerfile-language-server', 'docker-compose-language-service',
            'typescript-language-server',
    })
end

-- lsp
local lspconfig = require('lspconfig')
for _, lsp in ipairs({
        'clangd', 'cmake',
        'pyright',
        'bashls', 'awk_ls',
        'opencl_ls',
        'dockerls', 'docker_compose_language_service',
        'tsserver',
    }) do
    lspconfig[lsp].setup({})
end
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        vim.bo[ev.buf].tagfunc = 'v:lua.vim.lsp.tagfunc'
    end
})

vim.keymap.set({'n', 'i'}, '<A-k>', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format)

