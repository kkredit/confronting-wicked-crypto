DOCNAME := Thesis
OUTDIR := build
TEMPLATE := gvsu-thesis-template
TEMPLATE_IS_CLONED := $(TEMPLATE)/Fonts

SOURCES := $(wildcard *.tex) $(wildcard *.bib) $(wildcard Forms/*.pdf) $(wildcard $(TEMPLATE)/*.tex) $(wildcard $(TEMPLATE)/*.cls)
LATEX_OPTS := -xelatex -bibtex -outdir=$(OUTDIR) -halt-on-error -file-line-error
LIVE_OPTS := -pvc -view=none
LATEX_PATHS := '.:./$(TEMPLATE):'
ENVIRON := TEXINPUTS=$(LATEX_PATHS) TEXFORMATS=$(LATEX_PATHS)

GVSU_JOB := Thesis-GVSU
PRETTY_JOB := Thesis

.PHONY: all pretty gvsu live gvsu-live clean Prereqs Kludge

pretty: $(OUTDIR)/$(PRETTY_JOB).pdf
gvsu: $(OUTDIR)/$(GVSU_JOB).pdf
all: gvsu pretty

$(TEMPLATE_IS_CLONED):
	git submodule init
	git submodule update --init --force --remote

Fonts: | $(TEMPLATE_IS_CLONED)
	if [ ! -L Fonts ]; then ln -s $(TEMPLATE)/Fonts Fonts; fi

Kludge:
	# FIXME: Kludge to fix broken VSCode LatexWorkshop
	if [ ! -L build/build ]; then mkdir -p build && ln -s . build/build; fi

Prereqs: | $(TEMPLATE_IS_CLONED) Fonts Kludge

$(DOCNAME).bib:
	./scripts/bib-gen.sh

$(OUTDIR)/$(GVSU_JOB).pdf: $(SOURCES) | Prereqs
	$(ENVIRON) latexmk -jobname=$(GVSU_JOB) $(LATEX_OPTS) $(DOCNAME)

$(OUTDIR)/$(PRETTY_JOB).pdf: $(SOURCES) | Prereqs
	$(ENVIRON) latexmk -jobname=$(PRETTY_JOB) $(LATEX_OPTS) $(DOCNAME)

live: | Prereqs
	$(ENVIRON) latexmk -jobname=$(PRETTY_JOB) $(LATEX_OPTS) $(LIVE_OPTS) $(DOCNAME)

gvsu-live: | Prereqs
	$(ENVIRON) latexmk -jobname=$(GVSU_JOB) $(LATEX_OPTS) $(LIVE_OPTS) $(DOCNAME)

clean:
	rm -rf $(OUTDIR)
