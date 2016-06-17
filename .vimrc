" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

syntax enable
"------- Encoding settings -------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,big5,latin1

" Include plugins file
so ~/.vim/plugins.vim

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
"Let's activate line numbers.
set nonumber
"Set our desired autocompletion matching.
set complete=.,w,b,u
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
" tab = 4 spaces
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4


"-------------Visuals--------------"
colorscheme monokai
colorscheme atom-dark-256
"colorscheme vividchalk
" Use 256 colors. This is useful for Terminal Vim.
set t_CO=256
set lazyredraw

"SHOW TABS, EOL, Trailing spaces
set list
set listchars=tab:▸\ ,trail:·

" line number
set number

"Hide borders
"hi vertsplit ctermfg=bg ctermbg=bg

" Statusline appear all the time
set laststatus=2

" Vertical Line
if exists('+colorcolumn')
  highlight ColorColumn ctermbg=7
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


"-------------Search--------------"
" Highlight all matched terms.
set hlsearch
" Incrementally highlight, as we type.
set incsearch

"-------------Split Management--------------"
"Make splits default to below...
set splitbelow
"And to the right.
set splitright

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


"-------------Mappings--------------"

" Fuck off arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>:85<cr>
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>
nmap <Leader>es :e ~/.vim/snippets/

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Quickly browse to any tag/symbol in the project.
"Tip: run ctags -R to regenerated the index.
nmap <Leader>f :tag<space>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"Strip trailing spaces throughout an entire file
nmap <Leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

nmap <Leader>ln :setlocal number!<CR>

nmap <Leader>o :set paste!<CR>

" Mappings to access buffers
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>



"-------------Plugins--------------"

"/
"/ Airline
"/

"               Install Powerline Fonts
"=====================================================
"  git clone https://github.com/powerline/fonts.git
"  cd fontd
"  ./install.sh
"=====================================================
" In Terminal use poweline fonts like 'Meslo LG L DZ for Powerline' (or else)
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0

"/
"/ CtrlP
"/
"let g:ctrlp_custom_ignore = 'git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

nmap <D-p> :CtrlP<cr>
nmap <C-t> :CtrlPBufTag<cr>
nmap <C-e> :CtrlPMRUFiles<cr>

"/
"/ Greplace.vim
"/

" Use Ag for the search.
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/ vim-php-cs-fixer.vim
"/
let g:php_cs_fixer_level = "psr2"

nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"/
"/ pdv
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

"/
"/ Ultisnips
"/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"/
"/ NERDTree
"/
nmap <leader>n :NERDTreeToggle<CR>

"-------------Laravel-Specific--------------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :CtrlP<cr>app/
nmap <Leader><Leader>v :e resources/views/<cr>

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

"-------------Functions------------------"

function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

