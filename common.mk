%.png : %.svg
	inkscape -e $@ $<

%.jpg : %.png
	convert $< $@

%.gif : %.png
	convert $< $@

%.bmp : %.png
	convert $< $@

clean :
	rm -f *.png *.jpg *.gif *.bmp

.PRECIOUS : %.png

.PHONY : all clean
