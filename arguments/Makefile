# ------------------------------------------------
# Argdown Makefile
# ------------------------------------------------

SRCDIR   := .
BINDIR   := build
CITDIR   := build/w_citations

SOURCES  := $(wildcard $(SRCDIR)/*.argdown)
IMAGES := $(patsubst $(SRCDIR)/%.argdown,$(BINDIR)/%.pdf,$(SOURCES))
IMAGE_SVGS := $(patsubst $(SRCDIR)/%.argdown,$(BINDIR)/%.svg,$(SOURCES))
IMAGE_W_CITS := $(patsubst $(SRCDIR)/%.argdown,$(CITDIR)/%.argdown,$(SOURCES))

.PHONY: all clean dirs

all: $(IMAGES)

clean:
	rm -rf $(BINDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

$(CITDIR):
	mkdir -p $(CITDIR)

# $(IMAGE_W_CITS): $(CITDIR)/%.argdown : $(SRCDIR)/%.argdown | $(CITDIR)
$(CITDIR)/%.argdown : $(SRCDIR)/%.argdown | $(CITDIR)
	../scripts/argdown-insert-citations.sh $<

# $(IMAGE_SVGS):
$(BINDIR)/%.svg : $(CITDIR)/%.argdown | $(BINDIR)
	argdown run --config argdown.config.js onesvg $<

# $(IMAGES):
$(BINDIR)/%.pdf : $(BINDIR)/%.svg
	inkscape -z -D --file=$< --export-pdf=$@
