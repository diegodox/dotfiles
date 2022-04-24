" :vt to open virtical split terminal
command! Vterm :vs|:term
cnoreabbrev vt Vterm

" :ct to clear terminal buffer
function! ClearTerminal()
  let s:scroll_value=&scrollback
  set scrollback=1
  let &g:scrollback=1
  echo &scrollback
  call feedkeys("\i")
  call feedkeys("\x1b")
  call feedkeys("[2K")
  call feedkeys("clear\<CR>")
  call feedkeys("\<C-\>\<C-n>")
  call feedkeys("\i")
  sleep 100m
  let &scrollback=1000
endfunction

