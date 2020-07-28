call plug#begin()

"Conquer of completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale' "async linter and fixer

Plug 'SirVer/ultisnips' "Snippet engine
Plug 'honza/vim-snippets' "the actual snippets

Plug 'jiangmiao/auto-pairs' "insert or delete brackets, parens, quotes in pair
Plug 'tpope/vim-surround' "quickly add/change/delete surrounding characters

Plug 'scrooloose/nerdtree' "shows project tree
Plug 'tpope/vim-fugitive' "See current git branch
Plug 'tc50cal/vim-terminal' "run interactive programs in vim buffer
Plug 'kien/ctrlp.vim'  "Fuzzy file finding

Plug 'tpope/vim-endwise' "logically closes structures
Plug 'scrooloose/nerdcommenter' "easy comments <leader>cc
Plug 'Yggdroot/indentLine' "Adds bar under indentations
Plug 'terryma/vim-multiple-cursors' "like sublime texts'

Plug 'bling/vim-airline' "extra info at bottom
Plug 'vim-airline/vim-airline-themes' "style bottom
Plug 'altercation/vim-colors-solarized' "color theme
Plug 'kien/rainbow_parentheses.vim' "easier to read brackets

Plug 'tpope/vim-cucumber'
Plug 'quentindecock/vim-cucumber-align-pipes'
Plug 'godlygeek/tabular' "needed by vim cucumber

" Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

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

"show numbers on default
set number

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"CONFIGURATION

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"IndentLine
let g:indentLine_char = '┆'

"Nerdtree
nmap <leader>t :NERDTreeToggle<CR>

" If you want :UltiSnipsEdit to split your window.  let g:UltiSnipsEditSplit="vertical"

"
"Rainbow parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"ALE config

nnoremap <leader>F :ALEFix<CR> 
let g:ale_fix_on_save = 1

"Tell vim to recognize coffescript files
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.coffee set filetype=coffee
augroup END

let g:ale_linters = { 
    \ 'javascript': ['eslint'],
    \'ruby': ['solargraph', 'rubocop', 'rails_best_practices'],
    \'html': ['htmlhint'],
    \'scss': ['scss-lint']
\}
let g:ale_fixers = { 
    \ 'javascript':  ['prettier', 'eslint'], 
    \ 'ruby': ['rubocop'],
    \ 'html': ['prettier'],
    \ 'html.erb': ['prettier'],
    \ 'css': ['prettier'],
    \ 'scss': ['prettier'],
    \ 'yaml': ['prettier'],
\}


"Coc extension configurations:

"    Coc-actions

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

"   Coc-snippets
"
"Ultisnips compatability
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"

let g:coc_snippet_prev = '<C-p>'
let g:coc_snippet_next = '<TAB>'
vmap <TAB> <Plug>(coc-snippet-select)
imap <TAB> <Plug>(coc-snippets-expand-jump)

