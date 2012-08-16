let s:save_cpo = &cpo
set cpo&vim

func! Zen2Han#Zen2Han() range
  let l:scriptfname = g:zen2han_path . "/plugin/zen2han.pl"
  let l:tmpname = "zen2han.tmp"

  let l:str = getline(1, '$')
  if a:firstline != a:lastline
    let l:str = getline(a:firstline, a:lastline)
  endif

  try
    if writefile(l:str, l:tmpname) < 0
"      call errormsg('Error writing file: ' . v:errmsg)
      return
    endif
  catch
"    call s:errormsg('Error writing file: ' . v:errmsg)
    return
  endtry

  let cmd = 'perl -x ' . shellescape(expand(l:scriptfname))
  let result = system(cmd)

  let l:split = split(l:result, '\n\|\r')
  let l:lines = []
  for l:line in l:split
      call add(l:lines, l:line)
  endfor

  if a:firstline == a:lastline
    silent %delete _
    call setline('.', l:lines)
    normal! 1G
  else
    call setline('.', l:lines)
  endif

  let cmd = 'rm ' . l:tmpname
  call system(cmd)

  return
endfunction

let &cpo = s:save_cpo
finish

