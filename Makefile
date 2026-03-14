SHELL := $(shell which zsh)

PREFIX     ?= $(HOME)/.local
BIN_DIR     = $(PREFIX)/bin
SITE_FN_DIR = $(HOME)/.local/share/zsh/site-functions

SRC_DIR  = src
COMMANDS = path envs

.PHONY: install uninstall

install:
	@mkdir -p $(BIN_DIR) $(SITE_FN_DIR)
	@for cmd in $(COMMANDS); do \
		ln -sfn $(CURDIR)/$(SRC_DIR)/$$cmd/$$cmd $(BIN_DIR)/$$cmd; \
	done
	@for comp in $(SRC_DIR)/completions/_*; do \
		ln -sfn $(CURDIR)/$$comp $(SITE_FN_DIR)/$$(basename $$comp); \
	done
	@echo "Installed $(words $(COMMANDS)) commands to $(BIN_DIR)"
	@echo "Linked completions to $(SITE_FN_DIR)"

uninstall:
	@for cmd in $(COMMANDS); do \
		rm -f $(BIN_DIR)/$$cmd; \
	done
	@for comp in $(SRC_DIR)/completions/_*; do \
		rm -f $(SITE_FN_DIR)/$$(basename $$comp); \
	done
	@echo "Uninstalled"
