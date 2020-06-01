" bootstrap vim-plug automagically
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync|source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" Colorschemes
Plug 'morhetz/gruvbox'

" Nifty stuff
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'jamessan/vim-gnupg'
Plug 'lambdalisue/suda.vim'
Plug 'junegunn/vim-easy-align'

" Some config/whitespace automation
Plug 'dpc/vim-smarttabs'
Plug 'tpope/vim-sleuth'

" Interface
Plug 'ntpeters/vim-better-whitespace'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Checking, linting, building etc.
Plug 'neomake/neomake'
Plug 'ycm-core/YouCompleteMe', {'for': ['python', 'c', 'cpp']}

"Better syntax
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'vivien/vim-linux-coding-style'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'hdima/python-syntax'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'LnL7/vim-nix', {'for': 'nix'}
Plug 'chikamichi/mediawiki.vim'

Plug 'vimwiki/vimwiki'

call plug#end()

"" TeX and co stuff
" disable TeX commands concealing
let g:tex_conceal = ''

" space is our leader!
let mapleader = "\<Space>"
let maplocalleader = "\\"

" theme
if $COLORTERM == 'truecolor' || $COLORTERM == '24bit'
    set termguicolors
endif
" all my terminals can handle italic
set t_ZH=[3m
set t_ZR=[23m
let g:gruvbox_italic='1' "has to be before the colorscheme
let g:gruvbox_contrast_dark ='hard'
set background=dark
colorscheme gruvbox
let g:airline_theme="gruvbox"

" airline
set noshowmode
let g:airline#extensions#tabline#enabled = 1

" set line numbering
set number

" hidden is cool
set hidden

" add 80th column hightlight
set colorcolumn=80

" use arrows for visual line navigation
imap <up> <C-O>gk
imap <down> <C-O>gj
nmap <up> gk
nmap <down> gj
vmap <up> gk
vmap <down> gj

" Set place for backups
set nobackup

" Swap for slacks
set noswapfile

" Tagbar
nmap <F8> :TagbarToggle<CR>

" autosmartident
set ai
set si

" Expand tabs to spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

" show indentation
set list

" Enlarge your Undo!
set history=999
set undolevels=999

" Copying and pasting
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Easier buffer switching
nnoremap <leader>b :CtrlPBuffer<CR>

" Update more often
set updatetime=107

" Activate linux coding style helper only in certain dirs
let g:linuxsty_patterns = ["/usr/src", "/linux", "~/git/linux", "~/devel/linux"]

" markdown
let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['html', 'python']

" disable modelines
set nomodeline

" neomake on read and write
call neomake#configure#automake('rw')

" easy align
nmap <leader>a <Plug>(EasyAlign)
xmap <leader>a <Plug>(EasyAlign)

" change tab completion to more bash-like
set wildmode=longest:full,list:full

" I cannot spell
set spelllang=en,ru,de
nnoremap <F9> :set spell!<CR>
inoremap <F9> <C-o>:set spell!<CR>

" Toggle UndoTree
nnoremap <Leader>u :UndotreeToggle<cr>
" U is quite useless
nnoremap U :echo "NOPE!"<CR>

" vimwiki
let g:vimwiki_list = [{'path': '~/nextcloud/vimwiki', 'syntax': 'markdown', 'ext': '.vwmd'}]
