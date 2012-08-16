if v:version < 700 || &cp
  finish
endif

if exists('loaded_zen2han')
  finish
endif
let loaded_zen2han = 1

vnoremap <leader>zh :call Zen2Han#Zen2Han()<cr>
nnoremap <leader>zh :call Zen2Han#Zen2Han()<cr>

