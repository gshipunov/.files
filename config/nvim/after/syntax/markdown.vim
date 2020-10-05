" Vim syntax file                                                                                                                                                                                                                             
" Language: markdown with embedded yaml, toml for Hugo
" Author:   James Wright (james@jameswright.xyz)
" License:  MIT
" Inspired by https://github.com/pbrisbin/vim-syntax-shakespeare/blob/master/after/syntax/haskell.vim

" store and remove current syntax value
if exists('b:current_syntax')
  let old_syntax = b:current_syntax
  unlet b:current_syntax
endif

syn include @yaml syntax/yaml.vim
unlet b:current_syntax

syn include @toml syntax/toml.vim
unlet b:current_syntax

if getline(1) =~ '---'
    syn region yamlBlock matchgroup=quasiQuote start=/\%^---/ end=/^---/ contains=@yaml
elseif getline(1) =~ '+++'
    syn region tomlBlock matchgroup=quasiQuote start=/\%^+++/ end=/^+++/ contains=@toml
endif

if version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif


HiLink quasiQuote     Boolean

delcommand HiLink

" restore current syntax value
if exists('old_syntax')
  let b:current_syntax = old_syntax
endif
