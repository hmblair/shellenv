SHELL := $(shell which zsh)

PREFIX     ?= $(HOME)/.local
BIN_DIR     = $(PREFIX)/bin
SITE_FN_DIR = $(HOME)/.local/share/zsh/site-functions

SRC_DIR  = src
COMMANDS = path envs

CLAUDE_MD     = $(HOME)/CLAUDE.md
CLAUDE_SRC    = $(CURDIR)/CLAUDE.md
CLAUDE_MARKER = claude-shellenv

.PHONY: install install-commands install-claude uninstall uninstall-commands uninstall-claude

install: install-commands install-claude

install-commands:
	@mkdir -p $(BIN_DIR) $(SITE_FN_DIR)
	@for cmd in $(COMMANDS); do \
		ln -sfn $(CURDIR)/$(SRC_DIR)/$$cmd/$$cmd $(BIN_DIR)/$$cmd; \
	done
	@for comp in $(SRC_DIR)/completions/_*; do \
		ln -sfn $(CURDIR)/$$comp $(SITE_FN_DIR)/$$(basename $$comp); \
	done
	@echo "Installed $(words $(COMMANDS)) commands to $(BIN_DIR)"
	@echo "Linked completions to $(SITE_FN_DIR)"

install-claude:
	@if [ -f "$(CLAUDE_MD)" ] && grep -q '$(CLAUDE_MARKER):start' "$(CLAUDE_MD)" 2>/dev/null; then \
		sed '/$(CLAUDE_MARKER):start/,/$(CLAUDE_MARKER):end/d' "$(CLAUDE_MD)" > "$(CLAUDE_MD).tmp"; \
		mv "$(CLAUDE_MD).tmp" "$(CLAUDE_MD)"; \
	fi
	@if [ -f "$(CLAUDE_MD)" ]; then \
		cat "$(CLAUDE_MD)" "$(CLAUDE_SRC)" > "$(CLAUDE_MD).tmp"; \
		mv "$(CLAUDE_MD).tmp" "$(CLAUDE_MD)"; \
	else \
		cp "$(CLAUDE_SRC)" "$(CLAUDE_MD)"; \
	fi
	@echo "Installed Claude instructions in $(CLAUDE_MD)"

uninstall: uninstall-commands uninstall-claude

uninstall-commands:
	@for cmd in $(COMMANDS); do \
		rm -f $(BIN_DIR)/$$cmd; \
	done
	@for comp in $(SRC_DIR)/completions/_*; do \
		rm -f $(SITE_FN_DIR)/$$(basename $$comp); \
	done
	@echo "Uninstalled commands"

uninstall-claude:
	@if [ -f "$(CLAUDE_MD)" ] && grep -q '$(CLAUDE_MARKER):start' "$(CLAUDE_MD)" 2>/dev/null; then \
		sed '/$(CLAUDE_MARKER):start/,/$(CLAUDE_MARKER):end/d' "$(CLAUDE_MD)" > "$(CLAUDE_MD).tmp"; \
		mv "$(CLAUDE_MD).tmp" "$(CLAUDE_MD)"; \
		echo "Removed Claude instructions from $(CLAUDE_MD)"; \
	fi
