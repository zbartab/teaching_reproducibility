
work/paper.docx: work/paper.md4
	pandoc -t docx -o work/paper.docx work/paper.md4

work/results.md: doc/results.Rmd
	Rscript -e \
		'library(knitr); knit(input="doc/results.Rmd", output="work/results.md")'

work/paper.md4: doc/paper.md
	m4 -P doc/paper.md > work/paper.md4

