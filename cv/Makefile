FIGURES := $(wildcard figures/*.png)
PAGES := $(wildcard pages/*.tex)
INCLUDES := $(wildcard includes/*.pdf)
LIBS := lib/cv.sty

pdf: cv.pdf

cv.pdf: export TEXINPUTS=lib:
cv.pdf: export BSTINPUTS=lib:
cv.pdf: cv.tex $(PAGES) $(FIGURES) $(LIBS)
	echo $(TEXINPUTS) $(BSTINPUTS)
	xelatex -shell-escape --no-pdf --interaction=nonstopmode cv.tex
	bibtex cv || true
	xelatex -shell-escape --no-pdf --interaction=nonstopmode cv.tex
	xelatex -shell-escape --interaction=nonstopmode cv.tex

clean:
	rm -rf *.run.xml *.bcf *.aux *.blg *.out *.log *.bbl *.toc *.backup *.xdv _minted-*

distclean: clean
	rm -rf cv.pdf

.PHONY: pdf clean distclean
