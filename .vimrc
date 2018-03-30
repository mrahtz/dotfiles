colorscheme smyck

set expandtab
set shiftwidth=4
set tabstop=4
set ignorecase
set smartcase	"if a search phrase has uppercase, be case-sensitive
set textwidth=79

"magic options to make lists autoindent properly
"from https://stackoverflow.com/a/37172060/7832197
:set formatoptions+=n
:set formatlistpat=^\\s*\\w\\+[.\)]\\s\\+\\\\|^\\s*[\\-\\+\\*]\\+\\s\\+

execute pathogen#infect()

let g:ale_enabled = 0
set rtp+=/usr/local/opt/fzf

"map: vanilla
"nmap: only in visual mode

"switch tabs
map <Leader>9 gT
map <Leader>0 gt
map <Leader>q :nohls<CR>

map <Leader>= :Autoformat<CR>
map <Leader>g :GitGutterToggle<CR>
map <Leader>a :ALEToggle<CR>
map <Leader>i :Isort<CR>
map <Leader>e :call deoplete#enable()<CR>

"vim-surround
"surround word with []
map <Leader>] ysiw]
"surround Word with []
map <Leader>p] ysiW]
"remove []
map <Leader>d] ds]

"fzf
map <Leader>t :Files<CR>
map <Leader>y :Tags<CR>
map <Leader>u :Ag<CR>

"for git commit, which invokes vim directly
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

function! s:goyo_enter()
	call deoplete#disable()
endfunction

function! s:goyo_leave()
	call deoplete#enable()
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\}
let g:ale_python_pylint_options = '--disable=invalid-name,missing-docstring,fixme,too-many-statements,too-many-locals,too-many-arguments,too-many-instance-attributes,too-few-public-methods,too-many-branches'
let g:ale_lint_on_text_changed = 'never'
