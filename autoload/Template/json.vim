function! Template#json#LoadTemplate()
  let path     = expand("%:h")
  let filename = expand("%:t:r")
  let model    = "skel"
  let extension= "json"
  let filetype = "json"

  if filename == ".projections"
    let model = substitute(filename,'\.','','g')
  endif
  let obj = templates#New(path, filename, model, extension, filetype)
  call obj.Load()
endfunction

" vim: ts=4
