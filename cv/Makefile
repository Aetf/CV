TARGET = cv

LIBPATH := lib
BUILDPATH := build

TEX = pdflatex
BIB = bibtex
MKDIR_P = mkdir -p

# for xelatex
# DRAFT_FLAGS = -no-pdf
DRAFTFLAGS = -draftmode
TEXFLAGS = --max-print-line -halt-on-error -file-line-error -interaction=nonstopmode --synctex=1

# Internal variables

FIGURES := $(wildcard figures/*.pdf)
PAGES := $(wildcard pages/*.tex)
LIBS := $(wildcard $(LIBPATH)/*)

PDF_NAME = $(addsuffix .pdf, $(TARGET))
PDF_FILE = $(BUILDPATH)/$(PDF_NAME)

view: all
	if which xdg-open 1>/dev/null 2>&1; then \
		xdg-open $(PDF_FILE); \
	else \
		open -a Preview $(PDF_FILE) & \
	fi

all: $(PDF_FILE)

$(BUILDPATH)/%.pdf: export TEXINPUTS=$(LIBPATH)//:
$(BUILDPATH)/%.pdf: export BSTINPUTS=$(LIBPATH)//:
$(BUILDPATH)/%.pdf: %.tex $(PAGES) $(FIGURES) $(LIBS) $(BUILDPATH)
	$(TEX) $(TEXFLAGS) $(DRAFTFLAGS) -output-directory $(BUILDPATH) $<
	TEXMFOUTPUT="$(BUILDPATH):" $(BIB) $(BUILDPATH)/$* || true
	$(TEX) $(TEXFLAGS) $(DRAFT_ARGS) -output-directory $(BUILDPATH) $<
	$(TEX) $(TEXFLAGS) -output-directory $(BUILDPATH) $<

${BUILDPATH}:
	${MKDIR_P} ${BUILDPATH}

clean:
	rm -rf $(BUILDPATH) *.log *.out *.blg *.bbl *.aux *.synctex.gz *.run.xml *.bcf *.cut *.dvi *.pdf *.fls *.fdb_latexmk

arxiv: $(TARGET).tar.bz2
	@echo "Building tarball for arXiv submission"

$(TARGET).tar.bz2: $(PDF_FILE)
	tar cvf $(TARGET).tar.bz2 --xform='s,$(BUILDPATH)/,,' --xform='s,$(LIBPATH)/,,' $(TARGET).tex $(FIGURES) $(PAGES) $(LIBS) $(BUILDPATH)/$(addsuffix .bbl, $(TARGET))

rename:
	$(eval NEW_NAME := $(notdir $(abspath $(dir $(MAKEFILE_LIST)))))
	$(eval OLD_NAME := $(lastword $(subst -, ,$(TARGET))))
	$(eval STEM_NAME := $(firstword $(subst -, ,$(TARGET))))
	@echo "Renaming $(OLD_NAME) to $(NEW_NAME)"
	for filename in $(TARGET).*; do \
		echo "Moving $$filename to $(STEM_NAME)-$(NEW_NAME).$${filename##*.}"; \
		mv $$filename "$(STEM_NAME)-$(NEW_NAME).$${filename##*.}"; \
	done
	sed -i 's/$(OLD_NAME)/$(NEW_NAME)/g' *.tex Makefile

.PHONY: view all clean rename arxiv
