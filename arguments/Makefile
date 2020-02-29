# ------------------------------------------------
# Argdown Makefile
# ------------------------------------------------

SRCDIR   := .
BINDIR   := build

SOURCES  := $(wildcard $(SRCDIR)/*.argdown)
IMAGES := $(patsubst $(SRCDIR)/%.argdown,$(BINDIR)/%.pdf,$(SOURCES))
IMAGE_SVGS := $(patsubst $(SRCDIR)/%.argdown,$(BINDIR)/%.svg,$(SOURCES))

.PHONY: all clean

all: $(IMAGES)

clean:
	rm -rf $(BINDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

$(IMAGE_SVGS): $(BINDIR)/%.svg : $(SRCDIR)/%.argdown | $(BINDIR)
	argdown map --format svg $< $(BINDIR)

$(IMAGES): $(BINDIR)/%.pdf : $(BINDIR)/%.svg
	inkscape -z -D --file=$< --export-pdf=$@
