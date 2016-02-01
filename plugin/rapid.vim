scriptencoding utf-8
if exists('g:loaded_rapid') || &cp | finish | endif
let g:loaded_rapid = 1

function! Rapid()
  function! s:Rapid_js()
    inoremap afR function () {<CR>}<ESC>O
    inoremap fnR function name(){<CR><CR>}<ESC>kkwv3l<c-g>
    inoremap arfR () => {<CR><CR>}<ESC>kkli
    inoremap iifeR (function () {<CR>})();<ESC>O
    inoremap clR console.log();<ESC>hi
    inoremap flR for (var i = 0; i < 9; i++)
          \{<CR>console.log(i)<CR>}<ESC>2k^9wv<c-g>

    inoremap ifR if () {<CR><CR>}<ESC>2k4li
    inoremap ifeR if () {<CR><CR>} else {<CR><CR>}<ESC>4k4li
  endfun

  function! s:Rapid_rb()
    inoremap dfR def name()<CR>end<ESC>O
    inoremap elR (array).each do \|i\|<CR>puts i<CR>end<ESC>2k^lv<c-g>4l
    inoremap ifeR if <CR><CR>else<CR><CR>end<ESC>4k^A
    inoremap erR <%=  %><ESC>2hi
  endfun

    autocmd FileType javascript,js call s:Rapid_js()
    autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby
    autocmd FileType ruby,rb call s:Rapid_rb()
    autocmd FileType html.eruby,eruby call s:Rapid_rb()
endfun
call Rapid()

