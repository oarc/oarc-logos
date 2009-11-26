SVG = $(wildcard *.svg)
PNG = $(SVG:.svg=.png)
JPG = $(SVG:.svg=.jpg)
GIF = $(SVG:.svg=.gif)
BMP = $(SVG:.svg=.bmp)

all : $(SVG) $(PNG) $(JPG) $(GIF) $(BMP)

%.png : %.svg
	inkscape -e $@ $<

%.jpg %.gif %.bmp : %.png
	convert $< $@

clean :
	rm -f $(PNG) $(JPG) $(GIF) $(BMP)

.PRECIOUS : %.png

.PHONY : all clean
