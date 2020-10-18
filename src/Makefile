#
# Makefile for _Unix Text Processing_
#
# 16 November 2002 - jcs
#
#
# Set the next two lines for the paths for groff and awk on your system
#
GROFF = /usr/bin/groff
AWK = /usr/bin/awk
VIEW = gv

CHAPTERS= front.t preface.t ch01.t ch02.t ch03.t ch04.t ch05.t \
ch06.t ch07.t ch08.t ch09.t ch10.t ch11.t ch12.t ch13.t ch14.t \
ch15.t ch16.t ch17.t ch18.t appa.t appb.t appc.t appd.t appe.t \
appf.t appg.t

utp_book.ps: toc.t utp_ix.t
	$(GROFF) -step -ms -rRef=0 utp_book.t >$@.tmp
	mv $@.tmp $@

clean::
	rm -f utp_book.ps utp_book.ps.tmp

toc.t: $(CHAPTERS)
	$(GROFF) -step -ms -rRef=1 ix.macro utp_book.t >/dev/null 2>utp.aux.tmp
	mv utp.aux.tmp utp.aux
	$(AWK) -f toc.awk utp.aux >$@.tmp
	mv $@.tmp $@

clean::
	rm -f utp.aux.tmp utp.aux toc.t toc.t.tmp

utp_ix.t: $(CHAPTERS)
	cd index && ./make.index ../utp.aux >../$@.tmp
	mv $@.tmp $@

clean::
	rm -f utp_ix.t utp_ix.t.tmp

#########################################################################
# helpers to maintain single chapters
# make ch03
#########################################################################

.SUFFIXES: .t .html .pdf

% : %.t
	groff -step -ms -rRef=0 $< > x.ps 2>ix.raw
	$(VIEW) x.ps

%.pdf : %.t
	groff -step -ms -rRef=0 $< > x.ps
	ps2pdf x.ps
	mv x.pdf $@
	$(VIEW) x.ps
