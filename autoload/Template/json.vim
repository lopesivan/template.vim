function! Template#json#LoadTemplate()
  let path     = expand("%:h")
  let filename = expand("%:t:r")
  let model    = "basic"
  let extension= "json"
  let filetype = "json"

  let obj = templates#New(path, filename, model, extension, filetype)
  call obj.Load()
endfunction

" vim: ts=4
