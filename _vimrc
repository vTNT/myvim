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
Bundle 'vim-scripts/winmanager'

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

" ======= 引号 && 括号自动匹配 ======= "
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap ` ``<ESC>i

function ClosePair(char) 
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf


" code template
autocmd BufNewFile *.py 0r ~/.vim/mode/mode.py
autocmd BufNewFile *.php 0r ~/.vim/mode/mode.php

" MiniBufExplorer     多个文件切换 可使用鼠标双击相应文件名进行切换
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
" :AuthorInfoDetect   自动添加作者、时间等信息，本质是NERD_commenter && authorinfo的结合
let g:vimrc_author='vtnt'
let g:vimrc_email='vbb625@gmail.com'
let g:vimrc_homepage='http://tntdba.blog.51cto.com/'

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

"winManager  文件浏览
let g:winManagerWidth = 30 "设置WinManager宽度, 默认25
 "let g:winManagerWindowLayout='FileExplorer|TagList'
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='FileExplorer|BufExplorer'
nmap <silent> <F8> :WMToggle<cr>
"    "进入vim 自动打开 WinManager
let g:AutoOpenWinManager = 1

