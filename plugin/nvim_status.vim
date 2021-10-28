if exists('g:loaded_nvim_status')
  finish
endif
let g:loaded_nvim_status = 1

let g:nvim_status#root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
let g:nvim_status#bin_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h:h') .. '/bin'
