require("luasnip/loaders/from_vscode").lazy_load()
local luasnip = require('luasnip')

local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({
            select = true ,
            behavior = cmp.ConfirmBehavior.Replace
        })
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'emoji' },
        { name = 'buffer' },
        { name = 'path' },
    }),
})
