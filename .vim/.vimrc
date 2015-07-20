 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 "let Vundle manage Vundle
 "required! 
 Bundle 'gmarik/vundle'


 "My installed bundles here:
 "original repos on github.com
 
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'scrooloose/nerdtree'
 Bundle 'scrooloose/syntastic'
 Bundle 'Valloric/YouCompleteMe'


 "vim-scripts.org repos
 
 Bundle 'FuzzyFinder'
 Bundle 'c.vim'


 "non github repos
 
 Bundle 'git://git.wincent.com/command-t.git'


 "colour schemes
 
 Bundle 'adam.vim'
 "Setting default colourscheme below
 colorscheme adam.vim
 Bundle 'darkerdesert'
 Bundle 'dante.vim'


 filetype plugin indent on     " required!



 		" ~ my custom settings ~ "
		" ====================== "


 "maps
 map <F2> :NERDTreeToggle<CR> 

 
 "Editor settings
 set showmode
 set showcmd
 set history = 500
 set autoread
 set filetype plugin on filetype indent on
 set number
 set ignorecase set smartcase
 set hlsearch
 set incsearch
 syntax enable
 set shiftwidth=4 
 set tabstop=4
 set expandtab
 set smarttab
 set smartindent
 set cindent		"will disable smartindent for c-like code
 set autowrite
 set ai
 set si
 set wrap
 set title
 set visualbell
 set backspace=indent,eol,start
 set statusline


 "UI
 set cursorline
 

 "completion
 set wildmode=list:longest
 set wildmenu		"enable ctrl-n ctrl-p to scroll thru searches


 "disable arrow/navigation keys
 nnoremap <up> <nop>
 nnoremap <down> <nop>
 nnoremap <left> <nop>
 nnoremap <right> <nop>


 "loqding the plugin and indentation rules as per detected file type
 if has("autocmd")
	 filetype plugin indent on
 endif

 au FocusLost * :wa


 "backup swap undo files separate
 set undolevels=50
 set backupdir=~/.vim/tmp/backup//
 set directory=~/.vim/tmp/swap//
 set undodir=~/.vim/tmp/undo// 


 "catch trailing whitespaces and tabs
 set listchars=tab:>-,trail:·,eol:$
 nmap <silent> <leader>s :set nolist!<CR> 


 " =========================================================================
 " Brief help with Bundle.. commands
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
