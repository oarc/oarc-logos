SHELL = /bin/bash

SVG = $(wildcard *.svg)
PNG = $(SVG:.svg=.png)
JPG = $(SVG:.svg=.jpg)
GIF = $(SVG:.svg=.gif)

.PHONY : all
all : $(PNG) $(JPG) $(GIF)

%.png : %.svg
	@inkscape -e $@ $<

%.thumb.png : %.png
	@convert -size 125x125 -resize 125x125 $< $@

%.jpg : %.png
	@convert $< $@

%.gif : %.png
	@convert $< $@

.PHONY : clean
clean :
	@rm -f $(PNG) $(JPG) $(GIF)

.PRECIOUS : %.png
