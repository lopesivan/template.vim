function! Template#cheetah#LoadTemplate(f)
  let path     = expand("%:h")
  let filename = expand("%:t:r")
  let model    = "cheetah"
  let extension= 'yml'
  let filetype = a:f

  let obj = templates#New(path, filename, model, extension, filetype)
  call obj.YMLCreate()

endfunction

" vim: ts=4
