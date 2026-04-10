MAIN = main
LATEX = lualatex --shell-escape
BIBER = biber
LATEXMK = latexmk

.PHONY: pdf clean watch quick help

pdf:
	$(LATEX) $(MAIN)
	$(BIBER) $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)

quick:
	$(LATEX) $(MAIN)

watch:
	$(LATEXMK) -pvc $(MAIN)

clean:
	rm -f $(MAIN).{aux,bbl,bcf,blg,fdb_latexmk,fls,log,out,run.xml,synctex.gz,toc,lof,lot,pdf}
	rm -f chapters/*.aux pages/*.aux appendices/*.aux preamble/*.aux
	rm -rf _minted-$(MAIN)
	rm -f texput.log

help: 
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'
