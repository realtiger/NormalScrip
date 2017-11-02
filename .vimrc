"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" Base Config  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible
"Sets how many lines of history VIM har to remember
set history=1000

"Enable filetype plugin
filetype on
if has("eval") && v:version>=600
    filetype plugin on
    filetype indent on
endif

"Set to auto read when a file is changed from the outside
if exists("&autoread")
    set autoread
endif

"internationalization
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

"Favorite filetype
set ffs=unix,dos,mac

set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show number
set number
" 不要图形按钮
set go=
"Enable syntax highlight
syntax on
" 显示标尺
set ruler
" Highlight current line
set cursorline
" 输入的命令显示出来，看的清楚些
set showcmd
" 左下角显示当前Vim模式
set showmode
" 光标移动到buffer的顶部和底部时保持7行距离
set scrolloff=7
"允许折叠
set foldenable
" 手动折叠
set foldmethod=manual
" Language Setting
set helplang=cn
set langmenu=zh_CN.UTF-8
" 设置退出Vim之后内容显示在终端屏幕，可以用于查看和复制
set t_ti= t_te=
" 自动缩进
set autoindent
set cindent
" 只对特定文件设定tab类型
autocmd FileType * set tabstop=4|set shiftwidth=4|set softtabstop=4|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set softtabstop=4|set expandtab
" Tab键的宽度
" set tabstop=4
" 统一缩进为4
" set softtabstop=4
" set shiftwidth=4
" 用空格代替制表符
"set expandtab
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 搜索忽略大小写
set ignorecase
set smartcase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"代码补全
set completeopt=preview,menu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自定义前缀键
let mapleader=","
" f3 粘贴模式切换
" f8 自动排版
set pastetoggle=<F3>
map <F8> gg=G
nmap <leader>{ i{<Esc>ea}<Esc>
nmap <leader>[ i[<Esc>ea]<Esc>
nmap <leader>( i(<Esc>ea)<Esc>
inoremap <leader>' ''<ESC>i
inoremap <leader>" ""<ESC>i
inoremap <leader>( ()<ESC>i
inoremap <leader>[ []<ESC>i
inoremap <leader>{ {<CR>}<ESC>O
"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc
" delete line tail space
nmap <leader>l :%s/\s\+$<CR>
" 重新定义文件中的tab
nmap TS :%retab!<CR>
" 将tab显示为可见字符
nmap <leader>T :set list listchars=tab:>-,trail:-<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""" 其他命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" 新文件标题
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java,.py文件，自动插入文件头
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
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G

