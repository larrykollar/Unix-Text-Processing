#
# Makefile for _Unix Text Processing_
#
# 16 November 2002 - jcs
#
#
# Set the next two lines for the paths for groff and awk on your system
#
GROFF = /usr/bin/groff
GROPDF_EMBED = # -P-e
AWK = /usr/bin/awk
VIEW = gv

CHAPTERS= front.t preface.t ch01.t ch02.t ch03.t ch04.t ch05.t \
ch06.t ch07.t ch08.t ch09.t ch10.t ch11.t ch12.t ch13.t ch14.t \
ch15.t ch16.t ch17.t ch18.t appa.t appb.t appc.t appd.t appe.t \
appf.t appg.t

utp_book.pdf: toc.t utp_ix.t
	$(GROFF) -Tpdf $(GROPDF_EMBED) -P-pletter -step -ms -z -rpdf:bm.nr=1 -rRef=0 -dPDF.EXPORT=1 utp_book.t 2>&1 | grep '^.ds' | $(GROFF) -Tpdf -P-pletter $(GROPDF_EMBED) -step -ms -rRef=0 - utp_book.t >$@.tmp
	mv $@.tmp $@

clean::
	rm -f utp_book.pdf

toc.t: $(CHAPTERS)
	$(GROFF) -Tpdf $(GROPDF_EMBED) -P-pletter -z -step -rpdf:bm.nr=1 -ms -rRef=1 -wall utp_book.t >/dev/null 2>utp.aux.tmp; \
	mv utp.aux.tmp utp.aux; \
	$(AWK) -f toc.awk utp.aux >$@.tmp; \
	mv $@.tmp $@

clean::
	rm -f utp.aux.tmp utp.aux toc.t toc.t.tmp

utp_ix.t: $(CHAPTERS)
	./mkindex.pl utp.aux > $@.tmp
	mv $@.tmp $@
	
clean::
	rm -f utp_ix.t utp_ix.t.tmp
#########################################################################
# helpers to maintain single chapters
# make ch03
#########################################################################

.SUFFIXES: .t .html

% : %.t
	groff -step -ms -rRef=0 $< > x.ps 2>ix.raw
	$(VIEW) x.ps
