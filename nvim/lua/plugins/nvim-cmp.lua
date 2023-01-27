local lsp_setup = function(lsp, opts)
    local on_attach = function(client, bufnr)
        local bufopts = { remap=false, silent=true, buffer=bufnr }
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', '<leader>gD', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)

        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        if vim.lsp.buf.format then
            vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format({async = true}) end, bufopts)
        else
            vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.formatting() end, bufopts)
        end
    end
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local opts_ = {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    if opts ~= nil then
        opts_ = vim.tbl_extend("force", opts_, opts)
    end
    require('lspconfig')[lsp].setup(opts_)
end

vim.tbl_map(function(i)
    lsp_setup(i, nil)
end, {
    'clangd', 'cmake', 'pyright',
    'bashls', 'awk_ls', 'opencl_ls',
    'dockerls', 'marksman', 'tsserver'
})

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

