set nu
set mouse=a

map <C-o> :NERDTreeToggle<CR>

" plugins 
call plug#begin()
" colorscheme
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" UI
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Autocomplete plugins
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'jiangmiao/auto-pairs'


" formatter
Plug 'neoclide/coc.nvim', {'branch' : 'release'}
Plug 'Chiel92/vim-autoformat'

call plug#end()

filetype plugin indent on

syntax on
syntax enable

let base16colorspace=256
colorscheme base16-gruvbox-dark-hard
set background=dark

if has('termguicolors')
    set termguicolors
endif

if has('gui_running')
    set guicursor=n-v-c-sm:block,i-ci-ve:block, r-cr-o:blocks
endif

"tab size configuration
set expandtab
set tabstop=4
set shiftwidth=4

