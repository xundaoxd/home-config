require('mason').setup({
    install_root_dir = vim.fn.stdpath('config')..'/pack/mason'
})

local packages = {
    'clangd', 'cmake-language-server', 'pyright',
    'bash-language-server', 'shellcheck', 'awk-language-server',
    'opencl-language-server', 'dockerfile-language-server',
    'marksman', 'typescript-language-server'
}
local mason_cmd = require('mason.api.command')
vim.api.nvim_create_user_command("MasonInstallAll", function() mason_cmd.MasonInstall(packages) end, {})



