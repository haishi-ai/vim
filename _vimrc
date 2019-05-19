set nocompatible
set backspace=indent,eol,start
set textwidth=0

" C�C���f���g
set cindent

" �����C���f���g
set autoindent

set ambiwidth=double

set noerrorbells
set visualbell

" �⊮��Tab�ōs��
set wildchar=<TAB>
set wildmenu
set wildmode=list:longest,full

set magic

" ���ʓ��͎��̑Ή����銇�ʂ�\��
set showmatch

" ���g���Ă��郂�[�h��\������
set showmode

" ���͒��̃R�}���h���X�e�[�^�X�ɕ\������
set showcmd

" �\�t����
"set paste

" �m�[�}�����[�h���Ɏ����Ńy�[�X�g���[�h����������
autocmd InsertLeave * set nopaste

" tab�����ݒ�
set listchars=tab:^\ ,extends:<,trail:-,eol:<

" tab/���s �\���ȂǂȂ�
"set list

augroup dein
	" dein.vim �{��
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
		" neobundle �̐ݒ�
		call dein#add('Shougo/dein.vim')

		" ==================== plugins ===============================
		call dein#add('Shougo/unite.vim') " �t�@�C������Ƃ�
		call dein#add('Shougo/neocomplete.vim') " �⊮
		call dein#add('Shougo/neosnippet.vim') " �X�j�y�b�g
		call dein#add('Shougo/neosnippet-snippets') " �X�j�y�b�g
		call dein#add('itchyny/lightline.vim') " �������₷��
		call dein#add('nathanaelkane/vim-indent-guides') " �C���f���g��F����
		call dein#add('Townk/vim-autoclose') " �J�b�R�������ŕ���
		call dein#add('honza/vim-snippets') " �X�j�y�b�g
		call dein#add('ujihisa/neco-look') " �p�P��̕⊮
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
	" �e���|�����t�@�C��
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
" �܂肽���ݐݒ�
"=====================================
augroup Folding
	set foldmethod=expr
	"set commentstring=%s
	set foldtext=FoldCCtext()
	set foldcolumn=0
	set fillchars=vert:\|

	"autocmd BufEnter *.[ch],*.cc set foldmethod=expr foldexpr=CFoldSetting(v:lnum)
	autocmd BufEnter *.[ch],*.cc,*.cpp set foldmethod=expr foldexpr=CFoldSetting(v:lnum)

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
augroup END

" US�L�[�{�[�h�p�ݒ�
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
		" ' �� : �����ւ�
		nnoremap ' :
		nnoremap : '
	endfunction

	function! JPKeyboard()
		" ' �� : �����ւ�
		nnoremap ' '
		nnoremap : :
	endfunction

	command! HardMode call HardMode()
	command! EasyMode call EasyMode()
	command! UseUSKeyboard call USKeyboard()
	command! UseJPKeyboard call JPKeyboard()
augroup END

" �f�t�H���g��hard���[�h(*�L�́M*)
":HardMode
:EasyMode
:UseUSKeyboard

"=======================================================
" �ϐ�
"=======================================================
let $DT = $HOME . '\Desktop'
"let $WORK = 'C:;gcwork\20_SVN\I1364\trunk\27_�v���O�����\�[�X\IPTool\IPTool\IPTool'
"let $WORK = 'C:\work\20_SVN\GD591_master\40_����\10_�\�[�X�R�[�h\IPTool\IPTool'
let $WORK='C:\work\20_SVN\GD591_master\40_����\10_�\�[�X�R�[�h\branch\IPTOOL_PSD_BRANCH\IPTool'
let $OPENCV='C:\work\20_SVN\GD591_master\40_����\10_�\�[�X�R�[�h\IPTool\opencv\sources'
let $WORK='C:\work\20_proj\21_Git\aisin-pedestrian-detection\train'

augroup StatusLine
	"=====================================
	" �X�e�[�^�X���C���̕\������
	"=====================================
	" [%n]  :�ҏW�t�@�C���ԍ�
	" [%t]  :�t�@�C����
	" [%f]  :�t�@�C����
	" [%F]  :�t�@�C����(�t���p�X)
	" [%]	:�t�@�C���̎��
	" [0x%B]:�����R�[�h
	" [%]	:���s�R�[�h
	" [%c]  :�J����
	" [%V]  :�J����(��s�̂Ƃ�"-1"��\��)
	" [%l]  :�s�ԍ�
	" [%p]  :�s�ʒu(�S����)
	" [%3p] :�s�ʒu(3���Œ�S����)
	" [%P]  :�s�ʒu(�擪:Top,�r��:�S����(%),����:Bot,�S�\��:All)
	" [%m]  :�C���}�[�N([+])
	" [%%]  :"%"
	" [%=]  :�E��
	" [%<]  :???
	" [%r]  :???
	" [%h]  :???
	" [%w]  :???
	" [\ ]  :�X�y�[�X
	" [%5(\ %)\ ]  :�X�y�[�X�~5
	"set statusline=[%m]%y%{GetStatus()}%F%m%r%=<%c-%l/%L>%5(\ %)%3p%%
	set laststatus=2

	let g:lightline = {
		\ 'colorscheme' : 'wombat',
		\ 'mode_map'	: {'c': 'NORMAL'},
	  	\ 'separator'	: {'left': "", 'right': ""},
	  	\ 'subseparator': {'left': "", 'right': ""},
		\ 'active': {
		\	'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
		\ },
		\ 'component_function': {
		\	'modified'	 : 'LightlineModified',
		\	'readonly'	 : 'LightlineReadonly',
		\	'fugitive'	 : 'LightlineFugitive',
		\	'filename'	 : 'LightlineFilename',
		\	'fileformat' : 'LightlineFileformat',
		\	'filetype'	 : 'LightlineFiletype',
		\	'fileencoding' : 'LightlineFileencoding',
		\	'mode'		 : 'LightlineMode'
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

	" �t�@�C���t�H�[�}�b�g�������G���R�[�f�B���O�����s�R�[�h�擾
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

	" tag�W�����v�ݒ�
	nnoremap <silent> <C-]> g<C-]>
	nnoremap <silent> <C-LeftMouse> g<C-]>

	" ESC�Ńn�C���C�g�T�[�`����
	nnoremap <silent> <ESC> :<C-w>nohlsearch<CR><ESC>
	inoremap <silent> <ESC> <ESC>:<C-w>nohlsearch<CR>

	"=======================================================
	"tab�ݒ�
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

	" �u���V���[�g�J�b�g
	nnoremap gs :%s;;;gc<left><left><left><left>
	vnoremap gs :s;;;gc<left><left><left><left>

	nnoremap <M-g> :call GrepUnderWord()<CR>

	let g:netrw_nogx = 1 " disable netrw's gx mapping.
	nnoremap gx <Plug>(openbrowser-smart-search)
	vnoremap gx <Plug>(openbrowser-smart-search)

	inoremap <silent> <expr><C-a>  search('^\s\s*\%#', 'bcn') ? "\<C-o>0" : "\<C-o>^"
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
let Tlist_Show_One_File = 1 "���ݕҏW���̃\�[�X�̃^�O�����\�����Ȃ�
let Tlist_Exit_OnlyWiindow = 1 "taglist ���Ō�̃E�C���h�E�Ȃ� vim �����
"let Tlist_Enable_Fold_Column = 1 " �܂���
map <silent> <leader>tl :TlistToggle<CR>

let g:tlist_php_settings = 'php;c:class;d:constant;f:function'

autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | vs | copen | endif
