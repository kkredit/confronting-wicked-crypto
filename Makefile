DOCNAME := Thesis
OUTDIR := build
TEMPLATE := gvsu-thesis-template
TEMPLATE_IS_CLONED := $(TEMPLATE)/Fonts

ARG_SRC_DIR := arguments
ARG_IMAGE_SOURCES  := $(wildcard $(ARG_SRC_DIR)/*.ad)
ARG_IMAGES := $(patsubst $(ARG_SRC_DIR)/%.ad,$(ARG_SRC_DIR)/build/%.pdf,$(ARG_IMAGE_SOURCES))

DFD_SRC_DIR := dfds
DFD_IMAGE_SOURCES  := $(wildcard $(DFD_SRC_DIR)/*.drawio)
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

DOCKER_BUILD_ARGS := --build-arg USER_UID=`id -u` --build-arg USER_GID=`id -g` --build-arg USER_NAME=`whoami`
DOCKER_TAG := thesis-build-env
DISP_FLAGS := -e DISPLAY=$(DISPLAY) -v /tmp/.X11-unix:/tmp/.X11-unix
DOCKER_RUN_FLAGS := --privileged $(DISP_FLAGS) -v `pwd`:/host --user=`id -u`:`id -g` --hostname builder --rm -it
# FIXME: the following command alleviates a side-effect in the container where 'drawio' hangs upon fist execution
HACK := drawio --export DFD-demo.drawio --format png --embed-dragram -o build/DFD-demo.png
DOCKER_RUN_CMD := bash -c "(cd dfds; $(HACK) &); make live"

.PHONY: all check pretty gvsu images live gvsu-live docker rtf clean clean-all prereqs

pretty: $(OUTDIR)/$(PRETTY_JOB).pdf
gvsu: $(OUTDIR)/$(GVSU_JOB).pdf
all: gvsu pretty

check:
	# Ensure that all the references in the arguments maps resolved. It would be nice to automatically rebuild if this
	# check fails, but that is more work than it is probably worth.
	if (( 0 != $$(grep -rniI E_AGAIN arguments/build/ | wc -l) )); then \
		printf "\e[1;31m$$(grep -rniIl E_AGAIN arguments/build/)\e[0m\n"; \
		exit 1; \
	fi

$(TEMPLATE_IS_CLONED):
	git submodule init
	git submodule update --init --force --remote

Fonts: | $(TEMPLATE_IS_CLONED)
	if [ ! -L Fonts ]; then ln -s $(TEMPLATE)/Fonts Fonts; fi

images:
	$(MAKE) $(IMAGES)

$(OUTDIR)/$(DOCNAME).aux:
	# This fails but is needed to bootstrap the image making process
	$(ENVIRON) latexmk -jobname=$(PRETTY_JOB) $(LATEX_OPTS) $(DOCNAME) || true

$(IMAGES): | $(OUTDIR)/$(DOCNAME).aux
	$(MAKE) -C $(ARG_SRC_DIR)
	$(MAKE) -C $(DFD_SRC_DIR)

$(DOCNAME).bib:
	./scripts/bib-gen.sh

$(DOCNAME)-Glossary.tex: notes/glossary.md
	./scripts/update-acronyms.sh

prereqs: | $(TEMPLATE_IS_CLONED) Fonts $(IMAGES) $(DOCNAME).bib

$(OUTDIR)/$(GVSU_JOB).pdf: $(SOURCES) | prereqs
	$(ENVIRON) latexmk -jobname=$(GVSU_JOB) $(LATEX_OPTS) $(DOCNAME)

$(OUTDIR)/$(PRETTY_JOB).pdf: $(SOURCES) | prereqs
	$(ENVIRON) latexmk -jobname=$(PRETTY_JOB) $(LATEX_OPTS) $(DOCNAME)

live: | prereqs
	$(ENVIRON) latexmk -jobname=$(PRETTY_JOB) $(LATEX_OPTS) $(LIVE_OPTS) $(DOCNAME)

gvsu-live: | prereqs
	$(ENVIRON) latexmk -jobname=$(GVSU_JOB) $(LATEX_OPTS) $(LIVE_OPTS) $(DOCNAME)

rtf: | pretty
	latex2rtf $(DOCNAME).tex
	pandoc $(DOCNAME).tex -o $(DOCNAME).docx

docker:
	docker build $(DOCKER_BUILD_ARGS) -t $(DOCKER_TAG) .
	docker run $(DOCKER_RUN_FLAGS) $(DOCKER_TAG)
	# docker run $(DOCKER_RUN_FLAGS) $(DOCKER_TAG) $(DOCKER_RUN_CMD)

clean:
	rm -rf $(OUTDIR) $(DOCNAME).bib

clean-all: clean
	$(MAKE) -C $(ARG_SRC_DIR) clean
	$(MAKE) -C $(DFD_SRC_DIR) clean
