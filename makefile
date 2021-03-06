
server:
	jekyll serve --trace

view:
	open http://localhost:4000

cv: pdf txt

pdf: makefile malick-cv.md malick-cv.tex
	tail +12 malick-cv.md > cv-body.md
	perl -p -i -e "s/<br>/  /g" cv-body.md
	pandoc cv-body.md -o cv-body.tex
	pandoc malick-cv-head.md -o cv-head.tex
	latexmk -pdf malick-cv.tex
	rm cv-body.tex
	rm cv-head.tex
	rm cv-body.md
	rm *.log *.out *.aux *.fls *.fdb_latexmk
	cp malick-cv.md ./cv/index.md

txt: makefile malick-cv.md malick-cv.tex
	tail +12 malick-cv.md > cv-body.md
	perl -p -i -e "s/<br>/\\\/g" cv-body.md
	pandoc cv-body.md -o cv-body.txt
	cat malick-cv-head.md cv-body.txt > malick-cv.txt
	perl -p -i -e "s/\\\$///g" malick-cv.txt
	rm cv-body.txt
	rm cv-body.md
