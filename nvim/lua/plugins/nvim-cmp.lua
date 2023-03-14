local lsp_setup = function(lsp, opts)
    require('lspconfig')[lsp].setup({
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        on_attach = function(client, bufnr)
            local opts = { buffer = bufnr }
            vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

            vim.keymap.set('n', 'rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, opts)

            vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

            vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format({async = true}) end, opts)

            require('lsp_signature').on_attach({
                bind = true,
                handler_opts = {
                    border = 'rounded'
                },
                padding = ' '
            }, bufnr)
        end,
    })
end

lsp_setup('clangd')
lsp_setup('cmake')
lsp_setup('pyright')
lsp_setup('bashls')
lsp_setup('awk_ls')
lsp_setup('opencl_ls')
lsp_setup('dockerls')
lsp_setup('marksman')
lsp_setup('tsserver')

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                local e = cmp.get_selected_entry()
                if e == nil or vim.tbl_isempty(e) then
                    cmp.close()
                else
                    cmp.confirm()
                end
            else
                fallback()
            end
        end),
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = require('lspkind').cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
        })
    },
    sources = cmp.config.sources({
        { name = 'buffer' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'calc' },
        { name = 'emoji' },
        { name = 'nvim_lsp' },
    }),
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'buffer' }
    })
})
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'cmdline' }
    })
})

