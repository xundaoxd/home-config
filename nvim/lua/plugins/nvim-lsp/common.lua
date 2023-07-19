local common = {}

common.lsp_mason = {
    {
        lsp = 'clangd',
        mason = {'clangd'},
    },
    {
        lsp = 'cmake',
        mason = {'cmake-language-server'},
    },
    {
        lsp = 'pyright',
        mason = {'pyright'},
    },
    {
        lsp = 'pylsp',
        mason = {'python-lsp-server'},
    },
    {
        lsp = 'bashls',
        mason = {'bash-language-server', 'shellcheck'},
    },
    {
        lsp = 'awk_ls',
        mason = {'awk-language-server'},
    },
    {
        lsp = 'opencl_ls',
        mason = {'opencl-language-server'},
    },
    {
        lsp = 'dockerls',
        mason = {'dockerfile-language-server'},
    },
    {
        lsp = 'docker_compose_language_service',
        mason = {'docker-compose-language-service'},
    },
    {
        lsp = 'marksman',
        mason = {'marksman'},
    },
    {
        lsp = 'tsserver',
        mason = {'typescript-language-server'},
    },
}

return common

