#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# no double quote
src=`cat<<EOF
function! _find_nvim(pid) abort
  let xs = glob('/tmp/nvim*/0', v:false, v:true)
  for x in xs
    try
      let c = sockconnect('pipe', x, {'rpc': v:true, 'data_buffered': v:false})
      let p = rpcrequest(c, 'nvim_call_function', 'getpid', [])
      if p == a:pid
        return c
      endif
      call chanclose(c)
    catch /connection failed/
    endtry
  endfor
endfunction

function! _main() abort
  let c = _find_nvim($1)
  if c == 0 | return | endif
  let status = rpcrequest(c, 'nvim_eval_statusline', '$2', {})['str']
  echo status
endfunction

call _main()
EOF`

function main(){
  nvim --headless -u NONE\
    -c "echo nvim_exec(\"${src}\", v:true)"\
    -c "q"
}

main $*
