$(FINAL_GENERIC_PDF): $(GENERIC_PARTS) $(CONFIG_INPUT) $(IMG_INPUT)
	$(LATEXMK) -jobname=$(GENERIC_BASE) $(GENERIC_BASE)/slides.tex