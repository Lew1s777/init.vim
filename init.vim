"
" __  __       _   _                 _           ____   ____ 
"|  \/  |_   _| \ | | ___  _____   _(_)_ __ ___ |  _ \ / ___|
"| |\/| | | | |  \| |/ _ \/ _ \ \ / / | '_ ` _ \| |_) | |    
"| |  | | |_| | |\  |  __/ (_) \ V /| | | | | | |  _ <| |___ 
"|_|  |_|\__, |_| \_|\___|\___/ \_/ |_|_| |_| |_|_| \_\\____|
"        |___/                                               
"my neovim configuration file
"sudo rm ~/.local/share/nvim/shada/main.shada

" ==================== Dependencies =======================
"{
"	nvim git curl python3
"}!!!require neovim optional python3 support

" ==================== Autoload ===========================
"This only works on neovim
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==================== Editor behavior ====================
syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
let mapleader=" "
let mapscript=","
set nocompatible
set hidden
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
"set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=4
set shiftwidth=3
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=4
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set updatetime=300
set shortmess+=c
"set signcolumn=yes
" ==================== Cursor Movement ====================
" cursor movement
"     ^			Slow:<movement key>
"     w			Fast:<Shift>+<movement key>
" < a   d >		Fastest:<ctrl>+<movement key>
"     s
"     v
"noremap w gk
"noremap s gj
noremap w gk
noremap s gj
noremap a h
noremap d l
noremap A b
noremap D w
noremap W 7gk
noremap S 7gj
"noremap <c-w> <c-u>
"noremap <c-s> <c-d>
noremap <LEADER><CR> gf

" ==================== Keymap =============================
noremap r i
noremap R I
noremap T A
noremap t a
noremap <c-a> g0
noremap <c-d> g$
noremap F V
noremap f v
noremap <c-f> <c-v>
noremap c y
noremap C Y
noremap v p
noremap x d
noremap X D
noremap <c-q> :q<CR>
noremap Q :wq<CR>
noremap <c-s> :w<CR>
noremap <c-z> u
noremap z f
noremap Z F
noremap <c-e> :e 
"hex
"noremap h :%!xxd<CR>
"noremap j :%!xxd -r<CR>
"next search result
noremap j nzz
noremap l Nzz
noremap <CR> nzz
noremap \ :nohlsearch<CR>
"completion
"noremap  <c-n>
"split screen
noremap <LEADER>D :set splitright<CR>:vsplit<CR>
noremap <LEADER>A :set nosplitright<CR>:vsplit<CR>
noremap <LEADER>W :set nosplitbelow<CR>:split<CR>
noremap <LEADER>S :set splitbelow<CR>:split<CR>
noremap <LEADER>d <C-w>l
noremap <LEADER>w <C-w>k
noremap <LEADER>a <C-w>h
noremap <LEADER>s <C-w>j
noremap <LEADER><c-a> <C-w>t<C-w>H
noremap <LEADER><c-d> <C-w>t<C-w>H
noremap <LEADER><c-w> <C-w>t<C-w>K
noremap <LEADER><c-s> <C-w>t<C-w>K
noremap <down> :res +5<CR>
noremap <up> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>
"page
noremap e :tabe<CR>
noremap <c-r> :-tabnext<CR>
noremap <c-t> :+tabnext<CR>
"number
noremap N :set nonumber<CR>:set norelativenumber<CR>
noremap <c-n> :set number<CR>:set relativenumber<CR>

"completion
source ~/.config/nvim/completation.vim

"----------------------Greeting-------------------------
let name = "archer"
echo "Hello, " . name

" ==================== Install Plugins with Vim-Plug ====================
call plug#begin('$HOME/.config/nvim/plugged')
"completation
"Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mzlogin/vim-markdown-toc'

"Plug 'folke/which-key.nvim'

" Treesitter
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'
" Status line
Plug 'liuchengxu/eleline.vim'
" Markdown(disabled on server)
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  , 'for': ['text', 'markdown', 'vim-plug']}
" Mini Vim-APP
"Plug 'mhinz/vim-startify'
"Plug 'd0c-s4vage/pfp-vim'

call plug#end()

" ==================== Vim-Plugins configurations ==============
"NerdTree-----------------------------------------------
noremap E :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = ""
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = ""
let NERDTreeMapOpenInTab = ""
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = ""
let NERDTreeMapChangeRoot = ""

"MarkdownPreview(disabled on server)-----------------------------------------------
nmap m <Plug>MarkdownPreviewToggle
let g:mkdp_browser = 'chromium'
"run below after install Markdownplug
":call mkdp#util#install_sync()

"eleline-----------------------------------------------
let g:airline_powerline_fonts = 1


"which key-----------------------------------------------
"lua << EOF
"  require("which-key").setup {
"    -- your configuration comes here
"    -- or leave it empty to use the default settings
"    -- refer to the configuration section below
"  }
"EOF
"noremap ? :WhichKey<CR>

"coc.nvim-----------------------------------------------
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-docker',
	\ 'coc-eslint',
	\ 'coc-explorer',
	\ 'coc-flutter-tools',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-import-cost',
	\ 'coc-java',
	\ 'coc-jest',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-lua',
	\ 'coc-omnisharp',
	\ 'coc-prettier',
	\ 'coc-prisma',
	\ 'coc-pyright',
	\ 'coc-snippets',
	\ 'coc-sourcekit',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'https://github.com/theniceboy/coc-tailwindcss',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
	\ 'coc-yank']
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use <c-space> to trigger completion.
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"inoremap <silent><expr> <TAB> coc#refresh()

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
