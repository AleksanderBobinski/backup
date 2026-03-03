"vim-plug
call plug#begin('~/.local/share/nvim/plugged')

"Everyday
:colorscheme delek
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/mru.vim'
:set spelllang=en_us,pl
:set spell
":match MatchParen '\%>80v.\+'
"Automatically break lines at 80 chars
":set tw=80
autocmd Filetype py match :set tw=120
:set fo+=t
"Expand tabs
:set tabstop=8 smarttab tw=79

" Show marks
Plug 'kshenoy/vim-signature'

" Show git diff inline
Plug 'airblade/vim-gitgutter'

" Show trailing whitespace
" :set list listchars=trail:·

"Highlight words on double clicking
:noremap <2-LeftMouse> * <c-o>
:inoremap <2-LeftMouse> <c-[>* <c-o> i

"Fileview
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

"Completion
" Brackets
"Plug 'cohama/lexima.vim'

" Python linters
Plug 'vim-syntastic/syntastic'

nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>r :YcmCompleter RefactorRename 
nnoremap <leader><leader> :YcmCompleter GoToReferences<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>

"Python
Plug 'davidhalter/jedi-vim'
autocmd Filetype py match MatchParen '\%>79v.\+'

"C++
Plug 'octol/vim-cpp-enhanced-highlight'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

"UML
Plug 'aklt/plantuml-syntax'
call plug#end()

" Flex and bison syntax highlighting
Plug 'calincru/flex-bison-syntax'

" Inside terminal-mode
:tnoremap <C-[> <C-\><C-n>
:autocmd TermOpen :set nonumber

" All the other stuff
set number
"YCM overrides menu with menuone
"set completeopt=preview,menu,longest

set mouse=a
set nowrap

" lightline
set noshowmode
let g:lightline = {
	    \ 'active': {
	    \   'left': [ [ 'mode' ],
	    \             [ 'relativepath', 'modified' ] ],
	    \ 'right': [ ]
	    \ },
	    \ 'inactive': {
	    \ 'left': [ ['filename'] ],
	    \ 'right': []
	    \},
	    \ 'component_function': {
	    \ },
	    \ 'mode_map': {
	    \ 'n' : 'NORMALNY',
	    \ 'i' : 'WPROWADZANIE',
	    \ 'R' : 'ZAMIANA',
	    \ 'v' : 'VIZUALNY',
	    \ 'V' : 'VIZUALNY-LINIOWY',
	    \ "\<C-v>": 'VIZUALNY-BLOKOWY',
	    \ 'c' : 'POLECENIE',
	    \ 's' : 'WYBÓR',
	    \ 'S' : 'S-LINIOWY',
	    \ "\<C-s>": 'S-BLOKOWY',
	    \ 't': 'TERMINAL',
	    \}
	    \ }

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

" Exit vim if last buffer is closed and close NERDTree as well
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

