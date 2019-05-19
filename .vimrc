" テンポラリファイル
let vimdir = $HOME . '/.vim'
let tmpdir = vimdir . '/tmpdir'
if !isdirectory(tmpdir)
    call mkdir(tmpdir, 'p')
    call mkdir(tmpdir . '/bk', 'p')
    call mkdir(tmpdir . '/undo', 'p')
    call mkdir(tmpdir . '/swap', 'p')
endif
" for NeoBundle 
let bundledir = $HOME . '/.vim/bundle'
if !isdirectory(bundledir)
    call mkdir(bundledir, 'p')
	execute '!git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim'
endif

"--------------------------------------------------------------------------
" neobundle
"--------------------------------------------------------------------------
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

"from GitHub
NeoBundle 'lighttiger2505/gtags.vim'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle "Shougo/vimproc", {
        \ "build": {
        \   "windows"   : "make -f make_mingw32.mak",
        \   "cygwin"    : "make -f make_cygwin.mak",
        \   "mac"       : "make -f make_mac.mak",
        \   "unix"      : "make -f make_unix.mak",
        \ }}
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'honza/vim-snippets'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'vim-scripts/vcscommand.vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'https://github.com/yatmsu/molokai.git'
NeoBundle 'vim-scripts/newspaper.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Shougo/vimshell'
" from ai github
NeoBundle 'git@160.203.82.105:haishi/GrepUnderCursor.vim.git'

NeoBundleCheck

call neobundle#end()
"--------------------------------------------------------------------------
set hlsearch
set ignorecase
set smartcase
set incsearch
set tabstop=4
set nowrapscan
set hlsearch
set incsearch
set path+=../**/*,../../**/*,../../../**/*,../../../../**/*
set tags+=tags;
set iminsert=0
autocmd InsertEnter * set iminsert=0
set imsearch=1
set nocompatible
set whichwrap=b,s,h,l,<,>,[,],~
set backspace=indent,eol,start
set textwidth=0
set tw=0
set number

set runtimepath+=$HOME/.vim
set runtimepath+=$HOME/.vim/vim74

" マウスの設定
set mouse=a
set ttymouse=xterm2
set clipboard=unnamed,autoselect

" Cインデント
set cindent

set wildignorecase
"set wildmode=list:full

" 自動インデント
set autoindent

set backup
set undofile
set swapfile
set viminfo+=f1
set backupdir=~/.vim/tmpdir
set directory=~/.vim/tmpdir
set undodir=$HOME/.vim/tmpdir
set ambiwidth=double
set noerrorbells

set visualbell

" 補完をTabで行う
set wildchar=<TAB>

set wildmenu

set wildmode=list:longest,full

set magic

" 括弧入力時の対応する括弧を表示
set showmatch

" 今使っているモードを表示する
set showmode

" 入力中のコマンドをステータスに表示する
set showcmd

" 貼付け時
"set paste

" ノーマルモード時に自動でペーストモードを解除する
autocmd InsertLeave * set nopaste

" tab文字設定
set listchars=tab:^\ ,extends:<,trail:-,eol:<

" tagジャンプ設定
nnoremap <silent> <C-]> g<C-]>
nnoremap <silent> <C-LeftMouse> g<C-]>

nnoremap <silent>cd	:<C-u>lcd %:h<CR>

" tab/改行 表示などなど
"set list

"=====================================
" 折りたたみ設定
"=====================================
set foldmethod=expr
"set commentstring=%s
set foldtext=FoldCCtext()
set foldcolumn=0
set fillchars=vert:\|

"autocmd BufEnter *.[ch],*.cc set foldmethod=expr foldexpr=CFoldSetting(v:lnum)
autocmd BufEnter *.[ch],*.cc,*.cpp set foldmethod=expr foldexpr=CFoldSetting(v:lnum)

" ファイルフォーマット＆文字エンコーディング＆改行コード取得
function! GetStatus()
	let str = &fileformat . ']'
	if has('multi_byte') && &fileencoding != ''
		let str = &fileencoding . ':' . str
	endif
	let str = '[' . str
	return str
endfunction

function! CFoldSetting(lnum)
	let l:line = getline(a:lnum)
	if l:line =~ '^#if 0'
		return '>1'
	elseif getline(a:lnum - 1) =~ '^#else'
		return 0
	elseif getline(a:lnum) =~ '^#endif'
		return '<1'
	else
		return '='
	endif
endfunction

" USキーボード用設定
augroup Keyboard
	function! HardMode ()
		noremap  <Up>    <Nop>
		noremap  <Down>  <Nop>
		noremap  <Left>  <Nop>
		noremap  <Right> <Nop>
		inoremap <Up>    <Nop>
		inoremap <Down>  <Nop>
		inoremap <Left>  <Nop>
		inoremap <Right> <Nop>
	endfunction

	function! EasyMode ()
		inoremap <Up>    <Up>
		inoremap <Down>  <Down>
		inoremap <Left>  <Left>
		inoremap <Right> <Right>
		nnoremap <Up>    <Up>
		nnoremap <Down>  <Down>
		nnoremap <Left>  <Left>
		nnoremap <Right> <Right>
	endfunction

	function! USKeyboard()
		" ' と : を入れ替え
		nnoremap ' :
		nnoremap : '
	endfunction

	function! JPKeyboard()
		" ' と : を入れ替え
		nnoremap ' '
		nnoremap : :
	endfunction

	command! HardMode call HardMode()
	command! EasyMode call EasyMode()
	command! UseUSKeyboard call USKeyboard()
	command! UseJPKeyboard call JPKeyboard()
augroup END

" デフォルトはhardモード(*´∀｀*)
":HardMode
:EasyMode
:UseUSKeyboard

" ------------------ lightline ---------------------------
augroup StatusLine
	"=====================================
	" ステータスラインの表示項目
	"=====================================
	" [%n]  :編集ファイル番号
	" [%t]  :ファイル名
	" [%f]  :ファイル名
	" [%F]  :ファイル名(フルパス)
	" [%]   :ファイルの種類
	" [0x%B]:文字コード
	" [%]   :改行コード
	" [%c]  :カラム
	" [%V]  :カラム(空行のとき"-1"を表示)
	" [%l]  :行番号
	" [%p]  :行位置(百分率)
	" [%3p] :行位置(3桁固定百分率)
	" [%P]  :行位置(先頭:Top,途中:百分率(%),末尾:Bot,全表示:All)
	" [%m]  :修正マーク([+])
	" [%%]  :"%"
	" [%=]  :右寄せ
	" [%<]  :???
	" [%r]  :???
	" [%h]  :???
	" [%w]  :???
	" [\ ]  :スペース
	" [%5(\ %)\ ]  :スペース×5
	"set statusline=[%m]%y%{GetStatus()}%F%m%r%=<%c-%l/%L>%5(\ %)%3p%%
	set laststatus=2

"		\ 'separator'   : {'left': '<U+2B80>', 'right': '<U+2B82>'},
"		\ 'subseparator': {'left': '<U+2B81>', 'right': '<U+2B83>'},

	let g:lightline = {
		\ 'colorscheme' : 'wombat',
		\ 'mode_map'    : {'c': 'NORMAL'},
		\ 'separator'   : {'left': '', 'right': ''},
		\ 'subseparator': {'left': '', 'right': ''},
		\ 'active': {
		\ 	'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
		\ },
						\ 'component_function': {
		\ 	'modified'     : 'LightlineModified',
		\ 	'readonly'     : 'LightlineReadonly',
		\ 	'fugitive'     : 'LightlineFugitive',
		\ 	'filename'     : 'LightlineFilename',
		\ 	'fileformat'   : 'LightlineFileformat',
		\ 	'filetype'     : 'LightlineFiletype',
		\ 	'fileencoding' : 'LightlineFileencoding',
		\ 	'mode'         : 'LightlineMode'
		\}
	\ }

	function! LightlineModified()
	  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
	endfunction

	function! LightlineReadonly()
	  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
	endfunction

	function! LightlineFilename()
	  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
	        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
	        \  &ft == 'unite' ? unite#get_status_string() :
	        \  &ft == 'vimshell' ? vimshell#get_status_string() :
	        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
	        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
	endfunction

	function! LightlineFugitive()
	  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
	    return fugitive#head()
	  else
	    return ''
	  endif
	endfunction

	function! LightlineFileformat()
	  return winwidth(0) > 70 ? &fileformat : ''
	endfunction

	function! LightlineFiletype()
	  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
	endfunction

	function! LightlineFileencoding()
	  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
	endfunction

	function! LightlineMode()
	  return winwidth(0) > 60 ? lightline#mode() : ''
	endfunction
augroup END

colorscheme jellybeans

nnoremap Ug :<C-u>GrepWordUnderCursor<CR>

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" vim起動時にneocomplcacheを起動するか 1:有効 2:無効(初期値)
let g:NeoComplCache_EnableAtStartup = 1
" 入力に大文字が含まれている場合は、大文字・小文字を無視しない 1:有効 2:無効(初期値)
let g:NeoComplCache_SmartCase = 1
" ポップアップメニューで表示される候補の数
let g:NeoComplCache_MaxList = 50
" 単語の出現頻度だけではなく、前の単語とのつながりも考慮して候補の並び替えを行うかどうか 1:有効(初期値) 0:無効
let g:NeoComplCache_PreviousKeywordCompletion = 1
" プレビューウインドウが開いているとき、追加情報を表示するかどうか 1:有効 0:無効
let g:NeoComplCache_EnableInfo = 1
" 大文字を入力したときに、それを単語の区切りとしてあいまい検索を行うかどうか 1:有効 0:無効(初期値)
let g:NeoComplCache_EnableCamelCaseCompletion = 1
" _を入力したときに、それを単語の区切りとしてあいまい検索を行うかどうか 1:有効 0:無効(初期値)
let g:NeoComplCache_EnableUnderbarCompletion = 1
" 補完の対象となるキーワードの最小長さ
let g:NeoComplCache_MinSyntaxLength = 3
" 自動補完を中止するための連続入力時間 初期値0.0
let g:NeoComplCache_SkipInputTime = '0.2'
" 手動補完時に補完を行う入力数
let g:NeoComplCache_ManualCompletionStartLength = 0
" 補完するためのキーワードパターンを記録する(まだよくわかってない)
if !exists('g:NeoComplCache_KeywordPatterns')
    let g:NeoComplCache_KeywordPatterns = {}
endif
let g:NeoComplCache_KeywordPatterns['default'] = '\v\h\w*'
" ユーザが定義したスニペット補完ファイルのパス
let g:NeoComplCache_SnippetsDir = $HOME.'/snippets'

" Unite
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | vs | copen | endif
nnoremap [unite] <Nop>
nmap U [unite]
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]r :<C-u>Unite register<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
nnoremap <silent> [unite]w :<C-u>Unite window<CR>
let s:hooks = neobundle#get_hooks("unite.vim")
function! s:hooks.on_source(bundle)
	" start unite in insert mode
	let g:unite_enable_start_insert = 1

	" use vimfiler to open directory
	call unite#custom_default_action("source/bookmark/directory", "vimfiler")
	call unite#custom_default_action("directory", "vimfiler")
	call unite#custom_default_action("directory_mru", "vimfiler")

	autocmd MyAutoCmd FileType unite call s:unite_settings()
	function! s:unite_settings()
		imap <buffer> <Esc><Esc> <Plug>(unite_exit)
		nmap <buffer> <Esc> <Plug>(unite_exit)
		nmap <buffer> <C-n> <Plug>(unite_select_next_line)
		nmap <buffer> <C-p> <Plug>(unite_select_previous_line)
	endfunction
endfunction

" vimprocで非同期実行
" 成功時にバッファ、失敗時にQuickFixで表示
" 結果表示のサイズ調整など
let g:quickrun_config = {
    \ '_' : {
        \ 'runner' : 'vimproc',
        \ 'runner/vimproc/updatetime' : 40,
        \ 'outputter' : 'error',
        \ 'outputter/error/success' : 'buffer',
        \ 'outputter/error/error'   : 'quickfix',
        \ 'outputter/buffer/split' : ':botright 8sp',
    \ }
\}

" 実行時に前回の表示内容をクローズ&保存してから実行
let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
