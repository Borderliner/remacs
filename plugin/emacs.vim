" Enable Alt key for binding (e.g. <A-x> for Alt+x)
let c='a'
while c <= 'z'
  silent! exec "set <A-".c.">=\e".c
  silent! exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

" Set timeout for combo keys (e.g. C-g)

set timeout timeoutlen=200
set ttimeout ttimeoutlen=200

"""" INSERT MODE """"

" Half-page movement with Ctrl+v and Alt+v
" It switches to normal mode, moves, and comes back to insert mode.
inoremap <C-v> <Esc><C-d>i
inoremap <A-v> <Esc><C-u>i

" Basic Emacs movement keys
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <C-o>:call <SID>home()<CR>
inoremap <C-e> <End>

" Character and line deletion mappings
inoremap <C-d> <Del>
inoremap <C-h> <BS>
inoremap <C-k> <C-r>=<SID>kill_line()<CR>

inoremap <Tab> <C-t>
inoremap <C-g> <C-[>
inoremap <C-Space> <Esc>v
inoremap <C-x><C-s> <Esc>l:w<CR>i
inoremap <C-y> <Esc>:put<CR>i
inoremap <C-z> <Esc>:undo<CR>i
inoremap <C-r> <Esc>:redo<CR>i

" command line mode
nnoremap <C-v> <C-d>
nnoremap <A-v> <C-u>

nnoremap <CR> i

nnoremap <C-p> <Up>
nnoremap <C-n> <Down>
nnoremap <C-b> <Left>
nnoremap <C-f> <Right>
nnoremap <C-a> <Home>
nnoremap <C-e> <End>
nnoremap <C-d> <Del>
nnoremap <C-h> <BS>
nnoremap <C-k> <C-f>D<C-c><C-c>:<Up>
nnoremap <C-Space> v
nnoremap <C-y> p<Down>
nnoremap <C-x><C-s> :w<CR>
nnoremap <C-x><C-c> :qa!<CR>
nnoremap <C-x><C-x> :wq!<CR>
nnoremap <A-x> :
nnoremap p <Nop>
nnoremap n <Nop>
nnoremap a <Nop>
nnoremap <C-z> u
nnoremap u <Nop>
nnoremap <C-x> <Nop>
nnoremap f e
nnoremap <A-f> e
nnoremap e <Nop>
nnoremap <C-x><C-o> <C-w>w
nnoremap <C-x><C-k> :q!<CR>

vnoremap <C-p> <Up>
vnoremap <C-n> <Down>
vnoremap <C-b> <Left>
vnoremap <C-f> <Right>
vnoremap <C-a> <Home>
vnoremap <C-e> <End>
vnoremap <A-w> y 
vnoremap <C-w> d
vnoremap <C-d> d
vnoremap <BS> d
vnoremap <nowait> <C-g> <Esc>
vnoremap <C-Space> <Esc>

cnoremap <C-g> <C-c>

" command-T window
let g:CommandTCursorLeftMap  = ['<Left>',  '<C-b>']
let g:CommandTCursorRightMap = ['<Right>', '<C-f>']
let g:CommandTBackspaceMap   = ['<BS>',    '<C-h>']
let g:CommandTDeleteMap      = ['<Del>',   '<C-d>']

function! s:home()
  let start_col = col('.')
  normal! ^
  if col('.') == start_col
    normal! 0
  endif
  return ''
endfunction

function! s:kill_line()
  let [text_before_cursor, text_after_cursor] = s:split_line_text_at_cursor()
  if len(text_after_cursor) == 0
    normal! J
  else
    call setline(line('.'), text_before_cursor)
  endif
  return ''
endfunction

function! s:split_line_text_at_cursor()
  let line_text = getline(line('.'))
  let text_after_cursor  = line_text[col('.')-1 :]
  let text_before_cursor = (col('.') > 1) ? line_text[: col('.')-2] : ''
  return [text_before_cursor, text_after_cursor]
endfunction



