nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'                   , 'comment' ]
let g:which_key_map['S'] = [ ':Startify'                                   , 'start screen' ]
let g:which_key_map['d'] = [ ':FloatermNew lazydocker'                     , 'lazydocker' ]
let g:which_key_map['e'] = [ ':lua require"nvim-tree-barbar".toggle_tree()', 'explorer' ]
let g:which_key_map['f'] = [ ':Files'                                      , 'search files' ]
let g:which_key_map['g'] = [ ':FloatermNew lazygit'                        , 'lazygit' ]
let g:which_key_map['r'] = [ ':Ranger'                                     , 'ranger' ]
let g:which_key_map['t'] = [ ':Rg'                                         , 'search text' ]
let g:which_key_map['v'] = [ '<C-W>v'                                      , 'split right']
let g:which_key_map['z'] = [ 'Goyo'                                        , 'zen' ]

let g:which_key_map.b = {
      \ 'name' : '+search' ,
      \ 'c' : [':BufferClose'            , 'close'],
      \ 'C' : [':BufferCloseButCurrent'  , 'close but current'],
      \ 'L' : [':BufferCloseBuffersLeft' , 'close left'],
      \ 'R' : [':BufferCloseBuffersRight', 'close right'],
      \ 'p' : [':BufferPick'             , 'buffer pick'],
      \ 'd' : [':BufferOrderByDirectory' , 'order by directory'],
      \ 'l' : [':BufferOrderByLanguage'  , 'order by language'],
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'search history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'B' : [':BLines'       , 'current buffer'],
      \ 'b' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'H' : [':History'      , 'file history'],
      \ 'h' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git',
      \ 'l' : [':FloatermNew lazygit'               , 'lazygit'],
      \ 'n' : [':Gitsigns next_hunk'                , 'next hunk'],
      \ 'p' : [':Gitsigns prev_hunk'                , 'prev hunk'],
      \ 's' : [':Gitsigns stage_hunk'               , 'stage hunk'],
      \ 'u' : [':Gitsigns undo_stage_hunk'          , 'undo stage hunk'],
      \ 'S' : [':Gitsigns stage_buffer'             , 'stage buffer'],
      \ 'U' : [':Gitsigns reset_buffer_index'       , 'reset buffer index'],
      \ 'd' : [':Gitsigns reset_hunk'               , 'reset hunk'],
      \ 'D' : [':Gitsigns reset_buffer'             , 'reset buffer'],
      \ 'v' : [':Gitsigns preview_hunk'             , 'preview hunk'],
      \ 'b' : [':Gitsigns blame_line'               , 'blame line'],
      \ 'B' : [':Gitsigns toggle_current_line_blame', 'toggle current line blame'],
      \ 't' : [':Gitsigns diffthis'                 , 'diff this'],
      \ 'w' : [':Gitsigns toggle_word_diff'         , 'toggle word diff'],
      \ 'a' : [':Gitsigns get_actions'              , 'get actions'],
      \ }

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'code action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : [':Vista!!'                            , 'outline'],
      \ 'O' : [':CocList outline'                    , 'search outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-references)'              , 'references'],
      \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }
      " \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],

let g:which_key_map.j = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew'                                          , 'terminal'],
      \ 'l' : [":FloatermNew --autoclose=0 python %"                   , 'python %'],
      \ 'c' : [":FloatermNew --autoclose=0 g++ -o program %; ./program", 'g++ %;./a.out'],
      \ 'x' : [":FloatermNew --autoclose=0 python -m cProfile %" , 'python -m Cprofile %'],
      \ 'f' : [':FloatermNew fzf'                                      , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                                  , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                               , 'docker'],
      \ 'n' : [':FloatermNew node'                                     , 'node'],
      \ 'm' : [':FloatermNew --autoclose=0 make run'                   , 'make run'],
      \ 'N' : [':FloatermNew nnn'                                      , 'nnn'],
      \ 'p' : [':FloatermNew python'                                   , 'python'],
      \ 'i' : [':FloatermNew ipython'                                  , 'ipython'],
      \ 'r' : [':FloatermNew ranger'                                   , 'ranger'],
      \ 't' : [':FloatermToggle'                                       , 'toggle'],
      \ 'b' : [':FloatermNew btm'                                      , 'bottom'],
      \ 's' : [':FloatermNew ncdu'                                     , 'ncdu'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
