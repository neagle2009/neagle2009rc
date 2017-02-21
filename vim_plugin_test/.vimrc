














"                                                     Vim就够了
"
"                                          email  -> huxu@staff.weibo.com
"                                          blog   -> www.ihuxu.com
"                                          github -> github.com/genialx
"                                          weibo  -> weibo.com/ihuxublog













" ====================================
"              说点啥呢？
" ====================================




" 0. 热身（基础）
" 1. 文件在哪里？（模糊文件搜索）
" 2. 代码穿梭机（Ctags 标签跳转）
" 3. 代码只写一遍 (自动补全） 
" 4. 为什么要多个显示器？（多窗口管理）
" 5. 携程在手，想走就走（Vundle插件管家）
" 6. 重要的事情，说三遍（建议）




















" ====================================
"                 热身
" ====================================




" 随时随地，摆脱环境的束缚，你只需要一个终端。
" 你不必在键盘和鼠标之前来回切换（我压根就觉得鼠标是不服务于“编码工作”的产品），所有的操作都在指尖下的按键。
" 高程度的自定义，所以不要来拷贝他人的配置文件，很伤。
" 其他IDE中的功能在Vim里基本能找到替代品，幸福指数飙升~
" 
" 1. 模式 c(ommend) v(isual) i(nsert) x s
" 2. 运动 i(n) a(l) t(ill)
" 3. 动作 c(ut) d(elete) y(paste)
" 4. 缩进 ==
" 5. 宏   q 
" 6. 回溯 earlier
















" ================================
"           文件在哪里？
" ================================




" 递归包含当前路径
" set path+=**

" 野生的菜单
" set wildmenu 

" 1. 模糊查找文件 :find
" 2. 缓存区查找   :b
" 3. 缓存区列表   :ls
" 4. 插件         ControlP

















" ================================
"           代码穿梭机
" ================================




" 1. CTAGS 
" 最先是用来生成C代码的tags文件，后来扩展成可以生成各类语言的tags。
" 它可以帮助程序员很容易地浏览源代码。
"
" 2. ctags -R -f tags --fields=+aimS --languages=PHP /some/absolute/path
"
" 3. ctr+] 跳入
"
" 4. ctr+o 跳出到上一个标签位置
"
" 5. ctr+i 跳入到下一个标签位置
"
" 6. g+]   显示当前符合的所有标签列表














" ================================
"           代码只写一遍
" ================================




" 1. ctr + N 本地补全 （包含当前tags文件和缓存区）
" 2. ctr + x + o Omni 补全（全功能补全）
" 3. ctr + x + ?
























" ================================
"        为什么要多个显示器
" ================================




" 0. 基础       split vsplit               窗口分割
"               :res(ize) +/- N            调整高度
"               :vertical res(ize) +/- N   调整宽度
"               <C-w> H/J/K/L              移动窗口
"               <C-w> h/j/k/l              切换窗口
"
" 1. Winmanager Vim 插件
"               GITHUB: https://github.com/vim-scripts/winmanager
"
" 2. tmux       多终端管理器（🐂X了~）
"               可以：打开多个终端；保留上一次会话。
"               DOC: http://kumu-linux.github.io/blog/2013/08/06/tmux/
"               tmux new -t session-name   打开终端指定会话（session）
"               tmux list-sessions         查看已经有的终端
"               <C-b>                      进入tmux命令模式的口令
"               <C-b>d                     脱离当前会话
"               <C-b>c                     创建tmux窗口
"               <C-b>&                     退出当前窗口
"               <C-b>n/p                   切换tmux窗口
"               <C-b>:split -v/h -p        水平/垂直分屏
"               <C-b>z                     最大化当前窗口






" ================================
"        携程在手，想走就走
" ================================




" 1. Vundle, Vim bundle（捆）的简称，一个管理vim插件的大管家。
"
" 2. Github: https://github.com/VundleVim/Vundle.vim
"
" 3. 配置
"
" 4. 命令
"             :PluginList       - lists configured plugins
"             :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"             :PluginSearch foo - searches for foo; append `!` to refresh local cache
"             :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
















" ================================
"        重要的事情说三遍
" ================================




" 1. 永远不要直接复用其他人的配置
" 2. 尽量多使用help
" 3. 视频 
"        vim+tmux: http://www.tudou.com/programs/view/WqYvxcISogQ
"        tmux: http://www.tudou.com/listplay/eLwVUsV5A-M/3irTcoFS19k.html
" 4. 文章
"        http://www.ihuxu.com/blog/tag/vim/




















" Vundle is short for Vim bundle and is a Vim plugin manager.
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'taglist.vim'
" plugin on GitHub repo
Plugin 'vim-scripts/winmanager'
Plugin 'GenialX/phpcheck'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'
Plugin 'bufexplorer.zip'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'vim-scripts/highlight_current_line.vim'
Plugin 'powerline/powerline'
Plugin 'vim-scripts/togglenumber'
"Plugin 'vim-scripts/phpfolding.vim'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'tpope/vim-commentary'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"解决crontab -e时，提示crontab: temp file must be edited in place
autocmd filetype crontab setlocal nobackup nowritebackup

" fuzy file search
set path+=**
set wildmenu 

" set tags
"set tags+=/Users/GenialX/tags
"set tags+=/usr/local/gcc493/include/c++/4.9.3/tags
""set tags+=/usr/local/php5/include/php/tags
"set tags+=/usr/local/php710/include/php/tags
""set tags+=/usr/local/src/php-src/tags
"set tags+=/usr/include/tags
"set tags+=/Users/GenialX/Documents/Workspace/Open/php-src/tags

nnoremap <Up> :echomsg "use k"<cr>
nnoremap <Down> :echomsg "use j"<cr>
nnoremap <Left> :echomsg "use h"<cr>
nnoremap <Right> :echomsg "use l"<cr>

"ppt
nnoremap ,n <C-d><C-d>
nnoremap ,p <C-u><C-u>

"phpfolding
let g:DisableAutoPHPFolding = 1

" ctrlp
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0

" Config BufExplorer
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.

" tagbar auto open tagbar
let Tlist_Show_One_File=1  
let Tlist_Exit_OnlyWindow=1 
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Sort_Type = 'name'
let Tlist_WinWidth = 26 
autocmd VimEnter * nested :TlistToggle

" winmanager
autocmd VimEnter * nested :WMToggle
let g:winManagerWindowLayout="NERDTree"
let g:NERDTree_title="[NERDTree]"

function! NERDTree_Start()  
	exec 'NERDTree'  
endfunction

function! NERDTree_IsValid()  
	return 1  
endfunction

" search
set incsearch

" powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set guifont=Sauce\ Code\ Powerline:h14.5  
set laststatus=2  
set encoding=utf-8  
set t_Co=256  
set number  
set fillchars+=stl:\ ,stlnc:\  
set term=xterm-256color  
set termencoding=utf-8  
set background=light  


if has("gui_running")
	let s:uname = system("uname")
	if s:uname == "Darwin\n"
		set guifont=Inconsolata\ for\ Powerline:h15
	endif
endif

autocmd FileType php set omnifunc=phpcomplete#CompletePHP 
autocmd FileType java setlocal omnifunc=javacomplete#Complete

set relativenumber "显示行号
set number

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set guifont=Noteworthy 
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  
set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠 
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

map <C-K> :NERDTreeToggle<CR>
map <C-L> :TlistToggle<CR>
map <C-F> :FirstExplorerWindow<cr>
"map <C-B> :BottomExplorerWindow<cr>
map <C-H> :BufExplorer<cr>
"map <C-G> :split<cr>

" folder
map <F5> <Esc>:EnableFastPHPFolds<Cr>
map <F6> <Esc>:EnablePHPFolds<Cr>
map <F7> <Esc>:DisablePHPFolds<Cr>

" tab
:map tt :tabnew .tab_file<cr>
:map tc :tabc<cr>
:map tp :tabpre<cr>
:map tn :tabnext<cr>

" window size 
:map sh :vertical res-2<cr>                                                                                                        
:map sl :vertical res+2<cr>                                                                                                        
:map sj :res-2<cr>                                                                                                                 
:map sk :res+2<cr>  

" automatically append closing characters


inoremap puf public<Space>function<Space>
inoremap pif private<Space>function<Space>
inoremap pusf public<Space>static<Space>function<Space>

inoremap fct function<Space>
inoremap pbl public<Space>
inoremap prv private<Space>

inoremap qq <Esc>

" tab键设置
set tabstop=4
"set softtabstop=4
set expandtab
set shiftwidth=4

set history=1000 "历史记录数
    
        
"
" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Sep 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"	      for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
      syntax on
  endi

  " Switch on search pattern highlighting.
  set hlsearch

  " For Win32 version, have "K" lookup the keyword in a help file
  "if has("win32")
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background
  highlight Normal guibg=grey90
  highlight Cursor guibg=Green guifg=NONE
  highlight lCursor guibg=Cyan guifg=NONE
  highlight NonText guibg=grey80
  highlight Constant gui=NONE guibg=grey95
  highlight Special gui=NONE guibg=grey95

endif
