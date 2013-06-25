set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" My Bundles here:
"
" original repos on github
Bundle 'kevinw/pyflakes-vim'
Bundle 'vim-scripts/grep.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'sorah/puppet.vim'
Bundle 'vim-scripts/minibufexplorerpp'
Bundle 'vim-scripts/AuthorInfo'
Bundle 'vim-scripts/Pydiction'
Bundle 'jiangmiao/auto-pairs'
Bundle 'scrooloose/nerdtree'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on " required!
"
" Brief help
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" STEP: git submodule init; git submodule update

" 设置Vim字符集【enc】
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 解决consle输出乱码
language messages zh_CN.utf-8

" mouse=a 启动所有模式，会屏蔽鼠标的右键功能；
" mouse=v 让Vim在可视化模式下也可以使用右键粘贴
""set mouse=a
" 显示行号【nu】
set number
" 显示光标所在列号【ru】
set ruler
" 高亮当前行【cul】
set cursorline
" 自动缩进
set ai        
" 智能缩进
set si
" tab转化为4个字符
set expandtab
set smarttab
" 设置缩进为4 个空格【sw】
set shiftwidth=4
" 设置制表符为4 个空格【ts
set tabstop=4
" 状态栏
set laststatus=2      " 总是显示状态栏
" 启用语法高亮【syn】
syntax enable
syntax on
"filetype plugin on
filetype plugin indent on
"colorscheme ron " 着色模式：黑色背景
"colorscheme evening
colorscheme desert
set completeopt=longest,menu

" code template
autocmd BufNewFile *.py 0r ~/.vim/mode/mode.py
autocmd BufNewFile *.php 0r ~/.vim/mode/mode.php
autocmd BufNewFile *.sh 0r ~/.vim/mode/mode.sh

" MiniBufExplorer     多个文件切换 可使用鼠标双击相应文件名进行切换
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1

" 设置TList
"让窗口显示在左边
let Tlist_Use_LEFT_Window=1
"非当前文件，函数列表折叠隐藏
let Tlist_File_Fold_Auto_Close=1
"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File=1
let Tlist_GainFocus_On_ToggleOpen=1
"当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Exit_OnlyWindow=1
"let Tlist_Auto_Open=1 "启动vim 自动打开TagList
let Tlist_Show_Menu=1 "显示taglist菜单
let Tlist_WinWidth = 25  "taglist窗口宽度
map <F3> :silent! Tlist<CR>
"let g:winManagerWindowLayout=’FileExplorer’
"nmap tl :Tlist<cr>

"vim 自动补全 Python代码
"autocmd FileType python set complete+=k~/.vim/tools/pydictionplugin on
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'"defalut g:pydiction_menu_height == 15"
let g:pydiction_menu_height = 20
autocmd FileType python setlocal et | setlocal sta | setlocal sw=4

"快速浏览和操作Buffer -- 插件: MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1

" ##### nerdtree.vim #####
" nnoremap <Leader>fl :NERDTreeToggle<CR>
" nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <F4> :NERDTree<CR>
let NERDTreeWinSize = 25
let NERDTreeWinPos = "right"
let NERDChristmasTree=1
let NERDTreeShowHidden=1 

"进行版权声明的设置
"添加或更新头
map <F5> :call TitleDet()<cr>'s
function AddTitle()
    call append(2,"# Filename: ".expand("%:t"))
    call append(3,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(4,"# Author: vTNT")
    call append(5,"# Email : vbb625@gmail.com")
    call append(6,"# Description: ")
    call append(7,"")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
"更新最近修改时间和文件名
function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction
