# ------------------------------------------------
# Argdown Makefile
# ------------------------------------------------

SHELL := bash

SRCDIR := .
BINDIR := build
CITDIR := build/w_citations

VARIATIONS := whole ea_proposals pro anti

SOURCES := comprehensive.ad
DOCS_W_CITS := $(CITDIR)/comprehensive.ad
BUILD_CONFIG := argdown.config.js
BUILT_SENTINAL := $(BINDIR)/.built

.PHONY: all clean

all: $(BUILT_SENTINAL)

clean:
	rm -rf $(BINDIR) $(CITDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

$(CITDIR):
	mkdir -p $(CITDIR)

$(CITDIR)/%.ad: $(SRCDIR)/%.ad | $(CITDIR)
	../scripts/argdown-insert-citations.sh $<

$(BUILT_SENTINAL): $(DOCS_W_CITS) $(BUILD_CONFIG)
	set -ex; \
		for VAR in $(VARIATIONS); do \
			argdown run --config argdown.config.js $$VAR; \
			inkscape -z -D --file=$(BINDIR)/comprehensive.$$VAR.svg --export-pdf=$(BINDIR)/comprehensive.$$VAR.pdf; \
		done
	touch $(BUILT_SENTINAL)
