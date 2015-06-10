" Before using this file, you must install Vundle. You can do so by running
" the following:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after,/usr/share/vim/vimfiles

set nocompatible
filetype off

" alias
nnoremap <c-k> <c-w><c-w>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" ultisnips
Plugin 'SirVer/ultisnips'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" SuperTab
Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

" Code snippets with tab
Plugin 'honza/vim-snippets'
" Extra JS stuff
" For some crazy reason, these should be Bundle...
"
" Misc js things (better highlighting, etc)
" Bundle pangloss/vim-javascript 

" Indentation
Bundle "vim-scripts/JavaScript-Indent"

" Syntax highlighting
Bundle "jelera/vim-javascript-syntax"
Bundle "derekwyatt/vim-scala"

" Smarter autocomplete in js
Bundle "myhere/vim-nodejs-complete" 
" Fixing the autocomplete help location
set splitbelow

" Syntastic... Hopefully no conflict with jshint...
"Bundle scrooloose/syntastic

" nerd tree
Bundle "scrooloose/nerdtree"

" cpplint
Bundle "funorpain/vim-cpplint"

" js linter
Bundle "Shutnik/jshint2.vim"
let jshint2_save = 1

" Generate JSDoc for javascript
Bundle "heavenshell/vim-jsdoc"

" tern for js autocomplete
"Bundle "marijnh/tern_for_vim"

" Easy commenting
Bundle "scrooloose/nerdcommenter"

" Edit surrounding tags, quotes, etc
Bundle "tpope/vim-surround"

" Trying out a java plugin
" Bundle "vim-scripts/Vim-JDE"

" Fugitive
Bundle "tpope/vim-fugitive"

" Visualizing the undo/redo tree of vim
Bundle "sjl/gundo.vim"
nnoremap <F5> :GundoToggle<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
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

