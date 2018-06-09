function! GitDiff()
	" TODO add Vim-fugitive check and if we are in a valid git repo (ugly if
	" it isn't

	execute ':Gsplit! diff --name-only HEAD HEAD^'
	let l:lines = getline(line('^'), line('$'))
	for line in l:lines
		execute ':tabedit ' . line
		execute ':Gdiff HEAD^'
	endfor
	execute ':tabnext'
	execute ':bdelete'
endfunction

function! DeleteInactive()
	for b in getbufinfo()
		if empty(b.windows)
			exe ':bd '. b.bufnr
		endif
	endfor
endfunction
