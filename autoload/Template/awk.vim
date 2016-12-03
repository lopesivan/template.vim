function! Template#awk#LoadTemplate()
  let path     = expand("%:h")
  let filename = expand("%:t:r")
  let model    = "basic"
  let extension= "awk"
  let filetype = "awk"

  let obj = templates#New(path, filename, model, extension, filetype)
  call obj.Load()
endfunction

" vim: ts=4
