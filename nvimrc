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
Plug 'vim-scripts/Align'                                          " It's in the name: align text, declarations, pretty much anything
Plug 'jiangmiao/auto-pairs'                                       " Auto-inserts closing characters when applicable
Plug 'ntpeters/vim-better-whitespace'                             " Highlight trailing whitespace characters
Plug 'airblade/vim-gitgutter'                                     " git diff in gutter
Plug 'tpope/vim-commentary'                                       " Comment/Uncomment code
Plug 'tpope/vim-repeat'                                           " . for plugins
Plug 'tpope/vim-eunuch'                                           " vim sugar for the UNIX shell commands that need it the most.
Plug 'tpope/vim-surround'                                         " add surroundings to text (quotes, tags, brackets, etc.)
Plug 'tpope/vim-vinegar'                                          " enhance netrw, never look at nerdtree again
Plug 'tpope/vim-speeddating'                                      " increment dates, times, numerals & ordinal (C-A/C-X)
Plug 'tpope/vim-dispatch'                                         " async compile
Plug 'tpope/vim-fugitive'                                         " git in vim ❤️
Plug 'tpope/vim-rhubarb'                                          " github extension for fugitive
Plug 'idanarye/vim-merginal'                                      " TUI for managing git branches
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
Plug 'janko-m/vim-test'                                           " Run tests from vim
Plug 'neomake/neomake'                                            " run programs asynchronously
Plug 'lxhillwind/leader-clipboard'                                " use <Leader> to access system clipboard in Vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}                   " intellisense engine
Plug 'w0rp/ale'                                                   " Async code linting
Plug 'liuchengxu/vista.vim'                                       " Viewer & Finder for LSP symbols and tags


" statusline
" https://gist.github.com/sainnhe/b8240bc047313fd6185bb8052df5a8fb
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'maximbaz/lightline-ale'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'sainnhe/artify.vim'

" Color Schemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'dylanaraps/wal.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'


" Syntax highlighters, Pretty self-explanatory for the most part
Plug 'ap/vim-css-color'             " Shows colors defined in CSS & various pre-processor languages
Plug 'sheerun/vim-polyglot'         " Collection of language packs for vim, regularly updated
" Plug 'gavocanov/vim-js-indent'      " Indenting from pangloss/vim-javascript
" Plug 'othree/yajs.vim'              " Better syntax highlighting than ^^
" Plug 'HerringtonDarkholme/yats.vim' " TypesSript highlighting
" Plug 'mxw/vim-jsx'                  " JSX highlighting

" vim niceties for various languages
Plug 'kewah/vim-stylefmt'
Plug 'docunext/closetag.vim'   " Autoclose HTML/XML tags
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'ryanoasis/vim-devicons'  " Add icons to plugins

" Vimwiki
" Plug 'patrickdavey/vimwiki-1', { 'branch': 'dev' }
Plug 'vimwiki/vimwiki'
" Plug 'mattn/calendar-vim'

" Writing
Plug 'reedes/vim-pencil'             " Several improvements for writing prose
Plug 'reedes/vim-textobj-quote'      " Use curly quotes in vim
Plug 'kana/vim-textobj-user'         " Dependency for vim-textobj-quote
Plug 'junegunn/goyo.vim'             " Distraction-free writing
Plug 'junegunn/limelight.vim'        " Hyperfocus-writing

" Ledger
Plug 'ledger/vim-ledger'
Plug 'anekos/hledger-vim'

" Add plugins to &runtimepath
call plug#end()




"" MAIN SETTINGS
syntax enable                       " Syntax highlighting
set encoding=utf-8
set showcmd                         " display incomplete commands
filetype plugin indent on           " load file type plugins + indentation
set number                          " show line numbers
set visualbell                      " No sounds
set autoread                        " Reload files changed outside vim
set relativenumber                  " default to relative numbers
set inccommand=nosplit              " live preview
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Cursor is pipe in Insert, block in Normal
let mapleader = ","                 " Use comma as leader
set cmdheight=1                     " Better display for messages
set shortmess+=c                    " suppress 'match x of y', 'The only match' and 'Pattern not found' messages
set signcolumn=yes                  " always show signcolumns
set fcs=eob:\                       " hide tilde sign on blank lines
set laststatus=2                    " always show status line
set noshowmode                      " don't display the mode you're in. since it's already shown on the statusline
set noruler                         " disable line/column number in status bar
set updatetime=300

" Some coc.nvim servers have issues with backup files
set nobackup
set nowritebackup

" Disable underline cursor
function! s:SetCursorLine()
    set nocursorline
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
colorscheme nord

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif



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
nmap <Leader>g :GF?<CR>
nmap <Leader>v :Vista!!<CR>
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

" Nuake
nnoremap <Bslash> :Nuake<CR>



"" PLUGIN SETTINGS

" hledger
autocmd FileType hledger setlocal omnifunc=hledger#complete#omnifunc

" Close netrw buffers; vinegar creates an issue where these buffers can't be deleted
" https://codeyarns.com/2015/02/02/cannot-close-buffer-of-netrw-in-vim/
autocmd FileType netrw setl bufhidden=wipe

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'

" FZF
" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_COMMAND = 'rg --hidden --ignore-file .agignore -l ""'
let $FZF_DEFAULT_OPTS='--layout=reverse --prompt "▲ "'
let g:fzf_files_options = '--preview "bat --style numbers {2..} | head -'.&lines.'"'

" Using the custom window creation function
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

" Function to create the custom floating window
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction


" ripgrep
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --follow --glob "!.git/*" --glob "!.rgignore" --glob "!.gitignore" --color "always" '.shellescape(<q-args>), 1, <bang>0)

nnoremap <silent> <leader>f :Find

" Hide line number in fzf
au FileType fzf set nonu nornu

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'CursorLine'],
  \ 'bg':      ['bg', 'CursorLine'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" vim-signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']




" Ale
" specify some specific ale linter sources, rest are using defaults
let g:ale_sign_error = "\uf057"
let g:ale_sign_warning = "\uf071"

let g:ale_linters = {
\   'javascript': ['stylelint', 'eslint', 'prettier'],
\   'javascriptreact': ['stylelint', 'eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\   'typescriptreact': ['eslint', 'prettier'],
\   'css': ['stylelint']
\ }
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'javascriptreact': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\   'typescriptreact': ['eslint', 'prettier'],
\   'css': ['stylelint'],
\}


" Javascript / React improved highlighting/indentation
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

" Move between linting errors
nnoremap <silent> ]r :ALENextWrap<CR>
nnoremap <silent> [r :ALEPreviousWrap<CR>

" Move between GitGutterHunks
nnoremap <silent> ]h :GitGutterNextHunk<CR>
nnoremap <silent> [h :GitGutterPrevHunk<CR>

" coc.nvim
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>ly <Plug>(coc-type-definition)
nmap <silent> <leader>lr <Plug>(coc-references)
nmap <silent> <leader>li <Plug>(coc-implementation)

" Remap for rename current word
nnoremap <leader>rn <Plug>(coc-rename)

" Documentation on hover
autocmd CursorHold * silent if ! coc#util#has_float()
      \| call CocActionAsync('doHover')
      \| endif

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


" coc.nvim color changes
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

" vim-test
let g:neomake_open_list = 1
let g:test#strategy = 'neomake'
let g:test#javascript#jest#options = '--reporters ~/.config/yarn/global/node_modules/jest-vim-reporter/index.js'
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

" Vista
let g:vista#renderer#enable_icon = 1

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
autocmd! User GoyoEnter set nocursorline | Limelight
autocmd! User GoyoLeave Limelight!

" Lightline
" https://github.com/sainnhe/dotfiles/blob/b669e364a68acb850f03cdd71ad628b5a504b210/.config/nvim/init.vim#L762-L954
function! TmuxBindLock() abort
    if filereadable('/tmp/.tmux-bind.lck')
        return "\uf13e"
    else
        return "\uf023"
    endif
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! Devicons_Filetype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' : "\uf059 ") : ''
endfunction

function! Devicons_Fileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

augroup lightlineCustom
    autocmd!
    autocmd WinEnter,BufEnter * call lightline_gitdiff#query_git() | call lightline#update()
augroup END

function! NearestMethodOrFunction() abort
   return !empty(get(b:, 'vista_nearest_method_or_function', '')) ? '  '.b:vista_nearest_method_or_function : ''
 endfunction

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:lightline = {}
let g:lightline.colorscheme = 'nord'
let g:lightline.separator = { 'left': "\ue0b0", 'right': "\ue0b2" }
let g:lightline.subseparator = { 'left': "", 'right': "" }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf057"
let g:lightline#ale#indicator_ok = "\uf7d0"
let g:lightline_gitdiff#indicator_added = '+'
let g:lightline_gitdiff#indicator_deleted = '-'
let g:lightline_gitdiff#indicator_modified = '~'
let g:lightline.active = {
            \ 'left':  [ [ 'gbranch', 'gitstatus' ],
            \            [ 'readonly', 'relativepath', 'devicons_filetype', 'modified' ],
            \            [ 'paste' ] ],
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
            \            [ 'method' ],
            \            [ 'asyncrun_status', 'coc_status' ] ]
            \ }
let g:lightline.inactive = {
            \ 'left':  [ [ 'filename' , 'devicons_filetype' ]],
            \ 'right': [ [ 'lineinfo' ] ]
            \ }
let g:lightline.component = {
            \ 'gitstatus' : '%{lightline_gitdiff#get_status()}',
            \ 'gbranch': "\ue725 %{gitbranch#name()}",
            \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
            \ 'tmuxlock': '%{TmuxBindLock()}',
            \ 'vim_logo': "\ue7c5",
            \ 'mode': '%{lightline#mode()}',
            \ 'absolutepath': '%F',
            \ 'relativepath': '%f',
            \ 'filename': '%t',
            \ 'filesize': "%{HumanSize(line2byte('$') + len(getline('$')))}",
            \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
            \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
            \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
            \ 'modified': '%M',
            \ 'bufnum': '%n',
            \ 'paste': '%{&paste?"PASTE":""}',
            \ 'readonly': '%R',
            \ 'charvalue': '%b',
            \ 'charvaluehex': '%B',
            \ 'percent': '%2p%%',
            \ 'percentwin': '%P',
            \ 'spell': '%{&spell?&spelllang:""}',
            \ 'lineinfo': '%3l:%-2v',
            \ 'line': '%l',
            \ 'column': '%c',
            \ 'close': '%999X X ',
            \ 'winnr': '%{winnr()}'
            \ }
let g:lightline.component_function = {
            \ 'gitbranch': 'gitbranch#name',
            \ 'devicons_filetype': 'Devicons_Filetype',
            \ 'devicons_fileformat': 'Devicons_Fileformat',
            \ 'coc_status': 'coc#status',
            \ 'coc_currentfunction': 'CocCurrentFunction',
            \ 'method': 'NearestMethodOrFunction'
            \ }
let g:lightline.component_expand = {
            \ 'linter_checking': 'lightline#ale#checking',
            \ 'linter_warnings': 'lightline#ale#warnings',
            \ 'linter_errors': 'lightline#ale#errors',
            \ 'linter_ok': 'lightline#ale#ok',
            \ 'asyncrun_status': 'lightline#asyncrun#status'
            \ }
let g:lightline.component_type = {
            \ 'linter_checking': 'middle',
            \ 'linter_warnings': 'warning',
            \ 'linter_errors': 'error',
            \ 'linter_ok': 'middle'
            \ }
let g:lightline.component_visible_condition = {
            \ 'gitstatus': 'lightline_gitdiff#get_status() !=# ""'
            \ }
let g:lightline.component_function_visible_condition = {
            \ 'coc_status': 'g:vimMode ==# "complete"',
            \ 'coc_current_function': 'g:vimMode ==# "complete"'
            \ }
