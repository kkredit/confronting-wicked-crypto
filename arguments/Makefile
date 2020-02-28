# ------------------------------------------------
# Argdown Makefile
# ------------------------------------------------

SRCDIR   := .
BINDIR   := build

SOURCES  := $(wildcard $(SRCDIR)/*.argdown)
IMAGES := $(patsubst $(SRCDIR)/%.argdown,$(BINDIR)/%.pdf,$(SOURCES))

.PHONY: all clean

all: $(IMAGES)

clean:
	rm -rf $(BINDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

$(IMAGES): $(BINDIR)/%.pdf : $(SRCDIR)/%.argdown | $(BINDIR)
	argdown map $< $(BINDIR)
