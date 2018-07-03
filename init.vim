call plug#begin()
"Autocomplete - tern is for javacript
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --java-completer' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "autocomplete
Plug 'kien/ctrlp.vim'  "Fuzzy file finding
Plug 'Yggdroot/indentLine' "Adds bar under indentations
Plug 'Valloric/MatchTagAlways' "Highlights html tags
Plug 'bling/vim-airline' "extra info at bottom
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree' "shows project tree
Plug 'terryma/vim-multiple-cursors' "like sublime texts'
Plug 'SirVer/ultisnips' "awww yiss.. (the engine)
Plug 'honza/vim-snippets' "the snippets
Plug 'kien/rainbow_parentheses.vim' "name speaks for itself
Plug 'airblade/vim-gitgutter' "shows git diff in the gutter
Plug 'cakebaker/scss-syntax.vim' "nice scss .. haha..
Plug 'elzr/vim-json' 
Plug 'mxw/vim-jsx'  
Plug 'isRuslan/vim-es6' "see site for snippet details 
Plug 'jiangmiao/auto-pairs' "see site for snippet details 
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale' "async linter
Plug 'scrooloose/nerdcommenter' "easy comments
Plug 'altercation/vim-colors-solarized' "Looks pretty
Plug 'tpope/vim-fugitive' "See current git branch
Plug 'pangloss/vim-javascript' "Javascript syntax
Plug 'othree/javascript-libraries-syntax.vim' "syntax for js libraries
Plug 'mattn/emmet-vim' "faster html coding
Plug 'tc50cal/vim-terminal' "run interactive programs in vim buffer
Plug 'tpope/vim-obsession' "save session state
Plug 'ap/vim-css-color' " highlight colors in css files
Plug 'kchmck/vim-coffee-script' "coffeescript support
Plug 'tpope/vim-cucumber'
Plug 'quentindecock/vim-cucumber-align-pipes'
Plug 'godlygeek/tabular' "needed by vim cucumber

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
filetype plugin indent on

"sets leader
let mapleader= ","

"change way of leaving insertmode:
inoremap jk <ESC>lh  

"spell check:
set spell spelllang=en_ca
hi SpellLocal ctermbg=200
nnoremap <leader>f 1z=
nnoremap <leader>s :set spell!
set spell!

"show matching brackets
set showmatch

"Map tab shifting
map <F7> :tabp<CR>
map <F8> :tabn<CR>

"insert spaces when tab is pressed
set tabstop=2
set softtabstop=2

"indentation about for > and <
set shiftwidth=2

"tabs this many spaces
set expandtab
set autoindent

"copies indentation from line above
set copyindent 

"UI Config
"
"show numbers on default
set number

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"CONFIGURATION

"deocoplete
let g:deocoplete#enable_at_startup = 1

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"IndentLine
let g:indentLine_char = '┆'

"Nerdtree
nmap <leader>t :NERDTreeToggle<CR>

"Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"YCM
let g:ycm_key_list_select_completion=['<C-n>', 'Down']

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

"Rainbow parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"ALE config linter
"Tell vim to recognize coffescript files
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.coffee set filetype=coffee
augroup END

let g:ale_linter_aliases = {'coffee': 'coffee'} 
let g:ale_linters = { 'javascript': ['eslint'], 'ruby': ['rubocop'], 'coffee': ['coffeelint'] }
let g:ale_fixers = { 'javascript':  ['prettier', 'eslint'], 'ruby': ['rubocop'] }

nnoremap <leader>F :ALEFix<CR> 


"Colour theme
set t_Co=256
let g:solarized_termcolors=256
syntax enable
"let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

"Airline theme 
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"emmet
