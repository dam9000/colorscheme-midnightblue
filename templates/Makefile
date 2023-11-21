# Build a colorscheme from the template
# and apply Neovim required changes
# This uses the vim-colortemplate from:
# github.com/lifepillar/vim-colortemplate

COLORTEMPLATE = ../../vim-colortemplate

CSNAME = midnightblue

CSTMPL = $(CSNAME).colortemplate
CSFILE = ../colors/$(CSNAME).vim
CSHELP = ../doc/$(CSNAME).txt
HELP_TMPL = $(CSNAME)_help.colortemplate

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

.PHONY: all build

all: $(CSFILE)

$(CSFILE): $(CSTMPL) $(HELP_TMPL) Makefile
	@$(MAKE) build

build:
	@if [ ! -d "$(COLORTEMPLATE)" ]; then \
		echo "Error: COLORTEMPLATE='$(COLORTEMPLATE)' not found"; \
		exit 1; \
	fi
	@echo "Generating: $(CSFILE)"
	@echo
	@rm -f "$(CSFILE)"
	vim --not-a-term --clean -n \
		--cmd "set rtp+=$(COLORTEMPLATE)" \
		--cmd ':set noswapfile' \
		--cmd ":e! $(CSTMPL)" \
		--cmd ':Colortemplate!' \
		--cmd ':helptags ../doc' \
		--cmd ':q!' >/dev/null
	@echo
	@echo "Processing: $(CSFILE)"
	@sed -i $(FIX_T_CO) $(CSFILE)
	@sed -i $(FIX_TERMINAL_COLORS) $(CSFILE)
	@sed -i '/Last Update/s/ ..:..:.. .*$$//' $(CSFILE)
	@echo "Done"

