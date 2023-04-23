local function on_attach(bufnr)
    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    local api = require("nvim-tree.api")
    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.del('n', '<BS>', { buffer = bufnr })
    vim.keymap.set('n', 'h',  api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.del('n', '<CR>', { buffer = bufnr })
    vim.keymap.set('n', 'l',  api.node.open.edit, opts('Open'))
end

require("nvim-tree").setup({
    on_attach = on_attach,
})
vim.keymap.set({ 'n', 'v', 'i' }, '<F2>', ':NvimTreeToggle<CR>', {})

