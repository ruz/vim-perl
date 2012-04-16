
augroup filetypedetect

au BufNewFile,BufRead * call s:FTmason()

" detect if it's mason
func! s:FTmason()
    if exists(&ft) && &ft !~ 'html'
        return
    endif

    if match(getline(1, min([line("$"), 200])), '\c^%\|<&\|<\/\?%\(perl\|args\|init\)>') > -1
        set filetype=mason
        return
    endif
endfunc

augroup END
