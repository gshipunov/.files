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
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'lepture/vim-jinja'
Plug 'neomutt/neomutt.vim'

" Slimey stuff
Plug 'kassio/neoterm'

" pretty bits
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'luochen1990/rainbow'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" completion
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

" filetype magic
autocmd BufRead,BufNewFile *.nasm set filetype=nasm

" Theme
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
let g:airline_theme = 'gruvbox'
let g:rainbow_active = 1 " rainbow delimiters

" langmap russian
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Incrementally show effects of :s, :smagic, :snomagic
set icm=split

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
let g:markdown_fenced_languages = ['c', 'html', 'python', 'scheme', 'yaml', 'sh', 'json']

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
" and another time for supid ones who continue to insist
let g:pandoc#syntax#conceal#use = 0
let g:tex_conceal = ''

" vim-pandoc really tries to be 'user-friendly'...
let g:pandoc#modules#disabled = [ "spell", "folding" ]

" neoterm
let g:neoterm_default_mod='belowright' " open terminal in bottom split
let g:neoterm_size=19 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
" REPL interaction
nnoremap <leader><cr> :TREPLSendLine<cr>j
nnoremap <leader>cc :TREPLSendFile
vnoremap <leader><cr> :TREPLSendSelection<cr>

" lsp (in lua), and completion
"lua require('lsp-config')

" Whitespace highlight
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

" fzf
nmap <leader>f :Files<cr>
nmap <leader>b :Buffers<cr>
