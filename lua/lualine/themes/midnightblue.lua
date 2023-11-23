-- midnightblue theme for lualine

local cc = require('colorscheme_midnightblue.colors')
-- cc.colorname = { gui ='#rrggbb', cterm = number }

local ll = {
  normal  = cc.deepskyblue,
  insert  = cc.white,
  replace = cc.lightpink2,
  command = cc.burlywood,
  visual  = cc.aquamarine3,
  a_fg    = cc.black,
  b_bg    = cc.bg5,
  c_fg    = cc.white,
  c_bg    = cc.bg4,
}

local function ll_entry(a_fg, b_fg, c_fg, a_bg, b_bg, c_bg)
  -- optional: gui = bold, italic or other attr-list
  return {
    a = { fg = a_fg.gui, bg = a_bg.gui },
    b = { fg = b_fg.gui, bg = b_bg.gui },
    c = { fg = c_fg.gui, bg = c_bg.gui },
  }
end

local function ll_mode(color)
  return ll_entry(
    ll.a_fg, color,   ll.c_fg, -- fg: a b c
    color,   ll.b_bg, ll.c_bg) -- bg: a b c
end

local function ll_inactive()
  return ll_entry(
    cc.black, cc.grey38, cc.grey38, -- fg: a b c
    cc.bg4,   cc.bg3,    cc.bg3)    -- bg: a b c
end

return {
  normal  = ll_mode(ll.normal),
  insert  = ll_mode(ll.insert),
  replace = ll_mode(ll.replace),
  command = ll_mode(ll.command),
  visual  = ll_mode(ll.visual),
  inactive = ll_inactive(),
}

-- vim: ts=2 sts=2 sw=2 et
