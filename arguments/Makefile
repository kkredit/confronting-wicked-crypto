# ------------------------------------------------
# Argdown Makefile
# ------------------------------------------------

SHELL := bash

SRCDIR := .
BINDIR := build
CITDIR := build/w_citations

VARIATIONS := whole ea_proposals pro anti fallacies

SOURCES := comprehensive.ad demo.ad
DOCS_W_CITS := $(CITDIR)/comprehensive.ad.success $(CITDIR)/demo.ad.success
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

$(CITDIR)/%.ad.success: $(SRCDIR)/%.ad | $(CITDIR)
	set -e; \
		TARGET=$$(echo $@ | sed 's/.success//'); \
		rm -f $$TARGET; \
		$(MAKE) $$TARGET
	touch $@

$(CITDIR)/%.ad: $(SRCDIR)/%.ad | $(CITDIR)
	../scripts/argdown-preprocess.sh $<

$(BUILT_SENTINAL): $(DOCS_W_CITS) $(BUILD_CONFIG)
	set -ex; \
		for VAR in $(VARIATIONS); do \
			argdown run --config argdown.config.js $$VAR; \
			inkscape -z -D --file=$(BINDIR)/comprehensive.$$VAR.svg --export-pdf=$(BINDIR)/comprehensive.$$VAR.pdf; \
		done; \
		argdown run --config argdown.config.js file $(CITDIR)/demo.ad; \
		inkscape -z -D --file=$(BINDIR)/demo.svg --export-pdf=$(BINDIR)/demo.pdf;
	touch $(BUILT_SENTINAL)
