DOCNAME := manuscript
OUTDIR := build
TEMPLATE := ../acm-template
THESIS_BASE := ../..

ARG_SRC_DIR := ../../arguments
ARG_IMAGE_SOURCES  := $(wildcard $(ARG_SRC_DIR)/*.ad)
ARG_IMAGES := $(patsubst $(ARG_SRC_DIR)/%.ad,$(ARG_SRC_DIR)/build/%.pdf,$(ARG_IMAGE_SOURCES))

DFD_SRC_DIR := ../../dfds
DFD_IMAGE_SOURCES  := $(wildcard $(DFD_SRC_DIR)/*.drawio)
DFD_IMAGES := $(patsubst $(DFD_SRC_DIR)/%.drawio,$(DFD_SRC_DIR)/build/%.png,$(DFD_IMAGE_SOURCES))

IMAGES := $(ARG_IMAGES) $(DFD_IMAGES)

SOURCES := $(wildcard *.tex) $(wildcard *.bib) $(wildcard $(TEMPLATE)/*.tex) $(wildcard $(TEMPLATE)/*.cls) \
			$(ARG_IMAGE_SOURCES) $(DFD_IMAGE_SOURCES)
LATEX_OPTS := -xelatex -bibtex -outdir=$(OUTDIR) -halt-on-error -file-line-error
LIVE_OPTS := -pvc -view=none
LATEX_PATHS := '.:./$(TEMPLATE):./$(THESIS_BASE):'
ENVIRON := TEXINPUTS=$(LATEX_PATHS) TEXFORMATS=$(LATEX_PATHS)

.PHONY: all pdf images live clean clean-all prereqs

pdf: $(OUTDIR)/$(DOCNAME).pdf
all: pdf

images:
	$(MAKE) $(IMAGES)

$(OUTDIR)/$(DOCNAME).aux:
	# This fails but is needed to bootstrap the image making process
	$(ENVIRON) latexmk -jobname=$(DOCNAME) $(LATEX_OPTS) $(DOCNAME) || true

$(IMAGES): | $(OUTDIR)/$(DOCNAME).aux
	$(MAKE) -C $(ARG_SRC_DIR)
	$(MAKE) -C $(DFD_SRC_DIR)

prereqs: | $(IMAGES) $(DOCNAME).bib

$(OUTDIR)/$(DOCNAME).pdf: $(SOURCES) | prereqs
	$(ENVIRON) latexmk -jobname=$(DOCNAME) $(LATEX_OPTS) $(DOCNAME)

live: | prereqs
	$(ENVIRON) latexmk -jobname=$(DOCNAME) $(LATEX_OPTS) $(LIVE_OPTS) $(DOCNAME)

clean:
	rm -rf $(OUTDIR)
