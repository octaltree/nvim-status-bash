" 0 is not found
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
  " vim can't re-throw the error starting with "Vim"
endfunction

function! _close(c) abort
  try
    call chanclose(a:c)
  catch /E116/
  endtry
endfunction

function! _abort(_timer) abort
  cq
endfunction

call timer_start(1000, '_abort')
