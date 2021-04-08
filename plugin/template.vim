" $Id$
" Name Of File: my_init_template.vim
"
"  Description: Vim plugin
"
"       Author: Ivan Carlos S. Lopes <lopesivan (at) poli (dot) com (dot) br>
"   Maintainer: Ivan Carlos S. Lopes <lopesivan (at) poli (dot) com (dot) br>
"
"  Last Change: Tue 02 Apr 2013 01:45:48 PM BRT
"      Version: |Revision|
"
"    Copyright: This script is released under the Vim License.
"

if &cp || exists("g:loaded_template")
  finish
endif

let g:loaded_template = "v01"
let s:keepcpo         = &cpo
set cpo&vim

"-----------------------------------------------------------------------------
function LoadTemplate(extension)

    if (a:extension == '') && ( &ft == "")
      let f = 'FileWithOutDefinitionType'
    else
      if &ft == ''
        let f = a:extension
      else
        let f = &ft
      endif
    endif

    "sem argumento
    let functionName = 'Template#'.f.'#LoadTemplate()'
    " /home/ivan/.config/nvim/site/pack/packer/start/template.vim/autoload/Template
    let plugin_name = "template.vim"
    let script_name = expand('$HOME').'/.config/nvim/site/pack/packer/start/'.plugin_name.'/autoload/Template/'.f.'.vim'

    if filereadable(expand(script_name))
      execute 'call '.functionName
    else
      echo "Função ".functionName." não existe"
      let path     = expand("%:h")
      let filename = expand("%:t:r")
      let model    = "skel"
      let extension= f
      let filetype = f

      let obj = templates#New(path, filename, model, extension, filetype)
      call obj.Load()
    endif
endfunction

function YMLTemplate(extension)

    if (a:extension == '') && ( &ft == "")
      let f = 'FileWithOutDefinitionType'
    else
      if &ft == ''
        let f = a:extension
      else
        let f = &ft
      endif
    endif

    "sem argumento
    let functionName = 'Template#'.'cheetah'.'#LoadTemplate'
    execute 'call '.functionName.'(f)'

endfunction
"-----------------------------------------------------------------------------
let &cpo= s:keepcpo
unlet s:keepcpo

" vim: ts=4
