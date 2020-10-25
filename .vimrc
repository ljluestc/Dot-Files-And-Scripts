" Disable ex mode
nnoremap Q <nop>
nnoremap x "_x

map <C-c> <leader>c<space>
map <C-f> <leader><leader>w
map <C-t> :TestNearest<CR>
map <C-q> :Dash<CR>
map <C-p> :Files<CR>
vmap <Enter> <Plug>(EasyAlign)
vnoremap . :normal .<CR>
nnoremap <C-e> :e.<CR>

if has('nvim')
  tnoremap <C-w> <C-\><C-n> 
  set termguicolors
endif

set backspace=indent,eol,start
set backupdir=$HOME/.vim/backup//
set directory=$HOME/.vim/swap//
set undodir=~/.vim/undo//

set hlsearch
set autoread
syntax on
filetype plugin indent on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup install_vim_plug
    autocmd VimEnter * PlugInstall
  augroup end
endif

let g:polyglot_disabled = ['coffee-script', 'emblem', 'yaml', 'cs', 'jinja', 'ansible', 'handlebars']

"" Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-dispatch'
Plug 'scrooloose/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'machakann/vim-sandwich'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim', { 'commit': '75798afff51e764ada87149b16bb56a6ef971042' }
Plug 'jesseleite/vim-agriculture'
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'rizzatti/dash.vim'
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)' }
Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['lisp', 'clojure', 'scheme'] }
Plug 'Konfekt/FastFold'
Plug 'janko-m/vim-test'
Plug 'sukima/vim-javascript-imports'
Plug 'AndrewRadev/ember_tools.vim'
Plug 'sukima/vim-ember-imports'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sleuth'
Plug 'metakirby5/codi.vim'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-rails', { 'for': 'ruby' } 
Plug 'moll/vim-node'
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'OmniSharp/omnisharp-vim'
Plug 'pearofducks/ansible-vim'
Plug 'ngn/vim-apl'
Plug 'brandonbloom/vim-factor'
Plug 'alunny/pegjs-vim'
Plug 'robbles/logstash.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'rhysd/vim-wasm'
Plug 'jakesjews/vim-emblem'
Plug 'katusk/vim-qkdb-syntax'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'sheerun/vim-polyglot'

call plug#end()

let g:coc_global_extensions = [
\ 'coc-actions',
\ 'coc-clangd',
\ 'coc-cmake',
\ 'coc-css',
\ 'coc-elixir',
\ 'coc-ember',
\ 'coc-erlang_ls',
\ 'coc-fsharp',
\ 'coc-go',
\ 'coc-html',
\ 'coc-java',
\ 'coc-json',
\ 'coc-julia',
\ 'coc-metals',
\ 'coc-omnisharp',
\ 'coc-perl',
\ 'coc-phpactor',
\ 'coc-powershell',
\ 'coc-python',
\ 'coc-r-lsp',
\ 'coc-rls',
\ 'coc-sh',
\ 'coc-solargraph',
\ 'coc-sourcekit',
\ 'coc-sql',
\ 'coc-svg',
\ 'coc-vimlsp',
\ 'coc-yaml'
\ ]

let g:test#strategy = 'neovim'

let g:vim_javascript_imports_use_semicolons = 0
let g:vim_javascript_imports_multiline_max_col = 120
let g:vim_javascript_imports_multiline_max_vars = 100
let g:ember_imports_ember_data_next = 1

let g:ansible_template_syntaxes = { 
\ '*.sh.j2': 'sh', 
\ '*.json.j2': 'json', 
\ '*.js.j2': 'javascript', 
\ '*.conf.j2': 'dosini', 
\ }

let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_linter_aliases = {'coffee': ['javascript']}

let g:ale_linters = {
\ 'coffee': ['eslint'],
\ 'javascript': ['eslint'],
\ 'cs': ['OmniSharp'],
\ 'html': { 'handlebars': ['ember-template-lint'] }
\}

let g:ale_fixers = {
\ 'coffee': ['eslint'],
\ 'javascript': ['eslint'],
\ 'html': { 'handlebars': ['ember-template-lint'] }
\}

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 3

let g:agriculture#disable_smart_quoting = 1
let g:agriculture#rg_options = '--smart-case'

inoremap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><Up>   pumvisible() ? "\<C-p>" : "\<Up>"

augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

augroup filetypedetect
  au! BufRead,BufNewFile *.m setfiletype objc
  au BufRead,BufNewFile *.AWL setfiletype asm
  au BufRead,BufNewFile *.razor setfiletype razor
  au FileType cs setl sw=4 sts=4 ts=4 et
  au FileType c setl sw=4 sts=4 ts=4 et
  au FileType cpp setl sw=4 sts=4 ts=4 et
  au FileType zsh setl sw=4 sts=4 ts=4 et
  au FileType sh setl sw=4 sts=4 ts=4 et
  au FileType make setl noexpandtab sw=4 sts=0 ts=4
augroup END

let g:NERDTreeIgnore = [
\ '\.hgcheck',    '\.hglf', '\.nuget', 'publish',
\ '.\vagrant$',   '\.idea', 'eflex.bbprojectd', 'tmp',
\ 'test-results', 'TestResults', 'compiled',
\ 'node_modules', 'bin', 'obj', 'Properties', 'coverage',
\
\ '\.suo$',            '\.hgtabs$',      '\.orig$',       '\.userconfig$', 
\ 'npm-debug.log',     '\.swp$',         '\.tmp$',        '\.reh$', 
\ '.DS_Store',         '\.iml$',         '\~$',           '.sublime-workspace', 
\ '\.userprefs$',      '.tm_properties', '\.jar$',        '\.pfx$', 
\ '\.sublime-project', '\.DotSettings',  'TestResult.xml'
\ ]

let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeCascadeSingleChildDir = 0

"don't autoselect first item in omnicomplete, show if only one item (for preview)
set completeopt=longest,menuone,preview

set showcmd
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab
set smarttab
set ignorecase
set smartcase
set number
set incsearch
set autowrite
set pastetoggle=<F2>
set mouse=a
set clipboard=unnamed
set foldmethod=indent
set foldlevel=99
set splitright
set ruler
set wildmenu
set formatoptions+=j " Delete comment character when joining commented lines
set autoread
set fileformats+=mac

setglobal tags-=./tags tags-=./tags; tags^=./tags;

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &term =~? '^screen'
  set ttymouse=xterm2
endif

cnoreabbrev rg RgRaw
cnoreabbrev rG RgRaw
cnoreabbrev RG RgRaw
cnoreabbrev Rg RgRaw

set background=dark
colorscheme dracula
hi! link SpecialComment DraculaCyan
hi! link Type DraculaCyan
hi! def link coffeeObjAssign Function
hi! def link coffeeSpecialIdent DraculaOrange
hi! def link coffeeKeyword DraculaRed
hi! def link coffeeStatement DraculaRed
hi Normal guibg=NONE ctermbg=NONE

