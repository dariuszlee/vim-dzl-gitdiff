function! GitDiff(...)
	" TODO add Vim-fugitive check and if we are in a valid git repo (ugly if
	" it isn't
    if !s:IsFugitiveInstalled()
        echom "Please install vim-fugitive. Exiting"
        return 
    endif

    if a:0 == 1
        let l:commit = a:1
    else
        let l:commit = "HEAD^"
    endif

	execute ':Gsplit! diff --name-only HEAD HEAD^'
    let l:currentBuf = s:GetCurrentBuffer()
	let l:lines = getline(line('^'), line('$'))
	for line in l:lines
        let l:file = FugitiveWorkTree() . line
		execute ':tabedit ' . l:file
        let l:command = ':Gdiff ' . l:commit
		execute l:command
	endfor
    call s:DeleteBuffer(l:currentBuf)
endfunction

function! DeleteInactive()
	for b in getbufinfo()
		if empty(b.windows)
			execute ':bd '. b.bufnr
		endif
	endfor
endfunction

function! s:IsFugitiveInstalled()
    if exists('g:autoloaded_fugitive')
        return v:true
    else
        return v:false
    endif
endfunction

function! s:GetCurrentBuffer()
    return bufnr('%')
endfunction

function! s:DeleteBuffer(bufnr)
    execute ':bdelete ' . a:bufnr
endfunction
