""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show number
set nu
" 不要图形按钮
set go=
"color asmanian2     " 设置背景主题
"set guifont=Courier_New:h10:cANSI   " 设置字体
"语法高亮
syntax on

"autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul

" 显示标尺
set ruler
" 突出显示当前行
set cursorline
" 输入的命令显示出来，看的清楚些
set showcmd
" 光标移动到buffer的顶部和底部时保持7行距离
set scrolloff=7

"set statusline=
"set laststatus=1
"允许折叠
set foldenable
" 手动折叠
set foldmethod=manual

" 显示中文帮助
set helplang=cn
set encoding=utf-8

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

set t_ti= t_te=
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
    func SetTitle()
        "如果文件类型为.sh文件
        if &filetype == 'sh' 
            call setline(1,"\#########################################################################") 
            call append(line("."), "\# File Name: ".expand("%")) 
            call append(line(".")+1, "\# Author: Viktor") 
            call append(line(".")+2, "\# mail: viktor@ganchangde.com") 
            call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
            call append(line(".")+4, "\#########################################################################") 
            call append(line(".")+5, "\#!/bin/bash") 
            call append(line(".")+6, "") 
        elseif &filetype == 'python' 
            call setline(1,"'''") 
            call append(line("."), "File Name: ".expand("%")) 
            call append(line(".")+1, "Author: Viktor") 
            call append(line(".")+2, "\# mail:viktor@ganchangde.com") 
            call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
            call append(line(".")+4, "'''") 
            call append(line(".")+5, "\#!/usr/bin/env python") 
            call append(line(".")+6, "") 
        else 
            call setline(1, "/*************************************************************************") 
            call append(line("."), "    > File Name: ".expand("%")) 
            call append(line(".")+1, "    > Author: Viktor") 
            call append(line(".")+2, "    > Mail: viktor@ganchangde.com ") 
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自定义前缀键
let mapleader=","
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
imap ； ;
imap ： :
imap “ "
imap ” "
imap ‘ '
imap ’ '
imap ？ ?
imap ！ !
imap 》 >
imap 《 <
imap 、 /
imap ￥ $
imap 》 >
imap 《 <
map ： :

func! Replace_Chn( )                      " for writing latex
    let chinese={ "（" : "( " , "）" : ") " , "，" : ",", "；" : ";", "：": ":","？" : "?", "！" : "!", "“" : "\"", "’" : "'" ,""”" : "\"", "℃" : "\\\\textcelsius", "μ" : "$\\\\mu$"} 
    for i in keys( chinese)
        silent! exec '%substitute/' . i . '/'. chinese[ i]  . '/g'
     endfor
endfunc
nnoremap <leader>sch :call Replace_Chn( ) <cr>

