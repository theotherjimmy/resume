latex-files += resume.tex
output := resume

all:  ${output}.pdf

${output}.pdf: ${latex-files}
	pdflatex -file-line-error ${latex-files}
	pdflatex -file-line-error ${latex-files}

clean:
	rm -rf *.pdf *.aux *.log
