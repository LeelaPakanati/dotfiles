set runtimepath+=~/.vim/bundle/LanguageClient-neovim

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'systemverilog': ['svlangserver'],
    \ }

function SetLSPShortcuts()
  nnoremap gd :call LanguageClient_textDocument_definition({'gotoCmd': 'tabnew'})<CR>
  nnoremap K :call LanguageClient_textDocument_hover()<CR>
  "nnoremap <leader>lf :call LanguageClient_textDocument_formatting()<CR>
  "nnoremap <leader>lt :call LanguageClient_textDocument_typeDefinition()<CR>
  "nnoremap <leader>lx :call LanguageClient_textDocument_references()<CR>
  "nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  "nnoremap <leader>lc :call LanguageClient_textDocument_completion()<CR>
  "nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  "nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
  autocmd!
  call SetLSPShortcuts()
augroup END

