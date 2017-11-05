nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    " Save the register
    let save_register = @@
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]ly
    else
        return
    endif

    " echom shellescape(@@)
    silent execute "grep -R " . shellescape(@@) . " %"
    copen 7
    let @@ = save_register
endfunction
