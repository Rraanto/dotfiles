set nu
set mouse=a
syntax on

colorscheme slate
autocmd VimEnter * NERDTree | wincmd p
map <C-o> :NERDTreeToogle<CR>

call plug#begin()
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
call plug#end()

