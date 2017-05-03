function! Template#markdown#LoadTemplate()
  let path     = expand("%:h")
  let filename = expand("%:t:r")
  let model    = "skel"
  let extension= "markdown"
  let filetype = "markdown"

  if filename == "autogen"
    let model = filename
  endif

  if filename == "opt"
    let model = filename
  endif

  let obj = templates#New(path, filename, model, extension, filetype)
  call obj.Load()
  " call obj.markdownow()
endfunction

" vim: ts=4
