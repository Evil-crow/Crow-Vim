" Leader-Setting {{{
let mapleader=","
let maplocalleader = "\\"
" }}}

" Basic-Setting{{{
" 设置显示行号
set number

" 设置自动缩进的空格数
set shiftround
set shiftwidth=4

" 设置自动卷曲换行
set wrap

" 显示括号匹配,并且设置跳转时间为0.2秒
set showmatch
set matchtime=3
"}}}

"Mapping-Setting{{{
" 在insert模式下可以进行大小写的切换
inoremap <c-u> <esc>VUi
inoremap <leader>s <esc>:wq<enter>

" 很方便的进行vimrc的修改与加载
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" 修改<Esc>的映射,同时禁止<Esc>的映射
inoremap jk <esc>
inoremap <esc> <nop>

" 使用缩写进行博客,Github,邮箱的配置
iabbrev blog (http://evil-crow.github.io)
iabbrev @@ Evilcrow486@gmail.com
iabbrev github (http://www.github.com/evil-crow

" command-mode中q!很烦人
cabbrev q q!
" 强化的H与L
nnoremap H 0
nnoremap L $

" 使用Operator-Pending映射
onoremap in( <c-u>normal! f(vi(<cr>
onoremap il( <c-u>normal! F)vi(<cr>
"}}}

" Autocmd-Setting{{{
" 使用自动命令,进行代码的自动对齐
autocmd BufWritePre *.c :normal gg=G

" 使用自动命令的FilType事件进行定制化

" 关于使用自动命令组
augroup testgroup
  autocmd!
  autocmd BufWrite * :write
  autocmd BufWrite * :echo"Success!\n"
augroup END

" 添加自动折叠
augroup foldgroup
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" 添加自动折叠
augroup foldgroup
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

"Other-Setting{{{
" 设置状态条
set statusline=%f
set statusline+=\ -\
set statusline+=FilType
set statusline+=%y
set statusline+=%=
set statusline+=Current:\ %4l\ Total:\ %4L
"}}}
