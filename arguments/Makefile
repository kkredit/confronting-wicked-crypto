# ------------------------------------------------
# Argdown Makefile
# ------------------------------------------------

SRCDIR   := .
BINDIR   := build
CITDIR   := build/w_citations

SOURCES  := $(wildcard $(SRCDIR)/*.ad)
IMAGES := $(patsubst $(SRCDIR)/%.ad,$(BINDIR)/%.pdf,$(SOURCES))
IMAGE_SVGS := $(patsubst $(SRCDIR)/%.ad,$(BINDIR)/%.svg,$(SOURCES))
IMAGE_W_CITS := $(patsubst $(SRCDIR)/%.ad,$(CITDIR)/%.ad,$(SOURCES))

.PHONY: all clean dirs

all: $(IMAGES)

clean:
	rm -rf $(BINDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

$(CITDIR):
	mkdir -p $(CITDIR)

# $(IMAGE_W_CITS): $(CITDIR)/%.ad : $(SRCDIR)/%.ad | $(CITDIR)
$(CITDIR)/%.ad : $(SRCDIR)/%.ad | $(CITDIR)
	../scripts/argdown-insert-citations.sh $<

# $(IMAGE_SVGS):
$(BINDIR)/%.svg : $(CITDIR)/%.ad | $(BINDIR)
	argdown run --config argdown.config.js onesvg $<

# $(IMAGES):
$(BINDIR)/%.pdf : $(BINDIR)/%.svg
	inkscape -z -D --file=$< --export-pdf=$@
