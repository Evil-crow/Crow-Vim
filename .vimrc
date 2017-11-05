"  ____                   _   __     ___           
" / ___|_ __ _____      _( )__\ \   / (_)_ __ ___  
"| |   | '__/ _ \ \ /\ / /// __\ \ / /| | '_ ` _ \ 
"| |___| | | (_) \ V  V /  \__ \\ V / | | | | | | |
" \____|_|  \___/ \_/\_/   |___/ \_/  |_|_| |_| |_|
"
" This is my own .vimrc.
" I have used many vimrc before,
" Now,I decided to write my own vimrc for my Vim
" Well, if you like it.
" Please fork and star! Thank you very much!
" 
" Author :EvilCrow
" Source :http://github.com/evil-crow/Crow-vim
" Last ,dedicate this vimrc for XiyouLinuxGroup
" Thanks for you very much!
"
""""""""""""""""""""""""""""""""""""""""General Settings""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""{{{

let mapleader = ","               "set up the mapleader
filetype on                       "detect the different filetype
filetype plugin on                "auto loading the ftplugin by filetype
filetype indent on                "auto loading the indent by filetype
syntax enable                     "open the default code highlight
syntax on                         "open the syntax switch
set completeopt=longest,menu
set showtabline=2                 "always show the tab 

set t_Co=256                      "provide 256 colors support for some colorscheme
let g:solarized_termcolors=256
" set background=dark
colorscheme solarized
set noerrorbells                  "Let Vim do not DiDiDi anymore
set novisualbell                  "Let vim be quiet in visual mode
set history=500                   "set Vim's history 500
set autoread                      "autoread when the file has been modified
set shortmess=atI                 "do not display the Uganda message
set textwidth=200                 "let the linewidth is 200
"set mouse=a                      let the mouse can be use in GUI:help
"set title                        display the title in GUI
"}}}

""""""""""""""""""""""""""""""""""""""""Display Settings"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""{{{

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
"}}}

""""""""""""""""""""""""""""""""""""""""Mapping-Setting"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""{{{

" use <leader>s to save you file,quit you file when you in insert-mode
inoremap <leader>wq <esc>:wq<cr>
inoremap <leader>q  <esc>:q!<cr>
inoremap <leader>w  <esc>:w<cr>

" change and loading the vimrc conviently
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" use <j-k> replace <esc> in insert-mode
inoremap jk <esc>

" use abbrevation to set your blog,e-mail and (http://www.github.com/evil-crow when your insert text
iabbrev blog (http://evil-crow.github.io)
iabbrev @@ Evilcrow486@gmail.com
iabbrev github (http://www.github.com/evil-crow)

" modify the wrong touch of the Caplocks/Shift
cabbrev q q!
cabbrev Wq wq
cabbrev W w
cabbrev Q q

" the stronger H and L
nnoremap H 0
nnoremap L $

" use <tab> to indent the text when you in visual-mode
nnoremap <tab> V>
nnoremap zs-tab> V<
vnoremap <tab> >
vnoremap <s-tab> <

" use <leader>+number to switch you tab 
inoremap <leader>n   <esc>:tabn<cr>
inoremap <leader>p   <esc>:tabp<cr>
inoremap <leader>new <esc>:tabnew<cr>
nnoremap <leader>n   :tabn<cr>
nnoremap <leader>p   :tabp<cr>
nnoremap <leader>new :tabnew<cr>

"}}}

""""""""""""""""""""""""""""""""""""""""Indent Setting"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""{{{

set autoindent                                      "set auto indent
set cindent                                         "set C/C++ indent
set smartindent                                     "indent smartly
"set foldmethod=indent                              "set the file fold by indent
set foldmethod=syntax                               "set the file fold by syntax
set foldignore=
set nofoldenable                                    "open the file without fold
autocmd FileType vim :set foldmethod=marker

"}}}

""""""""""""""""""""""""""""""""""""""""Autocmd Setting""""""""""""""""""""""""""""""""""""""""""""""""""""""""""{{{

"Python is strict with indent
autocmd FileType python set shiftwidth=4 tabstop=4 smarttab
"Ruby use soft-tab
autocmd Filetype ruby set shiftwidth=2 tabstop=2 expandtab

"You can't worry about not save the file
autocmd FocusLost,CursorHoldI " :write

"}}}

"""""""""""""""""""""""""""""""""""""""""Newfile Setting"""""""""""""""""""""""""""""""""""""""""""""""""""""""""{{{
"
autocmd BufNewFile *.c,*.cpp,*.java,*.rb,*.py,*.sh,*.h,*.html,*.css,*.js,*.php,*.xml :call NewFile( )

function NewFile( )
    if &filetype == 'python'
        call setline(1,"# !/usr/bin/env python")
        call append(1,"# -\"- coding: utf-8 -\"-")
        call append(2,"# @filename:" . expand("%"))
        call append(3,"# @date: " . strftime("%x %T"))
        call append(4,"# @author: Your Name (you@example.org)")
        call append(5,"# @description:")
        call append(6,"")
        call append(7,"")
    endif
    if &filetype == 'ruby' 
        call setline(1,"# !/usr/bin env ruby")
        call setline(2,"# encoding: utf-8")
        call setline(3,"# @filename:" . expand("%"))
        call setline(4,"# @date: " . strftime("%x %T"))
        call setline(5,"# @author: Your Name (you@example.org)")
        call setline(6,"# @description:")
        call setline(7,"")
        call setline(8,"")
    endif
    if &filetype == 'sh'
        call setline(1,"# !/bin/bash")
        call append(1,"# -\"- coding: utf-8 -\"-")
        call append(2,"# @filename:" . expand("%"))
        call append(3,"# @date: " . strftime("%x %T"))
        call append(4,"# @author: Your Name (you@example.org)")
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
        call append(2," *")
        call append(3," * @author: Your Name (you@example.org)")
        call append(4," * @date   " . strftime("%x %T"))
        call append(5," * @version $Id$")
        call append(6," */")
        call append(7,"")
        call append(8,"")
    endif
    if &filetype == 'javascript'
        call setline(1,"/**")
        call append(1," *")
        call append(2," * @author: Your Name (you@example.org)")
        call append(3," * @date    " . strftime("%x %T"))
        call append(4," * @version $Id$")
        call append(5," */")
        call append(6,"")
        call append(7,"")
    endif
    if &filetype == 'php'
        call setline(1,"<?php")
        call append(1,"/**")
        call append(2," *")
        call append(3," * @author: Your Name (you@example.org)")
        call append(4," * @date    " . strftime("%x %T"))
        call append(5," * @version $Id$")
        call append(6," */")
        call append(7,"") 
        call append(8,"class ClassName extends AnotherClass {")
        call append(9,"")
        call append(10,"    function __construct(){")
        call append(11,"")
        call append(12,"    }")
    endif
    if &filetype == "xml"
        call setline(1,"<?xml version=\"1.0\" encoding=\"UTF-8\" ?>")
        call append(1,"<root>")
        call append(2,"")
        call append(3,"</root>")
    endif
    if expand("%:e") == 'h'
        call setline(1,"#ifndef " . toupper(expand("%:r") . "_h"))
        call append(1,"#define " . toupper(expand("%:r") . "_h"))
        call append(2,"")
        call append(3,"#endif")
    endif
    if (&filetype == 'c' || &filetype == 'cpp' || &filetype == 'java') && expand("%:e") != "h"
        call setline(1,"/*")
        call append(1," *")
        call append(2," * @filename:    " . expand("%"))
        call append(3," * @author:     Your Name (you@example.org)")
        call append(4," * @date:        " . strftime("%x %T"))
        call append(5," * @description:")
        call append(6," */")
        call append(7,"")
        call append(8,"")
    endif
    if &filetype == 'c'
        call append(8,"#include<stdio.h>")
        call append(9,"#include<stdlib.h>")
    endif
    if &filetype == 'cpp'
        call append(8,"#include<iostream>")
        call append(9,"using namespace std;")
    endif
    if &filetype == 'java'
        call append(8,"public class name {")
        call append(9,"")
        call append(10,"}")
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
        exec "normal 3G"
    endif
    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'python' || &filetype == 'ruby' || &filetype == 'javascript' || &filetype == 'cpp' || &filetype == 'java' || &filetype == 'sh'
        exec "normal G"
    endif
endfunction

"}}}

"""""""""""""""""""""""""""""""""""""""""Vundle Setting"""""""""""""""""""""""""""""""""""""""""""""""""""{{{
set nocompatible              " be iMproved, required
"filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'                        "Plugin NERDtree
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Yggdroot/indentLine'

call vundle#end()            " required
filetype plugin indent on    " required

"}}}

""""Plugin Settizang{{{

"NERDTree Setting
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
noremap <F2> :NERDTreeToggle<cr>

"CtrlP Setting
let g:ctrlp_map = '<leader>cp'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:crtlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1

"Tagbar Setting
noremap <F4> :TagbarToggle<cr>

"Ale Setting
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
autocmd bufenter * if (winnr("$") == 1 && expand("%") == "" && argc() != 0 ) | q | endif

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
    let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_c_conf.py'
endif
if expand("%:e") == 'cpp'
    let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_cpp_conf.py'
endif
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.',' '],
  \   'cpp,objcpp' : ['->', '.', '::',' '],
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
let g:ycm_complete_in_comments = 1
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
