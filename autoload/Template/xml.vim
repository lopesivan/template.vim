function! Template#xml#LoadTemplate()
  let path     = expand("%:h")
  let filename = expand("%:t:r")
  let model    = "basic"
  let extension= "xml"
  let filetype = "xml"

  if filename == 'pom'
    let model = 'pom'
  endif

  let obj = templates#New(path, filename, model, extension, filetype)
  call obj.Load()
endfunction

" vim: ts=4
