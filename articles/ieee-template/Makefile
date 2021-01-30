DOCNAME := Article
OUTDIR := build

.PHONY: clean
.PHONY: default
.PHONY: all
.PHONY: full-clean

default: all
all: $(OUTDIR)/$(DOCNAME).pdf

$(OUTDIR):
	mkdir -p $(OUTDIR)

$(OUTDIR)/$(DOCNAME).pdf: $(DOCNAME).tex | $(OUTDIR)
	pdflatex -output-directory $(OUTDIR) $(DOCNAME).tex
	pdflatex -output-directory $(OUTDIR) $(DOCNAME).tex

full-clean: clean
	rm -rf $(OUTDIR)

clean:
	rm -rf $(OUTDIR)/{*.aux,*.log,*.out,*.fls,*.fdb_latexmk,*.synctex.gz}
