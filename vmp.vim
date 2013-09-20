syn match  vmpPageFeed		"^\(\|\^L\).*"

hi vmpPageFeed	guibg=lightgreen	guifg=black	ctermbg=lightgreen	ctermfg=black

syn match  vmpPageTitle		"^\s*\*.*"
syn match  vmpPageLine		"^---*"
syn match  vmpPageStrong	"^\s*!!.*"

hi vmpPageTitle		guifg=yellow	ctermfg=yellow
hi vmpPageLine		guifg=yellow	ctermfg=yellow
hi vmpPageStrong	guifg=yellow	ctermfg=yellow


nnoremap # oi^L:w
nnoremap ! o


nnoremap <silent> ]] /\^L<CR>:noh<CR>
nnoremap <silent> [[ ?\^L<CR>:noh<CR>
vnoremap <silent> ]] /\^L<CR>
vnoremap <silent> [[ ?\^L<CR>



set sw=2


finish
augroup MyVimrc
  au!

  au InsertEnter * set timeoutlen=230
  au InsertLeave * set timeoutlen=15000

  " grepする際に'|cw'を付けなくても、Quickfixに結果を表示する
  au QuickfixCmdPost vimgrep cw

  autocmd!  BufNewFile,BufRead,FileType *.awk so $HOME/avd/Avd.vim

  set cursorline
  au WinEnter * set cursorline
  au WinLeave * set nocursorline
augroup end

