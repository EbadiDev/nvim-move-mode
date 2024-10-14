if exists('g:loaded_move_mode') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

let g:loaded_move_mode = 1

let &cpo = s:save_cpo
unlet s:save_cpo
