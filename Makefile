IMAGES=$(shell find . -mindepth 1 -maxdepth 1 -type d | grep -v git)
all: $(IMAGES)

.PHONY: force
$(IMAGES): force
	cd $@ && docker build -t $@ .
