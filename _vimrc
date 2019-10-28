set nocompatible
set backspace=indent,eol,start
set textwidth=0

" Cインデント
set cindent

" 自動インデント
set autoindent

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
set listchars=tab:^¥ ,extends:<,trail:-,eol:<

" tab/改行 表示などなど
"set list

augroup dein
	" dein.vim 本体
	let bundledir = $VIM . '/bundles/dein'
	let s:dein_dir = bundledir. '/repos/github.com/Shougo/dein.vim'

	if !isdirectory(bundledir)
		call mkdir(bundledir, 'p')
		execute '!git clone https://github.com/Shougo/dein.vim' bundledir
	endif
	let &runtimepath = bundledir.  ',' .  &runtimepath

	" load dein
	if dein#load_state(s:dein_dir)
		call dein#begin(s:dein_dir)
		call dein#add('Shougo/neosnippet.vim')
		" neobundle の設定
		call dein#add('Shougo/dein.vim')

		" ==================== plugins ===============================
		call dein#add('Shougo/unite.vim') " ファイル操作とか
		call dein#add('Shougo/neocomplete.vim') " 補完
		call dein#add('Shougo/neosnippet.vim') " スニペット
		call dein#add('Shougo/neosnippet-snippets') " スニペット
		call dein#add('itchyny/lightline.vim') " 情報を見やすく
		call dein#add('nathanaelkane/vim-indent-guides') " インデントを色分け
		call dein#add('Townk/vim-autoclose') " カッコを自動で閉じる
		call dein#add('honza/vim-snippets') " スニペット
		call dein#add('ujihisa/neco-look') " 英単語の補完
		call dein#add('nanotech/jellybeans.vim')
		call dein#add('tomtom/tcomment_vim')
		call dein#add('thinca/vim-quickrun')
		call dein#add('slim-template/vim-slim')
		call dein#add('Yggdroot/indentLine')
		call dein#add('vim-scripts/vcscommand.vim')
		call dein#add('vim-scripts/taglist.vim')
		call dein#add('scrooloose/syntastic')
		call dein#add('https://github.com/yatmsu/molokai.git')
		call dein#add('vim-scripts/newspaper.vim')
		call dein#add('tyru/open-browser.vim')
		call dein#add('airblade/vim-gitgutter')
		call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
		" ============================================================
		call dein#end()
		filetype plugin indent on
		call dein#save_state()

	endif

	filetype plugin indent on
	syntax enable


	if has('vim_starting') && dein#check_install()
	  call dein#install()
	endif
augroup END

augroup Temp
	" テンポラリファイル
	set viminfo+=f1

	let vimdir = $VIM
	let tmpdir = vimdir . '/tmpdir'
	if !isdirectory(tmpdir)
		call mkdir(tmpdir, 'p')
	endif
	let bkdir = tmpdir . '/bk'
	if !isdirectory(bkdir)
		call mkdir(bkdir, 'p')
	endif
	set backup
	set backupdir=$VIM/tmpdir/bk

	let undodir = tmpdir . '/undo'
	if !isdirectory(undodir)
		call mkdir(undodir, 'p')
	endif
	set undofile
	set undodir=$VIM/tmpdir/undo
	let swapdir = tmpdir . '/swap'
	if !isdirectory(swapdir)
		call mkdir(swapdir, 'p')
	endif
	set swapfile
	set directory=$VIM/tmpdir/swap
augroup END

"=====================================
" 折りたたみ設定
"=====================================
augroup Folding
	set foldmethod=expr
	"set commentstring=%s
	set foldtext=FoldCCtext()
	set foldcolumn=0
	set fillchars=vert:¥|

	"autocmd BufEnter *.[ch],*.cc set foldmethod=expr foldexpr=CFoldSetting(v:lnum)
	autocmd BufEnter *.[ch],*.cc,*.cpp set foldmethod=expr foldexpr=CFoldSetting(v:lnum)

	function! CFoldSetting(lnum)
		let l:line = getline(a:lnum)
		if l:line =‾ '^#if 0'
			return '>1'
		elseif getline(a:lnum - 1) =‾ '^#else'
			return 0
		elseif getline(a:lnum) =‾ '^#endif'
			return '<1'
		else
			return '='
		endif
	endfunction
augroup END

" USキーボード用設定
augroup Keyboard
	function! HardMode ()
		noremap  <Up>	<Nop>
		noremap  <Down>  <Nop>
		noremap  <Left>  <Nop>
		noremap  <Right> <Nop>
		inoremap <Up>	<Nop>
		inoremap <Down>  <Nop>
		inoremap <Left>  <Nop>
		inoremap <Right> <Nop>
	endfunction

	function! EasyMode ()
		inoremap <Up>	<Up>
		inoremap <Down>  <Down>
		inoremap <Left>  <Left>
		inoremap <Right> <Right>
		nnoremap <Up>	<Up>
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

"=======================================================
" 変数
"=======================================================
let $DT = $HOME . '¥Desktop'
"let $WORK = 'C:;gcwork¥20_SVN¥I1364¥trunk¥27_プログラムソース¥IPTool¥IPTool¥IPTool'
"let $WORK = 'C:¥work¥20_SVN¥GD591_master¥40_実装¥10_ソースコード¥IPTool¥IPTool'
let $WORK='C:¥work¥20_SVN¥GD591_master¥40_実装¥10_ソースコード¥branch¥IPTOOL_PSD_BRANCH¥IPTool'
let $OPENCV='C:¥work¥20_SVN¥GD591_master¥40_実装¥10_ソースコード¥IPTool¥opencv¥sources'
let $WORK='C:¥work¥20_proj¥21_Git¥aisin-pedestrian-detection¥train'

augroup StatusLine
	"=====================================
	" ステータスラインの表示項目
	"=====================================
	" [%n]  :編集ファイル番号
	" [%t]  :ファイル名
	" [%f]  :ファイル名
	" [%F]  :ファイル名(フルパス)
	" [%]	:ファイルの種類
	" [0x%B]:文字コード
	" [%]	:改行コード
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
	" [¥ ]  :スペース
	" [%5(¥ %)¥ ]  :スペース×5
	"set statusline=[%m]%y%{GetStatus()}%F%m%r%=<%c-%l/%L>%5(¥ %)%3p%%
	set laststatus=2

	let g:lightline = {
		¥ 'colorscheme' : 'wombat',
		¥ 'mode_map'	: {'c': 'NORMAL'},
	  	¥ 'separator'	: {'left': "", 'right': ""},
	  	¥ 'subseparator': {'left': "", 'right': ""},
		¥ 'active': {
		¥	'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
		¥ },
		¥ 'component_function': {
		¥	'modified'	 : 'LightlineModified',
		¥	'readonly'	 : 'LightlineReadonly',
		¥	'fugitive'	 : 'LightlineFugitive',
		¥	'filename'	 : 'LightlineFilename',
		¥	'fileformat' : 'LightlineFileformat',
		¥	'filetype'	 : 'LightlineFiletype',
		¥	'fileencoding' : 'LightlineFileencoding',
		¥	'mode'		 : 'LightlineMode'
		¥}
	¥ }

	function! LightlineModified()
	  return &ft =‾ 'help¥|vimfiler¥|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
	endfunction

	function! LightlineReadonly()
	  return &ft !‾? 'help¥|vimfiler¥|gundo' && &readonly ? 'x' : ''
	endfunction

	function! LightlineFilename()
	  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
			¥ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
			¥  &ft == 'unite' ? unite#get_status_string() :
			¥  &ft == 'vimshell' ? vimshell#get_status_string() :
			¥ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
			¥ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
	endfunction

	function! LightlineFugitive()
	  if &ft !‾? 'vimfiler¥|gundo' && exists('*fugitive#head')
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

	" ファイルフォーマット＆文字エンコーディング＆改行コード取得
	function! GetStatus()
		let str = &fileformat . ']'
		if has('multi_byte') && &fileencoding != ''
			let str = &fileencoding . ':' . str
		endif
		let str = '[' . str
		return str
	endfunction
augroup END

"=======================================================
"  key bind
"=======================================================
augroup keybind
	nnoremap Y y$
	nnoremap x "_x
	nnoremap D "_D

	" tagジャンプ設定
	nnoremap <silent> <C-]> g<C-]>
	nnoremap <silent> <C-LeftMouse> g<C-]>

	" ESCでハイライトサーチ解除
	nnoremap <silent> <ESC> :<C-w>nohlsearch<CR><ESC>
	inoremap <silent> <ESC> <ESC>:<C-w>nohlsearch<CR>

	"=======================================================
	"tab設定
	"=======================================================
	nnoremap <silent> tt :<C-w>tabnew<CR>
	nnoremap <silent> tn :<C-w>tabnext<CR>
	nnoremap <silent> tp :<C-w>tabprevious<CR>
	nnoremap <silent> to :<C-w>tabonly<CR>

	"=======================================================
	" short cut
	"=======================================================
	nnoremap <silent> <F2>	:<C-w>IndentGuidesToggle<CR>
	nnoremap <silent> <F4>	:<C-w>:vsplit<CR>
	nnoremap <silent> <F8>	:<C-w>Tlist<CR>
	nnoremap <silent> <F9>	:<C-w>edit .<CR>
	nnoremap <silent> <F10>	:<C-w>edit $VIM<CR>
	nnoremap <silent> <F11>	:<C-w>edit $WORK<CR>
	nnoremap <silent> <F12>	:<C-w>edit $OPENCV<CR>

	" 置換ショートカット
	nnoremap gs :%s;;;gc<left><left><left><left>
	vnoremap gs :s;;;gc<left><left><left><left>

	nnoremap <M-g> :call GrepUnderWord()<CR>

	let g:netrw_nogx = 1 " disable netrw's gx mapping.
	nnoremap gx <Plug>(openbrowser-smart-search)
	vnoremap gx <Plug>(openbrowser-smart-search)

	inoremap <silent> <expr><C-a>  search('^¥s¥s*¥%#', 'bcn') ? "¥<C-o>0" : "¥<C-o>^"
	nnoremap <silent> <C-j> <C-w>j
	nnoremap <silent> <C-h> <C-w>h
	nnoremap <silent> <C-k> <C-w>k
	nnoremap <silent> <C-l> <C-w>s
	nnoremap <silent> <C-Right> <C-w>>
	nnoremap <silent> <C-Left> <C-w><
	nnoremap <silent> <C-Up> <C-w><C-->
	nnoremap <silent> <C-Down> <C-w><C-+>
augroup END


colorscheme jellybeans
execute "set colorcolumn=" . join(range(81, 9999), ',')

" taglist
let Tlist_Show_One_File = 1 "現在編集中のソースのタグしか表示しない
let Tlist_Exit_OnlyWiindow = 1 "taglist が最後のウインドウなら vim を閉じる
"let Tlist_Enable_Fold_Column = 1 " 折り畳み
map <silent> <leader>tl :TlistToggle<CR>

let g:tlist_php_settings = 'php;c:class;d:constant;f:function'

autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | vs | copen | endif
