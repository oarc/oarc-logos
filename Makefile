SHELL = /bin/bash

SVG = $(wildcard *.svg)
PNG = $(SVG:.svg=.png)
THUMB = $(SVG:.svg=.thumb.png)
PDF = $(SVG:.svg=.pdf)
JPG = $(SVG:.svg=.jpg)

GENERATED_FILES = $(PNG) $(THUMB) $(PDF) $(JPG)

.PHONY: all
all: $(GENERATED_FILES)

.PHONY: png
png: $(PNG)

.PHONY: thumb
thumb: $(THUMB)

.PHONY: pdf
pdf: $(PDF)

.PHONY: jpg
jpg: $(JPG)

%.png: %.svg
	@inkscape --export-png=$@ $<

#%.thumb.png: %.svg
	#@inkscape -w125 -h125 -e $@ $<

%.thumb.png: %.png
	@convert -size 125x125 -resize 125x125 $< $@

%.pdf: %.svg
	@inkscape --export-text-to-path --export-pdf=$@ $<

%.jpg: %.png
	@convert $< $@

.PHONY: clean
clean:
	@rm -f $(GENERATED_FILES)
