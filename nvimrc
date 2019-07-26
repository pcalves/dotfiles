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

Plug 'mhinz/vim-startify'                                         " Start screen
Plug 'w0rp/ale'                                                   " Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
Plug 'chazy/dirsettings'                                          " Directory-specific settings
Plug 'vim-scripts/Align'                                          " It's in the name: align text, declarations, pretty much anything
Plug 'jiangmiao/auto-pairs'                                       " Auto-inserts closing characters when applicable
Plug 'ntpeters/vim-better-whitespace'                             " Highlight trailing whitespace characters
Plug 'mhinz/vim-signify'                                          " git diff in gutter
Plug 'tpope/vim-commentary'                                       " Comment/Uncomment code
Plug 'tpope/vim-repeat'                                           " . for plugins
Plug 'tpope/vim-eunuch'                                           " vim sugar for the UNIX shell commands that need it the most.
Plug 'tpope/vim-surround'                                         " add surroundings to text (quotes, tags, brackets, etc.)
Plug 'tpope/vim-vinegar'                                          " enhance netrw, never look at nerdtree again
Plug 'tpope/vim-speeddating'                                      " increment dates, times, numerals & ordinal (C-A/C-X)
Plug 'tpope/vim-dispatch'                                         " async compile
Plug 'tpope/vim-fugitive'                                         " git in vim ❤️
Plug 'tpope/vim-rhubarb'                                          " github extension for fugitive
Plug 'tpope/vim-unimpaired'                                       " pairs of handy bracket mappings
Plug 'junegunn/gv.vim'                                            " git commit browser
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy finder
Plug 'junegunn/fzf.vim'                                           " fzf commands for vim
Plug 'junegunn/vim-slash'                                         " Improve in-buffer search
Plug 'tmhedberg/matchit'                                          " % matches more than single characters (e.g. tag matching)
Plug 'editorconfig/editorconfig-vim'                              " EditorConfig for vim, define coding styles b/w different editors & IDEs
Plug 'justinmk/vim-sneak'                                         " Vim motion plugin that jumps to any location specified by two characters (s{char}{char})
Plug 'vim-scripts/IndexedSearch'                                  " shows 'Nth match out of M' at every search
Plug 'nelstrom/vim-visual-star-search'                            " start a * or # search from a visual block
Plug 'thaerkh/vim-indentguides'                                   " display indention levels with thin vertical lines
Plug 'AndrewRadev/splitjoin.vim'                                  " gS to splig, gJ to join
Plug 'vim-airline/vim-airline'                                    " Lean & mean status/tabline
Plug 'vim-airline/vim-airline-themes'                             " Themes for airline
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }     " Async completion framework
Plug 'Shougo/neosnippet.vim'                                      " Snippet support for deoplete
Plug 'Shougo/neosnippet-snippets'                                 " Snippets for neosnippet
Plug 'janko-m/vim-test'                                           " Run tests from vim
Plug 'neomake/neomake'                                            " run programs asynchronously
Plug 'lxhillwind/leader-clipboard'                                " use <Leader> to access system clipboard in Vim
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}        " intellisense engine

" Color Schemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dylanaraps/wal.vim'


" Syntax highlighters, Pretty self-explanatory for the most part
Plug 'ap/vim-css-color'             " Shows colors defined in CSS & various pre-processor languages
Plug 'sheerun/vim-polyglot'         " Collection of language packs for vim, regularly updated
Plug 'gavocanov/vim-js-indent'      " Indenting from pangloss/vim-javascript
Plug 'othree/yajs.vim'              " Better syntax highlighting than ^^
Plug 'HerringtonDarkholme/yats.vim' " TypesSript highlighting

" vim niceties for various languages
Plug 'kewah/vim-stylefmt'
Plug 'docunext/closetag.vim'   " Autoclose HTML/XML tags
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ryanoasis/vim-devicons'  " Add icons to plugins

" Vimwiki
" Plug 'patrickdavey/vimwiki-1', { 'branch': 'dev' }
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

" Writing
Plug 'reedes/vim-pencil'             " Several improvements for writing prose
Plug 'reedes/vim-textobj-quote'      " Use curly quotes in vim
Plug 'kana/vim-textobj-user'         " Dependency for vim-textobj-quote
Plug 'junegunn/goyo.vim'             " Distraction-free writing
Plug 'junegunn/limelight.vim'        " Hyperfocus-writing

" Add plugins to &runtimepath
call plug#end()





"" MAIN SETTINGS
syntax on                           " Syntax highlighting
set encoding=utf-8
set showcmd                         " display incomplete commands
filetype plugin indent on           " load file type plugins + indentation
set number                          " show line numbers
set visualbell                      " No sounds
set autoread                        " Reload files changed outside vim
set cul                             " show cursor line
set relativenumber                  " default to relative numbers
set inccommand=nosplit              " live preview
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Cursor is pipe in Insert, block in Normal
let mapleader = ","                 " Use comma as leader
set cmdheight=1                     " Better display for messages
set shortmess+=c                    " suppress 'match x of y', 'The only match' and 'Pattern not found' messages
set signcolumn=yes                  " always show signcolumns
set fcs=eob:\                       " hide tilde sign on blank lines
set laststatus=2                    " always show status line

" Disable underline cursor
function s:SetCursorLine()
    set cursorline
    hi cursorline cterm=none
endfunction
autocmd VimEnter * call s:SetCursorLine()
" hi CursorLine ctermbg=7 ctermfg=0
" hi CursorLineNr ctermbg=7 ctermfg=0


" Swap file stuff. If you don't have one make an undodir in ~/.vim
" In terminal just type mkdir -p ~/.vim/undodir
set noswapfile
set hidden
set undofile
set undodir=~/.vim/undodir





"" Color scheme
colorscheme wal





" Make it obvious where 80 characters is
" (disabled due to syntax highlighting issues)
" cheatsheet https://jonasjacek.github.io/colors/
" highlight ColorColumn ctermbg=233 ctermfg=0
" let &colorcolumn=join(range(81,999),',')

"" Whitespace
set smartindent
set wrap linebreak nolist      " don't wrap lines
set breakindent                " sensible soft wrapping of lines
set tabstop=2 shiftwidth=2     " a tab is two spaces
set expandtab                  " use spaces, not tabs (optional)
set backspace=indent,eol,start " backspace through everything in insert mode
set conceallevel=0             " show all characters, all the time




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
" fzf.vim
nmap <Leader>; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <C-t> :FZF -m<CR>
nmap <C-p> :FZF -m<CR>

" vim-test
nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tv :TestVisit<CR>

" close current buffer
map <leader>d :bd<CR>

" Hotkey mapping to open the calendar pane
nnoremap <silent> <leader>C :Calendar<CR>
nnoremap <silent> <leader>G :Goyo<CR>

" Force saving files that require root permission
cnoremap w!! w !sudo tee > /dev/null %

" ripgrep
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --follow --glob "!.git/*" --glob "!.agignore" --glob "!.gitignore" --color "always" '.shellescape(<q-args>), 1, <bang>0)
nnoremap <silent> <leader>f :Find





"" PLUGIN SETTINGS

" Use JSX syntax in JS files
let g:jsx_ext_required = 0

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'

" FZF
let $FZF_DEFAULT_COMMAND = 'rg --hidden --ignore-file .agignore -l ""'
" let g:fzf_files_options = '--preview "(bat --color \"always\" --line-range 0:100 {} || head -'.&lines.' {})"'
" let g:fzf_files_options = '--preview "rougify {2..} | head -'.&lines.'"'
let g:fzf_files_options = '--preview "bat --color always --style numbers {2..} | head -'.&lines.'"'




" vim-signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']





"Completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" Deoplete
let g:deoplete#enable_at_startup = 1 " Auto start
let g:deoplete#enable_smart_case = 1 " Smart case
let g:deoplete#auto_complete_start_length = 2 " Stop bothering me
let g:deoplete#enable_refresh_always = 0 " Stop the weird sorting redraw
let g:deoplete#max_abbr_width = 0 " Allow for wide menu

set completeopt=longest,menuone

"use TAB as the mapping
inoremap <silent><expr> <TAB>
      \ pumvisible() ?  "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort ""
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction ""
inoremap <silent><expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" Sources:
let g:deoplete#sources = {}
let g:deoplete#ignore_sources = {}
let g:deoplete#sources.markdown = ['look']
" Ignore look in code files
let g:deoplete#ignore_sources.java = ['look', 'm']
let g:deoplete#ignore_sources['cs'] = ['look', 'm']
let g:deoplete#ignore_sources['javascript'] = ['look', 'm']
let g:deoplete#ignore_sources['rust'] = ['look', 'm']
let g:deoplete#ignore_sources['python'] = ['look', 'm']
let g:deoplete#ignore_sources['snippets'] = ['look', 'm']
let g:deoplete#ignore_sources['sh'] = ['look', 'm']
let g:deoplete#ignore_sources['go'] = ['look', 'm']
let g:deoplete#ignore_sources['pug'] = ['look', 'm']
let g:deoplete#ignore_sources['css'] = ['look', 'm']
let g:deoplete#ignore_sources['html'] = ['look', 'm']
let g:deoplete#ignore_sources['log'] = ['look', 'm']

set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags

" Snippets
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" coc.nvim
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lr <Plug>(coc-references)
nmap <silent> <leader>li <Plug>(coc-implementation)

" Ale
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'jsx': ['eslint'],
\ 'css': ['stylelint']
\}

let g:ale_fixers = {
\ 'javascript': ['eslint', 'prettier'],
\ 'jsx': ['eslint', 'prettier'],
\ 'css': ['stylelint']
\}

let g:ale_virtualenv_dir_names = []
let g:ale_cache_executable_check_failures = 1
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1

let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0

" Enable completion where available.
" This setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1

" vim-test
let g:neomake_open_list = 1
let g:test#strategy = 'neomake'
let g:neomake_warning_sign = {
  \   'text': '◉'
  \ }

let g:neomake_error_sign = {
  \   'text': '◉'
  \ }

" vimwiki
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_conceallevel = 0
let g:vimwiki_folding='custom' "this allows the folding to work for markdown

let g:vimwiki_list = [{
  \ 'nested_syntaxes': {
  \   'javascript': 'javascript',
  \   'bash': 'sh',
  \   'vim': 'vim',
  \  },
  \ 'auto_tags': 1,
  \ 'auto_toc': 1,
  \ 'list_margin': 2,
  \ 'auto_export': 1,
  \ 'automatic_nested_syntaxes': 1,
  \ 'maxhi': 1,
  \ 'template_default': 'default',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'path': '~/vimwiki/',
  \ 'template_path': '~/vimwiki/templates/',
  \ 'path_html': '~/vimwiki/site_html/',
  \ 'custom_wiki2html': 'vimwiki_markdown',
  \ 'template_ext': '.tpl',
  \ 'diary_rel_path': 'journal/',
  \ 'diary_index': 'index',
  \ 'diary_header': 'Journal'
  \ }]

" Switch to two spaces after a period for prose.
let g:goyo_width = 100
let g:pencil#joinspaces = 1
 " Color defs, for default dracula
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" IndentGuide
let g:indentguides_ignorelist = ['text', 'json', 'md', 'wiki', 'vimwiki']

" Show message that tests have started
function! MyOnNeomakeJobStarted() abort
  echom printf('🔮 Running tests...')
endfunction

" Show message when all tests are passing
function! MyOnNeomakeJobFinished() abort
  let context = g:neomake_hook_context
  if context.jobinfo.exit_code == 0
    echom printf('🧙 All tests passed ')
  endif
  if context.jobinfo.exit_code == 1
    echom printf('🤬 Failing tests')
  endif
endfunction

augroup my_neomake_hooks
  au!
  autocmd User NeomakeJobFinished call MyOnNeomakeJobFinished()
  autocmd User NeomakeJobStarted call MyOnNeomakeJobStarted()
augroup END

" Filetype specific config
augroup write_mode
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType vimwiki call textobj#quote#init()
  autocmd WinEnter,BufEnter * if &ft == "markdown" || &ft == "vimwiki" | call pencil#init({'wrap': 'soft'}) | set sbr= | endif
augroup END

" Turn on Limelight when Goyo is enabled
autocmd! User GoyoEnter  SignifyDisable | set nocursorline | Limelight
autocmd! User GoyoLeave SignifyEnable | Limelight!

" Allow vim to edit crontab files
au BufNewFile,BufRead crontab.* set nobackup | set nowritebackup

" airline

let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii=1
let g:airline#extensions#ale#enabled=1
