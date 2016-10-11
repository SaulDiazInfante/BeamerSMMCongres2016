# Makefile for LaTeX
##################################################################
# Use:
# make
# make clean
# options for ps2pdf: http://pages.cs.wisc.edu/~ghost/doc/AFPL/6.50/Ps2pdf.htm

TEX:=$(shell ls *.tex)
FILES= *.tex Makefile *.bst *.pdf *.bib
FOLDER= BeamerSMMCongres2016/
OTHER = *~ *.aux *.dvi *.toc *.bbl *.blg *.out *.thm *.ps *.idx *.ilg *.ind *.tdo *.pdf *.tar.gz *.log *.spl *.synctex.gz
LATEX	= latex
BIBTEX	= bibtex
MAKEINDEX = makeindex
XDVI	= xdvi -gamma 4
DVIPS	= dvips
DVIPDF  = dvipdft
L2H	= latex2html
GH	= gv
FILES= *.tex *.sty *.png *.bbl *.bib *.pdf *.lyx Makefile *.mpg *jpg biblio
FOLDERS= \Imagenes \images
NAMETAR1:= $(shell date '+%Y%b%d_%H_%M')
NAMETAR="$(NAMETAR1)_BeamerSMMCongres2016.tar.gz"
NAMEZIP="$(NAMETAR1)_BeamerSMMCongres2016.zip"

pdflatex: BeamerSMMCongres2016.tex
	/usr/local/texlive/2015/bin/x86_64-linux/pdflatex --synctex=1 BeamerSMMCongres2016.tex
	/usr/local/texlive/2015/bin/x86_64-linux/bibtex BeamerSMMCongres2016.aux
	sh biblio.sh
	/usr/local/texlive/2015/bin/x86_64-linux/pdflatex --synctex=1 BeamerSMMCongres2016.tex
	/usr/local/texlive/2015/bin/x86_64-linux/pdflatex --synctex=1 BeamerSMMCongres2016.tex

clean:
	rm -f $(OTHER) $(PS)
	(cd introduction && rm -f $(OTHER) $(PS))
	(cd papers/* && rm -f $(OTHER) $(PS))

tar: $(FILES)
	(cd .. && tar -cvf $(NAMETAR) $(FOLDER))

zip: $(FILES)
	(cd .. && zip -r $(NAMEZIP) $(FOLDER))
