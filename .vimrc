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

"General Settings
let mapleader = ","                     "设置mapleader
filetype on                             "检测到的不同文件类型
filetype plugin on                      "根据检测到的不同文件类型自动加载ftplugin
set noerrorbells                        "让Vim不再DiDiDi


"Display Settings
syntax enable                           "开启默认的语法高亮
syntax on                               "有语法高亮配色时,可以替换默认配色
set t_Co=256                            "对于有些主题开启256色支持

set number                              "显示行号
set numberwidth=4                       "设置行号宽度
set cursorcolumn                        "高亮当前行
set cursorline                          "高亮当前列
set encoding=utf-8                      "设置字符编码为UTF-8
set expandtab                           "用空格代替Tab
set shiftwidth=4                        "默认缩进为4空格,具体文件使用自动命令
set smarttab                            "插入的Tab使用shiftwidth的宽度
set tabstop=4                           "Tab默认4个空格,具体文件使用自动命令
set showcmd                             "显示输入的命令
set showmode                            "显示Vim当前的模式
set showmatch                           "高亮配对的括号

