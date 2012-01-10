SHELL = /bin/bash

SVG = $(wildcard *.svg)
PNG = $(SVG:.svg=.png)
THUMB = $(SVG:.svg=.thumb.png)
JPG = $(SVG:.svg=.jpg)

GENERATED_FILES = $(PNG) $(THUMB) $(JPG)

.PHONY : all
all : $(GENERATED_FILES)

%.png : %.svg
	@inkscape -e $@ $<

%.thumb.png : %.png
	@convert -size 125x125 -resize 125x125 $< $@

%.jpg : %.png
	@convert $< $@

.PHONY : clean
clean :
	@rm -f $(GENERATED_FILES)

.PRECIOUS : %.png
