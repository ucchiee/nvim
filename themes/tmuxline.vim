" https://github.com/edkolev/tmuxline.vim
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'onedark'

let g:tmuxline_preset = {
      \'a'    : '%Y-%m-%d(%a) %H:%M:%S',
      \'b'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    :'#(get_ssid_tmux)',
      \'y'    : ['#(get_load_average_tmux)', '#(get_volume_tmux)'],
      \'z'    :'#(get_battery_tmux)'}
" let g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'b'    : '#W',
"       \'c'    : '#H',
"       \'win'  : '#I #W',
"       \'cwin' : '#I #W',
"       \'x'    : '%a',
"       \'y'    : '#W %R',
"       \'z'    : '#H'}
