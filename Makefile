DOCNAME := Thesis
BIBNAME := Bibliography

TEMPLATE := simple-thesis-dissertation
ENVIRON := TEXINPUTS='.:./$(TEMPLATE)/:' TEXFORMATS='.:./$(TEMPLATE)/:'

.PHONY: clean
.PHONY: all
.PHONY: full-clean

all: $(DOCNAME).pdf

Fonts: $(TEMPLATE)
	if [[ ! -L Fonts ]]; then ln -s $(TEMPLATE)/Fonts Fonts; fi

$(DOCNAME).pdf: $(DOCNAME).tex $(BIBNAME).bib Fonts
	$(ENVIRON) latexmk -xelatex $(DOCNAME).tex

full-clean: clean
	rm -rf *.pdf

clean:
	rm -rf *.aux *.log *.out *.fls *.fdb_latexmk *.synctex.gz
