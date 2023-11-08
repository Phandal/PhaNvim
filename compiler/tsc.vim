" Vim compiler file
" Compiler:	NPX TypeScript Compiler
" Maintainer:	Bailey Feldewerd <bfeld.111@gmail.com>
" Last Change:	2023 May 15

let current_compiler = "tsc"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=npx\ tsc

" CompilerSet makeprg=tsc
CompilerSet errorformat=%f\ %#(%l\\,%c):\ %trror\ TS%n:\ %m,
		       \%trror\ TS%n:\ %m,
		       \%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save
