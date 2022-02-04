" --------------------------------------------------------------------------------
                                 "  VIM-PLUG
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes                                 
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Initialize plugin system
call plug#end()
" --------------------------------------------------------------------------------
                                 "  PATHOGEN
execute pathogen#infect() 
" --------------------------------------------------------------------------------
                                 " VUNDLE.VIM

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'dracula/vim', { 'name': 'dracula' } 
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf'
Plugin 'prettier/vim-prettier'
Plugin 'turbio/bracey.vim'
Plugin 'preservim/nerdtree'
Plugin 'junegunn/vim-github-dashboard'
Plugin 'junegunn/vim-emoji'
Plugin 'pangloss/vim-javascript'
Plugin 'chrisbra/Colorizer'
"Plugin 'w0rp/ale'
Plugin 'christoomey/vim-system-copy'
" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'grvcoelho/vim-javascript-snippets'
Plugin 'xuhdev/vim-latex-live-preview', {'for': 'text'} "Para uso de LaTeX


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"--------------------------------------------------------------------------------
                                   " VIMRC
                   
" Save 1,000 items in history
set history=1000

" Show the line and column number of the cursor position
set ruler

" turn relative numbers on
:set relativenumber

" Display the incomplete commands in the bottom right-hand side of your screen
set showcmd

" Display completion matches on your status line
set wildmenu

" Show a few lines of context around the cursor
set scrolloff=5

" Highlight search matches
set hlsearch

" Enable incremental searching
set incsearch

" Ignore case when searching
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case characters
set smartcase

" Turn on line numbering
set number

" Turn on file backups
set backup

" Don't line wrap mid-word
set lbr

" Copy the indentation from the current line
set autoindent

" Enable smart autoindentating
set smartindent

" Use spaces instead of tabs
set expandtab

" Enable smart tabs
set smarttab

" Make a tab equal to 2 spaces
set shiftwidth=2
set tabstop=2

" To Switch between files without save every change
set hidden

"--------------------------------------------------------------------------------
                           " PLUGINS CONFIGURATION

" Emmet shortcuts
"let g:user_emmet_mode='n'   "only enable normal mode functions.
let g:user_emmet_mode='a'   "enable all function in al mode
let g:user_emmet_leader_key=','

let g:user_emmet_settings = {
      \  'variables': {'lang': 'en'},
      \  'html': {
      \    'default_attributes': {
      \      'option': {'value': v:null},
      \      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
      \    },
      \    'snippets': {
      \      'html:5': "<!DOCTYPE html>\n"
      \              ."<html lang=\"${lang}\">\n"
      \              ."<head>\n"
      \              ."\t<meta charset=\"${charset}\">\n"
      \              ."\t<title></title>\n"
      \              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
      \              ."</head>\n"
      \              ."<body>\n\t${child}|\n</body>\n"
      \              ."</html>",
      \    },
      \  },
      \}

" Emoji completion
set completefunc=emoji#complete " emoji auto-completion

" Prettier
packloadall

" Kite
let g:kite_supported_languages = ['javascript', 'python']

" COC
let g:coc_disable_startup_warning = 1
autocmd Filetype python let b:coc_suggest_disable = 1
autocmd Filetype javascript let b:coc_suggest_disable = 1
autocmd Filetype scss setl iskeyword+=@-@

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
if &filetype == "javascript" || &filetype == "python"
  inoremap <c-space> <C-x><C-u>
else
  inoremap <silent><expr> <!-- <c-space> --> coc#refresh()
endif

" lightline
set laststatus=2
set noshowmode " doesn't show the vim's default mode message
let g:lightline = {
  \ 'colorscheme': 'Tomorrow_Night_Blue',
  \}

" hotkey Ctrl-j
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
let g:snipMate = { 'snippet_version' : 1 }

" ESLint
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"
"let b:ale_fixers = ['eslint']
"let g:ale_fix_on_save = 1

" NERDTress Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction
  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"--------------------------------------------------------------------------------
                                   " STYLE

" Coloring Syntax
syntax on

" Specify a color scheme
 colorscheme dracula

" Tell vim what background you are using
"set bg=light
"set bg=dark

" Set a transparent background
hi Normal guibg=NONE ctermbg=NONE

