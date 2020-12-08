""""""""""""""""""""""""""""""""""""""
"        ________        ________
"       /        \      /        \
"       \        /      \        /
"        |      |        /     /'
"        |      |      /     /'
"        |      |    /     /' 
"        |      |  /     /'     
"        |      |/   ___          
"        |          /  /  _ _ _ _ |         ___  / _   _  \
"        |       //  / / / / / / /
"        |     /' / / / / / / / /
"        |   /'  / / / / / / / /
"        |_/'  /__//__//__//___/
"                   
"""""""""""""""""""""""""""""""""""""

syntax on
filetype plugin indent on

"""""""""""""""""""
" Plugins
"""""""""""""""""""
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'Junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'ntk148v/vim-horizon'
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/Colorizer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


"""""""""""""""""""
" UI
"""""""""""""""""""
set termguicolors
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set nu

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='violet'

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor

colorscheme horizon

"""""""""""""""""""
" Functionality
""""""""""""""""""
set autoread			
set ignorecase		        
set smartcase		        
set autoindent		        
set noswapfile
set nobackup
set clipboard=unnamedplus       
set encoding=utf-8	        
set shiftwidth=4	        
set tabstop=4
set softtabstop=4	        
set expandtab
set smartindent		        
set smarttab
set incsearch
set scrolloff=8
set noshowmode
set undodir=~/.vim/undodir
set undofile
set completeopt=menuone,noinsert,noselect
set updatetime=50
set shortmess+=c
set wildmode=longest,list,full
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
vnoremap . :normal .<CR>
set splitbelow splitright

"""""""""""""""""""
" Mapping
"""""""""""""""""""
":imap jk <Esc>

