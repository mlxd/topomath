CC      =       pdflatex
BCC     =       bibtex
FLAGS   =       -shell-escape
WHITE		=				$(cat main.tex | sed 's/\\pagecolor{base03}/%/g')

Color:  Main.tex
				${CC} ${FLAGS} -jobname=Colored Main.tex;
				#bibtex Colored;
				${CC} ${FLAGS} -jobname=Colored Main.tex;
				${CC} ${FLAGS} -jobname=Colored Main.tex;
        #cp ./Final_thesis.pdf ../TheBookTB/Thesis.pdf

White:  whitetex
				${CC} ${FLAGS} -jobname=White whitetex
				#bibtex White;
				${CC} ${FLAGS} -jobname=White whitetex;
				${CC} ${FLAGS} -jobname=White whitetex;
        #cp ./Final_thesis.pdf ../TheBookTB/Thesis.pdf

whitetex: Main.tex
			sed 's/\\pagecolor{base03}/%/g' $< >$@;

bibtex:
				${BCC} biblio

clean:
				rm -f *gz *blx* *.bcf *.xml *bak *.out *.log *.aux *.lot *.toc *.bbl *.blg *mk *fls *lof


all: Color White
