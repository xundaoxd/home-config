require('mason').setup({
    install_root_dir = vim.fn.stdpath('config')..'/pack/mason'
})

local packages = vim.tbl_values(require('plugins.common').lsp2server)

local mason_cmd = require('mason.api.command')
vim.api.nvim_create_user_command("MasonInstallAll", function() mason_cmd.MasonInstall(packages) end, {})

