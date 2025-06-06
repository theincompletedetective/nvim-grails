" Enhanced GSP syntax highlighting
if exists('b:current_syntax')
    finish
endif

runtime! syntax/html.vim
unlet! b:current_syntax

syn include @groovy syntax/groovy.vim

" GSP tags
syn region gspTag matchgroup=htmlTag start=+<g:[-_:a-zA-Z0-9]\++ end=+>+ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster
syn region gspTag matchgroup=htmlTag start=+</g:[-_:a-zA-Z0-9]\++ end=+>+ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError

" GSP expressions
syn region gspExpression matchgroup=PreProc start=+${+ end=+}+ contains=@groovy
syn region gspExpression matchgroup=PreProc start=+%{+ end=+}+ contains=@groovy

" GSP comments
syn region gspComment start=+<%--+ end=+--%>+ contains=gspTodo,@Spell
syn keyword gspTodo contained TODO FIXME XXX NOTE

hi def link gspTag htmlTag
hi def link gspExpression PreProc
hi def link gspComment Comment
hi def link gspTodo Todo

let b:current_syntax = 'gsp'
