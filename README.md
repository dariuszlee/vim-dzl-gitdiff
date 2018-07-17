# vim-dzl-gitdiff

A gitdiff built off vim-fugitive.
All files changed in current commit (ie. HEAD) are opened in new tabs. Each file then is diffed with the previous working state. 

This is great for pulling a commit and doing code reviews in vim.

### Usage

`:call GitDiff()`

### To-do

1. Diff on specific commits. Ie changes between CommitHashA and CommitHashB
2. Integrate with Vim-Fugitive
