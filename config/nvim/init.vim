" bootstrap vim-plug automagically
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync|source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" Nifty stuff
Plug 'jamessan/vim-gnupg'

" Some config/whitespace automation
Plug 'tpope/vim-sleuth'

" Interface
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" linting/formatting/completion
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Better syntax
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'vivien/vim-linux-coding-style'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'hdima/python-syntax'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'LnL7/vim-nix', {'for': 'nix'}
Plug 'chikamichi/mediawiki.vim'
Plug 'cespare/vim-toml'

call plug#end()

"" TeX and co stuff
" disable TeX commands concealing
let g:tex_conceal = ''

" space is our leader!
let mapleader = "\<Space>"
let maplocalleader = "\\"

" set line numbering
set number

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

" fzf.vim
nnoremap <C-P> :Files<CR>
nnoremap <leader>b :Buffers<CR>

" Update more often
set updatetime=107

" Activate linux coding style helper only in certain dirs
let g:linuxsty_patterns = ["/usr/src", "/linux", "~/git/linux", "~/devel/linux"]

" markdown
let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['c', 'html', 'python', 'scheme']

" disable modelines
set nomodeline

" change tab completion to more bash-like
set wildmode=longest:full,list:full

" I cannot spell
set spelllang=en,ru,de
nnoremap <F9> :set spell!<CR>
inoremap <F9> <C-o>:set spell!<CR>
set spellsuggest+=10

" Toggle UndoTree
nnoremap <Leader>u :UndotreeToggle<cr>
" U is quite useless
nnoremap U :echo "NOPE!"<CR>

" do not conceal stuff
set conceallevel=0

" deoplete
let g:deoplete#enable_at_startup = 1

" neomake
call neomake#configure#automake('rw', 1000)

" airline
set noshowmode
let g:airline_theme='monochrome'
