BUILD_DIR= build
FINAL_DIR= final

LATEXMK=latexmk -pdf -file-line-error -halt-on-error -outdir=$(FINAL_DIR) 

CONFIG_INPUT=config/config-lst.tex \
	     config/config-tc.tex \
	     config/footline.tex \
	     config/packages.tex \
	     $(BUILD_DIR)/date.tex

LOGOS=\
logos/uc3m.png

ALL_PARTS = $(GUIDE_PARTS)
ALL_SLIDES_FINAL_PDF=

include guide/Makefile.def
include 01-intro/Makefile.def
include 02-wrappers/Makefile.def
include 03-init-captures/Makefile.def

ALL_FINAL_PDF=\
$(FINAL_DIR) \
$(ALL_SLIDES_FINAL_PDF) \
$(GUIDE_FINAL_PDF) \

all:	$(ALL_FINAL_PDF)

clean:
	rm -Rf $(BUILD_DIR)
	rm -Rf $(FINAL_DIR)

build:
	mkdir $(BUILD_DIR)

updatevers:	$(BUILD_DIR)
	LC_ALL=C git log -1 --format=%ad --date=format:'\date{%B %Y}' > $(BUILD_DIR)/date.tex
#	git log -1 --format=%ad --date=format:'\date{%d de %B de %Y}' > $(BUILD_DIR)/date.tex

$(FINAL_DIR):
	mkdir $(FINAL_DIR)

include $(GUIDE_BASE)/Makefile.mk
include $(INTRO_BASE)/Makefile.mk
include $(WRAPPERS_BASE)/Makefile.mk
include $(INITCAP_BASE)/Makefile.mk
