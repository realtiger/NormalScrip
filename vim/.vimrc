""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","
" delete line tail space
nmap <leader>l :%s/\s\+$<CR>
" show tab&space
nmap <leader>tt :set list listchars=tab:>-,trail:-<CR>
" 将tab替换为空格
nmap tt :%s/\t/    /g<CR>
" <silent> 静默执行，不显示执行结果
" F9 打开或关闭Tlist
nmap <silent> <F9> <ESC>:Tlist<RETURN>
" shift tab pages
" 查看前一个标签
map <S-Left> :tabp<CR>
" 查看后一个标签
map <S-Right> :tabn<CR>
" map! 則是作用于插入模式及命令列模式。
" 选中全部的文本， 其中gg为跳到行首，V选中整行，G末尾:q
" "+y复制到系统剪贴板(也就是vim的+寄存器)
map <C-A> ggVG$"+y
" 保存文件
map <Esc><Esc> :w<CR>
" 对整篇代码进行排版
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
imap <C-a> <Esc>^
imap <C-e> <Esc>$
set mouse=v
"粘贴格式问题
set pastetoggle=<F4>
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit
"列出当前目录文件  
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"打开树状文件目录  
map <C-F3> \be  
autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax highlight
syntax on
" Highlight current line
set cursorline
"set cursorcolumn
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI
" 不要图形按钮
set go=
" 设置背景主题
"color desert
color ron
"color torte
" 设置字体
"set guifont=Courier_New:h10:cANSI
" 用浅色高亮当前行  
"autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
"Always show current position
set ruler
" 输入的命令显示出来
set showcmd
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界(不建议)
set whichwrap+=<,>,h,l
" Set 4 lines to the curors - when moving vertical..
set scrolloff=4
"状态行显示的内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" 启动显示状态行(1),总是显示状态行(2)
set laststatus=2
" 允许折叠
"set foldenable
" 手动折叠
"set foldmethod=manual
"Get out of VI's compatible mode
set nocompatible
" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
"Auto indent
set autoindent
set cindent
" use space replace tab
set expandtab
" auto indent width
set shiftwidth=4
" tab width
set tabstop=4
" a <Tab> in front of a line inserts blanks according to 'shiftwidth'
set smarttab
"Smart indet
set smartindent
"Show line number
set number
" Sets how many lines of history VIM has to remember
set history=700
"Highlight search things
set hlsearch
"Make search act like search in modern browsers
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 状态行高度
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 不在单词中间折行
set lbr
"换行模块支持亚洲语言
set fo+=mB
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
"指定在选择文本时，光标所在位置也属于被选中的范围。
set selection=inclusive
"在命令模式下使用 Tab 自动补全的时候，将补全内容使用一个漂亮的单行菜单形式显示出来 
set wildmenu
" 当右键单击窗口的时候，弹出快捷菜单
set mousemodel=popup
" Maximum width of text that is being inserted
set textwidth=120
"Wrap lines 自动换行
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" File format
""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict

"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>1 :set syntax=cheetah<cr>
map <leader>2 :set syntax=xhtml<cr>
map <leader>3 :set syntax=python<cr>
map <leader>4 :set ft=javascript<cr>
map <leader>$ :syntax sync fromstart<cr>
"Favorite filetype
set ffs=unix,dos,mac "Default file types
nmap <leader>fd :set ff=dos<cr>
nmap <leader>fu :set ff=unix<cr>

" markdown配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
au BufRead,BufNewFile *.{py}   set syntax=python
" markdown to HTML  
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
nmap fi :!9firefox %.html & <CR><CR>

"syntastic相关
execute pathogen#infect()
let g:syntastic_python_python_exe="python3"
let g:syntastic_python_checkers=['pylint']
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
"golang
"Processing... % (ctrl+c to stop)
let g:fencview_autodetect=0
set rtp+=$GOROOT/misc/vim
set iskeyword+=.
"internationalization
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.cpp,.sh,.java,.rb,.py文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
    ""定义函数SetTitle，自动插入文件头 
    func SetTitle() 
        "如果文件类型为.sh文件 
        if &filetype == 'sh'
            call setline(1,"\#########################################################################") 
            call append(line("."), "\# File Name: ".expand("%")) 
            call append(line(".")+1, "\# Author: Virtue") 
            call append(line(".")+2, "\# mail: cos1eqlg10@126.com") 
            call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
            call append(line(".")+4, "\#########################################################################") 
            call append(line(".")+5, "\#!/bin/bash") 
            call append(line(".")+6, "") 
        elseif &filetype == 'python'
            call setline(1,"\#!/usr/bin/env python")
            call append(line("."), "'''")
            call append(line(".")+1, "File Name: ".expand("%")) 
            call append(line(".")+2, "Author: Virtue") 
            call append(line(".")+3, "mail: cos1eqlg10@126.com") 
            call append(line(".")+4, "Created Time: ".strftime("%c")) 
            call append(line(".")+5, "'''") 
            call append(line(".")+6, "")
        elseif &filetype == 'ruby'
            call setline(1,"#!/usr/bin/env ruby")
            call append(line("."),"# encoding: utf-8")
            call append(line(".")+1, "")
    "    elseif &filetype == 'mkd'
    "        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
        else 
            call setline(1, "/*************************************************************************") 
            call append(line("."), "	> File Name: ".expand("%")) 
            call append(line(".")+1, "	> Author: Virtue") 
            call append(line(".")+2, "	> Mail: cos1eqlg10@126.com") 
            call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
            call append(line(".")+4, " ************************************************************************/") 
            call append(line(".")+5, "")
        endif
        if expand("%:e") == 'cpp'
            call append(line(".")+6, "#include<iostream>")
            call append(line(".")+7, "using namespace std;")
            call append(line(".")+8, "")
        endif
        if &filetype == 'c'
            call append(line(".")+6, "#include<stdio.h>")
            call append(line(".")+7, "")
        endif
        if expand("%:e") == 'h'
            call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
            call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
            call append(line(".")+8, "#endif")
        endif
        if &filetype == 'java'
            call append(line(".")+6,"public class ".expand("%:r"))
            call append(line(".")+7,"")
        endif
    endfunc
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G

"C,C++,java,python,html,go,md 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -std=c++11 -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		"exec "!time python2.7 %"
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -std=c++11 -g -o %<"
	exec "!gdb ./%<"
endfunc


"代码格式优化
map <F6> :call FormartSrc()<CR><CR>

"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif
"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu  
"自动保存
set autowrite
" 设置魔术，可以使用正则表达式
set magic
" 隐藏工具栏
set guioptions-=T
" 隐藏菜单栏
set guioptions-=m
" 去掉输入错误的提示声音
set noerrorbells
set novisualbell
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 禁止生成临时文件
set nobackup
set noswapfile
" 搜索忽略大小写
set ignorecase
set smartcase
" 行间距
set linespace=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按照名称排序  
let Tlist_Sort_Type = "name"
" 在右侧显示窗口  
let Tlist_Use_Right_Window = 1
" 压缩方式
let Tlist_Compart_Format = 1
" 如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_Exist_OnlyWindow = 1
" 不要关闭其他文件的tags
let Tlist_File_Fold_Auto_Close = 1
" 不要显示折叠树
"let Tlist_Enable_Fold_Column = 0
" 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File=1
" 默认打开Taglist
let Tlist_Auto_Open=0
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
" 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
" 设置tags
set tags=tags;
set autochdir

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" Python section
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako
au FileType python inoremap <buffer> re return
au FileType python inoremap <buffer> im import 
au FileType python inoremap <buffer> pr print()<esc>i
au FileType python inoremap <buffer> f! # --- PH ---<esc>FP2xi
au FileType python inoremap <buffer> cla class Cn():<esc>FC2xi
au FileType python inoremap <buffer> def def Dn():<esc>FD2xi

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" JavaScript section
""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent
au FileType javascript imap <c-a> alert();<esc>hi
au FileType javascript inoremap <buffer> re return
au FileType javascript inoremap <buffer> f! //--- PH ---<esc>FP2xi

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"其他东东
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1  

"python补全
let g:pydiction_location = '~/.vim/after/complete-dict'
let g:pydiction_menu_height = 20

autocmd FileType python set omnifunc=pythoncomplete#Complete

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles here:
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'Yggdroot/indentLine'
let g:indentLine_char = '┊'
"ndle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'https://github.com/wincent/command-t.git'
Bundle 'Auto-Pairs'
Bundle 'python-imports.vim'
Bundle 'CaptureClipboard'
Bundle 'ctrlp-modified.vim'
Bundle 'last_edit_marker.vim'
Bundle 'synmark.vim'
"Bundle 'Python-mode-klen'
Bundle 'SQLComplete.vim'
Bundle 'Javascript-OmniCompletion-with-YUI-and-j'
"Bundle 'JavaScript-Indent'
"Bundle 'Better-Javascript-Indentation'
Bundle 'jslint.vim'
Bundle "pangloss/vim-javascript"
Bundle 'Vim-Script-Updater'
Bundle 'ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'jsbeautify'
Bundle 'The-NERD-Commenter'
"django
Bundle 'django_templates.vim'
Bundle 'Django-Projects'

"Bundle 'FredKSchott/CoVim'
"Bundle 'djangojump'
" ...
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
"
"ctrlp设置
"
" MacOSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif
" Windows
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']

let NERDTreeIgnore=['\.pyc']
