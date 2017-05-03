function! Template#sh#LoadTemplate()
  let path     = expand("%:h")
  let filename = expand("%:t:r")
  let model    = "basic"
  let extension= "sh"
  let filetype = "sh"

  if filename == "autogen"
    let model = filename
  endif

  if filename == "opt"
    let model = filename
  endif

  let obj = templates#New(path, filename, model, extension, filetype)
  call obj.Load()
  " call obj.Show()
endfunction

" vim: ts=4
