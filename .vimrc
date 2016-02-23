" Before using this file, you must install Vundle. You can do so by running
" the following:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after,/usr/share/vim/vimfiles

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme desert
set nocompatible
filetype off

" alias
nnoremap <c-k> <c-w><c-w>

" set the runtime path to include vim-plug and initialize
call plug#begin('~/.vim/plugged')

" ultisnips
Plug 'SirVer/ultisnips'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" SuperTab
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

" Code snippets with tab
Plug 'honza/vim-snippets'
" Extra JS stuff
" For some crazy reason, these should be Plug...
"
" Misc js things (better highlighting, etc)
" Bundle pangloss/vim-javascript 

" Indentation
Plug 'vim-scripts/JavaScript-Indent'

" Syntax highlighting
Plug 'jelera/vim-javascript-syntax'
Plug 'briancollins/vim-jst'
Plug 'derekwyatt/vim-scala'
Plug 'rust-lang/rust.vim'
"Plug 'racer-rust/vim-racer'

" Smarter autocomplete in js
Plug 'myhere/vim-nodejs-complete' 
" Fixing the autocomplete help location
set splitbelow

" Syntastic... Hopefully no conflict with jshint...
Plug 'scrooloose/syntastic'

" nerd tree
Plug 'scrooloose/nerdtree'

" cpplint
Plug 'funorpain/vim-cpplint'

" js linter
Plug 'Shutnik/jshint2.vim'
let jshint2_save = 1

let g:syntastic_scala_checkers=['scalastyle']
let g:syntastic_scala_scalastyle_jar="~/.config/configs/scalastyle-batch_2.10.jar"
let g:syntastic_scala_scalastyle_config_file="~/.config/configs/scalastyle.xml"

" Generate JSDoc for javascript
Plug 'heavenshell/vim-jsdoc'

" tern for js autocomplete
"Plug "marijnh/tern_for_vim"

" Easy commenting
Plug 'scrooloose/nerdcommenter'

" Edit surrounding tags, quotes, etc
Plug 'tpope/vim-surround'

" Trying out a java plugin
" Plug "vim-scripts/Vim-JDE"

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Fugitive
Plug 'tpope/vim-fugitive'

" Visualizing the undo/redo tree of vim
Plug 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

set nu
set rnu
syntax on
set ts=4
set shiftwidth=4
set expandtab
au BufRead,BufNewFile *.md set filetype=markdown 

" Add spell checking in md
autocmd FileType markdown set spell spelllang=en_us

filetype plugin indent on

" Extra aliases
" TODO
"
set foldmethod=syntax
"set foldlevelstart=0
"let javaScript_fold=1
"au FileType javascript call JavaScriptFold()

" Calling cppcheck on save
" autocmd BufWritePre *.cpp, *.h !cpplint %

" CPP tab spacing
"autocmd Filetype cpp setlocal ts=2 sts=2 sw=2
"
" Auto run pdflatex on tex files
command! -nargs=1 Silent
            \ | execute ':silent !'.<q-args>
            \ | execute ':redraw!'

autocmd BufWritePost *.tex :Silent pdflatex %

highlight OverLength ctermbg=red ctermfg=white guibg=#aa5555
match OverLength /\%81v.\+/
