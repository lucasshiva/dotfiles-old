    " ===================== PLUGINS =====================
call plug#begin()

" Color schemes
Plug 'dracula/vim',{'as':'dracula'}
Plug 'chuling/ci_dark'
Plug 'luochen1990/rainbow'

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kovetskiy/sxhkd-vim'
"Plug 'tpope/vim-fugitive'
"Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
"Plug 'ryanoasis/vim-devicons'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'airblade/vim-rooter'
Plug 'preservim/nerdtree'
"Plug 'jiangmiao/auto-pairs'
"Plug 'lambdalisue/vim-pyenv'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-css-color'

call plug#end()

"  ===================== CONFIG ====================
set number              " Show line numbers 
set relativenumber      " Show relative line numbers
set history=1000        " Store lots of :cmdline history
set showcmd             " Show incomplete commands down the bottom
set showmode            " Show current mode down the bottom
set visualbell          " No sounds
set autoread            " Reload files changed outside nvim
set expandtab           " Use spaces instead of tabs
set tabstop=4           " Tab length
set softtabstop=4       " Length to use when editing text (eg. TAB and BS keys)
set shiftwidth=4         " Length to use when shifting text (eg. <<, >> and == commands)
set colorcolumn=80      " Indent guide at 80 columns
set incsearch           " Find the next match as we type the search
set hlsearch            " Highlight searches by default
set ignorecase          " Ignore case when searching...
set smartcase           " ...unless we type a capital
syntax on               " Turn on syntax highlighting
colorscheme dracula     " Set colorscheme

" Use language‐specific plugins for indenting
filetype plugin indent on 

"This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden

" Show preview when substituting strings.
" :%s/<word>/<new_word>g
set inccommand=split

" Disable all backup files, never used them
set nobackup
set nowritebackup
set noswapfile

" Fix cursor
set guicursor=

" Use 24-bit (true-color) mode in Vim/Neovim.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors 

" Enable autocomplete
" let g:deoplete#enable_at_startup = 1


"nmap <C-n> :NERDTreeToggle<CR>
nmap <C-n> :CocCommand explorer<CR>
