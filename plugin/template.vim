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
    if a:extension == ''
      let functionName = 'Template#'.&ft.'#LoadTemplate'
    else
      let functionName = 'Template#'.a:extension.'#LoadTemplate'
    endif

    "sem argumento
    execute 'call '.functionName.'()'
    "com argumento
    "execute 'call '.functionName.'(a:extension)'
endfunction

"-----------------------------------------------------------------------------
let &cpo= s:keepcpo
unlet s:keepcpo

" vim: ts=4
