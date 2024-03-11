function! s:Lint()
        if filereadable("package.json")
                compiler eslinter
                Make
                copen
                return
        endif

        echoerr "No option found"
endfunction

command! Lint call <SID>Lint()
