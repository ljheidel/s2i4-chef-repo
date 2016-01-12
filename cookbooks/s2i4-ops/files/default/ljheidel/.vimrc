set nu
set laststatus=2
set statusline+=%F\ %l\:%c
set tabstop=2
set shiftwidth=2
set expandtab
" F5 is a shortcut for inserting a timestamp
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>
" F6 is a shortcut for turning on spell checking
nnoremap <F6> :setlocal spell! spelllang=en_us<CR>
