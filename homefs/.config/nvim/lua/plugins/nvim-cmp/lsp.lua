require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd', 'cmake',
        'pyright', 'pylsp',
        'html', 'emmet_language_server',
        'tsserver',
        'cssls',
        'bashls', 'awk_ls',
        'lua_ls',
        'dockerls', 'docker_compose_language_service',
        'jsonls', 'yamlls',
    },
    automatic_installation = true
})
require('mason-lspconfig').setup_handlers({
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup({})
    end,
    ['emmet_language_server'] = function()
        local lspconfig = require('lspconfig')
        lspconfig.emmet_language_server.setup({
            filetypes = {
                'css', 'less', 'sass', 'scss',
                'html', 'eruby', 'pug',
                'javascript', 'javascriptreact',
                'typescript', 'typescriptreact',
            },
        })
    end,
    ['html'] = function()
        local lspconfig = require('lspconfig')
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        lspconfig.html.setup({
            capabilities = capabilities,
        })
    end,
    ['cssls'] = function()
        local lspconfig = require('lspconfig')
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        lspconfig.cssls.setup({
            capabilities = capabilities,
        })
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

-- trouble
local trouble = require('trouble')

trouble.setup({
    action_keys = {
        cancel = '<esc>',
        refresh = 'r',
        jump_close = { '<CR>' },
        next = '<TAB>',
        previous = '<S-TAB>',
    }
})

vim.keymap.set('n', 'gd', function() trouble.toggle('lsp_definitions') end)
vim.keymap.set('n', 'gr', function() trouble.toggle('lsp_references') end)
