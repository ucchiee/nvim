let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_bookmarks = [
            \ { 'a': '~dotfiles/alacritty/.config/alacritty/alacritty.yml' },
            \ { 'c': '~/.config/nvim/coc-settings.json' },
            \ { 'd': '~/dotfiles/Makefile' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 's': '~/dotfiles/vim/simple.vimrc' },
            \ { 't': '~/dotfiles/tmux/.config/tmux/tmux.conf' },
            \ { 'v': '~/dotfiles/vim/.vimrc' },
            \ { 'z': '~/dotfiles/zsh/.config/zsh/zshrc' },
            \ ]
let g:startify_session_autoload = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_custom_header = [
  \' ▄         ▄  ▄               ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄       ▄▄ ',
  \'▐░▌       ▐░▌▐░▌             ▐░▌▐░░░░░░░░░░░▌▐░░▌     ▐░░▌',
  \'▐░▌       ▐░▌ ▐░▌           ▐░▌  ▀▀▀▀█░█▀▀▀▀ ▐░▌░▌   ▐░▐░▌',
  \'▐░▌       ▐░▌  ▐░▌         ▐░▌       ▐░▌     ▐░▌▐░▌ ▐░▌▐░▌',
  \'▐░▌       ▐░▌   ▐░▌       ▐░▌        ▐░▌     ▐░▌ ▐░▐░▌ ▐░▌',
  \'▐░▌       ▐░▌    ▐░▌     ▐░▌         ▐░▌     ▐░▌  ▐░▌  ▐░▌',
  \'▐░▌       ▐░▌     ▐░▌   ▐░▌          ▐░▌     ▐░▌   ▀   ▐░▌',
  \'▐░▌       ▐░▌      ▐░▌ ▐░▌           ▐░▌     ▐░▌       ▐░▌',
  \'▐░█▄▄▄▄▄▄▄█░▌       ▐░▐░▌        ▄▄▄▄█░█▄▄▄▄ ▐░▌       ▐░▌',
  \'▐░░░░░░░░░░░▌        ▐░▌        ▐░░░░░░░░░░░▌▐░▌       ▐░▌',
  \' ▀▀▀▀▀▀▀▀▀▀▀          ▀          ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀ ',
  \ ]
