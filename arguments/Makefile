# ------------------------------------------------
# Argdown Makefile
# ------------------------------------------------

SHELL := bash

SRCDIR := .
BINDIR := build
CITDIR := build/w_citations

WHOLE_FILES := demo key
VARIATIONS := whole contrib goingdark goldenage fallacies

SOURCES := $(wildcard $(SRCDIR)/*.ad)
DOCS_W_CITS := $(patsubst $(SRCDIR)/%.ad,$(CITDIR)/%.ad.success,$(SOURCES))
LATEX_CIT_FILE := ../build/Thesis.aux
BUILD_CONFIG := argdown.config.js
BUILT_SENTINAL := $(BINDIR)/.built

.PHONY: all clean image

all: $(BUILT_SENTINAL)

clean:
	rm -rf $(BINDIR) $(CITDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

$(CITDIR):
	mkdir -p $(CITDIR)

$(DOCS_W_CITS): $(CITDIR)/%.ad.success : $(SRCDIR)/%.ad | $(LATEX_CIT_FILE) $(CITDIR)
	set -e; \
		TARGET=$$(echo $@ | sed 's/.success//'); \
		rm -f $$TARGET; \
		$(MAKE) $$TARGET
	touch $@

$(CITDIR)/%.ad: $(SRCDIR)/%.ad | $(LATEX_CIT_FILE) $(CITDIR)
	../scripts/argdown-preprocess.sh $<

image:
	# Requires ARGDOWN_ARGS and FILE
	argdown run --config argdown.config.js $(ARGDOWN_ARGS)
	inkscape -z -D --file=$(BINDIR)/$(FILE).svg --export-pdf=$(BINDIR)/$(FILE).pdf
	inkscape -z -D --file=$(BINDIR)/$(FILE).svg --export-latex --export-ps=$(BINDIR)/$(FILE).ps
	head -n 49 $(BINDIR)/$(FILE).ps_tex > $(BINDIR)/$(FILE).tex
	cat inkscape-mod.tex >> $(BINDIR)/$(FILE).tex
	tail -n +50 $(BINDIR)/$(FILE).ps_tex >> $(BINDIR)/$(FILE).tex
	rm $(BINDIR)/$(FILE).ps_tex

$(WHOLE_FILES): $(DOCS_W_CITS) $(BUILD_CONFIG)
	$(MAKE) image ARGDOWN_ARGS="file $(CITDIR)/$@.ad" FILE=$@

$(VARIATIONS): $(DOCS_W_CITS) $(BUILD_CONFIG)
	$(MAKE) image ARGDOWN_ARGS=$@ FILE=comprehensive.$@

$(BUILT_SENTINAL): $(DOCS_W_CITS) $(BUILD_CONFIG)
	set -ex; \
		for FILE in $(WHOLE_FILES); do $(MAKE) $$FILE; done
	set -ex; \
		for VAR in $(VARIATIONS); do $(MAKE) $$VAR; done
	touch $(BUILT_SENTINAL)
