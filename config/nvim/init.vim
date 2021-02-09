" bootstrap vim-plug automagically
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync|source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" Some config/whitespace automation
Plug 'tpope/vim-sleuth'
Plug 'ntpeters/vim-better-whitespace'

" Interface
Plug 'tpope/vim-vinegar'
Plug 'jeffkreeftmeijer/vim-dim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"Better syntax
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'vivien/vim-linux-coding-style'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'vim-python/python-syntax'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'LnL7/vim-nix', {'for': 'nix'}
Plug 'chikamichi/mediawiki.vim', { 'for' : 'wiki' }
Plug 'cespare/vim-toml'
Plug 'JuliaEditorSupport/julia-vim', { 'for' : 'julia' }

call plug#end()

colorscheme dim

" disable TeX commands concealing
let g:tex_conceal = ''

" space is our leader!
let mapleader = "\<Space>"
let maplocalleader = "\\"

set number
set nobackup
set noswapfile

" autosmartident
set ai
set si
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set list

" arrows for visual line identation
imap <up> <C-O>gk
imap <down> <C-O>gj
nmap <up> gk
nmap <down> gj
vmap <up> gk
vmap <down> gj

set history=999
set undolevels=999

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

set updatetime=107

" Activate linux coding style helper only in certain dirs
let g:linuxsty_patterns = ["/usr/src", "/linux", "~/git/linux", "~/fun/linux", "~/devel/linux"]

" markdown
let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['c', 'html', 'python', 'scheme', 'yaml', 'sh']

" disable modelines
set nomodeline

" change tab completion to more bash-like
set wildmode=longest:full,list:full

" I cannot spell
set spelllang=en,ru,de
nnoremap <F9> :set spell!<CR>
inoremap <F9> <C-o>:set spell!<CR>
set spellsuggest+=10

" U is quite useless
nnoremap U :echo "NOPE!"<CR>

" do not conceal stuff
set conceallevel=0
