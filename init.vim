call plug#begin(stdpath('data') . '/plugged')
"" Themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'ayu-theme/ayu-vim'

"" Sidebar
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin' 

"" Syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'ryanoasis/vim-devicons'
let g:webdevicons_enable_nerdtree = 1

"" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" Cheatsheet
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"" Language server
Plug 'neovim/nvim-lspconfig'

"" Other
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"" Configurations
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
"" set background=dark
let ayucolor="mirage"
colorscheme ayu
set encoding=UTF-8
set number
set cursorline
set wrap
set nocompatible
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set wildmode=longest,list
set cc=120
filetype plugin indent on
set mouse=a
set clipboard=unnamedplus
filetype plugin on
set ttyfast
set splitright
set splitbelow

"" Coc
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-git']
" Code action on <leader>a
vmap <leader>a <Plug>(coc-codeaction-selected)<CR>
nmap <leader>a <Plug>(coc-codeaction-selected)<CR>
" Format action on <leader>f
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Goto definition
nmap <silent> gd <Plug>(coc-definition)
" Open definition in a split window
nmap <silent> gv :vsp<CR><Plug>(coc-definition)<C-W>L

"" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
:let g:NERDTreeWinSize=60
:let g:Tlist_WinWidth=60
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 
" " Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {} 
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue 
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {} 
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange 
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {} 
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red 
" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige 
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue 

" NERDTree Git Plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" use alt+hjkl to move between split/vsplit panels
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" open terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>t :below 10sp term://$SHELL<cr>i
" hit <Escape> key to exit from terminal mode
:tnoremap <Esc> <C-\><C-n>

" use <Tab> key to trigger completion and navigate to the next complete item
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1

"" elixir-ls
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require'lspconfig'.elixirls.setup{
    -- Unix
    cmd = { "/home/blaci/Elixir/elixir-ls/release/language_server.sh" };
}
EOF
