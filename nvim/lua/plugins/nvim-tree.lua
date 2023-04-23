local function on_attach(bufnr)
    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    local api = require("nvim-tree.api")
    api.config.mappings.default_on_attach(bufnr)

end

require("nvim-tree").setup({
    on_attach = on_attach,
})
vim.keymap.set({ 'n', 'v', 'i' }, '<F2>', ':NvimTreeToggle<CR>', {})

