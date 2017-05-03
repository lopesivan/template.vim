" templates.vim - Templates
" Maintainer: Ivan Lopes

function templates#Show() dict
  echo s:path
  echo s:filename
  echo s:model
  echo s:extension
  echo s:filetype
endfunction

function templates#Get() dict
  call self.Show()
endfunction

function templates#Set(path, filename, model, extension, filetype ) dict
  let s:path     = a:path
  let s:filename = a:filename
  let s:model    = a:model
  let s:extension= a:extension
  let s:filetype = a:filetype
endfunction

function templates#YMLCreate() dict
  let s:template = expand('$HOME').'/.vim/templates/'.s:filetype.'/'.s:model.'.'.s:extension

  if !empty(glob(s:template))
    "execute 'e ' . d:filetype . '.yml'
    let copy = 'cp '.s:template .' cheetah.yml'
    call system(copy)
    echo "Create cheetah File."
  else
    echoerr "File not find!"
  endif

endfunction

function templates#Load() dict
  let s:template = expand('$HOME').'/.vim/templates/'.s:filetype.'/'.s:model.'.'.s:extension

  if !empty(glob(s:template))
    execute '%d'
    execute '0r '. s:template
    execute '$d'
    echo "Loaded template File."
  else
    echoerr "File not find!"
  endif

  " normal! Gdd
  silent! %s/|n|/\=substitute(expand('%'),'.*\/', '', '')/g
  silent! %s/|n%|/\=substitute(s:filename,'.*\/', '', '')/g
  silent! %s/|d|/\=substitute(strftime('%c'),'.*\/', '', '')/g

  silent! %s/|user.name|/\=substitute(system('git config user.name'), '\n$', '', '')/g
  " silent! %s/|user.email|/\=substitute(system('git config user.email'), '\n$', '', '')/g
  silent! %s/|user.email|/\=substitute( substitute( substitute( system('git config user.email'), '\n$', '', ''), '\s(at)\s','@',''), '\s(dot)\s', '.', 'g')/g
  silent! %s/|user.site|/\=substitute(system('git config user.site'), '\n$', '', '')/g
endfunction

"'git config --get user.email| sed -e "s/\s(at)\s/@/" -e "s/\s(dot)\s/./g"'

" Costrutor
"""""""""""

function templates#New(path, filename, model, extension, filetype )

  let s:path     = a:path
  let s:filename = a:filename
  let s:model    = a:model
  let s:extension= a:extension
  let s:filetype = a:filetype

  let Retval = {
        \ 'path':      s:path,
        \ 'filename':  s:filename,
        \ 'model':     s:model,
        \ 'extension': s:extension,
        \ 'filetype':  s:filetype,
        \ 'Set':       function ('templates#Set'),
        \ 'Get':       function ('templates#Get'),
        \ 'Show':      function ('templates#Show'),
        \ 'Load':      function ('templates#Load'),
        \ 'YMLCreate': function ('templates#YMLCreate')
        \}

  return Retval

endfunction templates#New

" vim: fdm=marker:sw=2:sts=2:et
