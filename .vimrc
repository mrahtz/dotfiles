" - ale: flake8 and pylint. Toggle checking with '\a'. Checks on save.
" - fzf:
"   - '\t': search files
"   - '\y': search tags
"   - '\u': search contents
" - goyo: ':Goyo' to start
" - ultisnips:
"   - 'ipy' for ipython debugger
"   - 'ap' for argparse
"   - 'ut' for unittest
" - vim-autoformat: uses yapf. '\=' to format.
" - vim-gitgutter: toggle with '\g'.
" - vim-isort: '\i'.

runtime bundle/vim-pathogen/autoload/pathogen.vim

colorscheme smyck

set expandtab
set shiftwidth=4
set tabstop=4
set ignorecase
set smartcase	" if a search phrase has uppercase, be case-sensitive
set textwidth=79

" magic options to make lists autoindent properly
" from https://stackoverflow.com/a/37172060/7832197
:set formatoptions+=n
:set formatlistpat=^\\s*\\w\\+[.\)]\\s\\+\\\\|^\\s*[\\-\\+\\*]\\+\\s\\+

execute pathogen#infect()

" Load fzf scripts
set rtp+=~/.fzf

" vim-surround
" surround word with []
map <Leader>] ysiw]
" surround Word with []
map <Leader>p] ysiW]
" remove []
map <Leader>d] ds]

" fzf
map <Leader>t :Files<CR>
map <Leader>y :Tags<CR>
map <Leader>u :Ag<CR>

" ALE
let g:ale_enabled = 0
map <Leader>a :ALEToggle<CR>
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\}
let g:ale_python_pylint_options = '--disable=invalid-name,missing-docstring,fixme,too-many-statements,too-many-locals,too-many-arguments,too-many-instance-attributes,too-few-public-methods,too-many-branches'
let g:ale_lint_on_text_changed = 'never'

map <Leader>q :nohls<CR>
map <Leader>= :Autoformat<CR>
map <Leader>g :GitGutterToggle<CR>
map <Leader>i :Isort<CR>

" switch tabs
map <Leader>9 gT
map <Leader>0 gt
