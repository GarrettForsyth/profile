"add pathogen, Manage your 'runtimepath' with ease. In practical terms,
"pathogen.vim makes it super easy to install plugins and runtime files in
"their own private directories.
"
execute pathogen#infect()

"change way leaving insertmode:
inoremap jk <ESC>


"change the leader key (preludes shortcuts) fomr / to space
let mapleader="\<Space>"

"spell check:
set spell spelllang=en_ca
hi SpellLocal ctermbg=200
"easier to fix misspelled word
nnoremap <leader>f 1z=
"toggle spell check:
nnoremap <leader>s :set spell!







"============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"=================== MY PLUGS INS:

"you complete me plugin
Plugin 'Valloric/YouCompleteMe'

"youcompleteme autocomplete for c family
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" avoid conflict with YCM and UltiSnips on the tab key:
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:EclimCompletionMethod = 'omnifunc'

"Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"eclim mappings
nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
nnoremap <silent> <buffer> <leader>h :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

"deliminate autoclosing of quotes and brackets
let delimitMate_expand_cr = 1

"CtrlP - fuzzy finding for files, buffers, MRU and even tags
" Use <leader>t to open ctrlp
let g:ctrlp_map = '<leader>t'
" Ignore these directories
set wildignore+=*/build/**
" disable caching
let g:ctrlp_use_caching=0

"NERDtree file tree visualizer
nmap <leader>d :NERDTreeToggle<CR>

" Supertab autocompletion that is outside insertmode
Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-n>"

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

"==========================================================================================
" Enable exrc option. This forces vim to source .vimrc file if
" present in the working directory.
set exrc

" The above causes a potential security hole so opt for the secure
" option whic restricts usage of some commands in non-default .vimrc
" files.
set secure

"Set indentation styling
filetype plugin indent on

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
" set noexpandtab

"Set a line at 80 charcters
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

"by default  vim assume all .h files to be C++ files. Want pure C to be
"filetype c. Since project also comes with doxygen documentation, set
"subtype to doxygen to enable very nice doxygen highlighting.
augroup project
	    autocmd!
		    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
		augroup END


"
"
"Vim has a gf command (and related, <C-W><C-F> to open in new tab) which open
"file whose name is under or after the cursor. This feature is extremely
"useful for browsing header files.
"
"By default, Vim searches file in working directory. However, most projects
"have separated directory for include files. Thus, you should set Vim’s path
"option to contain a comma-separated list of directories to look for the file.
"
let &path.="src/include,/usr/include/AL,"

"
"
"Java users should pay attention to includeexpr option. It holds expression
"which will be used to transform a string to a file name. The following line
"changes all “.” to “/” for gf command (and related):
"
set includeexpr=substitute(v:fname,'\\.','/','g')


