
docx: work/paper.docx
html: work/paper.html

work/paper.docx: work/paper.md4
	pandoc -t docx -o work/paper.docx work/paper.md4

work/paper.html: work/paper.md4
	convert work/badge_wing-length.png -resize 600x600 work/badge_wing-length.png
	sed -i -e 's+(work/badge+(badge+' work/paper.md4
	pandoc -t html -o work/paper.html work/paper.md4

work/results.md: doc/results.Rmd data/badge.csv
	Rscript -e \
		'library(knitr); knit(input="doc/results.Rmd", output="work/results.md")'

work/paper.md4: doc/paper.md work/results.md
	m4 -P doc/paper.md > work/paper.md4

.PHONY: docx html
