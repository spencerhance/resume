.PHONY: SH_Resume.pdf all clean

all: SH_Resume.pdf

# CUSTOM BUILD RULES
%.tex: %.raw
	./raw2tex $< > $@

%.tex: %.dat
	./dat2tex $< > $@

# MAIN LATEXMK RULE
SH_Resume.pdf: SH_Resume.tex
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make SH_Resume.tex

clean:
	latexmk -CA
