" generate a airline theme for midnightblue colorscheme variants

scriptencoding utf-8

" cc.name = { gui: 'rgb', cterm: number }
function s:ll_set_colors(cc)
    let s:cc = a:cc
    let s:ll = {}
    let s:ll.normal  = s:cc.deepskyblue
    let s:ll.insert  = s:cc.white
    let s:ll.replace = s:cc.lightpink2
    let s:ll.command = s:cc.burlywood
    let s:ll.visual  = s:cc.aquamarine3
    let s:ll.a_fg    = s:cc.black
    let s:ll.b_bg    = s:cc.bg5
    let s:ll.c_fg    = s:cc.white
    let s:ll.c_bg    = s:cc.bg4
endfunction

function s:ll_entry(a_fg, b_fg, c_fg, a_bg, b_bg, c_bg)
  " [ guifg, guibg, ctermfg, ctermbg, opts ]
  let s:xa = [ a:a_fg.gui, a:a_bg.gui, a:a_fg.cterm, a:a_bg.cterm ]
  let s:xb = [ a:b_fg.gui, a:b_bg.gui, a:b_fg.cterm, a:b_bg.cterm ]
  let s:xc = [ a:c_fg.gui, a:c_bg.gui, a:c_fg.cterm, a:c_bg.cterm ]
  return airline#themes#generate_color_map(s:xa, s:xb, s:xc)
endfunction

function s:ll_mode(color)
  " fg: a b c
  " bg: a b c
  let s:xx = s:ll_entry(
    \ s:ll.a_fg, a:color,   s:ll.c_fg,
    \ a:color,   s:ll.b_bg, s:ll.c_bg)
  let s:xx.airline_warning = [
    \ s:ll.c_fg.gui,   s:ll.b_bg.gui,
    \ s:ll.c_fg.cterm, s:ll.b_bg.cterm ]
  return s:xx
endfunction

function s:ll_inactive()
  return s:ll_entry(
    \ s:cc.black, s:cc.grey38, s:cc.grey38,
    \ s:cc.bg4,   s:cc.bg3,    s:cc.bg3)
endfunction

function! colorscheme_midnight_common#airline_theme#gen_airline_theme(cc)
    call s:ll_set_colors(a:cc)
    let s:palette = {}
    let s:palette.normal  = s:ll_mode(s:ll.normal)
    let s:palette.insert  = s:ll_mode(s:ll.insert)
    let s:palette.replace = s:ll_mode(s:ll.replace)
    let s:palette.visual  = s:ll_mode(s:ll.visual)
    let s:palette.commandline = s:ll_mode(s:ll.command)
    let s:palette.inactive = s:ll_inactive()
    return s:palette
endfunction

