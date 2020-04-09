DOCNAME := Thesis
OUTDIR := build
TEMPLATE := gvsu-thesis-template
TEMPLATE_IS_CLONED := $(TEMPLATE)/Fonts

ARG_SRC_DIR := arguments
ARG_IMAGE_SOURCES  := $(wildcard $(ARG_SRC_DIR)/*.argdown)
ARG_IMAGES := $(patsubst $(ARG_SRC_DIR)/%.argdown,$(ARG_SRC_DIR)/build/%.pdf,$(ARG_IMAGE_SOURCES))

DFD_SRC_DIR := dfds
DFD_IMAGE_SOURCES  := $(wildcard $(ARG_SRC_DIR)/*.drawio)
DFD_IMAGES := $(patsubst $(DFD_SRC_DIR)/%.drawio,$(DFD_SRC_DIR)/build/%.png,$(DFD_IMAGE_SOURCES))

IMAGES := $(ARG_IMAGES) $(DFD_IMAGES)

SOURCES := $(wildcard *.tex) $(wildcard *.bib) $(wildcard Forms/*.pdf) $(wildcard $(TEMPLATE)/*.tex) \
	$(wildcard $(TEMPLATE)/*.cls) $(ARG_IMAGE_SOURCES) $(DFD_IMAGE_SOURCES)
LATEX_OPTS := -xelatex -bibtex -outdir=$(OUTDIR) -halt-on-error -file-line-error
LIVE_OPTS := -pvc -view=none
LATEX_PATHS := '.:./$(TEMPLATE):'
ENVIRON := TEXINPUTS=$(LATEX_PATHS) TEXFORMATS=$(LATEX_PATHS)

GVSU_JOB := Thesis-GVSU
PRETTY_JOB := Thesis

.PHONY: all pretty gvsu live gvsu-live clean clean-all prereqs
# TODO: build from a container. I don't trust myself to keep this environment working!

pretty: $(OUTDIR)/$(PRETTY_JOB).pdf
gvsu: $(OUTDIR)/$(GVSU_JOB).pdf
all: gvsu pretty

$(TEMPLATE_IS_CLONED):
	git submodule init
	git submodule update --init --force --remote

Fonts: | $(TEMPLATE_IS_CLONED)
	if [ ! -L Fonts ]; then ln -s $(TEMPLATE)/Fonts Fonts; fi

# FIXME: Kludge to fix broken VSCode LatexWorkshop
build/build:
	mkdir -p build
	ln -s . build/build

$(IMAGES):
	make -C $(ARG_SRC_DIR)
	make -C $(DFD_SRC_DIR)

$(DOCNAME).bib:
	./scripts/bib-gen.sh

$(DOCNAME)-Glossary.tex: notes/glossary.md
	./scripts/update-acronyms.sh

prereqs: | $(TEMPLATE_IS_CLONED) Fonts build/build $(IMAGES) $(DOCNAME).bib

$(OUTDIR)/$(GVSU_JOB).pdf: $(SOURCES) | prereqs
	$(ENVIRON) latexmk -jobname=$(GVSU_JOB) $(LATEX_OPTS) $(DOCNAME)

$(OUTDIR)/$(PRETTY_JOB).pdf: $(SOURCES) | prereqs
	$(ENVIRON) latexmk -jobname=$(PRETTY_JOB) $(LATEX_OPTS) $(DOCNAME)

live: | prereqs
	$(ENVIRON) latexmk -jobname=$(PRETTY_JOB) $(LATEX_OPTS) $(LIVE_OPTS) $(DOCNAME)

gvsu-live: | prereqs
	$(ENVIRON) latexmk -jobname=$(GVSU_JOB) $(LATEX_OPTS) $(LIVE_OPTS) $(DOCNAME)

clean:
	rm -rf $(OUTDIR) $(DOCNAME).bib

clean-all: clean
	make -C $(ARG_SRC_DIR) clean
	make -C $(DFD_SRC_DIR) clean
