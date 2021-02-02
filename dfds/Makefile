
DIAGRAM_DIR := .
BUILD_DIR := build

SOURCES := $(wildcard $(DIAGRAM_DIR)/*.drawio)
DIAGRAMS := $(patsubst $(DIAGRAM_DIR)/%.drawio,$(BUILD_DIR)/%.png,$(SOURCES))
DIAGRAMS_PDFS := $(patsubst $(DIAGRAM_DIR)/%.drawio,$(BUILD_DIR)/%.pdf,$(SOURCES))

.PHONY: clean
.PHONY: default
.PHONY: all

default: all
all: $(DIAGRAMS) $(DIAGRAMS_PDFS)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.png: $(DIAGRAM_DIR)/%.drawio | $(BUILD_DIR)
	drawio --export $< --format png --scale 2.0 --embed-dragram -o $@

$(BUILD_DIR)/%.pdf: $(DIAGRAM_DIR)/%.drawio | $(BUILD_DIR)
	drawio --export $< --format pdf -o $@

clean:
	rm -f $(DIAGRAMS) $(DIAGRAMS_PDFS)
