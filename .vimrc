"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" Shortcut Key Summary
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving
" nmap <leader>w :w!<cr>
" Fast editing of the .vimrc
" map <leader>e :e! ~/.vim_runtime/vimrc<cr>
" set pastetoggle=<F3>
" map <F8> gg=G
" nmap <leader>{ i{<Esc>ea}<Esc>
" nmap <leader>[ i[<Esc>ea]<Esc>
" nmap <leader>( i(<Esc>ea)<Esc>
" delete line tail space
" nmap <leader>l :%s/\s\+$<CR>
" redraw tab
" nmap TS :%retab!<CR>
" show tab&space
" nmap <leader>T :set list listchars=tab:>-,trail:-<CR>
" Some nice mapping to switch syntax (useful if one mixes different languages in one file)
" map <leader>1 :set syntax=cheetah<cr>
" map <leader>2 :set syntax=xhtml<cr>
" map <leader>3 :set syntax=python<cr>
" map <leader>4 :set ft=javascript<cr>
" map <leader>$ :syntax sync fromstart<cr>
" Fileformat
" nmap <leader>fd :se ff=dos<cr>
" nmap <leader>fu :se ff=unix<cr>
" In visual mode when you press * or # to search for the current selection
" vnoremap <silent> * :call VisualSearch('f')<CR>
" vnoremap <silent> # :call VisualSearch('b')<CR>
" When you press gv you vimgrep after the selected text
" vnoremap <silent> gv :call VisualSearch('gv')<CR>
" map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
" vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vnoremap $e <esc>`>a"<esc>`<i"<esc>
" Map auto complete of (, ", ', [
" inoremap $1 ()<esc>i
" inoremap $2 []<esc>i
" inoremap $3 {}<esc>i
" inoremap $4 {<esc>o}<esc>O
" inoremap $q ''<esc>i
" inoremap $e ""<esc>i
" inoremap $t <><esc>i 
" au FileType python inoremap <buffer> $r return
" au FileType python inoremap <buffer> $i import
" au FileType python inoremap <buffer> $p print()<esc>i
" au FileType python inoremap <buffer> $f #--- PH ---<esc>FP2xi
" au FileType python inoremap <buffer> $c class Cn():<esc>FC2xi
" au FileType python inoremap <buffer> $d def Dn():<esc>FD2xi
" au FileType python map <buffer> <leader>1 /class
" au FileType python map <buffer> <leader>2 /def
" au FileType python map <buffer> <leader>C ?class
" au FileType python map <buffer> <leader>D ?def
" au FileType javascript imap <c-a> alert();<esc>hi
" au FileType javascript inoremap <buffer> $r return
" au FileType javascript inoremap <buffer> $f //--- PH ---<esc>FP2xi

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" Key Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","
" Fast saving
nmap <leader>w :w!<cr>
" Fast editing of the .vimrc
map <leader>e :e! ~/.vim_runtime/vimrc<cr>
set pastetoggle=<F3>
map <F8> gg=G
nmap <leader>{ i{<Esc>ea}<Esc>
nmap <leader>[ i[<Esc>ea]<Esc>
nmap <leader>( i(<Esc>ea)<Esc>
" delete line tail space
nmap <leader>l :%s/\s\+$<CR>
" redraw tab
nmap TS :%retab!<CR>
" show tab&space
nmap <leader>T :set list listchars=tab:>-,trail:-<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode
set nocompatible
" Sets how many lines of history VIM has to remember
set history=700
" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on
" Set to auto read when a file is changed from the outside
set autoread
" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc
set showcmd
set showmode
set t_ti= t_te=

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax highlight
syntax on
"internationalization
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
" Language Setting
set helplang=cn
set langmenu=zh_CN.UTF-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" Fileformat
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>1 :set syntax=cheetah<cr>
map <leader>2 :set syntax=xhtml<cr>
map <leader>3 :set syntax=python<cr>
map <leader>4 :set ft=javascript<cr>
map <leader>$ :syntax sync fromstart<cr>
"Favorite filetype
set ffs=unix,dos,mac "Default file types
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight current
set cursorline
" Set 7 lines to the curors - when moving vertical..
set scrolloff=7
"Turn on WiLd menu
set wildmenu
"Always show current position
set ruler
" Set backspace config
set backspace=eol,start,indent
"Ignore case when searching
set ignorecase
set smartcase
"Highlight search things
set hlsearch
"Make search act like search in modern browsers
set incsearch
"Set magic on, for regular expressions
set magic
"Show matching bracets when text indicator is over them
set showmatch
"How many tenths of a second to blink
set matchtime=2
" No sound on errors
set noerrorbells
set novisualbell
" allow fold
set foldenable
" fold method
set foldmethod=manual

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
" set noswapfile
set noundofile

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use space replace tab
set expandtab
" auto indent width
set shiftwidth=4
" tab width
set tabstop=4
" a <Tab> in front of a line inserts blanks according to 'shiftwidth'
set smarttab
" set different tab mode base file type
" autocmd FileType * set tabstop=4|set shiftwidth=4|set softtabstop=4|set noexpandtab
" autocmd FileType python set tabstop=4|set shiftwidth=4|set softtabstop=4|set expandtab
" wrap long lines at a character in 'breakat'
set linebreak
" Maximum width of text that is being inserted
set textwidth=500
"Auto indent
set autoindent
set cindent
"Smart indet
set smartindent
"Wrap lines
set wrap
"Show line number
set number
"code complete
set completeopt=preview,menu

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" Visual mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>
" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" Python section
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako
au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print()<esc>i
au FileType python inoremap <buffer> $f #--- PH ---<esc>FP2xi
au FileType python inoremap <buffer> $c class Cn():<esc>FC2xi
au FileType python inoremap <buffer> $d def Dn():<esc>FD2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" JavaScript section
""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent
au FileType javascript imap <c-a> alert();<esc>hi
au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ---<esc>FP2xi

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" Function
""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '///.*$^~[]')
    let l:pattern = substitute(l:pattern, "/n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" New file title
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"create file type is .c,.h,.sh,.java,.py,title will auto fill
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
""Function SetTitle，auto insert title
    func SetTitle()
        "filetype is .sh
        if &filetype == 'sh' 
            call setline(1,"\#########################################################################") 
            call append(line("."), "\# File Name: ".expand("%")) 
            call append(line(".")+1, "\# Author: Changde") 
            call append(line(".")+2, "\# mail: changde@ganchangde.com") 
            call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
            call append(line(".")+4, "\#########################################################################") 
            call append(line(".")+5, "\#!/bin/bash") 
            call append(line(".")+6, "") 
        elseif &filetype == 'python' 
            call setline(1,"'''") 
            call append(line("."), "File Name: ".expand("%")) 
            call append(line(".")+1, "Author: Changde") 
            call append(line(".")+2, "mail:changde@ganchangde.com") 
            call append(line(".")+3, "Created Time: ".strftime("%c")) 
            call append(line(".")+4, "'''") 
            call append(line(".")+5, "\#!/usr/bin/env python") 
            call append(line(".")+6, "") 
        else 
            call setline(1, "/*************************************************************************") 
            call append(line("."), "    > File Name: ".expand("%")) 
            call append(line(".")+1, "    > Author: Changde") 
            call append(line(".")+2, "    > Mail: changde@ganchangde.com ") 
            call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
            call append(line(".")+4, " ************************************************************************/") 
            call append(line(".")+5, "")
        endif
        if &filetype == 'cpp'
            call append(line(".")+6, "#include<iostream>")
            call append(line(".")+7, "using namespace std;")
            call append(line(".")+8, "")
        endif
        if &filetype == 'c'
            call append(line(".")+6, "#include<stdio.h>")
            call append(line(".")+7, "")
        endif
    endfunc
    "fill finish, cursor goto end
    autocmd BufNewFile * normal G
