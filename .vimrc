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
"***************************************General Settings************************************************************

let mapleader = ","               "set up the mapleader
filetype on                       "detect the different filetype
filetype plugin on                "auto loading the ftplugin by filetype
filetype indent on                "auto loading the indent by filetype
syntax enable                     "open the default code highlight
syntax on                         "open the syntax switch
set showtabline=2                 "always show the tab 

set t_Co=256                      "provide 256 colors support for some colorscheme
set noerrorbells                  "Let Vim do not DiDiDi anymore
set novisualbell                  "Let vim be quiet in visual mode
set history=500                   "set Vim's history 500
set autoread                      "autoread when the file has been modified
set shortmess=atI                 "do not display the Uganda message
set textwidth=200                 "let the linewidth is 200
"set mouse=a                      let the mouse can be use in GUI:help
"set title                        display the title in GUI


"***************************************Display Settings***********************************************************

set number                        "set line number
set numberwidth=4                 "set the line numberwidth=4
set cursorcolumn                  "highlight the current column
set cursorline                    "highlight the current line 
set encoding=utf-8                "set the encoding UTF-8
set expandtab                     "use <space> to replace <tab> It's very useful for filetype=asm
set nowrap                        "prohibit wrap the line
set shiftround
set shiftwidth=4                 "default shift indent=4
set smarttab                     "let tabwidth = shiftwidth
set showcmd                      "display the command you're typing
set showmode                     "display the Vim-mode currently
set showmatch                    "highlight the brackets 
set matchtime=3                  "set the jump time is 0.3


"***************************************Mapping-Setting***********************************************************

" use <leader>s to save you file,quit you file when you in insert-mode
inoremap <leader>wq <esc>:wq<cr>
inoremap <leader>q  <esc>:q<cr>
inoremap <leader>w  <esc>:w<cr>

" change and loading the vimrc conviently
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" use <j-k> replace <esc> in insert-mode
inoremap jk <esc>

" use abbrevation to set your blog,e-mail and (http://www.github.com/evil-crow when your insert text
iabbrev blog (http://evil-crow.github.io)
iabbrev @@ Evilcrow486@gmail.com
iabbrev github (http://www.github.com/evil-crow

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
nnoremap <s-tab> V<
vnoremap <tab> >
vnoremap <s-tab> <

" use <leader>+number to switch you tab 
inoremap <leader>n   <esc>:tabn<cr>
inoremap <leader>p   <esc>:tabp<cr>
inoremap <leader>new <esc>:tabnew<cr>
nnoremap <leader>n   :tabn<cr>
nnoremap <leader>p   :tabp<cr>
nnoremap <leader>new :tabnew<cr>

"***************************************Indent Setting***********************************************************

set foldmethod=indent
