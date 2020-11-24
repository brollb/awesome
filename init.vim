" Before using this file, you must install Vundle. You can do so by running
" the following:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
" set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after,/usr/share/vim/vimfiles

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let mapleader=" "
colorscheme desert
set nocompatible
set clipboard=unnamedplus
filetype off

" alias
nnoremap <c-k> <c-w><c-w>

" set the runtime path to include vim-plug and initialize
call plug#begin('~/.config/nvim/plugged')

" ultisnips
Plug 'SirVer/ultisnips'
"Plug 'Vigemus/iron.nvim'

"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"" SuperTab
"Plug 'ervandew/supertab'
"let g:SuperTabDefaultCompletionType = "context"

"" Code snippets with tab
Plug 'honza/vim-snippets'
Plug 'raimondi/delimitmate'
"" Extra JS stuff
"" For some crazy reason, these should be Plug...
""
"" Misc js things (better highlighting, etc)
"" Bundle pangloss/vim-javascript 

"" Indentation
Plug 'vim-scripts/JavaScript-Indent'

"" Syntax highlighting
Plug 'jelera/vim-javascript-syntax'
Plug 'briancollins/vim-jst'
Plug 'derekwyatt/vim-scala'

"Plug 'coala/coala-vim'

"" Smarter autocomplete in js
"Plug 'myhere/vim-nodejs-complete' 
"" Fixing the autocomplete help location
"set splitbelow

"" Syntastic... Hopefully no conflict with jshint...
Plug 'scrooloose/syntastic'
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_pug_checkers = ['pug_lint']

"Plug 'digitaltoad/vim-pug'

"" nerd tree
"Plug 'scrooloose/nerdtree'

""" cpplint
"Plug 'funorpain/vim-cpplint'

"let g:syntastic_scala_checkers=['scalastyle']
"let g:syntastic_scala_scalastyle_jar="~/.config/configs/scalastyle-batch_2.10.jar"
"let g:syntastic_scala_scalastyle_config_file="~/.config/configs/scalastyle.xml"

"" Generate JSDoc for javascript
"Plug 'heavenshell/vim-jsdoc'

"" Easy commenting
Plug 'scrooloose/nerdcommenter'

"" Edit surrounding tags, quotes, etc
Plug 'tpope/vim-surround'

"" Trying out a java plugin
"" Plug "vim-scripts/Vim-JDE"

"" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

"" Fugitive
"Plug 'tpope/vim-fugitive'

"Plug 'roxma/nvim-completion-manager'

"Plug 'autozimu/LanguageClient-neovim', { 'do': 'UpdateRemotePlugins' }
" Rust
"set hidden
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
"nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Set of common configs
Plug 'neovim/nvim-lspconfig'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'


"let g:syntastic_rust_checkers=['clippy']

" Visualizing the undo/redo tree of vim
Plug 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

" Typescript
"Plug 'Quramy/tsuquyomi'

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
" autocmd FileType markdown set spell spelllang=en_us

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
autocmd FileType javascript match OverLength /\%81v/

" Language Servers
let g:LanguageClient_autoStart = 1 
let g:LanguageClient_settingsPath = '/home/irishninja/.config/nvim/settings.json'
let g:LanguageClient_loadSettings = 1

let g:LanguageClient_serverCommands = {}
if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  " Use LanguageServer for omnifunc completion
  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
else
  echo "javascript-typescript-stdio not installed!\n"
  ":cq
endif

" Rust
augroup filetype_rust
    autocmd!
    autocmd BufReadPost *.rs setlocal filetype=rust
augroup END

" <leader>ld to go to definition
autocmd FileType * nnoremap <buffer>
  \ <leader>ld :call LanguageClient_textDocument_definition()<cr>
" <leader>lh for type info under cursor
autocmd FileType * nnoremap <buffer>
  \ <leader>lh :call LanguageClient_textDocument_hover()<cr>
" <leader>lr to rename variable under cursor
autocmd FileType * nnoremap <buffer>
  \ <leader>lr :call LanguageClient_textDocument_rename()<cr>

if executable('rls')
  let g:LanguageClient_serverCommands.rust = ['rls']
  " Use LanguageServer for omnifunc completion
  autocmd FileType rust setlocal omnifunc=LanguageClient#complete
else
  echo "rls not installed!\n"
  ":cq
endif

if executable('cquery')
  let g:LanguageClient_serverCommands.cpp = ['cquery', '--log-file=/tmp/cq.log']
  " Use LanguageServer for omnifunc completion
  autocmd FileType cpp setlocal omnifunc=LanguageClient#complete
else
  echo "cquery not installed!\n"
  ":cq
endif

" w!! to hard overwrite
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"let g:LanguageClient_loggingLevel = 'DEBUG'

" customization for rust support :)
syntax enable
filetype plugin indent on

set completeopt=menuone,noinsert,noselect

set shortmess+=c

" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF
-- nvim_lsp object
local nvim_lsp = require'nvim_lsp'

local on_attach = function(client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
end

nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
-- nvim_lsp.bashls.setup({ on_attach=on_attach })

EOF

" LSP shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'
" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>
set signcolumn=yes

" Add type hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }
