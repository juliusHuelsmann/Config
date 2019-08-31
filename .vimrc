"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plugin Managers                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" XXX:  ALE: better syntastic
"       FZF: better CMD + p
"
" mkdir -p ~/.vim/pack/git-plugins/start
" git clone https://github.com/w0rp/ale.git ~/.vim/pack/git-plugins/start/ale

nnoremap <silent> j gj
nnoremap <silent> k gk

"""""""""""
"  Vundle "
"""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Here is the place for new plugins!
" 1: nerdtree
" 2: nerdtree tabs
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
Plugin 'vim-latex/vim-latex'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'

" Display methods and class variables
Plugin 'majutsushi/tagbar'
"Plugin 'https://git.llvm.org/git/llvm'
" https://git.llvm.org/git/llvm
"Plugin 'llvm-mirror/lldb'

"" not that relevant Plugin 'ervandew/supertab'

Plugin 'octol/vim-cpp-enhanced-highlight'
" Plugin for php autocomplete suppot for projects
"Plugin 'shawncplus/phpcomplete.vim'

" Plugin for changing the color of the inactive buffers
" Plugin 'blueyed/vim-diminactive'

" color gedoens
Plugin 'morhetz/gruvbox'
Bundle 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"semantic highlighting
Plugin 'jaxbot/semantic-highlight.vim'

" live
" Plugin 'shime/vim-livedown'
" XXX: use an alternative
" https://github.com/joeyespo/grip
" https://github.com/yoshuawuyts/vmd
" https://github.com/ianks/octodown
Plugin 'ianks/octodown'

" git gutter 
Plugin 'gitgutter/Vim'


"
" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'




" solidity blcokcina.
Plugin 'tomlion/vim-solidity'

" Optional:
" Plugin 'honza/vim-snippets'

" assuming you want to use snipmate snippet engine

"
" Information on how to add plugins:
"
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Plugin 'git://git.wincent.com/command-t.git'
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

call vundle#end()            " required
filetype plugin indent on    " required


" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just 
"                     :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to 
"                     auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Livedown:                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:livedown_autorun=1
"let g:livedown_open = 1
"let g:livedown_port = 1337
"let g:livedown_browser = "chromium-browser"
 








"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Utility functions:                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" original setting: <Leader> = \.
let mapleader=","
let mallocalleader=";"

" <CMD>+ww is used for switching from nerdtree the text window.
" let's change that.
"map <leader>ww <Ctrl>ww
noremap <Leader>n <plug>NERDTreeTabsToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=


set tw=99
set nowrap "don't automatically wrap on load
set fo-=t  "don't automatically wrap text when typing.

" separate lines into entire paragraph such that the lenght of the lines
" is leq 80 characters.
vnoremap Q gq
nnoremap Q gqap




map <C-i> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-i> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

" Useful settings
set history=700
set undolevels=700

" interesting stuff:
" for automatically reloading changes in vimrc
autocmd! bufwritepost .vimrc source %


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" boring std clipboard
" set clipboard=unnamed

" standard behavior of backspace key (whatever that means)
" set bs=2

" Make search case insensitive
"" set hlsearch
"" set incsearch
"" set ignorecase
"" set smartcase
set infercase       " the completion recognizes capitalization.
set incsearch       " search while typing 
set wildmenu        " show completions @ cl
set suffixes+=.pyc
set suffixes+=.a
set suffixes+=.ipynb


" Disable backup and swap files in case they trigger too many events
" for file system watchers
"" set nobackup
"" set nowritebackup
"" set noswapfile






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""     Movement:  windows, tabs, files   """""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <C-g> <Plug>IMAP_JumpForward
nnoremap <C-g> <Plug>IMAP_JumpForward
let g:C_Ctrl_j = 'off'
noremap <c-j> <c-w>j
nnoremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
noremap <leader>c :noh<CR>

"nmap j gj                   " finally found this! 'natural' j for linewrap .
"nmap j gj                   " finally found this! 'natural' j for linewrap .
                             " but something sucks a lot while using folds..
"nmap k gk

" Tabs:		move between tabs 
"		by pressing <Ctrl>+nm
noremap <c-n> <esc>:tabprevious<CR>
noremap <c-m> <esc>:tabnext<CR>

" TODO: open tab :newtab
" TODO: Close tab
" TODO: : find in files more easily
" TODO: Ctrl+N for autocomplete
" TODO: spell checker 


" Move between open buffers.
nmap <C-E> :e#<CR>     " move to last opened buff (eg.following stuff in ctags) 
" XXX: this command sucked.  like it overwrites tab prev.
" nmap <C-n> :bnext<CR>  " move to next open buff (round), e, g, after C-e
nmap <C-e> :bprev<CR>  " move to previous "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Coding Conventions                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general stuff "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch

" anmeldung "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                     UTILS                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Search for the word under the cursor in the current directory
"nmap <C-k>    mo:Ack! "\b<cword>\b" <CR>
"nmap <Esc>k   mo:Ack! "\b<cword>\b" <CR>
"nmap <M-S-k>  mo:Ggrep! "\b<cword>\b" <CR>
"nmap <Esc>K   mo:Ggrep! "\b<cword>\b" <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Programs and Languages                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""
"    LATEX Latex latex   "
""""""""""""""""""""""""""

" makes vim invoke latex suite when opening tex file
filetype plugin on

" set shellslash " i think this is not required so i dont use it

" grep sometimes skips displaying the filename if searching in a
" single file. This will confuse Latexsuite. Set up grep program
" to always generate a filename
set grepprg=grep\ -nH\ $*

" auto indent
filetype indent on

" load vimlatex even in empty .tex file
let g:tex_flavor='latex'

" This causes the instnat markdown not to be 
" that instant for saving battery power.
let g:instant_markdown_slow = 1


""""""""""""""""""""""""""
"  PYTHON python Python  "
""""""""""""""""""""""""""

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
"" set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
"" let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=*/coverage/*


" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
"" let g:jedi#usages_command = "<leader>z"
"" let g:jedi#popup_on_dot = 0
"" let g:jedi#popup_select_first = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"" set nofoldenabl





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Appearance                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show whitespace (MUST be inserted BEFORE the colorscheme command)
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/
" The following alternative may be less obtrusive.
:highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
" Try the following if your GUI uses a dark background.
":highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen  
" Show trailing whitespace:
:match ExtraWhitespace /\s\+$/

" Show trailing whitespace and spaces before a tab:
:match ExtraWhitespace /\s\+$\| \+\ze\t/

" Show tabs that are not at the start of a line:
:match ExtraWhitespace /[^\t]\zs\t\+/

" Show spaces used for indenting (so you use only tabs for indenting).
:match ExtraWhitespace /^\t*\zs \+/
" Switch off :match highlighting.
":match

" display tabs
set list
set listchars=tab:>-



" This colorscheme has been adapted by me for adapting the blue lines for
" the display of my x230. 
"colorscheme corporation_modified


" XXX: both in for normal
colorscheme blaquemagick 
colorscheme hybrid
" high contrast
" colorscheme harlequin " this is the 
"colorscheme lucius
"LuciusWhite

"## best
">>>>> blaquemagick
">>>> strage
">>>> moonscape
"
"
"# best colorful
">>>>> hybrid
">>>> spartan
">>> bubblegum
">>> genericdc
">>>> alduin
">>off
"colorscheme skull
" off


"highlight LineNr ctermfg=12
"highlight ColorColumn ctermbg=0 

"
" enable relative numbering
set relativenumber
set number

" 
" max line width
set colorcolumn=100
"match ErrorMsg '\%>80v.\+'






" color of the currently active buffer.
"
"

function! OpenNerdTree()
      NERDTreeTabsToggle
      :execute "normal! \<C-w>l"
endfunction


"
" Startup function:
"   (1) start NERDTre
"   (1) start NERDTreee
  function! BehaviorOnStartup()

    if @% == ""
      " No filename for current buffer
      call OpenNerdTree()
    elseif filereadable(@%) == 0
      " File doesn't exist yet
      call OpenNerdTree()
    elseif line('$') == 1 && col('$') == 1
      " File is empty
    endif
  endfunction


  function! Execute() 

    let file = expand('%:p')
    let splitForEnding = split(file, '\.')


    if len(splitForEnding)

      let ending = splitForEnding[-1]

      if ending == "py" 

        echom "Execute python on that file."
        execute '!python3 '. file

      elseif ending == "tex" 
        echom "execute pdflatex"
        execute '!pdflatex ' . file
      
      elseif executable(file)
        execute "!" . file
      else 
        execute '!./cexec.sh'
        ":!clear<CR>:!./cexec.sh<CR>
        echom "Falling back to cexec"
      endif
    endif
  endfunction

  function! GetHeader() 

    let file = expand('%:p')
    "let file = expand('%')
    let splitForEnding = split(file, '\.')


    if len(splitForEnding)

      let ending = splitForEnding[-1]
      let rec = ""

      if ending == "h" || ending == "hpp"

        let newFile = join(splitForEnding[0:-2])
        let newFile = join([newFile,".cpp"], "")
        "echom "Looking for cpp file" newFile


        let rec = ReconstructFile(newFile, "/include/", "/src/")
        "echom "reconstructed " rec  
        "echom "hier " newFile
      elseif ending == "c" || ending == "cpp" 


        let newFile = join(splitForEnding[0:-2])
        let newFile = join([newFile,".h"], "")
        "echom "Looking for h file" newFile


        let rec = ReconstructFile(newFile, "/src/", "/include/")
        "echom "reconstructed " rec 

      else 
        echom "Sorry, the corresponding file could not be found."
        return
      endif

        "join([rec, ""], "")
        "echom "recovered" rec
        "
        if (filereadable(rec))

          return fnameescape(rec) 
        else 
          echom "Sorry, the corresponding file could not be found."
          return
        endif
    endif
  endfunction

  nnoremap <Leader>o :call OpenHeader() <CR>

  function! ReplaceWithHeader() 
    let name = GetHeader()
    if len(name)
      :execute "e " . name 
    endif

    return
  endfunction

  function! OpenHeader() 
    let name = GetHeader()

    if len(name)
      vsp
      :execute "e " . name 
    endif

    return
  endfunction

  nnoremap <leader>o :call OpenHeader() <CR>
  nnoremap <leader>r :call ReplaceWithHeader() <CR>
  function! ReconstructFile(str, find, replace)

    let str = a:str
    let find = a:find
    let replace = a:replace
    let verbose = 0

    " Replace string in the following form: /include/
    
    " 1) Replace last find
    " 2) Check if valid -> return
    " 3) Remove last find  -> call ReconstructFile(str-, find, replace) 


    " reverse all strings
    let str =  join(reverse(split(str, '.\zs')), '')
    let findRev =  join(reverse(split(find, '.\zs')), '')
    let replRev = join(reverse(split(replace, '.\zs')), '')
    let voidReplacement ='/'

  
    let replRev0 = replRev .  substitute(replRev, "/", "", "")
    " corner case for 2 src
    let p0Rev =substitute(str, findRev, replRev0, "")
    let p0 = join(reverse(split(p0Rev, '.\zs')), '')
    if filereadable(p0)
      if verbose
        echom "found " p0
      endif
      return p0
    endif

    let p1Rev =substitute(str, findRev, replRev, "")
    let p1 = join(reverse(split(p1Rev, '.\zs')), '')
    if filereadable(p1)
      if verbose
        echom "found " p1
      endif
      return p1
    endif

    
    let p2Rev = substitute(str, findRev, voidReplacement, "")

    " corner case: not replaceable
    if p2Rev == str

      if verbose
        echom "interrupt "  
      endif
      return ""
    endif

    let p2 = join(reverse(split(p2Rev, '.\zs')), '')
    if verbose
      echom "recursion " p2
    endif
    return ReconstructFile(p2, find, replace) 

  endfunction


  inoremap <Leader>s :sort<CR>

  "
  " syntax highlighting
  syntax on






  "
  " syntastic
  "

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_cpp_compiler = 'clang++'
  let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

  let g:syntastic_cpp_checkers = ['gcc']
  let g:syntastic_cpp_compiler = 'gcc'
  let g:syntastic_cpp_compiler_options = '-std=c++14'

  let g:syntastic_cpp_check_header = 1
  let g:syntastic_cpp_auto_refresh_includes = 1

  "set statusline+=%#warningmsg#
  "set statusline+=%{SyntasticStatuslineFlag()}
  " set statusline+=%*
  " for enabling syntastic wiht ycm enabled
  "XXX:
  "let g:ycm_show_diagnostics_ui = 0 


  " vimlatex
  "REQIRED. This makes vim invoke Latex-Suite when you open a tex file.
  filetype plugin on

  set shellslash
  "
  " " IMPORTANT: grep will sometimes skip displaying the file name if you
  " " search in a singe file. This will confuse Latex-Suite. Set your grep
  " " program to always generate a file-name.
  set grepprg=grep\ -nH\ $*
  "
  " " OPTIONAL: This enables automatic indentation as you type.
  filetype indent on
  "
  " " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
  " " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
  " " The following changes the default filetype back to 'tex':
  let g:tex_flavor='latex'
  let g:Tex_DefaultTargetFormat='pdf'

  noremap <Leader>lr <Leader>ll<CR>:e#<CR>


  set wildignore+=*.a,*.o
  set wildignore+=*.png,*.jpg,*.gif
  set wildignore+=.git,*.DS_Store
  set wildignore+=*~,*.swp,*.tmp


  " turn on the ability to use project specific vimrc files
  " disable unsafe commands 
  set exrc
  set secure 


  " re php-tag folder
  noremap <Leader>rc :!<space>phpctags<space>-R<CR> 

  :hi ColorColumn ctermbg=black


  " resize the split
  "nnoremap <silent> h- :<C-U>exe "resize " . (winheight(0)  - 5 * v:count1)<CR>
  "nnoremap <silent> h+ :<C-U>exe "resize " . (winheight(0)  + 5 * v:count1)<CR>
  nnoremap <silent> -h :<C-U>exe "resize " . (winheight(0)  - 5 * v:count1)<CR>
  nnoremap <silent> +h :<C-U>exe "resize " . (winheight(0)  + 5 * v:count1)<CR>

  "nnoremap <silent> v+ :<C-U>exe "vertical resize " . (winwidth(0) + 5 * v:count1)<CR>
  "nnoremap <silent> v- :<C-U>exe "vertical resize " . (winwidth(0) - 5* v:count1)<CR>

  nnoremap <silent> +v :<C-U>exe "vertical resize " . (winwidth(0) + 5 * v:count1)<CR>
  nnoremap <silent> -v :<C-U>exe "vertical resize " . (winwidth(0) - 5* v:count1)<CR>

  " open fold while using space in normal mode
  nnoremap <space> za
  "
  set showmatch

  " wrap the displaying of lines
  set wrap 

  noremap <Leader>- ddp
  noremap <Leader>_ ddkP 

  set timeoutlen=500

  " edit vimrc and apply vimrc (resp. source vimrc)
  nnoremap <leader>ev :vsplit $MYVIMRC<cr>
  nnoremap <leader>sv :source $MYVIMRC<cr>

  iabbrev adn and
  iabbrev @@ huelsmann@campus.tu-berlin.de

  nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
  nnoremap <leader>$ viW<esc>a$<esc>hBi$<esc>lel
  nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
  nnoremap <leader>` viw<esc>a`<esc>hbi`<esc>lel
  nnoremap <leader>h viw<esc>a`<esc>hbi`<esc>lel

  nnoremap <leader>2" viW<esc>a"<esc>hBi"<esc>lel
  nnoremap <leader>#' viW<esc>a'<esc>hBi'<esc>lel
  nnoremap <leader>H viW<esc>a`<esc>hBi`<esc>lel

  inoremap jk <esc>
  "vnoremap jk <esc> " not considered useful
  " XXX: remove this, like a lot of commands
  " tend to use <esc>...
  "
  
  "inoremap <esc> <nop>
  "noremap <Left> <nop>
  "noremap <Right> <nop>
  "noremap <Up> <nop>
  "noremap <Down> <nop>

  "set statusline +=%f\ %=%c/80\ %l/%L
  "set statusline +=%t\ %=%c/80\ %l/%L



  " Highlight all instances of word under cursor, when idle.
  " Useful when studying strange source code.
  " Type z/ to toggle highlighting on/off.
  nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
  function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
      au! auto_highlight
      augroup! auto_highlight
      setl updatetime=4000
      echo 'Highlight current word: off'
      return 0
    else
      augroup auto_highlight
        au!
        au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
      augroup end
      setl updatetime=500
      echo 'Highlight current word: ON'
      return 1
    endif
  endfunction





  nnoremap <Leader>o :call OpenHeader() <CR>
  noremap <Leader>E :!clear<CR>:!./cexec.sh<CR>
  noremap <Leader>e :call Execute()<CR>
  noremap <Leader>m :!clear<CR>:!make<CR><CR>
  " XXX:
  "let g:enable_ycm_at_startup = 0


  " XXX: vim enter: make vertical alignment for i3, call qutebrowser, open new
  " window with the output of octodown --live-reload
  autocmd VimEnter *.{md,mdpp} let b:dispatch = 'octodown --live-reload %'
  autocmd BufReadPre,FileReadPre *.{cpp,php,h} :TagbarOpen


  "let s:semanticGUIColors = [ '#72d572', '#c5e1a5', '#e6ee9c', '#fff59d', '#ffe082', '#ffcc80', '#ffab91', '#bcaaa4', '#b0bec5', '#ffa726', '#ff8a65', '#f9bdbb', '#f9bdbb', '#f8bbd0', '#e1bee7', '#d1c4e9', '#ffe0b2', '#c5cae9', '#d0d9ff', '#b3e5fc', '#b2ebf2', '#b2dfdb', '#a3e9a4', '#dcedc8' , '#f0f4c3', '#ffb74d' ]
  "let g:semanticTermColors = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 ,14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58]
  "


  autocmd VimResized * wincmd =  | let NERDTreeWinSize = 1
  autocmd BufEnter * wincmd = | let NERDTreeWinSize = 1
  "folds

  " normally every fold is open
  "set foldmethod=syntax
  " set foldmethod=indent " specified in vimenter
  auto BufRead * normal zR
  nnoremap <leader>ff :%g ) {/ normal! zf%


  nnoremap <leader>w :w<space>!sudo<space>tee<space>% <CR>



  " Sytnastics replacment
  let g:ale_sign_column_always = 1
  let g:ale_sign_error = '>>'
  let g:ale_sign_warning = '--'


  nnoremap <leader>tn :tabnew<CR>:NERDTree<CR><c-w>l
  nnoremap <leader>x :%!xxd<CR> 

"  set cursorline
"  set cursorcolumn

  set foldmethod=indent


  " open Tree only in case the vimenter is performed on an empty file
  autocmd VimEnter * call BehaviorOnStartup() 
  autocmd VimEnter *.{cpp,hpp,c,h,php,java,py,md,tex} call OpenNerdTree() 

" vin autocommands for changing the layout of 
autocmd VimEnter,WinEnter,BufWinEnter,FocusGained,CmdwinEnter * silent :setlocal syntax=ON | setlocal cursorline cursorcolumn
autocmd WinLeave,Bufleave,FocusLost,CmdwinLeave * silent :setlocal foldmethod=manual|  :setlocal syntax=off | setlocal nocursorline nocursorcolumn 
autocmd WinLeave,FocusLost,CmdwinLeave NERD_tree* :set syntax=ON | setlocal nocursorline nocursorcolumn 
autocmd WinLeave,FocusLost,CmdwinLeave ControlP :set syntax=ON | setlocal nocursorline nocursorcolumn 
autocmd WinLeave,FocusLost,CmdwinLeave __Tagbar__* :set syntax=ON | setlocal nocursorline nocursorcolumn 

autocmd VimEnter,WinEnter,BufWinEnter,FocusGained,CmdwinEnter * silent :setlocal syntax=ON | setlocal cursorline cursorcolumn
autocmd VimEnter,WinEnter,BufWinEnter,FocusGained,CmdwinEnter NERD_tree* :set syntax=ON | setlocal nocursorline nocursorcolumn 
autocmd VimEnter,WinEnter,BufWinEnter,FocusGained,CmdwinEnter ControlP :set syntax=ON | setlocal nocursorline nocursorcolumn 
autocmd VimEnter,WinEnter,BufWinEnter,FocusGained,CmdwinEnter __Tagbar__* :set syntax=ON | setlocal nocursorline nocursorcolumn 


filetype plugin on
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS



:hi CursorLine   cterm=NONE ctermbg=4
:hi CursorColumn cterm=NONE ctermbg=1

:hi CursorLine   cterm=NONE ctermbg=7
:hi CursorColumn cterm=NONE ctermbg=8
:hi CursorColumn cterm=NONE ctermbg=23

:hi CursorLine   cterm=NONE ctermbg=66
:hi CursorLine   cterm=NONE ctermbg=52
:hi CursorLine   cterm=NONE ctermbg=88


:hi CursorLine   cterm=NONE ctermbg=1
:hi CursorColumn cterm=NONE ctermbg=1
:hi Cursor       cterm=NONE ctermbg=4
" XXX thi sis just for white
" :hi CursorLine   cterm=NONE ctermbg=11
":hi CursorColumn cterm=NONE ctermbg=11
" let g:gitgutter_max_signs = 999
" highlight Normal ctermfg=grey ctermbg=white


let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|CVS$\|build|\.svn$\|target$\|build\|cmake-build-debug\|ignore\|local\|migrate\|thirdparty\|src/libs/\|settings/benchmark\|settings/configs\|settings/data\|settings/documentation',
  \ 'file': '\.class$\|\.so$',
  \ }

  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;white\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;#229B78\x7"
  silent !echo -ne "\033]12;white\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]12;white\007"
  " use \003]12;gray\007 for gnome-terminal
   
function! Formatonsave()
  let l:formatdiff = 1
  pyf /usr/share/clang/clang-format.py
endfunction
"autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
   
   
"speed of blinking 
"set guicursor=i:blinkwait0-blinkon100-blinkoff50


"nnoremap cc dd
nnoremap CC "+d
"vnoremap <C-d> "+d
"XXX: it is also possible to just use the system keyboard as default keyboard, 
" but that screws up the system keyboard. 


set exrc
set secure


