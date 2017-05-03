function! Template#js#LoadTemplate()
  let path     = expand("%:h")
  let filename = expand("%:t:r")
  let model    = "basic"
  let extension= "js"
  let filetype = "js"

  if filename == "GruntFile"
    let model = filename
  endif

  let obj = templates#New(path, filename, model, extension, filetype)
  call obj.Load()

endfunction

" vim: ts=4
