"   ____                             _
"  / ___|_ __ _____      __   __   _(_)_ __ ___
" | |   | '__/ _ \ \ /\ / /___\ \ / / | '_ ` _ \
" | |___| | | (_) \ V  V /_____\ V /| | | | | | |
"  \____|_|  \___/ \_/\_/       \_/ |_|_| |_| |_|
"
" This is my own .vimrc.
" I have used many vimrc before,
" Now,I decided to write my own vimrc for my Vimrc
" Well, if you like it.
" Please fork and star! Thank you very much!
" 
" Author :EvilCrow
" Source :http://github.com/evil-crow/Crow-vim
" Last ,dedicate this vimrc for XiyouLinuxGroup
" Thanks for you very much!
"
""""""""""""""""""""""""""""""""""""""""General Settings""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
filetype on                       "detect the different filetype
filetype plugin on                "auto loading the ftplugin by filetype
filetype indent on                "auto loading the indent by filetype
syntax enable                     "open the default code highlight
syntax on                         "open the syntax switch
set completeopt=longest,menu
set showtabline=2                 "always show the tab 

set t_Co=256                      "provide 256 colors support for some colorscheme
set background=dark
" colorscheme gruvbox
colorscheme molokai
" colorscheme ron
set noerrorbells                  "Let Vim do not DiDiDi anymore
set novisualbell                  "Let vim be quiet in visual mode
set history=500                   "set Vim's history 500
set autoread                      "autoread when the file has been modified
set shortmess=atI                 "do not display the Uganda message
set textwidth=200                 "let the linewidth is 200
"set mouse=a                      let the mouse can be use in GUI:help
"set title                        display the title in GUI

""""""""""""""""""""""""""""""""""""""""Display Settings"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number                        "set line number
set numberwidth=4                 "set the line numberwidth=4
set cursorcolumn                  "highlight the current column
set cursorline                    "highlight the current line 
set encoding=utf-8                "set the encoding UTF-8
set expandtab                     "use <space> to replace <tab> It's very useful for filetype=asm
set nowrap                        "prohibit wrap the line
set shiftround
set tabstop=4                     "default tabwidth=4
set shiftwidth=4                  "default shift indent=4
set smarttab                      "let tabwidth = shiftwidth
set showcmd                       "display the command you're typing
set showmode                      "display the Vim-mode currently
set showmatch                     "highlight the brackets 
set matchtime=3                   "set the jump time is 0.3


""""""""""""""""""""""""""""""""""""""""Mapping-Setting"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use <j-k> replace <esc> in insert-mode
inoremap jk <esc>

" use abbrevation to set your blog,e-mail and (http://www.github.com/evil-crow when your insert text
iabbrev blog (http://evil-crow.github.io)
iabbrev @@ Evilcrow486@gmail.com
iabbrev github (http://www.github.com/evil-crow)

" the stronger H and L
nnoremap H 0
nnoremap L $

" use <tab> to indent the text when you in visual-mode
nnoremap <tab> V>
nnoremap <s-tab> V<
vnoremap <tab> >
vnoremap <s-tab> <

""""""""""""""""""""""""""""""""""""""""Indent Setting"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent                                      "set auto indent
set cindent                                         "set C/C++ indent
set smartindent                                     "indent smartly
"set foldmethod=indent                              "set the file fold by indent
set foldmethod=syntax                               "set the file fold by syntax
set foldignore=
set nofoldenable                                    "open the file without fold
autocmd FileType vim :set foldmethod=marker


""""""""""""""""""""""""""""""""""""""""Autocmd Setting""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Python is strict with indent
autocmd FileType python set shiftwidth=4 tabstop=4 smarttab
"Ruby use soft-tab
autocmd Filetype ruby set shiftwidth=2 tabstop=2 expandtab

"You can't worry about not save the file
autocmd FocusLost,CursorHoldI " :write


"""""""""""""""""""""""""""""""""""""""""Newfile Setting"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
autocmd BufNewFile *.c,*.cpp,*.java,*.rb,*.py,*.sh,*.h,*.html,*.css,*.js,*.php,*.xml :call NewFile( )

function NewFile( )
    if &filetype == 'python'
        call setline(1,"# !/usr/bin/env python")
        call append(1,"# -\"- coding: utf-8 -\"-")
        call append(2,"# @filename:" . expand("%"))
        call append(3,"# @date: " . strftime("%x %T"))
        call append(4,"# @author: Crow")
        call append(5,"# @description:")
        call append(6,"")
        call append(7,"")
    endif
    if &filetype == 'ruby' 
        call setline(1,"# !/usr/bin env ruby")
        call setline(2,"# encoding: utf-8")
        call setline(3,"# @filename:" . expand("%"))
        call setline(4,"# @date: " . strftime("%x %T"))
        call setline(5,"# @author: Crow")
        call setline(6,"# @description:")
        call setline(7,"")
        call setline(8,"")
    endif
    if &filetype == 'sh'
        call setline(1,"# !/bin/bash")
        call append(1,"# -\"- coding: utf-8 -\"-")
        call append(2,"# @filename:" . expand("%"))
        call append(3,"# @date: " . strftime("%x %T"))
        call append(4,"# @author: Crow")
        call append(5,"# @description:")
        call append(6,"")
        call append(7,"")
    endif
    if &filetype == 'html'
        call setline(1,"<!DOCTYPE html>")
        call append(1,"<html>")
        call append(2,"<head>")
        call append(3,"<meta charset\"utf-8\">")
        call append(4,"<meta http-equiv=\"X-UA-Compatible\" contest=\"IE=edge,chrome=1\">")
        call append(5,"<title>Examples</title>")
        call append(6,"<meta name=\"description\" content=\"\">")
        call append(7,"<meta name=\"keywords\" content=\"\">")
        call append(8,"<link href=\"\" rel=\"stylesheet\">")
        call append(9,"</head>")
        call append(10,"<body>")
        call append(11,"")
        call append(12,"</body>")
        call append(13,"</html>") 
    endif
    if &filetype == 'css'
        call setline(1,"@charset \"UTF-8\";")
        call append(1,"/**")
        call append(2," * @author: Crow")
        call append(3," * @date   " . strftime("%x %T"))
        call append(4," * @version $Id$")
        call append(5," */")
        call append(6,"")
        call append(7,"")
    endif
    if &filetype == 'javascript'
        call setline(1,"/**")
        call append(1," * @author: Crow")
        call append(2," * @date    " . strftime("%x %T"))
        call append(3," * @version $Id$")
        call append(4," */")
        call append(5,"")
        call append(6,"")
    endif
    if &filetype == 'php'
        call setline(1,"<?php")
        call append(1,"/**")
        call append(2," * @author: Crow")
        call append(3," * @date    " . strftime("%x %T"))
        call append(4," * @version $Id$")
        call append(5," */")
        call append(6,"") 
        call append(7,"class ClassName extends AnotherClass {")
        call append(8,"")
        call append(9,"    function __construct(){")
        call append(10,"")
        call append(11,"    }")
    endif
    if &filetype == "xml"
        call setline(1,"<?xml version=\"1.0\" encoding=\"UTF-8\" ?>")
        call append(1,"<root>")
        call append(2,"")
        call append(3,"</root>")
    endif
    if expand("%:e") == 'h'
        call setline(1,"#ifndef " . "_" . toupper(expand("%:r") . "_h"))
        call append(1,"#define " . "_" . toupper(expand("%:r") . "_h"))
        call append(2,"")
        call append(3,"#endif")
    endif
    if (&filetype == 'c' || &filetype == 'cpp' || &filetype == 'java') && expand("%:e") != "h"
        call setline(1,"/*")
        call append(1," * @filename:    " . expand("%"))
        call append(2," * @author:      Crow")
        call append(3," * @date:        " . strftime("%x %T"))
        call append(4," * @description:")
        call append(5," */")
        call append(6,"")
    endif
    if &filetype == 'c'
        call append(7,"#include <stdio.h>")
        call append(8,"#include <stdlib.h>")
        call append(9,"")
    endif
    if &filetype == 'cpp'
        call append(7,"")
    endif
    if &filetype == 'java'
    endif
endfunction

autocmd BufNewFile * :call Indent_file( )    
function Indent_file( )
    if &filetype == 'html'
        exec "normal 6G7l"
    endif
    if &filetype == 'php'
        exec "normal 3G"
    endif
    if &filetype == 'xml'
        exec "normal 3G"
    endif
    if expand("%:e") == 'h'
        exec "normal gg"
        exec "normal k"
    endif
    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'python' || &filetype == 'ruby' || &filetype == 'javascript' || &filetype == 'cpp' || &filetype == 'java' || &filetype == 'sh'
        exec "normal G"
    endif
endfunction


"""""""""""""""""""""""""""""""""""""""""Vundle Setting"""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
"filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'                        "Plugin NERDtree
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-scripts/Conque-GDB'
call vundle#end()            " required
filetype plugin indent on    " required


""""Plugin Settizang

"NERDTree Setting
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
noremap <F2> :NERDTreeToggle<cr>

"Tagbar Setting
noremap <F4> :TagbarToggle<cr>


"Airline
let g:airline_section_b = '%{strftime("%x")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'

"NERDComment
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

"YouCompleteMe
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_python_binary_path = '/usr/bin/python3'
 
if expand("%:e") == 'c' 
    let g:ycm_global_ycm_extra_conf='/usr/src/kernels/4.14.16-300.fc27.x86_64/.ycm_extra_conf.py'
endif
if expand("%:e") == 'cpp'
    let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_cpp_conf.py'
endif
if expand("%:e") == 'hpp'
    let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_cpp_conf.py'
endif
if expand("%:e") == 'cxx'
    let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_cpp_conf.py'
endif

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'],
  \   'cpp,objcpp' : ['->', '.', '::','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::',' '],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.',' '],
  \   'ruby' : ['.', '::',' '],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1 
let g:ycm_min_num_of_chars_for_completion=2 
let g:ycm_cache_omnifunc=0  
let g:ycm_seed_identifiers_with_syntax=1    
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0

"Ultisnips Seting
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"IndentLine Setting
let g:indentLine_char = "┆"  
let g:indentLine_enabled = 1  
let g:autopep8_disable_show_diff=1

"Conque GDB
let g:ConqueGdb_SrcSplit = 'above'
let g:ConqueGdb_SaveHistory = 1
let g:ConqueGdb_Leader = ','
let g:ConqueTerm_Color = 1
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_StartMessages = 1

nnoremap <Leader>cgdb :ConqueGdb a.out<cr><esc><C-w><C-w>
nnoremap <silent> <Leader>Y :ConqueGdbCommand y<CR>
nnoremap <silent> <Leader>N :ConqueGdbCommand n<CR>
