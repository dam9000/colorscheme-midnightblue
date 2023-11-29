" midnightteal theme for airline
let s:cc = colorscheme_midnight_common#midnightteal_colors#get()
let s:palette = colorscheme_midnight_common#airline_theme#gen_airline_theme(s:cc)
let g:airline#themes#midnightteal#palette = s:palette

