require('plugins.nvim-cmp.lsp')

local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_snipmate').lazy_load()

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
        -- ['<Tab>'] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_next_item()
        --     elseif luasnip.jumpable(1) then
        --         luasnip.jump(1)
        --     elseif luasnip.expandable() then
        --         luasnip.expand()
        --     else
        --         fallback()
        --     end
        -- end, {'i', 's'}),
        -- ['<S-Tab>'] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_prev_item()
        --     elseif luasnip.jumpable(-1) then
        --         luasnip.jump(-1)
        --     else
        --         fallback()
        --     end
        -- end, {'i', 's'}),
        -- ['<esc>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<A-k>'] = cmp.mapping.scroll_docs(-4),
        ['<A-j>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm(),
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = require('lspkind').cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
        })
    },
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'buffer' },
        { name = 'emoji' },
        { name = 'luasnip' },
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

