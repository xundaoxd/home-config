require('luasnip/loaders/from_vscode').lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

-- 'i' = insert mode
-- 'c' = command mode
-- 's' = select mode
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
            before = function(entry, vim_item)
                vim_item.menu = '['..string.upper(entry.source.name)..']'
                return vim_item
            end
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

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'cmdline' }
    })
})

