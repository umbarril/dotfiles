" VSCODE VIM CONFIG

"" configs ""
let mapleader = " "
set incsearch
set hlsearch

" options and mappings that are supported by both Vim and IdeaVim
set ignorecase
set smartcase

set nu
set relativenumber
set showmode

" making Y act like other keys
nmap Y y$

" my previously unused key on my brazilian portuguese keyboard now has an use
noremap ç "_d
noremap Ç "_d$
onoremap ç d

" stop things from going to clipboard
vnoremap p "_dP
noremap x "_x
noremap X "_X

" Allow Ctrl+c in visual mode
vnoremap <C-c> "+y
inoremap <C-v> <C-R>+

" allow using Shift+Tab in normal mode
nnoremap <S-Tab> v<l
" allow using Tab in visual mode
vnoremap <Tab> >gv
" allow using Tab in visual mode
vnoremap <S-Tab> <gv

" allow using Tab in visual mode
vnoremap <Tab> >gv
" allow using Tab in visual mode
vnoremap <S-Tab> <gv

"" Doesn't work on IdeaVim yet :´(
"vnoremap <expr> I mode() == "V" ? '<C-V>^I' : 'I'
"vnoremap <expr> A mode() == "V" ? '<C-V>$A' : 'I'

" yanking and pasting
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y" gg"+yG

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Substitute
nnoremap <leader>s :%s//g<Left><Left>
vnoremap <leader>s :s//g<Left><Left>

nnoremap <leader><leader>s :%s/<C-R>"//g<Left><Left>

noremap H ^
noremap L $

nnoremap <A-o> o<Esc>
