function! Template#mk#LoadTemplate()
  let path     = expand("%:h")
  let filename = expand("%:t:r")
  let model    = "skel"
  let extension= "mk"
  let filetype = "make"

  if filename == "ps2pdf"
    let model = "ps2pdf"
  endif

  if filename == "latex"
    let model = "latex"
  endif

  let obj = templates#New(path, filename, model, extension, filetype)
  call obj.Load()
endfunction

" vim: ts=4
