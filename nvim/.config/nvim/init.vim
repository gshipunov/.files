" Install vim-plug automagically
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

" insert images into markdown automagically
Plug 'ferrine/md-img-paste.vim'

"Better syntax
Plug 'rust-lang/rust.vim'
Plug 'LnL7/vim-nix'
Plug 'cespare/vim-toml'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'lervag/vimtex'
Plug 'lepture/vim-jinja'
Plug 'neomutt/neomutt.vim'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

" pretty bits
Plug 'bluz71/vim-moonfly-colors'
"Plug 'jeffkreeftmeijer/vim-dim'
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'

" navigating files
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'

call plug#end()

" filetype magic
autocmd BufRead,BufNewFile *.nasm set filetype=nasm

" Theme
set termguicolors
let g:airline#extensions#tabline#enabled = 1
set noshowmode " airline shows it for us
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline_theme = 'moonfly'
colorscheme moonfly

" langmap russian
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Incrementally show effects of :s, :smagic, :snomagic
set icm=split
set signcolumn=yes

" insert images into markdown automagically
autocmd FileType markdown nmap <buffer><silent> <localleader>p :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = 'static'
let g:mdip_imgname = 'image'

set number

" space is our leader!
let mapleader = "\<Space>"
let maplocalleader = "\\"

set nobackup nowritebackup
set noswapfile

" autosmartident
set ai
set si
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" arrows for visual line navigation
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

" markdown
let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['c', 'html', 'python', 'rust', 'scheme', 'yaml', 'sh', 'json']

" disable modelines
set nomodeline

" autocomplete
let g:deoplete#enable_at_startup = 1

" change tab completion to more bash-like
set wildmode=longest:full,list:full

" U is quite useless
nnoremap U :echo "NOPE!"<CR>
" help is quite annoying when you miss esc
map <F1> <Esc>
imap <F1> <Esc>

" do not conceal stuff
set conceallevel=0
set foldlevel=999

" Whitespace highlight
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+\%#\@<!$/

" TeX
let g:tex_conceal = ''

" fzf
nnoremap <leader>f <cmd>GFiles<cr>
nnoremap <leader>g <cmd>Rg<cr>
nnoremap <leader>b <cmd>Buffers<cr>
nnoremap <leader>F <cmd>Files<cr>

" highlight yanked text
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END
