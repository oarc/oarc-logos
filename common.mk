SVG = $(wildcard *.svg)
PNG = $(SVG:.svg=.png)
JPG = $(SVG:.svg=.jpg)
GIF = $(SVG:.svg=.gif)
BMP = $(SVG:.svg=.bmp)

all : $(PNG) $(JPG) $(GIF) $(BMP)

%.png : %.svg
	@inkscape -e $@ $<

%.thumb.png : %.png
	@convert -size 125x125 -resize 125x125 $< $@

%.jpg : %.png
	@convert $< $@

%.gif : %.png
	@convert $< $@

%.bmp : %.png
	@convert $< $@

clean :
	@rm -f $(PNG) $(JPG) $(GIF) $(BMP)

.PRECIOUS : %.png

.PHONY : all clean
