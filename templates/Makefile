# Build a colorscheme from the template
# This uses the vim-colortemplate from:
# github.com/lifepillar/vim-colortemplate

COLORTEMPLATE = ../../vim-colortemplate

CSNAME = midnightblue

CSTMPL = $(CSNAME).colortemplate
CSFILE = ../colors/$(CSNAME).vim
CSHELP = ../doc/$(CSNAME).txt
HELP_TMPL = $(CSNAME)_help.colortemplate
LUA_CS_DIR = ../lua/colorscheme_$(CSNAME)
COLORS_LUA = $(LUA_CS_DIR)/colors.lua
COLORS_RGB_LUA = $(LUA_CS_DIR)/colorsrgb.lua
COLORS_VIM_DIR = ../autoload/colorscheme_$(CSNAME)
COLORS_VIM = $(COLORS_VIM_DIR)/colors.vim

# Neovim related changes

define FIX_T_CO
-e "/^let s:t_Co = has.*$$/{a\\"\
-e "if has('nvim')\\"\
-e "  let s:t_Co = &t_Co\\"\
-e "else\\"\
-e "  let s:t_Co = has('gui_running') ? -1 : (&t_Co ?? 0)\\"\
-e "endif"\
-e ";d}"
endef

define FIX_TERMINAL_COLORS
-e "/let g:terminal_ansi_colors/{n;/^endif/i\\"\
-e "  \" Nvim uses g:terminal_color_{0-15} instead\\"\
-e "  if has('nvim')\\"\
-e "    for i in range(g:terminal_ansi_colors->len())\\"\
-e "      let g:terminal_color_{i} = g:terminal_ansi_colors[i]\\"\
-e "    endfor\\"\
-e "  endif"\
-e "}"
endef

# map colors with unknown cterm ('~')

define AWK_UNK
/^" Color: .*~/{ printf("echo (colortemplate#colorspace#approx('%s'))\n", $$4) }
endef
export AWK_UNK

define AWK_REMAP
BEGIN { FS="[{,}]" }
{
if (NF > 3) {
  delete f
  for (i=1; i<=NF; i++) {
    if (split($$i, a, ":") == 2) {
      gsub("[' ]", "", a[1])
      gsub("[' ]", "", a[2])
      f[a[1]] = a[2]
    }
  }
  if (f["color"] && f["index"]) {
    print f["color"], f["index"], f["approx"]
  }
}
}
endef
export AWK_REMAP

# generate colors.vim

define AWK_COLORS_VIM
BEGIN {
  print "let s:cc = {}"
}
/^#/{ map[$$1] = $$2 }
/Color:/{
  cterm = $$5
  if (!(cterm ~ "^[0-9]+$$")) cterm = map[$$4]
  printf "let s:cc.%-16s = #{ gui: '%s', cterm: %d }\n", $$3, $$4, cterm
}
END {
  print "function! colorscheme_$(CSNAME)#colors#get()"
  print "  return s:cc"
  print "endfunction"
}
endef
export AWK_COLORS_VIM

# generate colorsrgb.lua

define AWK_COLORS_RGB_LUA
BEGIN { print "return {" }
/Color:/{ printf "  %-16s = '%s',\n", $$3, $$4 }
END { print "}" }
endef
export AWK_COLORS_RGB_LUA

# generate colors.lua

define AWK_COLORS_LUA
BEGIN { print "return {" }
/^#/{ map[$$1] = $$2 }
/Color:/{
  cterm = $$5
  if (!(cterm ~ "^[0-9]+$$")) cterm = map[$$4]
  printf "  %-16s = { gui = '%s', cterm = %d },\n", $$3, $$4, cterm
}
END { print "}" }
endef
export AWK_COLORS_LUA


.PHONY: all build

all: $(CSFILE)

$(CSFILE): $(CSTMPL) $(HELP_TMPL) Makefile
	@$(MAKE) build

build:
	@if [ ! -d "$(COLORTEMPLATE)" ]; then \
		echo "Error: COLORTEMPLATE='$(COLORTEMPLATE)' not found"; \
		exit 1; \
	fi
	@echo "Generate: $(CSFILE)"
	@echo
	@rm -f "$(CSFILE)"
	vim --not-a-term --clean -n \
		--cmd ":set rtp+=$(COLORTEMPLATE)" \
		--cmd ':set noswapfile' \
		--cmd ":e! $(CSTMPL)" \
		--cmd ':Colortemplate!' \
		--cmd ':helptags ../doc' \
		--cmd ':q!' >/dev/null
	@echo
	@echo "Process: $(CSFILE)"
	@sed -i $(FIX_T_CO) $(CSFILE)
	@sed -i $(FIX_TERMINAL_COLORS) $(CSFILE)
	@sed -i '/Last Update/s/ ..:..:.. .*$$//' $(CSFILE)
	@# remap "~" to cterm
	@awk "$$AWK_UNK" $(CSFILE) > tmp.unk.vim
	@vim --not-a-term --clean -n \
		--cmd ":set rtp+=$(COLORTEMPLATE)" \
		--cmd ':set noswapfile' \
		--cmd ":redir => out" \
		--cmd ':silent source tmp.unk.vim' \
		--cmd ":redir END" \
		--cmd ":call writefile(split(out,\"\n\",1),'tmp.vim.out','b')" \
		--cmd ':q!' >/dev/null
	@awk "$$AWK_REMAP" tmp.vim.out > tmp.cmap
	@# colors.lua
	@mkdir -p $(LUA_CS_DIR)
	@#echo "Generate: $(COLORS_RGB_LUA)"
	@#awk "$$AWK_COLORS_RGB_LUA" $(CSFILE) > $(COLORS_RGB_LUA)
	@echo "Generate: $(COLORS_LUA)"
	@awk "$$AWK_COLORS_LUA" tmp.cmap $(CSFILE) > $(COLORS_LUA)
	@# colors.vim
	@echo "Generate: $(COLORS_VIM)"
	@mkdir -p $(COLORS_VIM_DIR)
	@awk "$$AWK_COLORS_VIM" tmp.cmap $(CSFILE) > $(COLORS_VIM)
	@# cleanup
	@rm -f tmp.*

