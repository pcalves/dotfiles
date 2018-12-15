set nocompatible " This should be the first line. It sets vim to not be backwards compatible with vi.

"" Plug.vim (https://github.com/junegunn/vim-plug)
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

"" Plugins
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'mattn/emmet-vim'                                            " Emmet for vim, 'nuff said
Plug 'vim-scripts/Align'                                          " It's in the name: align text, declarations, pretty much anything
Plug 'Raimondi/delimitMate'                                       " Auto-inserts closing characters when applicable
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }       " asynchronous keyword completion
Plug 'Shougo/neosnippet'                                          " snippets in vim
Plug 'Shougo/neosnippet-snippets'                                 " default snippets
Plug 'ntpeters/vim-better-whitespace'                             " Highlight trailing whitespace characters
Plug 'mhinz/vim-signify'                                          " git diff in gutter
Plug 'tpope/vim-fugitive'                                         " git in vim ❤️
Plug 'tpope/vim-commentary'                                       " Comment/Uncomment code
Plug 'tpope/vim-repeat'                                           " . for plugins
Plug 'tpope/vim-eunuch'                                           " vim sugar for the UNIX shell commands that need it the most.
Plug 'tpope/vim-surround'                                         " add surroundings to text (quotes, tags, brackets, etc.)
Plug 'tpope/vim-vinegar'                                          " enhance netrw, never look at nerdtree again
Plug 'tpope/vim-speeddating'                                      " increment dates, times, numerals & ordinal (C-A/C-X)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy finder
Plug 'junegunn/fzf.vim'                                           " fzf commands for vim
Plug 'tmhedberg/matchit'                                          " % matches more than single characters (e.g. tag matching)
Plug 'benekastah/neomake'                                         " ansyc :make, run linters, builders, etc.
Plug 'editorconfig/editorconfig-vim'                              " EditorConfig for vim, define coding styles b/w different editors & IDEs
Plug 'justinmk/vim-sneak'                                         " Vim motion plugin that jumps to any location specified by two characters (s{char}{char})
Plug 'vim-scripts/IndexedSearch'                                  " shows 'Nth match out of M' at every search
Plug 'nelstrom/vim-visual-star-search'                            " start a * or # search from a visual block
Plug 'Yggdroot/indentLine'                                        " display indention levels with thin vertical lines
Plug 'AndrewRadev/splitjoin.vim'                                  " gS to splig, gJ to join
Plug 'junegunn/goyo.vim'                                          " distraction-free writing
Plug 'lukaszkorecki/workflowish'                                  " workflowy for vim!

" Color Schemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dylanaraps/wal.vim'

" Syntax highlighters, Pretty self-explanatory for the most part
Plug 'ap/vim-css-color'          " THIS IS THE BEST. Shows colors defined in CSS & various pre-processor languages
Plug 'cakebaker/scss-syntax.vim'
Plug 'sheerun/vim-polyglot'      " Collection of language packs for vim, regularly updated
Plug 'gavocanov/vim-js-indent'   " Indenting from pangloss/vim-javascript
Plug 'othree/yajs.vim'           " Better syntax highlighting than ^^

" vim niceties for various languages
Plug 'kewah/vim-stylefmt'
Plug 'w0rp/ale'

" Add plugins to &runtimepath
call plug#end()





"" MAIN SETTINGS
syntax on                            " Syntax highlighting
set encoding=utf-8
set showcmd                          " display incomplete commands
filetype plugin indent on            " load file type plugins + indentation
set number                           " show line numbers
set visualbell                       " No sounds
set autoread                         " Reload files changed outside vim
set cul                              " show cursor line
set relativenumber                   " default to relative numbers
set inccommand=nosplit               " live preview
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1  " Cursor is pipe in Insert, block in Normal
let mapleader = ","                  " Use comma as leader

" Swap file stuff. If you don't have one make an undodir in ~/.vim
" In terminal just type mkdir -p ~/.vim/undodir
set noswapfile
set hidden
set undofile
set undodir=~/.vim/undodir





"" Color scheme
let g:dracula_colorterm = 0
set termguicolors
color dracula
" colorscheme wal
" colorscheme palenight





"" Whitespace
set smartindent
set wrap linebreak nolist      " don't wrap lines
set breakindent                " sensible soft wrapping of lines
set tabstop=2 shiftwidth=2     " a tab is two spaces
set expandtab                  " use spaces, not tabs (optional)
set backspace=indent,eol,start " backspace through everything in insert mode




"" Margin highlighting
set colorcolumn=80,120





"" Folding settings
set foldmethod=indent " fold based on indent
set foldnestmax=10    " deepest fold is 10 levels
set nofoldenable      " dont fold by default
set foldlevel=1       " this is just what i use




"" Searching
set hlsearch                       " highlight matches
set incsearch                      " incremental searching
set ignorecase                     " searches are case insensitive...
set smartcase                      " ... unless they contain at least one capital letter
autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save





"" COMMAND MAPPINGS
" toggle current fold open/closed
nnoremap <Space> za
" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <leader>n :bn<CR>
nnoremap <silent> <leader>p :bp<CR>
nnoremap <silent> <leader>x :bd<CR>

nnoremap <silent> <C-t> :FZF -m<cr>
nnoremap <silent> <C-p> :FZF -m<cr>

" deoplete tab-complete
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" ,<Tab> for regular tab
inoremap <Leader><Tab> <Space><Space>
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" Force saving files that require root permission
cnoremap w!! w !sudo tee > /dev/null %




"" PLUGIN SETTINGS
set laststatus=2  " always show status line
" set showtabline=2 " always show tab line

"" neomake configuration
" Open the loclist/quickfix list when entries are produced,
" and preserve cursor position
let g:neomake_open_list = 2

" Customise error and warning signs
let g:neomake_error_sign = {
      \ 'text': 'E',
      \ 'texthl': 'ErrorMsg',
      \ }

let g:neomake_warning_sign = {
      \ 'text': 'W',
      \ 'texthl': 'ErrorMsg',
      \ }

" Run Neomake on :w
autocmd! BufWritePost * Neomake

" ---------- JAVASCRIPT MAKERS ----------
" Default JS linting is with ESLint
let g:neomake_css_enabled_makers = ['stylelint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
" load local eslint in the project root
" modified from https://github.com/mtscout6/syntastic-local-eslint.vim
" NB: This means, for your eslintrc to work properly, Neovim must be opened
" from the project’s root directory
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

" If an .eslintc file is NOT found in the current file's directory, or
" the directories above it, switch to linting JS files w/ Standard
" if findfile('.eslintrc', '.;') ==# ''
"   let g:neomake_javascript_enabled_makers = ['standard']
" endif




" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0  " This do disable full signature type on autocomplete
" Use smartcase.
let g:deoplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:deoplete#sources#syntax#min_keyword_length = 1

" Enable heavy omni completion.
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Use JSX syntax in JS files
let g:jsx_ext_required = 0

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'

" FZF
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Ale
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'jsx': ['eslint', 'stylelint'],
\ 'css': ['stylelint']
\}

let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'jsx': ['eslint', 'stylelint'],
\ 'css': ['stylelint']
\}

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1

let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0

" Workflowish
autocmd BufWinLeave *.wofl mkview
autocmd BufWinEnter *.wofl silent loadview

" Custom status line
" https://www.blaenkdenum.com/posts/a-simpler-vim-statusline/

function! Status(winnum)
  let active = a:winnum == winnr()
  let bufnum = winbufnr(a:winnum)

  let stat = ''

  " Display errors from Ale in statusline
  " https://kadekillary.work/post/statusline/
  function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf(
      \ 'W:%d E:%d',
      \ l:all_non_errors,
      \ l:all_errors
      \)
  endfunction

  " this function just outputs the content colored by the
  " supplied colorgroup number, e.g. num = 2 -> User2
  " it only colors the input if the window is the currently
  " focused one

  function! Color(active, group, content)
    if a:active
      return '%#' . a:group . '#' . a:content . '%*'
    else
      return a:content
    endif
  endfunction

  " this handles alternative statuslines
  let usealt = 0

  let type = getbufvar(bufnum, '&buftype')
  let name = bufname(bufnum)

  let altstat = ''

  if type ==# 'help'
    let altstat .= '%#SLHelp# HELP %* ' . fnamemodify(name, ':t:r')
    let usealt = 1
  elseif name ==# '__Gundo__'
    let altstat .= ' Gundo'
    let usealt = 1
  elseif name ==# '__Gundo_Preview__'
    let altstat .= ' Gundo Preview'
    let usealt = 1
  endif

  if usealt
    return altstat
  endif

  " column
  "   this might seem a bit complicated but all it amounts to is
  "   a calculation to see how much padding should be used for the
  "   column number, so that it lines up nicely with the line numbers

  "   an expression is needed because expressions are evaluated within
  "   the context of the window for which the statusline is being prepared
  "   this is crucial because the line and virtcol functions otherwise
  "   operate on the currently focused window

  function! Column()
    let vc = virtcol('.')
    let ruler_width = max([strlen(line('$')), (&numberwidth - 1)]) + &l:foldcolumn
    let column_width = strlen(vc)
    let padding = ruler_width - column_width
    let column = ''

    if padding <= 0
      let column .= vc
    else
      " + 1 because for some reason vim eats one of the spaces
      let column .= repeat(' ', padding + 1) . vc
    endif

    return column . ' '
  endfunction

  let stat .= '%#function#'
  let stat .= '%#SLColumn#'
  let stat .= '%{Column()}'
  let stat .= '%*'

  if getwinvar(a:winnum, 'statusline_progress', 0)
    let stat .= Color(active, 'SLProgress', ' %p ')
  endif

  " linter errors
  let stat .= LinterStatus()

  " file name
  let stat .= Color(active, 'SLArrows', active ? ' »' : ' «')
  let stat .= ' %<'
  let stat .= '%f'
  let stat .= ' ' . Color(active, 'SLArrows', active ? '«' : '»')

  " file modified
  let modified = getbufvar(bufnum, '&modified')
  let stat .= Color(active, 'SLLineNr', modified ? ' +' : '')

  " read only
  let readonly = getbufvar(bufnum, '&readonly')
  let stat .= Color(active, 'SLLineNR', readonly ? ' ‼' : '')

  " paste
  if active
    if getwinvar(a:winnum, '&spell')
      let stat .= Color(active, 'SLLineNr', ' S')
    endif

    if getwinvar(a:winnum, '&paste')
      let stat .= Color(active, 'SLLineNr', ' P')
    endif
  endif

  " right side
  let stat .= '%='

  " git branch
  if exists('*fugitive#head')
    let head = fugitive#head()

    if empty(head) && exists('*fugitive#detect') && !exists('b:git_dir')
      call fugitive#detect(getcwd())
      let head = fugitive#head()
    endif

    if !empty(head)
      let stat .= Color(active, 'SLBranch', ' ← ') . head . ' '
    endif
  endif

  return stat
endfunction

function! s:ToggleStatusProgress()
  if !exists('w:statusline_progress')
    let w:statusline_progress = 0
  endif

  let w:statusline_progress = !w:statusline_progress
endfunction

command! ToggleStatusProgress :call s:ToggleStatusProgress()

nnoremap <silent> ,p :ToggleStatusProgress<CR>

function! s:IsDiff()
  let result = 0

  for nr in range(1, winnr('$'))
    let result = result || getwinvar(nr, '&diff')

    if result
      return result
    endif
  endfor

  return result
endfunction

function! s:RefreshStatus()
  for nr in range(1, winnr('$'))
    call setwinvar(nr, '&statusline', '%!Status(' . nr . ')')
  endfor
endfunction

command! RefreshStatus :call <SID>RefreshStatus()

augroup status
  autocmd!
  autocmd VimEnter,VimLeave,WinEnter,WinLeave,BufWinEnter,BufWinLeave * :RefreshStatus
augroup END
