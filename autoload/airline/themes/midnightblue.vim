" midnightblue theme for airline
let s:cc = colorscheme_midnight_common#midnightblue_colors#get()
let s:palette = colorscheme_midnight_common#airline_theme#gen_airline_theme(s:cc)
let g:airline#themes#midnightblue#palette = s:palette

