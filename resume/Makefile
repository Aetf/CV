FIGURES := $(wildcard figures/*.png)
PAGES := $(wildcard pages/*.tex)
INCLUDES := $(wildcard includes/*.pdf)
LIBS := $(wildcard lib/*.sty) $(wildcard lib/*.cls)

pdf: resume.pdf

%.pdf: export TEXINPUTS=lib:
%.pdf: export BSTINPUTS=lib:
%.pdf: %.tex $(PAGES) $(FIGURES) $(LIBS)
	echo $(TEXINPUTS) $(BSTINPUTS)
	xelatex -shell-escape --no-pdf --interaction=nonstopmode $<
	bibtex $* || true
	xelatex -shell-escape --no-pdf --interaction=nonstopmode $<
	xelatex -shell-escape --interaction=nonstopmode $<

clean:
	rm -rf *.run.xml *.bcf *.aux *.blg *.out *.log *.bbl *.toc *.backup *.xdv _minted-*

distclean: clean
	rm -rf *.pdf

.PHONY: pdf clean distclean
