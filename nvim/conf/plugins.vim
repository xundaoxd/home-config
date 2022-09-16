" plugin config

call plug#begin(stdpath('config') . '/plugged')

Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

Plug 'preservim/nerdtree'
map <F2> :NERDTreeToggle<CR>

Plug 'sbdchd/neoformat'
let g:neoformat_cuda_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-assume-filename=' . expand('%:t')],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_cuda = ['clangformat']
nmap <leader>f :Neoformat<CR>

Plug 'jiangmiao/auto-pairs'

call plug#end()

