function! Template#FileWithOutDefinitionType#LoadTemplate()
  let path     = expand("%:h")
  let filename = expand("%:t:r")
  let model    = substitute(filename,'\.','','g')
  let extension= "fwodt"
  let filetype = "FileWithOutDefinitionType"

  " if filename == "INSTALL"
  "   let model = filename
  " endif

  let obj = templates#New(path, filename, model, extension, filetype)
  call obj.Load()

endfunction

" vim: ts=4
