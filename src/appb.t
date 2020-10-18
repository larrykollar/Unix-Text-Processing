.\" Unix Text Processing by Dougherty and O'Reilly
.\" Appendix B "Formatter Command Summary"
.\"
.\" Converted from .pbm to text and marked up
.\" by
.\" Manas Laha <mlaha@aero.iitkgp.ernet.in>
.\"
.\" TROFF source proof read
.\" by
.\" Andreas Kähäri <andreas.kahari@unix.net>
.\"
.\" Here we include the UTP macros
.so utp.mac
.utp
.\" Point size and Vertical Spacing
.\" .nr PS +2
.\" .nr VS +2
.nr iN 15	\" spaces to indent .IP paragraph
.de poS
.br
.sp 3p
.nr PO +0.35i
.nr LL -0.3i
..
.de poE
.br
.nr PO -0.35i
.nr LL +0.3i
.sp 3p
..
.\"
.\" _page 593
.Se B "Formatter Command Summary" Appendix 1
.\" The line below the appendix title is wrong, it's minus signs
.\" instead of an unbroken line.  /Andreas 2002-09-28
.\" Looks OK now. -LK
.LP
This appendix is divided into ten subsections,
each covering a different facet of the
\f(CWnroff/troff\fP formatting system.
These sections are:
.\" Original markup used DS, sp for this list.
.\" Changed by Larry Kollar
.Ls B
.Li
\f(CWnroff/troff\fP command-line syntax
.Li
\f(CWnroff/troff\fP requests
.Li
escape sequences
.Li
predefined number registers
.Li
special characters
.Li
the \f(CWms\fP macro package
.Li
the \f(CWmm\fP macro package
.Li
the \f(CWtbl\fP preprocessor
.Li
the \f(CWeqn\fP preprocessor
.Li
the \f(CWpic\fP preprocessor
.Le
.PP
In the following sections, italics are used for values
that you supply.
Optional
arguments to requests or macros are enclosed in brackets.
.\" _page 594
.Ah "\f(CBnroff/troff\fP Command-Line Syntax"
.ix	[nroff] formatter, command~line options %key nroff formatter, command line options
nroff [\fIoptions\fP] [\fIfiles\fP]
.ix	[nroff] formatter, invoking %key nroff formatter, invoking
.br
.poS
.ix	%begin [nroff] formatter, summary~of requests %key nroff formatter, summary of requests
.IP "\f(CW-c\fP\fIname\fP" \n(iN
Prepend \f(CW/usr/lib/macros/cmp.n.\fP[\f(CWdt\fP]\f(CW.\fP\fIname\fP
to \fIfiles\fP
(old versions of
.CW nroff
only).
.IP "\f(CW-e\fP" \n(iN
Space words equally on the line instead of in full multiples of the
space character.
.IP "\f(CW-h\fP" \n(iN
Use tabs in large spaces.
.IP "\f(CW-i\fP" \n(iN
Read standard input after \fIfiles\fP are processed.
.IP "\f(CW-k\fP\fIname\fP" \n(iN
Compact macros and output to [\f(CWdt\fP].\fIname\fP
(old versions of
.CW nroff
only).
.IP "\f(CW-m\fP\fIname\fP" \n(iN
Prepend \f(CW/usr/lib/tmac/tmac.\fP\fIname\fP
to \fIfiles\fP.
.IP "\f(CW-n\fP\fIn\fP" \n(iN
Number first page \fIn\fP.
.IP "\f(CW-o\fP\fIlist\fP" \n(iN
Print only pages contained in \fIlist\fP.
Individual pages in \fIlist\fP should
be separated by commas; a page range is specified by \fIn-m\fP;
\fIn-\fP indicates from page \fIn\fP to the end.
.IP "\f(CW-q\fP" \n(iN
Invoke simultaneous input/output of \f(CW.rd\fP requests.
.IP "\f(CW-r\fP\fIan\fP" \n(iN
Set register \fIa\fP to \fIn\fP.
.IP "\f(CW-s\fP\fIn\fPi" \n(iN
Stop every \fIn\fP pages.
.IP "\f(CW-T\fP\fIname\fP" \n(iN
Output is for device type \fIname\fP.
Values are shown in Table B-1.
(Check your manual for other devices, especially those supported
by the \f(CWmm\fP command.)
.IP "\f(CW-u\fP\fIn\fP" \n(iN
Embolden characters by overstriking \fIn\fP times.
.IP "\f(CW-z\fP \n(iN
Throw away output except messages from \f(CW.tm\fP request.
.poE

.ce
.Ts "Device Names for \f(CBnroff\fR
.TS
center,tab(:),box;
l:l.
Abbreviation:Used for
_
\f(CW37\fP:TELETYPE Model 37 terminal (default for \f(CWnroff\fP)
\f(CW450\fP:DASI 450 terminal (default for \f(CWmm\fP)
\f(CWtn300\fP:GE TermiNet 300 printer
\f(CW300\fP:DASI 300 terminal
\f(CW832\fP:Anderson Jacobson 832 printer
\f(CW2631\fP:Hewlett-Packard 2631
\f(CW4000a\fP:Trendata 4000a
\f(CW8510\fP:C. Itoh printer
\f(CWlp\fP:ASCII line printer
\f(CWX\fP:EBCDIC line printer
.TE
.\" _page 595
.Bh "\f(CBtroff\fP Options
.ix	%begin [troff] formatter, summary~of requests %key troff formatter, summary of requests
.LP
troff [\fIoptions\fP] [\fIfiles\fP]
.ix	[troff] formatter, invoking %key troff formatter, invoking
.poS
.ix	[troff] formatter, command~line options %key troff formatter, command line options
.IP "\f(CW-a\fP" \n(iN
Send printable ASCII approximation to standard output.
\f(CWotroff\fP sends its output directly to a connected typesetter
unless the \f(CW-t\fP or \f(CW-a\fP option is specified,
in which case it is sent to standard output.
\f(CWditroff\fP always writes to standard output.
.IP "\f(CW-b\fP" \n(iN
Report phototypesetter status (\f(CWotroff\fP only).
.IP "\f(CW-c\fP\fIname\fP" \n(iN
Prepend \f(CW/usr/lib/macros/cmp.t.[dt].\fP\fIname\fP
to \fIfiles\fP (\f(CWotroff\fP only).
.IP "\f(CW-f\fP" \n(iN
Do not stop the phototypesetter when the formatting run is done
(\f(CWotroff\fP only).
.IP "\f(CW-F\fP\fIdir\fP" \n(iN
Format output for device name using the font tables in directory \fIdir\fP
instead of \f(CW/usr/lib/font\fP (\f(CWditroff\fP only).
.IP "\f(CW-i\fP" \n(iN
Read standard input after files.
.IP "\f(CW-k\fP\fIname\fP" \n(iN
Compact macros and output to
\f(CW[dt].\fP\fIname\fP (\f(CWotroff\fP only).
.IP "\f(CW-m\fP\fIname\fP" \n(iN
Prepend \f(CW/usr/lib/tmac/tmac.\fP\fIname\fP to \fIfiles\fP.
.IP "\f(CW-n\fP\fIn\fP" \n(iN
Number first page \fIn\fP.
.IP "\f(CW-o\fP\fIlist\fP" \n(iN
Print only pages contained in \fIlist\fP.
Individual pages in \fIlist\fP should
be separated by commas.
A page range is specified by \fIn-m\fP;
\fIn\(mi\fP indicates from page \fIn\fP to the end.
.IP "\f(CW-p\fP\fIn\fP" \n(iN
Print all characters in point size \fIn\fP, but retain motions for sizes
specified in document (\f(CWotroff\fP only).
.IP "\f(CW-q\fP" \n(iN
Do not echo \f(CW.rd\fP requests.
.IP "\f(CW-r\fP\fIan\fP" \n(iN
Assign value \fIn\fP to register \fIa\fP.
.IP "\f(CW-s\fP\fIn\fP" \n(iN
Stop every \fIn\fP pages.
.IP "\f(CW-t\fP" \n(iN
Send output to standard output instead of directly to the
phototypesetter (\f(CWotroff\fP only).
.IP "\f(CW-T\fP\fIname\fP" \n(iN
Format output for device \fIname\fP using the device description and
font width tables in \f(CW/usr/lib/font/dev\fP\fIname\fP (\f(CWditroff\fP
only).
.IP "\f(CW-w\fP" \n(iN
If the phototypesetter is busy, wait until it is free (\f(CWotroff\fP only).
.poE
.Ah "\f(CBnroff/troff\fP Requests"
.poS
.IP "\f(CW.ab\fP [\fItext\fP]" \n(iN
Abort and print \fItext\fP as message.
If \fItext\fP is not specified,
the message \fIUser Abort\fP is printed.
.IP "\f(CW.ad\fP [\fIc\fP]" \n(iN
Adjust one or both margins if filling is in effect (see \f(CW.fi\fP).
\fIc\fP can be
.DS
\f(CWb\fP or \f(CWn\fP	Adjust both margins
\f(CWc\fP		Center all lines
.\" _page 596
\f(CWl\fP		Adjust left margin only
\f(CWr\fP		Adjust right margin only
.DE
.IP "\f(CW.af\fP \fIr c\fP" \n(iN
Assign format \fIc\fP to register \fIr\fP.
\fIc\fP can be:
.DS
\f(CW1\fP	0, 1, 2, etc.
\f(CW001\fP	000, 001, 002, etc.
\f(CWi\fP	Lowercase roman
\f(CWI\fP	Uppercase roman
\f(CWa\fP	Lowercase alphabetic
\f(CWA\fP	Uppercase alphabetic
.DE
.IP "\f(CW.am\f(CW \fIxx yy\fP" \n(iN
Append to macro \fIxx\fP; end append at call to \fIyy\fP (default
\fIyy\fP = \f(CW..\fP).
.IP "\f(CW.as\fP \fIxx string\fP" \n(iN
Append to \fIstring xx\fP.
.IP "\f(CW.bd\fP \fIf n\fP" \n(iN
Overstrike characters in font \fIf\fP, \fIn\fP times.
.IP "\f(CW.bd\fP \fIf s n\fP" \n(iN
Overstrike special font \fIs\fP, \fIn\fP times when font \fIf\fP is in
effect.
.IP "\f(CW.bp\fP [\fIn\fP]" \n(iN
Begin new page.
Number next page \fIn\fP.
.IP "\f(CW.br\fP" \n(iN
Break to a new line (output partial lines).
.IP "\f(CW.c2\fP \fIc\fP" \n(iN
Set no-break control character to \fIc\fP (default \f(CW'\fP).
.IP "\f(CW.cc\fP \fIc\fP" \n(iN
Set control character to \fIc\fP (default \f(CW.\fP).
.IP "\f(CW.cf\fP \fIfile\fP" \n(iN
Copy contents of \fIfile\fP into output, uninterpreted (\f(CWditroff\fP
only).
.IP "\f(CW.ce\fP [\fIn\fP]" \n(iN
Center next \fIn\fP lines;
if \fIn\fP is 0, stop centering (default \fIn\fP = 1).
.IP "\f(CW.ch\fP \fIxx\fP [\fIn\fP]" \n(iN
Change trap position for macro \fIxx\fP to \fIn\fP.
If \fIn\fP is
absent, remove the trap.
.IP "\f(CW.cs\fP \fIf n m\fP" \n(iN
Use constant character spacing for font \fIf\fP of \fIn\fP/36 ems.
If \fIm\fP is given, the em is taken to be \fIm\fP points.
.IP "\f(CW.cu\fP [\fIn\fP]" \n(iN
Continuous underline (including interword spaces) on next \fIn\fP lines.
If \fIn\fP is 0, stop underlining.
Italicize in \f(CWtroff\fP.
(See \f(CW.ul\fP.)
.IP "\f(CW.da\fP [\fIxx\fP]" \n(iN
Divert following text, appending it to macro \fIxx\fP.
If no argument, end diversion.
.IP "\f(CW.de\fP \fIxx\fP [\fIyy\fP]" \n(iN
Define macro \fIxx\fP.
End definition at \fI.yy\fP
(default \fI.yy\fP = \f(CW..\fP).
.IP "\f(CW.di\fP [\fIxx\fP]" \n(iN
Divert following text to newly defined macro \fIxx\fP.
If no argument, end diversion.
.IP "\f(CW.ds\fP \fIxx string\fP" \n(iN
Define \fIxx\fP to contain \fIstring\fP.
.IP "\f(CW.dt\fP \fIn xx\fP" \n(iN
Install trap to invoke macro \fIxx\fP at position \fIn\fP.
.IP "\f(CW.ec\fP [\fIc\fP]" \n(iN
Set escape character to \fIc\fP (default \f(CW\\\fP).
.IP "\f(CW.el\fP \fIanything\fP" \n(iN
Else portion of \f(CWif-else\fP.
See \f(CW.ie\fP.
.IP "\f(CW.em\fP \fIxx\fP" \n(iN
Set end macro to \fIxx\fP.
.IP "\f(CW.eo\fP" \n(iN
Turn escape character mechanism off.
See \f(CW.ec\fP.
.IP "\f(CW.ev\fP [\fIn\fP]" \n(iN
Change environment to \fIn\fP.
If no argument, restore previous environment
(0 \(<= \fIn\fP \(<= 2 = initial value 0).
.IP "\f(CW.ex\fP" \n(iN
Exit from formatter.
.IP "\f(CW.fc\f(CW \fIa b\fP" \n(iN
Set field delimiter to \fIa\fP and pad character to \fIb\fP.
.\" _page 597
.IP \f(CW.fi\fP \n(iN
Turn on fill mode (default: fill is on).
.IP "\f(CW.fl\fP" \n(iN
Flush output buffer.
.IP "\f(CW.fp\fP \fIn f\fP" \n(iN
Assign font \fIf\fP to position \fIn\fP.
.IP "\f(CW.ft\fP \fIf\fP" \n(iN
Change font to \fIf\fP.
.IP "\f(CW.hc\fP[\fIc\fP]" \n(iN
Change hyphenation-indication character used with \f(CW.hw\fP
to \fIc\fP (default \(en).
.IP "\f(CW.hw\fP \fIwords\fP" \n(iN
Specify hyphenation points for \fIwords\fP (e.g., \f(CW.hw
spe-ci-fy\fP).
.IP "\f(CW.hy\fP \fIn\fP" \n(iN
Turn hyphenation on (\fIn\fP\(>=1) or off (\fIn\fP=0).
.DS
\fIn\fP=1	Hyphenate wherever necessary
\fIn\fP=2	Don't hyphenate last word in page or diversion
\fIn\fP=4	Don't split off first two characters of word
\fIn\fP=8	Don't split off last two characters of word
\fIn\fP=14	Use all three restrictions
.DE
.IP "\f(CW.ie\fP \fIc anything\fP" \n(iN
If portion of \f(CWif-else\fP.
See \f(CW.el\fP.
.IP "\f(CW.if\fP !\fIc anything\fP" \n(iN
If condition \fIc\fP is false, do \fIanything\fP.
.IP "\f(CW.if\fP \fIn anything\fP" \n(iN
If expression \fIn\fP>0, do \fIanything\fP.
.IP "\f(CW.if\fP !\fIn anything\fP" \n(iN
If expression \fIn\fP\(<=0, do \fIanything\fP.
.IP "\f(CW.if\fP \f(CW'\fIstring1\f(CW'\fIstring2\f(CW'\fP \fIanything\fP" \n(iN
If \fIstring1\fP and \fIstring2\fP are identical, do \fIanything\fP.
.IP "\f(CW.if\fP !\f(CW'\fIstring1\f(CW'\fIstring2\f(CW'\fP \fIanything\fP" \n(iN
If \fIstring1\fP and \fIstring2\fP are not identical, do \fIanything\fP.
.IP "\f(CW.ig\fP \fIyy\fP" \n(iN
Ignore following text, up to line beginning with \f(CW.yy\fP.
.IP "\f(CW.in\fP [\(+-][\fIn\fP]" \n(iN
Set indent to \fIn\fP or increment indent by \(+-\fIn\fP.
If no argument, restore previous indent.
.IP "\f(CW.it\fP \fIn xx\fP" \n(iN
Set input line count trap to invoke macro \fIxx\fP after \fIn\fP lines
of input text have been read.
.IP "\f(CW.lc\fP \fIc\fP" \n(iN
Set leader repetition character to \fIc\fP.
(See \f(CW.tc\fP.) Leaders
are invoked by \f(CW\\a\fP.
.IP "\f(CW.lg\fP \fIn\fP" \n(iN
Turn ligature mode on if \fIn\fP is absent or nonzero.
.IP "\f(CW.ll\fP [\(+-][\fIn\fP]" \n(iN
Set line length to \fIn\fP or increment line length by \(+-\fIn\fP.
If no argument, restore previous line length (default 6.5 inches).
.IP "\f(CW.ls\fP \fIn\fP" \n(iN
Set line spacing to \fIn\fP.
If no argument, restore previous
line spacing (initial value 1).
.IP "\f(CW.lt\fP \fIn\fP" \n(iN
Set title length to \fIn\fP.
If no argument, restore previous value.
.IP "\f(CW.mc\fP [\fIc\fP] [\fIn\fP]" \n(iN
Set margin character to \fIc\fP, and place it \fIn\fP spaces to the right
of margin.
If \fIc\fP is missing, turn margin character off.
Default for \fIn\fP is 0.2 inches in \f(CWnroff\fP and 1 em
in \f(CWtroff\fP.
.IP "\f(CW.mk\fP [\fIr\fP]" \n(iN
Mark current vertical place in register \fIr\fP.
Return to mark with \f(CW.rt\fP, or \f(CW.sp|\\n\fP\fIr\fP.
.IP "\f(CW.na\fP" \n(iN
Do not adjust margins.
(See \f(CW.ad\fP.)
.IP "\f(CW.ne\fP \fIn\fP" \n(iN
If \fIn\fP lines do not remain on this page, start new page.
.IP \f(CW.nf\fP \n(iN
No filling or adjusting of output lines.
(See \f(CW.ad\fP and \f(CW.fi\fP.)
.\" _page 598
.IP "\f(CW.nh\fP" \n(iN
Turn hyphenation off.
(See \f(CW.hy\fP.)
.IP "\f(CW.nm\fP [\fIn m s i\fP]" \n(iN
Number of output lines (\fIn\fP\(>=0) or turn numbering off (\fIn\fP=0).
\(+-\fIn\fP sets initial line number; \fIm\fP sets numbering interval;
\fIs\fP sets separation of numbers and text; \fIi\fP sets indent of
text.
.IP "\f(CW.nn\fP \fIn\fP" \n(iN
Do not number next \fIn\fP lines, but keep track of numbering sequence,
which can be resumed with \f(CW.nm+0\fP.
.IP "\f(CW.nr\fP \fIr n\fP [\fIm\fP]" \n(iN
Assign the value \fIn\fP to number register \fIr\fP and optionally
set autoincrement to \fIm\fP.
.IP "\f(CW.ns\fP" \n(iN
Turn no-space mode on.
(See \f(CW.rs\fP.)
.IP "\f(CW.nx\fP \fIfile\fP" \n(iN
Switch to \fIfile\fP and do not return to current file.
(See \f(CW.so\fP.)
.IP "\f(CW.os\fP" \n(iN
Output saved space specified in previous \f(CW.sv\fP request.
.IP "\f(CW.pc\fP \fIc\fP" \n(iN
Set page number character to \fIc\fP.
.IP "\f(CW.pi\fP \fIcmd\fP" \n(iN
Pipe output of \f(CWtroff\fP to \fIcmd\fP instead of to standard output.
.IP "\f(CW.pl\fP [\(+-][\fIn\fP]" \n(iN
Set page length to \fIn\fP or increment page length by \(+-\fIn\fP.
If no argument, restore default (default 11 inches).
.IP "\f(CW.pm\fP" \n(iN
Print names and sizes of all defined macros.
.IP "\f(CW.pn\fP [\(+-][\fIn\fP]" \n(iN
Set next page number to \fIn\fP, or increment page number by
\(+-\fIn\fP.
.IP "\f(CW.po\fP [\(+-][\fIn\fP]" \n(iN
Offset text a distance \fIn\fP from the left edge of page, or increment the
current offset by \(+-\fIn\fP.
If no argument, restore previous offset.
.IP "\f(CW.ps\fP \fIn\fP" \n(iN
Set point size to \fIn\fP (\f(CWtroff\fP only).
(Default 10 points.)
.IP "\f(CW.rd\fP [\fIprompt\fP]" \n(iN
Read input from terminal, after printing optional \fIprompt\fP.
.IP "\f(CW.rm\fP \fIxx\fP" \n(iN
Remove macro or string \fIxx\fP.
.IP "\f(CW.rn\fP \fIxx yy\fP" \n(iN
Rename request, macro, or string \fIxx\fP to \fIyy\fP.
.IP "\f(CW.rr\fP \fIr\fP" \n(iN
Remove register \fIr\fP.
.IP "\f(CW.rs\fP \fIxx yy\fP" \n(iN
Restore spacing.
(Turn no-space mode off; see \f(CW.ns\fP.)
.IP "\f(CW.rt\fP [\(+-\fIn\fP]" \n(iN
Return (upward only) to marked vertical place, or to \(+-\fIn\fP
from top of page or diversion.
(See \f(CW.mk\fP.)
.IP "\f(CW.so\fP \fIfile\fP" \n(iN
Switch out to \fIfile\fP, then return to current file.
(See \f(CW.nx\fP.)
.IP "\f(CW.sp\fP \fIn\fP" \n(iN
Leave \fIn\fP blank lines (default 1).
.IP "\f(CW.ss\fP \fIn\fP" \n(iN
Space character size set to \fIn\fP/36 em
(no effect in \f(CWnroff\fP).
.IP "\f(CW.sv\fP \fIn\fP" \n(iN
Save \fIn\fP lines of space; output such space with \f(CW.os\fP.
.IP "\f(CW.sy\fP \fIcmd\fP [\fIargs\fP]" \n(iN
Execute \s-2UNIX\s0 command \fIcmd\fP with optional arguments
(\f(CWditroff\fP only).
.IP "\f(CW.ta\fP \fIn\fP[\fIt\fP] \fIm\fP[\fIt\fP]" \n(iN
Set tab stop at positions \fIn\fP, \fIm\fP, etc.
If \fIt\fP is not
given, tab is left adjusting; if \fIt\fP is:
.DS
\f(CWR\fP	Right adjust
\f(CWC\fP	Center
.DE
.IP "\f(CW.tc\fP \fIc\fP" \n(iN
Define tab character as \fIc\fP (e.g., \f(CW.tc .\fP will draw a string
of dots to tab position).
.IP "\f(CW.ti\fP [\(+-][\fIn\fP]" \n(iN
Indent next output line \fIn\fP spaces, or increment the current indent
by \(+-\fIn\fP for the next output line.
.\" _page 599
.IP "\f(CW.tl\fP \fI\f(CW'\fIl\f(CW'\fIc\f(CW'\fIr\f(CW'\fP" \n(iN
Specify left (\fIl\fP), centred (\fIc\fP), right (\fIr\fP) title.
.IP "\f(CW.tm\fP \fItext\fP" \n(iN
Terminal message.
(Print \fItext\fP on standard error.)
.IP "\f(CW.tr\fP \fIab\fP" \n(iN
Translate character \fIa\fP to \fIb\fP.
.IP "\f(CW.uf\fP \fIf\fP" \n(iN
Underline font set to \fIf\fP (to be switched to by \f(CW.ul\fP).
.IP "\f(CW.ul\fP [\fIn\fP]" \n(iN
Underline (italicize in \f(CWtroff\fP) next \fIn\fP input lines.
Do not underline interword spaces.
.IP "\f(CW.vs\fP [\fIn\fP]" \n(iN
Set vertical line spacing to \fIn\fP.
If no argument, restore previous
spacing (default 1/6 inch in \f(CWnroff\fP, 12 points in \fItroff\fP).
.IP "\f(CW.wh\fP \fIn xx\fP" \n(iN
When position \fIn\fP is reached, execute macro \fIxx\fP; negative
values of \fIn\fP are with respect to page bottom.
.poE
.ix	%end [nroff] formatter, summary~of requests %key nroff formatter, summary of requests
.ix	%end [troff] formatter, summary~of requests %key troff formatter, summary of requests
.Ah "Escape sequences"
.ix	%begin [troff] formatter, escape sequences %key troff formatter, escape sequences
.poS
.IP "\e" \n(iN
To prevent or delay the interpretation of \f(CW\\\fP.
.ig
The above conforms to the manual,
but should it not be \e\e to prevent/delay a backslash?
Am I misunderstanding something? --LK
..
.IP "\e\f(CWe\fP" \n(iN
Printable version of \fIcurrent\fP escape character.
.IP "\e\f(CW'\fP" \n(iN
\f(CW\'\fP (acute accent); equivalent to \f(CW\e(aa\fP.
.IP "\e\f(CW`\fP" \n(iN
\f(CW\(ga\fP (grave accent); equivalent to \f(CW\e(ga\fP.
.IP "\e\f(CW-\fP" \n(iN
\f(CW\-\fP Minus sign in the \fIcurrent\fP font.
.IP "\e\f(CW.\fP" \n(iN
Period (dot).
(See \f(CWde\fP.)
.IP "\e (space)" \n(iN
Unpaddable space-size space character.
.IP "\e\f(CW0\fP" \n(iN
Digit width space.
.IP "\e\f(CW|\fP" \n(iN
1/6-em narrow space character (zero width in \f(CWnroff\fP).
.IP "\e\f(CW^\fP" \n(iN
1/12-em half-narrow space character (zero width in \f(CWnroff\fP).
.IP "\e\f(CW&\fP" \n(iN
Nonprinting, zero-width character.
.IP "\e\f(CW!\fP" \n(iN
Transparent line indicator.
.IP "\e\f(CW""\fP" \n(iN
Beginning of comment.
.IP "\e\e\f(CW$\fP\fIN\fP" \n(iN
Interpolate argument 1\(<=\fIN\fP\(<=9.
.IP "\e\f(CW%\fP" \n(iN
Default optional hyphenation character.
.IP "\e\f(CW(\fIxx\fP" \n(iN
Character named \fIxx\fP.
.\" The next label below looks funny.  There is too much space
.\" between *( and xx. /Andreas 2002-09-27
.\" 'Fixed' by making the ( Roman. It looks slightly
.\" different, but less jarring than the gap. -LK
.IP "\e\f(CW*\fP\fIx\fP, \e\f(CW*\fR(\fIxx\fP" \n(iN
Interpolate string \fIx\fP or \fIxx\fP.
.IP "\e\f(CWa\fP" \n(iN
Noninterpreted leader character for use in macros.
.IP "\e\f(CWb\fP\'\fIabc...\fP\'" \n(iN
Bracket building function\(emstack \fIabc...\fP vertically.
.IP "\e\f(CWc\fP" \n(iN
Interrupt text processing.
.ig
I'm not sure the above is the correct description --
or perhaps not complete enough.
We use it extensively in some chapters to suppress
the word space that should otherwise be triggered by
the end of a line.  For example:
text text\(em\c
text text text...
We should consider a better description for UTP Revisited. --LK
..
.IP "\e\f(CWd\fP" \n(iN
Downward 1/2-em vertical motion (1/2 line in \f(CWnroff\fP).
.IP "\e\f(CWD\fP\'\f(CWl\fP \fIx,y\fP\'" \n(iN
Draw a line from current position to coordinates \fIx,y\fP
(\f(CWditroff\fP only).
.\" The last apostrophes in the next *two* labels below were
.\" typeset using ' instead of \' in the original UTP paper
.\" copy.  This has been corrected.  /Andreas 2002-09-29
.IP "\e\f(CWD\fP\'\f(CWc\fP \fId\fP\'" \n(iN
Draw circle of diameter \fId\fP with left edge at current position
(\f(CWditroff\fP only).
.\" _page 600
.IP "\e\f(CWD\fP\'\f(CWe\fP \fId1 d2\fP\'" \n(iN
Draw ellipse with horizontal diameter \fId1\fP and vertical diameter
\fId2\fP, with left edge at current position (\f(CWditroff\fP only).
.IP "\e\f(CWD\fP\'\f(CWa\fP \fIx1 y1 x2 y2\fP\'" \n(iN
Draw arc counterclockwise from current position, with center at
\fIx1,\^y1\fP and endpoint at
\fIx1\fP\^+\^\fIx2\fP,\^\fIy1\fP\^+\^\fIy2\fP
(\f(CWditroff\fP only).
.\" The last y-coordinate in the label below was actually
.\" typeset as "yx" in the book, not as "y2".  Also, the tilde
.\" here is too high.  /Andreas 2002-09-27
.IP "\e\f(CWD\fP\'\f(CW~\fP \fIx1 y1 x2 y2\fP ...\'" \n(iN
Draw spline from current position through the specified coordinates
(\f(CWditroff\fP only).
.IP "\e\f(CWf\fP\fIx\fP, \e\f(CWf\fP(\fIxx\fP, \e\f(CWf\fP\fIN\fP" \n(iN
Change to font named \fIx\fP or \fIxx\fP or position \fIN\fP.
.IP "\e\f(CWh\'\fIN\f(CW\'\fP" \n(iN
Local horizontal motion; move right \fIN\fP (negative left).
.IP "\e\f(CWH\fP\'\fIn\fP\'" \n(iN
Set character height to \fIn\fP points, without changing width
(\f(CWditroff\fP only).
.IP "\e\f(CWj\fP\fIx\fP" \n(iN
Mark horizontal place on output line in register \fIx\fP.
.IP "\e\f(CWk\fP\fIx\fP" \n(iN
Mark horizontal place on input line in register \fIx\fP.
.IP "\e\f(CWl\fP\'\fINc\fP\'" \n(iN
Horizontal line drawing function (optionally with \fIc\fP,
default _\^).
.IP "\e\f(CWL\fP\'Nc\fP\'" \n(iN
Vertical line drawing function (optionally with \fIc\fP,
default \f(CW|\fP).
.IP "\e\f(CWn\fP\fIx\fP, \e\f(CWn\fP(\fIxx\fP" \n(iN
Interpolate register number \fIx\fP or \fIxx\fP.
.IP "\e\f(CWo\fP\'\fIabc...\fP\'" \n(iN
Overstrike characters \fIa, b, c...\fP
.IP "\e\f(CWp\fP" \n(iN
Break and spread output line.
.IP "\e\f(CWr\fP" \n(iN
Reverse 1-em vertical motion (reverse line in \f(CWnroff\fP).
.IP "\e\f(CWs\fP\fIN\fP, \e\f(CWs\fP\(+-\fIN\fP" \n(iN
Point-size change function.
.IP "\e\f(CWS\fP\'\fIn\fP\'" \n(iN
Slant output \fIn\fP degrees to the right (\f(CWditroff\fP only).
Negative values slant to the left.
A value of zero turns off slanting.
.IP "\e\f(CWt\fP" \n(iN
Noninterpreted horizontal tab.
.IP "\e\f(CWu\fP" \n(iN
Reverse (up) 1/2-em vertical motion (1/2 line in \f(CWnroff\fP).
.IP "\e\f(CWv\fP\'\fIN\fP\'" \n(iN
Local vertical notion; move down \fIN\fP (negative up).
.IP "\e\f(CWw\fP\'\fIstring\fP\'" \n(iN
Interpolate width of \fIstring\fP.
.IP "\e\f(CWx\fP\'\fIN\fP\'" \n(iN
Extra line-space function (negative before, positive after).
.IP "\e\f(CWz\fP\fIc\fP" \n(iN
Print \fIc\fP with zero width (without spacing).
.IP "\e\f(CW{\fP" \n(iN
Begin conditional input.
.IP "\e\f(CW}\fP" \n(iN
End conditional input.
.IP "\e(newline)" \n(iN
Concealed (ignored) newline.
.IP "\e\fIX\fP" \n(iN
\fIX\fP, any character \fInot\fP listed above.
.poE
.ix	%end [troff] formatter, escape sequences %key troff formatter, escape sequences
.\" _page 601
.Ah "Predefined Number Registers"
.ix	%begin [troff] formatter, predefined number~register names %key troff formatter, predefined number register names
.Bh "Read-Only Registers"
.ix	[troff] formatter, read-only number~registers %key troff formatter, read-only number registers
.poS
.IP \f(CW.$\fP \n(iN
Number of arguments available at the current macro level.
.IP \f(CW.$$\fP \n(iN
Process \s-1ID\s0 of \f(CWtroff\fP process (\f(CWditroff\fP only).
.IP \f(CW.A\fP \n(iN
Set to 1 in \f(CWtroff\fP, if \f(CW-a\fP option is used;
always 1 in \f(CWnroff\fP.
.IP \f(CW.H\fP \n(iN
Available horizontal resolution in basic units.
.IP \f(CW.T\fP \n(iN
In \f(CWnroff\fP, set to 1 if \f(CW-T\fP option is used;
in \f(CWtroff\fP, always 0;
in \f(CWditroff\fP, you can print the value of \f(CW-T\fP with the
string \f(CW\e*(.T\fP.
.IP \f(CW.V\fP \n(iN
Available vertical resolution in basic units.
.IP \f(CW.a\fP \n(iN
Extra line space most recently utilized using \f(CW\ex\fP\'\fIN\fP\'.
.IP \f(CW.c\fP \n(iN
Number of \fIlines\fP read from current input file.
.IP \f(CW.d\fP \n(iN
Current vertical place in current diversion;
equal to \f(CWnl\fP if no diversion.
.IP \f(CW.f\fP \n(iN
Current font in physical quadrant
(1 to 4 in \f(CWotroff\fP; no limit in \f(CWditroff\fP).
.IP \f(CW.h\fP \n(iN
Text baseline high-water mark on current page or diversion.
.IP \f(CW.i\fP \n(iN
Current indent.
.\" The original ran things together: .adl, .adb
.\" Valid in the Elder software, not so in groff. --LK
.IP \f(CW.j\fP \n(iN
Current adjustment type (0=\f(CW.ad l\fP or \f(CW.na\fP;
1=\f(CW.ad b\fP; 3=\f(CW.ad c\fP; 5=\f(CW.ad r\fP).
.IP \f(CW.l\fP \n(iN
Current line length.
.IP \f(CW.n\fP \n(iN
Length of text portion on previous output line.
.IP \f(CW.o\fP \n(iN
Current page offset.
.IP \f(CW.p\fP \n(iN
Current page length.
.IP \f(CW.s\fP \n(iN
Current point size.
.IP \f(CW.t\fP \n(iN
Distance to the next trap.
.IP \f(CW.u\fP \n(iN
Equal to 1 in fill mode and 0 in no-fill mode.
.IP \f(CW.v\fP \n(iN
Current vertical line spacing.
.IP \f(CW.w\fP \n(iN
Width of previous character.
.IP \f(CW.x\fP \n(iN
Reserved version-dependent register.
.IP \f(CW.y\fP \n(iN
Reserved version-dependent register.
.IP \f(CW.z\fP \n(iN
Name of current diversion.
.poE
.Bh "Read/Write Registers"
.poS
.IP \f(CW%\fP \n(iN
Current page number.
.IP \f(CWct\fP \n(iN
Character type (set by \f(CWwidth\fP function).
.IP \f(CWdl\fP \n(iN
Width (maximum) of last completed diversion.
.IP \f(CWdn\fP \n(iN
Height (vertical size) of last completed diversion.
.IP \f(CWdw\fP \n(iN
Current day of the week (1 to 7).
.\" _page 602
.IP \f(CWdy\fP \n(iN
Current day of the month (1 to 31).
.IP \f(CWhp\fP \n(iN
Current horizontal place on input line.
.IP \f(CWln\fP \n(iN
Output line number.
.IP \f(CWmo\fP \n(iN
Current month (1 to 12).
.IP \f(CWnl\fP \n(iN
Vertical position of last printed text baseline.
.IP \f(CWsb\fP \n(iN
Depth of string below baseline (generated by \f(CWwidth\fP function).
.IP \f(CWst\fP \n(iN
Height of string below baseline (generated by \f(CWwidth\fP function).
.IP \f(CWyr\fP \n(iN
Last two digits of current year.
.poE
.ix	%end [troff] formatter, predefined number~register names %key troff formatter, predefined number register names
.Ah "Special Characters"
.ix	%begin [troff] formatter, special characters %key troff formatter, special characters
.Bh "On the Standard Fonts"
.LP
The following special characters are usually found on the standard
fonts:
.poS
.TS
tab(:);
c:lfCW:l:c:lfCW:l.
':\':close quote:\(fi:\e(fi:fi ligature
`:\`:open quote:\(fl:\e(fl:fl ligature
\(em:\e(em:3/4 em dash:\(ff:\e(ff:ff ligature
\(hy:\(hy:hyphen:\(ffi:\e(Fi:ffi ligature
\(hy:\e(hy:hyphen:\(ffl:\e(Fl:ffl ligature
\-:\e-:current font minus sign:\(de:\e(de:degree
\(bu:\e(bu:bullet:\(dg:\e(dg:dagger
\(sq:\e(sq:square:\(fm:\e(fm:foot mark
\(ru:\e(ru:rule:\(ct:\e(ct:cent sign
\(14:\e(14:1/4:\(rg:\e(rg:registered trademark
\(12:\e(12:1/2:\(co:\e(co:copyright
\(34:\e(34:3/4:
.TE
.poE
.Bh "On the Special Font"
.LP
The following characters are usually found on the special font except
for the uppercase Greek letter names followed by \(dg which are mapped
into uppercase English letters in whatever font is mounted on font
position one (default is Times Roman).
.\" _page 603
.Ch "Miscellaneous Characters"
.poS
.TS
tab(:);
c:lfCW:l:c:lfCW:l.
\(sc:\e(sc:section:	\(da:\e(da:down arrow
\(aa:\e(aa:acute accent:	\(br:\e(br:box rule
\(ga:\e(ga:grave accent:	\(dd:\e(dd:double dagger
\(ul:\e(ul:underrule:	\(rh:\e(rh:right hand
\(->:\e(->:right arrow:	\(lh:\e(lh:left hand
\(<-:\e(<-:left arrow:	\(ci:\e(ci:circle
\(ua:\e(ua:up arrow:
.TE
.poE
.Ch "Mathematical Symbols"
.ix	[troff] formatter, mathematic symbols %key troff formatter, mathematic symbols
.poS
.TS
tab(:);
c:lfCW:l:c:lfCW:l.
\(pl:\e(pl:math plus:\(cu:\e(cu:cup (union)
\(mi:\e(mi:math minus:\(ca:\e(ca:cap (intersection)
\(eq:\e(eq:math equals:\(sb:\e(sb:subset of
\(**:\e(**:math star:\(sp:\e(sp:superset of
\(sl:\e(sl:slash (matching backslash):\(ib:\e(ib:improper subset
\(sr:\e(sr:square root:\(ip:\e(ip:improper superset
\(rn:\e(rn:root en extender:\(if:\e(if:infinity
\(>=:\e(>=:greater than or equal to:\(pd:\e(pd:partial derivative
\(<=:\e(<=:less than or equal to:\(gr:\e(gr:gradient
\(==:\e(==:identically equal:\(no:\e(no:not
\(~=:\e(~=:approx equal:\(is:\e(is:integral sign
\(ap:\e(ap:approximates:\(pt:\e(pt:proportional to
\(!=:\e(!=:not equal:\(es:\e(es:empty set
\(mu:\e(mu:multiply:\(mo:\e(mo:member of
\(di:\e(di:divide:\(or:\e(or:or
\(+-:\e(+-:plus-minus:
.TE
.poE
.Ch "Bracket Building Symbols"
.ix	[troff] formatter, bracket-building characters %key troff formatter, bracket-building characters
.ix	bracket-building characters
.poS
.\" The alignment of the leftmost column in the next table is
.\" whacky.  /Andreas 2002-09-28
.\" Looks OK to me. --LK 2002-10-07
.TS
tab(:);
c:lfCW:l.
\(lt:\e(lt:left top of large curly bracket
\(lk:\e(lk:left center of large curly bracket
\(lb:\e(lb:left bottom of large curly bracket
\(rt:\e(rt:right top of large curly bracket
\(rk:\e(rk:right center of large curly bracket
\(rb:\e(rb:right bottom of large curly bracket
\(lc:\e(lc:left ceiling (top) of large square bracket
\(bv:\e(bv:bold vertical
\(lf:\e(lf:left floor (bottom) of large square bracket
\(rc:\e(rc:right ceiling (top) of large square bracket
\(rf:\e(rf:right floor (bottom) of large square bracket
.TE
.poE
.\" _page 604
.Ch "Greek Characters"
.ix	Greek characters
.ix	[troff] formatter, Greek characters %key troff formatter, Greek characters
.poS
.TS
tab (:);
c:lfCW:l:c:lfCW:l.
\(*a:\e(*a:alpha:	\(*A:\e(*A:Alpha\(dg
\(*b:\e(*b:beta:	\(*B:\e(*B:Beta\(dg
\(*g:\e(*g:gamma:	\(*G:\e(*G:Gamma
\(*d:\e(*d:delta:	\(*D:\e(*D:Delta
\(*e:\e(*e:epsilon:	\(*E:\e(*E:Epsilon\(dg
\(*z:\e(*z:zeta :	\(*Z:\e(*Z:Zeta\(dg
\(*y:\e(*y:eta  :	\(*Y:\e(*Y:Eta\(dg
\(*h:\e(*h:theta:	\(*H:\e(*H:Theta
\(*i:\e(*i:iota :	\(*I:\e(*I:Iota\(dg
\(*k:\e(*k:kappa:	\(*K:\e(*K:Kappa\(dg
\(*l:\e(*l:lambda:	\(*L:\e(*L:Lambda
\(*m:\e(*m:mu   :	\(*M:\e(*M:Mu\(dg
\(*n:\e(*n:nu   :	\(*N:\e(*N:Nu\(dg
\(*c:\e(*c:xi   :	\(*C:\e(*C:Xi
\(*o:\e(*o:omicron:	\(*O:\e(*O:Omicron\(dg
\(*p:\e(*p:pi   :	\(*P:\e(*P:Pi
\(*r:\e(*r:rho  :	\(*R:\e(*R:Rho\(dg
\(*s:\e(*s:sigma:	\(*S:\e(*S:Sigma
\(ts:\e(ts:terminal sigma:::
\(*t:\e(*t:tau  :	\(*T:\e(*T:Tau\(dg
\(*u:\e(*y:upsilon:	\(*U:\e(*Y:Upsilon
\(*f:\e(*f:phi  :	\(*F:\e(*F:Phi
\(*x:\e(*x:chi  :	\(*X:\e(*X:Chi\(dg
\(*q:\e(*q:psi  :	\(*Q:\e(*Q:Psi
\(*w:\e(*w:omega:	\(*W:\e(*W:Omega
.TE
.poE
.ix	%end [troff] formatter, special characters %key troff formatter, special characters
.Ah "The \f(CBms\fP macros"
.ix	%begin [ms] macros, summary~of macros %key ms macros, summary of macros
.Bh "Summary of \f(CBms\fP macros"
.poS
.IP "\f(CW.1C\fP" \n(iN
Return to single-column format.
.IP "\f(CW.2C\fP" \n(iN
Start two-column format.
.IP "\f(CW.AB\fP" \n(iN
Begin abstract.
.IP "\f(CW.AE\fP" \n(iN
End abstract.
.IP "\f(CW.AI\fP \fIname\fP" \n(iN
Name of author's institution (used in cover sheet).
.IP "\f(CW.AU\fP \fIname\fP" \n(iN
Author's name (used in cover sheet)
.IP "\f(CW.B\fP [\fItext\fP]" \n(iN
Print \fItext\fP in boldface.
If \fItext\fP is missing,
equivalent to \f(CW.ft 3\fP.
.\" _page 605
.IP "\f(CW.B1\fP" \n(iN
Enclose following text in a box.
.IP "\f(CW.B2\fP" \n(iN
End boxed text.
.IP "\f(CW.BX\fP \fIword\fP" \n(iN
Surround \fIword\fP in a box.
.IP "\f(CW.DA\fP" \n(iN
Print date on each page.
.IP "\f(CW.DS\fP" \n(iN
Start displayed text.
.IP "\f(CW.DS B\fP" \n(iN
Start left-justified block, centered.
.IP "\f(CW.DS C\fP" \n(iN
Start centered display.
.IP "\f(CW.DS L\fP" \n(iN
Start left-centered display.
.IP "\f(CW.DE\fP" \n(iN
End displayed text.
.IP "\f(CW.EQ\fP" \n(iN
Begin equation.
.IP "\f(CW.EN\fP" \n(iN
End equation.
.IP "\f(CW.FS\fP" \n(iN
Start footnote.
.IP "\f(CW.FE\fP" \n(iN
End footnote.
.IP "\f(CW.I\fP [\fItext\fP]" \n(iN
Print \fItext\fP in italics.
If \fItext\fP is missing, equivalent to \f(CW.ft 2\fP.
.IP "\f(CW.IP\fP \fIlabel n\fP" \n(iN
Indent paragraph \fIn\fP spaces with hanging \fIlabel\fP.
.IP "\f(CW.KS\fP" \n(iN
Start keep.
.IP "\f(CW.KE\fP" \n(iN
End of keep or floating keep.
.IP "\f(CW.KF\fP" \n(iN
Begin floating keep.
.IP "\f(CW.LG\fP" \n(iN
Increase type size by two points (\f(CWtroff\fP only).
.IP "\f(CW.LP\fP" \n(iN
Start block paragraph.
.IP "\f(CW.ND\fP" \n(iN
Change or omit date.
.IP "\f(CW.NH\fP \fIn\fP" \n(iN
Numbered section heading, level \fIn\fP.
.IP "\f(CW.NL\fP" \n(iN
Restore default type size (\f(CWtroff\fP only).
.IP "\f(CW.PP\fP" \n(iN
Start indented paragraph.
.IP "\f(CW.R\fP [\fItext\fP]" \n(iN
Print \fItext\fP in roman.
If \fItext\fP is missing, equivalent to \f(CW.ft 1\fP.
.IP "\f(CW.RP\fP" \n(iN
Initiate title page for a ``released paper''.
.IP "\f(CW\&.RS\fP" \n(iN
Increase relative indent one level.
Use with \f(CW.IP\fP.
.IP "\f(CW.RE\fP" \n(iN
End one level of relative indent.
.IP "\f(CW.SG\fP" \n(iN
Signature line.
.IP "\f(CW.SH\fP" \n(iN
Unnumbered section heading.
.IP "\f(CW.SM\fP" \n(iN
Decrease type size by two points (\f(CWtroff\fP only).
.IP "\f(CW.TL\fP" \n(iN
Title line.
.IP "\f(CW.TS\fP [\f(CWH\fP]" \n(iN
Start table.
\f(CWH\fP will put table header on all pages.
Use this option with following \f(CW.TH\fP.
.IP "\f(CW.TH\fP" \n(iN
Table header ends.
Must be used with \f(CW.TS H\fP.
.IP "\f(CW.TE\fP" \n(iN
End table.
.IP "\f(CW.UL\fP" \n(iN
Underline following text, even in \f(CWtroff\fP.
.poE
.\" _page 606
.Bh "Internal Macros Worth Knowing About"
.ix	[ms] macros, internal macros %key ms macros, internal macros
.ix	[ms] macros, internal number~register names %key ms macros, internal number register names
.poS
.IP \f(CW.IZ\fP \n(iN
Basic initialization; executed automatically before any text is
processed.
It is then removed, and cannot be invoked again.
.IP \f(CW.RT\fP \n(iN
Reset.
Invoked by all paragraph macros, plus
\f(CW\&.RS\fP, \f(CW.RE\fP, \f(CW.TS\fP, \f(CW.TE\fP,
\&\f(CW.SH\fP and \f(CW.NH\fP.
Resets various values to defaults stored in
number registers listed below.
.IP \f(CW.BG\fP \n(iN
Prints cover sheet, if any.
Also performs some first page initialization.
Invoked once by the very first \f(CW.RT\fP in a document.
.IP \f(CW.NP\fP \n(iN
New page.
Invoked at the top of each page.
Performs various page top resets, and calls \f(CW.PT\fP.
.IP \f(CW.PT\fP \n(iN
Page titles.
Contains running headers.
Can be redefined.
Invoked by \f(CW.NP\fP at \f(CW\en(HMu\fP from the top of the page.
.IP \f(CW.BT\fP \n(iN
Bottom titles.
Continuous running footers.
Invoked by trap at \f(CW\en(FMu/2u\fP from the bottom of the page.
.IP \f(CW.FO\fP \n(iN
Footer.
The bottom of the text on the page.
Invoked by trap at \f(CW\en(FMu\fP.
.poE
.Bh "Number Registers Containing Page Layout Defaults"
.ix	[ms] number~registers, page~layout %key ms number registers, page layout
.poS
.IP \f(CWCW\fP \n(iN
Column width (default 7/15 of line length).
.IP \f(CWFL\fP \n(iN
Footnote length (default 11/12 of line length).
.IP \f(CWFM\fP \n(iN
Bottom margin (default 1 inch).
.IP \f(CWGW\fP \n(iN
Intercolumn gap width for multiple columns
(default 1/5 of line length).
.IP \f(CWHM\fP \n(iN
Top margin (default 1 inch).
.IP \f(CWLL\fP \n(iN
Line length (default 6 inches).
.IP \f(CWLT\fP \n(iN
Title length (default 6 inches).
.IP \f(CWPD\fP \n(iN
Paragraph spacing (default 0.3 of vertical spacing).
.IP \f(CWPI\fP \n(iN
Paragraph indent (default 5 ens).
.IP \f(CWPO\fP \n(iN
Page offset (default 26/27 inches).
.IP \f(CWPS\fP \n(iN
Point size (default 10 points).
.IP \f(CWVS\fP \n(iN
Vertical line spacing (default 12 points).
.poE
.\" _page 607
.Bh "Predefined and User-Definable Strings"
.ix	[ms] macros, predefined~and~user-definable strings %key ms macros, predefined and~user-definable strings
.poS
.IP \f(CWDY\fP \n(iN
The current date.
.IP \f(CWLH\fP \n(iN
Left header, printed by
\&\f(CW.tl '\e\e*(LH'\e\e*CH'\e\e*(RH'\fP
in \f(CWPT\fP macro.
Null unless user-defined.
.IP \f(CWCH\fP \n(iN
Center header, printed by
\&\f(CW.tl '\e\e*(LH'\e\e*CH'\e\e*(RH'\fP
in \f(CWPT\fP macro.
Null unless user-defined.
.IP \f(CWRH\fP \n(iN
Right header, printed by
\&\f(CW.tl '\e\e*(LH'\e\e*CH'\e\e*(RH'\fP
in \f(CWPT\fP macro.
Null unless user-defined.
.IP \f(CWLF\fP \n(iN
Left footer, printed by
\&\f(CW.tl '\e\e*(LH'\e\e*CH'\e\e(RH'\fP
in \f(CWBT\fP macro.
Null unless user-defined.
.IP \f(CWCF\fP \n(iN
Center footer, printed by
\&\f(CW.tl '\e\e*(LH'\e\e*CH'\e\eRH'\fP
in \f(CWBT\fP macro.
Null unless user-defined.
.IP \f(CWRF\fP \n(iN
Right footer, printed by
\&\f(CW.tl '\e\e*(LH'\e\e*CH'\e\eRH'\fP
in \f(CWBT\fP macro.
Null unless user-defined.
.poE
.Bh "Reserved Macro and String Names"
.ix	[ms] macros, reserved macro~and~string names %key ms macros, reserved macro and~string names
The following macro and string names are used by the \f(CWms\fP package.
Avoid using these names for compatibility with the existing macros.
An italicized \fIn\fP means that the name contains a numeral
(generally the interpolated value of a number register).
.poS
.TS
tab(%);
l%l%l%l%l%l%l%l.
\f(CW,%\ \ \ AX%\ \ \ DA%\ \ \ FL%\ \ \ KJ%\ \ \ OD%\ \ \ RT%\ \ \ TR
\&.]%\ \ \ B%\ \ \ DW%\ \ \ FN%\ \ \ KS%\ \ \ OK%\ \ \ S0%\ \ \ TS
:%\ \ \ B1%\ \ \ DY%\ \ \ FO%\ \ \ LB%\ \ \ PP%\ \ \ S2%\ \ \ TT
[.%\ \ \ B2%\ \ \ EE%\ \ \ FS%\ \ \ LG%\ \ \ PT%\ \ \ S3%\ \ \ TX
[c%\ \ \ BB%\ \ \ EG%\ \ \ FV%\ \ \ LP%\ \ \ PY%\ \ \ SG%\ \ \ UL
[o%\ \ \ BG%\ \ \ EL%\ \ \ FX%\ \ \ LT%\ \ \ QE%\ \ \ SH%\ \ \ US
^%\ \ \ BT%\ \ \ EM%\ \ \ FY%\ \ \ MC%\ \ \ QF%\ \ \ SM%\ \ \ UX
`%\ \ \ BX%\ \ \ EN%\ \ \ HO%\ \ \ ME%\ \ \ QP%\ \ \ SN%\ \ \ WB
~%\ \ \ C%\ \ \ E\fIn\fP%\ \ \ I%\ \ \ MF%\ \ \ QS%\ \ \ SY%\ \ \ WH
1C%\ \ \ C1%\ \ \ EQ%\ \ \ IE%\ \ \ MH%\ \ \ R%\ \ \ TA%\ \ \ WT
2C%\ \ \ C2%\ \ \ EZ%\ \ \ IH%\ \ \ MN%\ \ \ R3%\ \ \ TC%\ \ \ XF
AB%\ \ \ CA%\ \ \ FA%\ \ \ IM%\ \ \ MO%\ \ \ RA%\ \ \ TD%\ \ \ XK
AE%\ \ \ CC%\ \ \ FE%\ \ \ I\fIn\fP%\ \ \ MR%\ \ \ RC%\ \ \ TE%\ \ \ XP
AI%\ \ \ CF%\ \ \ FF%\ \ \ IP%\ \ \ ND%\ \ \ RE%\ \ \ TH%\ \ \ 
A\fIn\fP%\ \ \ CH%\ \ \ FG%\ \ \ IZ%\ \ \ NH%\ \ \ R\fIn\fP%\ \ \ TL%\ \ \ 
AT%\ \ \ CM%\ \ \ FJ%\ \ \ KD%\ \ \ NL%\ \ \ RP%\ \ \ TM%\ \ \ 
AU%\ \ \ CT%\ \ \ FK%\ \ \ KF%\ \ \ NP%\ \ \ RS%\ \ \ TQ%\ \ \ \fP
.TE
.poE
.PP
The following number register names are used by the \f(CWms\fP package.
An italicized \fIn\fP means that the name contains a numeral (generally
the interpolated value of another number register).
.\" _page 608
.poS
.TS
tab(%);
l%l%l%l%l%l%l%l.
\f(CW#T%\ \ \ EF%\ \ \ H5%\ \ \ IX%\ \ \ MF%\ \ \ OJ%\ \ \ QP%\ \ \ TV
AJ%\ \ \ FC%\ \ \ HM%\ \ \ I#%\ \ \ MG%\ \ \ PD%\ \ \ RO%\ \ \ TY
AV%\ \ \ FL%\ \ \ HT%\ \ \ J#%\ \ \ ML%\ \ \ PE%\ \ \ SJ%\ \ \ TZ
BC%\ \ \ FM%\ \ \ I0%\ \ \ KG%\ \ \ MM%\ \ \ PF%\ \ \ ST%\ \ \ VS
BD%\ \ \ FP%\ \ \ IF%\ \ \ KI%\ \ \ MN%\ \ \ PI%\ \ \ T.%\ \ \ WF
BE%\ \ \ GA%\ \ \ IK%\ \ \ KM%\ \ \ NA%\ \ \ PN%\ \ \ TB%\ \ \ XX
BH%\ \ \ GW%\ \ \ IM%\ \ \ L1%\ \ \ NC%\ \ \ PO%\ \ \ TC%\ \ \ YE
BI%\ \ \ H1%\ \ \ IP%\ \ \ LE%\ \ \ ND%\ \ \ PQ%\ \ \ TD%\ \ \ YY
BQ%\ \ \ H2%\ \ \ IR%\ \ \ LL%\ \ \ NQ%\ \ \ PS%\ \ \ TK%\ \ \ ZN
BW%\ \ \ H3%\ \ \ IS%\ \ \ LT%\ \ \ NS%\ \ \ PX%\ \ \ TN%\ \ \ 
CW%\ \ \ H4%\ \ \ IT%\ \ \ MC%\ \ \ NX%\ \ \ QI%\ \ \ TQ%\ \ \ \fP
.TE
.poE
.LP
Note that with the exception of \f(CW[c\fP and \f(CW[o\fP, none of the
number register, macro, or string names contain lowercase letters,
so lowercase or mixed case names are a safe bet when you're writing your
own macros.
.ix	%end [ms] macros, summary~of macros %key ms macros, summary of macros
.Ah "The \f(CBmm\fP Macros"
.ix	%begin [mm] macros, summary~of macros %key mm macros, summary of macros
.Bh "Summary of \f(CBmm\fP Macros"
.poS
.IP \f(CW.1C\fP \n(iN
Return to single-column format.
.IP \f(CW.2C\fP \n(iN
Start two-column format.
.IP "\f(CW.AS\fP [\fIx\fP] [\fIn\fP]" \n(iN
Start abstract type \fIx\fP, indent \fIn\fP spaces.
(Used with \f(CW.TM\fP and \f(CW.RP\fP only.)
(Types: 1=abstract on cover sheet and first page;
2=abstract only on cover sheet;
3=abstract only on Memorandum for File cover sheet.)
End with \f(CW.AE\fP.
.IP \f(CW.AE\fP \n(iN
End Abstract.
Begin with \f(CW.AS\fP.
.IP "\f(CW.AF\fP [\fIcompany name\fP]" \n(iN
Alternate format for first page.
Change first page ``Subject/Date/From'' format.
If argument is given, other headings are not affected.
No argument suppresses company name and headings.
.IP "\f(CW.AL\fP [\fIx\fP] [\fIn\fP]" \n(iN
Start list type \fIx\fP (1, A, a, I or i), indent \fIn\fP spaces.
If third argument is 1, don't put a blank line between items.
Default is numbered listing, indented 5 spaces.
.IP "\f(CW.AT\fP \fItitle\fP" \n(iN
Author's \fItitle\fP follows.
.IP "\f(CW.AU\fP \fIname\fP" \n(iN
Author's \fIname\fP and other information follows.
.IP "\f(CW.AV\fP \fIname\fP" \n(iN
Approval signature line for \fIname\fP.
.\" Corrected inconsistency in paper copy:  Removed ellipsis
.\" from label below.  /Andreas 2002-09-29
.\" I hate to do this, but restored the ellipsis since it
.\" indicates an indeterminate number of arguments. --LK
.IP "\f(CW.B\fP [\fIw\fP] [\fIx\fP] .\|.\|." \n(iN
Set \fIw\fP in bold (underline in \f(CWnroff\fP) and \fIx\fP in previous
font; up to six arguments.
.IP \f(CW.BS\fP \n(iN
Begin block of text to be printed at bottom of page,
after footnotes (if any), but before footer.
.\" _page 609
.IP "\f(CW.BE\fP" \n(iN
End bottom block and print after footnotes (if any), but before footer.
.\" Corrected inconcistency in original paper copy text below:
.\" Changed "6" to "six".  /Andreas 2002-09-29
.IP "\f(CW.BI\fP [\fIw\fP] [\fIx\fP] .\|.\|." \n(iN
Set \fIw\fP in bold (underline in \f(CWnroff\fP) and \fIx\fP in italics;
up to six arguments.
.IP "\f(CW.BL\fP [\fIn\fP] [\fI1\fP]" \n(iN
Start bullet list and indent text \fIn\fP spaces.
If second argument is 1, don't put a blank line between items.
.IP "\f(CW.BR\fP [\fIw\fP] [\fIx\fP]" \n(iN
Set \fIw\fP in bold (underline in \f(CWnroff\fP) and \fIx\fP in roman;
up to six arguments.
.IP "\f(CW.CS\fP [\fIpgs\fP] [\fIother\fP] [\fItot\fP] [\fIfigs\fP] [\fItbls\fP] [\fIref\fP]" \n(iN
Cover sheet numbering information.
.\" Added optional [n], missing from original. --LK
.IP "\f(CW.DF\fP [\fIx\fP] [\fIy\fP] [\fIn\fP]" \n(iN
Start floating display of type \fIx\fP and mode \fIy\fP,
with indent \fIn\fP.
(Default is no indent, no-fill mode.)
End with \f(CW.DE\fP.
\fIx\fP is: \f(CWL\fP (no indent), \f(CWI\fP (indent standard amount),
\f(CWC\fP (center each line individually), or \f(CWCB\fP (center as a
block).
\fIy\fP is: \f(CWN\fP (no-fill mode) or \f(CWF\fP (fill mode).
.\" Added arguments to .DS, missing from original. --LK
.IP "\f(CW.DS\fP [\fIx\fP] [\fIy\fP] [\fIn\fP]" \n(iN
Start floating or static display of type \fIx\fP and mode \fIy\fP,
with indent \fIn\fP.
Type and mode are as in \f(CW.DF\fP.
End with &\f(CW.DE\fP.
.IP "\f(CW.DE\fP" \n(iN
End floating or static display started with \f(CW.DS\fP or \f(CW.DF\fP.
.IP "\f(CW.DL\fP [\fIn\fP] [\fI1\fP]" \n(iN
Start dashed list and indent text \fIn\fP spaces.
If second argument is 1, no space between items.
.IP "\f(CW.EC\fP [\fIcaption\fP] [\fIn\fP] [\fIf\fP]" \n(iN
Equation \fIcaption\fP.
Arguments optionally override default numbering,
where flag \fIf\fP determines use of number \fIn\fP.
If \fIf\fP=0 (default), \fIn\fP is a prefix to number;
if \fIf\fP=1, \fIn\fP is a suffix;
if \fIf\fP=2, \fIn\fP replaces number.
.IP "\f(CW.EF\fP [\fItext\fP]" \n(iN
Print \fItext\fP as the footer on all even pages.
\fItext\fP has the format 'left'center'right'.
.IP "\f(CW.EH\fP [\fItext\fP]" \n(iN
Print \fItext\fP as the heading on all even pages.
\fItext\fP has the format 'left'center'right'.
.IP "\f(CW.EQ\fP [\fItext\fP]" \n(iN
Start equation display using \fItext\fP as label.
.IP "\f(CW.EN\fP" \n(iN
End equation display.
.IP "\f(CW.EX\fP [\fIcaption\fP] [\fIn\fP] [\fIf\fP]" \n(iN
Exhibit \fIcaption\fP.
Arguments optionally override default numbering,
where flag \fIf\fP determines use of number \fIn\fP.
If \fIf\fP=0 (default), \fIn\fP is a prefix to number;
if \fIf\fP=1, \fIn\fP is a suffix;
if \fIf\fP=2, \fIn\fP replaces number.
.IP "\f(CW.FC\fP [\fItext\fP]" \n(iN
Use \fItext\fP for formal closing.
.IP "\f(CW.FD\fP [\fI0-11\fP]" \n(iN
Setup default footnote format.
.IP "\f(CW.FS\fP [\fIc\fP]" \n(iN
Start footnote using \fIc\fP for indicator.
Default is numbered footnote.
.IP "\f(CW.FE\fP" \n(iN
End footnote.
.IP "\f(CW.FG\fP [\fItitle\fP]" \n(iN
Figure \fItitle\fP follows.
.IP "\f(CW.H\fP\fIn\fP [\fIheading\fP]" \n(iN
Numbered \fIheading\fP level \fIn\fP follows.
.IP "\f(CW.HC\fP [\fIc\fP]" \n(iN
Use \fIc\fP as hyphenation indicator.
.\" _page 610
.IP "\f(CW.HM\fP [\fImark\fP]" \n(iN
Heading \fImark\fP style follows arabic (\f(CW1\fP or \f(CW001\fP),
roman (\f(CWi\fP or \f(CWI\fP) or alphabetic (\f(CWa\fP or \f(CWA\fP).
.IP "\f(CW.HU\fP \fIheading\fP" \n(iN
Unnumbered \fIheading\fP follows.
.IP "\f(CW.HX\fP" \n(iN
User-supplied exit macro before printing heading.
.IP "\f(CW.HY\fP" \n(iN
User-supplied exit macro in middle of printing heading.
.IP "\f(CW.HZ\fP" \n(iN
User-supplied macro after heading.
.\" Added ellipses to .I, .IB, .IR --LK
.IP "\f(CW.I\fP [\fIw\fP] [\fIx\fP] .\|.\|." \n(iN
Set \fIw\fP in italics (underline in \f(CWnroff\fP)
and \fIx\fP in previous font.
Up to six arguments.
.IP "\f(CW.IB\fP [\fIw\fP] [\fIx\fP] .\|.\|." \n(iN
Set \fIw\fP in italics (underline in \f(CWnroff\fP)
and \fIx\fP in bold.
Up to six arguments.
.IP "\f(CW.IR\fP [\fIw\fP] [\fIx\fP] .\|.\|." \n(iN
Set \fIw\fP in italics (underline in \f(CWnroff\fP)
and \fIx\fP in roman.
.\" The following line corrects an inconsistency in the paper
.\" copy, but we *really* don't know if the .IR command should
.\" be able to take up to six arguments /Andreas 2002-09-29
Up to six arguments.
.IP "\f(CW.LB\fP \fIn m pad type\fP [\fImark\fP] [\f(CWLI\fP-\fIspace\fP] [\f(CWLB\fP-\fIspace\fP]" \n(iN
List beginning.
Allows complete control over list format.
It takes the following arguments:
.in +0.3i
\fIn\fP \(em Text indent.
.br
\fIm\fP \(em Mark indent.
.br
\fIpad\fP \(em Padding associated with mark.
.br
\fItype\fP \(em If 0, use the specified \fImark\fP.
If non-zero, and \fImark\fP is 1, A, a, I, i, list will be
automatically numbered or alphabetically numbered or alphabetically
sequenced.
In this case, \fItype\fP controls how the \fImark\fP will be displayed.
For example, if \fImark\fP is 1, \fItype\fP will have the following
results:
.in +0.3i
.TS
tab(:);
c:c.
\fBType:Format\fP
1:1.
2:1)
3:(1)
4:[1]
5:<1>
6:{1}
.TE
.in -0.3i
\fImark\fP \(em The symbol or text that will be used to start each list
entry.
\fImark\fP can be null (creates hanging indent), a text string,
or 1, A, a, I, or i to create an automatically numbered or lettered list.
Format of the \fImark\fP will be affected by \fItype\fP.
.br
\f(CWLI\fP-\fIspace\fP \(em The number of blank lines to be output between
each following \f(CW.LI\fP macro (default 1).
.br
\f(CWLB\fP-\fIspace\fP \(em The number of blank lines to be output by the
\f(CWLB\fP macro itself (default 0).
.in -0.5i
.IP "\f(CW.LC\fP [\fIn\fP]" \n(iN
Clear list level \fIn\fP.
.IP "\f(CW.LE\fP" \n(iN
End list.
.IP "\f(CW.LI\fP [\fImark\fP]" \n(iN
Item in list and specify \fImark\fP.
.IP "\f(CW.ML\fP \fImark\fP [\fIn\fP] [\fI1\fP]" \n(iN
Start marked list, indent \fIn\fP spaces.
If third argument is 1, no space between items in list.
.\" _page 611
.IP "\f(CW.MT\fP [\fItype\fP] [\fItitle\fP]" \n(iN
Specify memorandum \fItype\fP and \fItitle\fP.
\fItype\fP is
.DS
"" = No type
\f(CW0\fP = No type
\f(CW1\fP = Memorandum for file (default)
\f(CW2\fP = Programmer's notes
\f(CW3\fP = Engineer's notes
\f(CW4\fP = Released paper
\f(CW5\fP = External letter
\fIstring\fP = \fIstring\fP is printed.
.DE
\fItitle\fP is user-supplied text prefixed to page number.
.IP "\f(CW.ND\fP \fIdate\fP" \n(iN
New date.
Change date to \fIdate\fP.
.IP "\f(CW.nP\fP" \n(iN
Double-line indent on paragraph start.
.IP "\f(CW.NS\fP [\fItype\fP]" \n(iN
Notation start.
Specify notation \fItype\fP.
\fItype\fP is:
.DS
"" =  Copy to
\f(CW0\fP = Copy to
\f(CW1\fP = Copy (with att.) to
\f(CW2\fP = Copy (no att.) to
\f(CW3\fP = Att.
\f(CW4\fP = Atts.
\f(CW5\fP = Enc.
\f(CW6\fP = Encs.
\f(CW7\fP = Under Separate Cover
\f(CW8\fP = Letter to
\f(CW9\fP = Memorandum to
\f(CW10\fP = Copy (with atts.) to
\f(CW11\fP = Copy (without atts.) to
\f(CW12\fP = Abstract Only to
\f(CW13\fP = Complete Memorandum to
\fIstring\fP = Copy \fIstring\fP to
.DE
.IP "\f(CW.NE\fP" \n(iN
Notation end.
.IP "\f(CW.OF\fP [\fItext\fP]" \n(iN
Print \fItext\fP as the footer on all odd pages.
\fItext\fP has the format 'left'center'right'.
.IP "\f(CW.OH\fP [\fItext\fP]" \n(iN
Print \fItext\fP as the heading on all odd pages.
\fItext\fP has the format 'left'center'right'.
.IP "\f(CW.OK\fP [\fItopic\fP]" \n(iN
Other keywords.
Specify \fItopic\fP for TM cover sheet.
.IP "\f(CW.OP\fP" \n(iN
Force an odd page.
.IP "\f(CW.P\fP [\fItype\fP]" \n(iN
Start paragraph \fItype\fP.
\fItype\fP is: \f(CW0\fP = left justified (default),
\f(CW1\fP = indented, \f(CW2\fP = indented except after \f(CW.H\fP,
\&\f(CW.LC\fP, \f(CW.DE\fP.
.IP "\f(CW.PF\fP [\fItext\fP]" \n(iN
Print \fItext\fP as the page footer on all pages.
\fItext\fP has the format 'left'center'right'.
.IP "\f(CW.PH\fP [\fItext\fP]" \n(iN
Print \fItext\fP as the page heading on all pages.
\fItext\fP has the format 'left'center'right'.
.IP "\f(CW.PM\fP [\fItype\fP]" \n(iN
Proprietary marking on each page (\fItype\fP: \f(CWP\fP=PRIVATE;
\f(CWN\fP=NOTICE).
.\" _page 612
.IP "\f(CW.PX\fP" \n(iN
Page-heading user exit.
.IP "\f(CW.R\fP" \n(iN
Return to roman font (end underlining in \f(CWnroff\fP).
.IP "\f(CW.RB\fP [\fIw\fP] [\fIx\fP] .\|.\|." \n(iN
Set \fIw\fP in roman and \fIx\fP in bold.
.\" Unsure whether it should say "Up to six arguments" here or
.\" not (not in paper copy).  /Andreas 2002-09-29
.\" It should. --LK
Up to six arguments.
.IP "\f(CW.RD\fP [\fIinput\fP]" \n(iN
Read \fIinput\fP from terminal.
.IP "\f(CW.RI\fP [\fIw\fP] [\fIx\fP] .\|.\|." \n(iN
Set \fIw\fP in roman and \fIx\fP in italics.
.\" Unsure whether it should say "Up to six arguments" here or
.\" not (not in paper copy).  /Andreas 2002-09-29
.\" It should. --LK
Up to six arguments.
.IP "\f(CW\&.RS\fP [\fIarg\fP]" \n(iN
Start automatically numbered reference.
\fIarg\fP manually specified reference number.
.IP "\f(CW.RF\fP" \n(iN
End of reference text.
.IP "\f(CW.RL\fP [\fIn\fP] [\fI1\fP]" \n(iN
Start reference listing, indent text \fIn\fP spaces.
If second argument is 1, no space between list items.
.IP "\f(CW.RP\fP" \n(iN
Produce reference page.
.IP "\f(CW.S\fP [\fIn\fP] [\fIm\fP]" \n(iN
Set point size to \fIn\fP and vertical spacing to \fIm\fP (\f(CWtroff\fP
only) (defaults: 10 on 12).
Alternatively, either argument can be specified as \(+-\fIn\fP/\fIm\fP
to increment/decrement current value, \f(CWD\fP to use default,
\f(CWC\fP to use current value, \f(CWP\fP to use previous value.
.IP "\f(CW.SA\fP [\fIn\fP]" \n(iN
Set right margin justification to \fIn\fP.
\fIn\fP is: \f(CW0\fP = no
justification or \f(CW1\fP = justification.
(Defaults: no justification
for \f(CWnroff\fP, justification for \f(CWtroff\fP.)
.IP "\f(CW.SG\fP [\fIname\fP]" \n(iN
Use \fIname\fP for signature line.
.IP "\f(CW.SK\fP \fIn\fP" \n(iN
Skip \fIn\fP pages.
.IP "\f(CW.SM\fP \fIx\fP[\fIy\fP][\fIz\fP]\fP" \n(iN
Reduce string \fIx\fP by one point.
If strings \fIx\fP, \fIy\fP, and \fIz\fP are specified, \fIy\fP is
reduced by one point.
.IP "\f(CW.SP\fP [\fIn\fP]" \n(iN
Leave \fIn\fP blank vertical spaces.
.IP "\f(CW.TB\fP [\fItitle\fP] [\fIn\fP] [\fIf\fP]" \n(iN
Supply table \fItitle\fP.
Arguments optionally override default numbering, where flag \fIf\fP
determines use of number \fIn\fP.
If \fIf\fP=0 (default), \fIn\fP is a
prefix to number; if \fIf\fP=1, \fIn\fP is a suffix; if \fIn\fP=2,
\fIn\fP replaces number.
.IP "\f(CW.TS\fP [\f(CWH\fP]" \n(iN
Start table.
\f(CWH\fP will put table header on all pages.
Use this option with following \f(CW.TH\fP.
.IP "\f(CW.TH\fP \fIN\fP" \n(iN
Table header ends.
Must be used with \f(CW.TS H\fP.
\f(CWN\fP = only print table headers on new page.
.IP "\f(CW.TE\fP" \n(iN
End table.
.IP "\f(CW.TC\fP [\fIlevel\fP] [\fIlevel\fP] [\fItab\fP] [\fIhead1\fP] ..." \n(iN
Generate table of contents.
.IP "\f(CW.TL\fP" \n(iN
Title of memorandum follows on next line.
.IP "\f(CW.TM\fP [\fIn\fP]" \n(iN
Number a technical memorandum \fIn\fP.
(Up to nine may be specified.)
.IP "\f(CW.TP\fP" \n(iN
Top-of-page macro.
.IP "\f(CW.TX\fP" \n(iN
User-supplied exit for table-of-contents titles.
.IP "\f(CW.TY\fP" \n(iN
User-supplied exit for table-of-contents header.
.IP "\f(CW.VL\fP \fIn\fP [\fIm\fP] [\fI1\fP]" \n(iN
Start variable item list.
Indent text \fIn\fP spaces and mark \fIm\fP spaces.
If third argument is 1, no space between list items.
.IP "\f(CW.VM\fP [\fIn\fP] [\fIm\fP]" \n(iN
Add \fIn\fP lines to top margin and \fIm\fP lines to bottom.
.\" _page 613
.IP "\f(CW.WC\fP [\fIx\fP]" \n(iN
Change column or footnote width to \fIx\fP.
\fIx\fP is:
.\" This looked kind of wonky with everything lined up on the left.
.\" Amazing how much better it looks with the dashes hanging. --LK
.DS
\f(CW\ FF\fP		All footnotes same as first
\f(CW-FF\fP		Turn off \f(CWFF\fP mode
\f(CW\ N\fP		Normal default mode
\f(CW\ WD\fP		Wide displays
\f(CW-WD\fP		Use default column mode
\f(CW\ WF\fP		Wide footnotes
\f(CW-WF\fP		Turn off \f(CWWF\fP mode
.DE
.poE
.Bh "Predefined String Names"
.ix	[mm] macros, predefined string~names %key mm macros, predefined string names
.poS
.IP \f(CWBU\fP \n(iN
Bullet; same as \f(CW\e(bu\fP.
.IP \f(CWCi\fP \n(iN
List of indents for table of contents levels.
.IP \f(CWDT\fP \n(iN
Current date, unless overridden.
Month, day, year (e.g., July 28, 1986).
.IP \f(CWEM\fP \n(iN
Em dash string (em dash in \f(CWtroff\fP and a double hyphen in
\f(CWnroff\fP).
.IP \f(CWF\fP \n(iN
Footnote number generator.
.IP \f(CWHF\fP \n(iN
Fonts used for each level of heading (1=roman, 2=italic, 3=bold).
.IP \f(CWHP\fP \n(iN
Point size used for each level of heading.
.IP \f(CWLe\fP \n(iN
Title set for \fIList Of Equations\fP.
.IP \f(CWLf\fP \n(iN
Title set for \fIList Of Figures\fP.
.IP \f(CWLt\fP \n(iN
Title set for \fIList Of Tables\fP.
.IP \f(CWLx\fP \n(iN
Title set for \fIList Of Exhibits\fP.
.IP \f(CWRE\fP \n(iN
SCCS Release and Level of \f(CWmm\fP.
.IP \f(CWRf\fP \n(iN
Reference number generator.
.IP \f(CWRp\fP \n(iN
Title for references.
.IP \f(CWTM\fP \n(iN
Trademark listing.
Place the letters \fITM\fP one-half line above the text that it follows.
.poE
.Bh "Number Registers Used in \f(CBmm\fP"
.ix	[mm] macros, number~registers %key mm macros, number~registers
A dagger (\(dg) next to a register name indicates that the register can
\fIonly\fP be set from the command line or before the \f(CWmm\fP macro
definitions are read by the formatter.
Any register that has a single-character name can be set from the
command line.
.\" _page 614
.poS
.IP \f(CWA\(dg\fP \n(iN
If set to 1, omits technical memorandum headings and provides spaces
appropriate for letterhead.
See \f(CW.AU\fP macro.
.IP \f(CWAu\fP \n(iN
Inhibits author information on first page.
See \f(CW.AU\fP macro.
.IP \f(CWC\(dg\fP \n(iN
Flag indicating type of copy (original, draft, etc.).
.IP \f(CWCl\fP \n(iN
Level of headings saved for table of contents (default 2).
See \f(CW.TC\fP macro.
.IP \f(CWCp\fP \n(iN
If set to 1, list of figures and tables appear on same page as table of
contents.
Otherwise, they start on a new page.
(Default is 1.)
.IP \f(CWD\(dg\fP \n(iN
If set to 1, sets debug mode (default 0).
If set, \f(CWmm\fP will
continue even when it encounters normally fatal errors.
.IP \f(CWDe\fP \n(iN
If set to 1, ejects page after each floating display.
(Default is 0.)
.IP \f(CWDf\fP \n(iN
Format of float displays.
See \f(CW.DF\fP macro.
.IP \f(CWDs\fP \n(iN
Sets the pre- and post-space used for static displays.
.IP \f(CWE\(dg\fP \n(iN
Font for the Subject/Date/From: 0=bold; 1=roman.
(Default is 0.)
.IP \f(CWEc\fP \n(iN
Equation counter, incremented for each \f(CW.EC\fP macro.
.IP \f(CWEj\fP \n(iN
Heading level for page eject before headings.
(Default is 0, no eject.)
.IP \f(CWEq\fP \n(iN
If set to 1, places equation label at left margin.
(Default is 0.)
.IP \f(CWEx\fP \n(iN
Exhibit counter, incremented for each \f(CW.EX\fP macro.
.IP \f(CWFg\fP \n(iN
Figure counter, incremented for each \f(CW.FG\fP macro.
.IP \f(CWFs\fP \n(iN
Vertical spacing between footnotes.
.IP \f(CWH1-H7\fP \n(iN
Heading counters for levels 1-7, incremented by the \f(CW.H\fP macro of
corresponding level or the \f(CW.HU\fP macro if at level given by the
\f(CWHu\fP register.
The \f(CWH2-H7\fP registers are reset to 0 by any \f(CW.H\fP (or
\f(CW\&.HU\fP) macro at a lower-numbered level.
.IP \f(CWHb\fP \n(iN
Level of heading for which break occurs before output of body text
(default 2 lines).
.IP \f(CWHc\fP \n(iN
Level of heading for which centering occurs
(default 0).
.IP \f(CWHi\fP \n(iN
Indent type after heading.
(Default 1=paragraph indent.)
Legal values are: 0 left justified, 1 indented,
2 indented except after \f(CW.H\fP, \f(CW.LC\fP, \f(CW.DE\fP.
(Default is 0).
.IP \f(CWHs\fP \n(iN
Level of heading for which space after heading occurs.
(Default = 2; \f(CW.H2\fP.)
.IP \f(CWHt\fP \n(iN
Numbering type of heading: single (1) or concatenated (0).
(Default is 0.)
.IP \f(CWHu\fP \n(iN
Sets level of numbered heading that unnumbered heading resembles.
(Default = 2; \f(CW.H2\fP.)
.IP \f(CWHy\fP \n(iN
Sets hyphenation.
If set to 1, \f(CWHy\fP enables hyphenation.
(Default is 0.)
.IP \f(CWL\(dg\fP \n(iN
.\" The "v" in "66v" is \f(CW in the paper book.  Let us leave
.\" it as \fR since almost all other units are \fR in the book.
.\" /Andreas 2002-09-29
Sets length of page.
(Default is 66v.)
.IP \f(CWLe\fP \n(iN
Flag for list of equations following table of contents.
0 = do not print; 1 = print.
(Default is 0.)
.\" _page 615
.IP \f(CWLf\fP \n(iN
Flag for list of figures following table of contents.
0 = do not print; 1 = print.
(Default is 0.)
.IP \f(CWLi\fP \n(iN
Default indent of lists.
(Default is 5.)
.IP \f(CWLs\fP \n(iN
List spacing between items by level.
(Default = 6, spacing between all levels of list.)
.IP \f(CWLt\fP \n(iN
Flag for list of tables following table of contents.
0 = do not print; 1 = print.
(Default is 0.)
.IP \f(CWLx\fP \n(iN
Flag for list of exhibits following table of contents.
0 = do not print; 1 = print.
(Default is 0.)
.IP \f(CWN\(dg\fP \n(iN
Page numbering style.
0=header on all pages; 1=header printed as footer on page 1;
2=no header on page 1; 3=section page as footer;
4=no header unless \f(CW.PH\fP defined;
5=section page and section figure as footer.
(Default is 0.)
.IP \f(CWNp\fP \n(iN
Numbering style for paragraphs.
0 = unnumbered; 1 = numbered.
.IP \f(CWO\fP \n(iN
Offset of page.
For \f(CWnroff\fP, this value is an unscaled number representing
character positions.
.\" Removed '(7.5i)' from default. --LK
Default is 9.
For \f(CWtroff\fP, this value is scaled.
.\" Interesting: my XENIX book says the default is 0.75i for troff.
.\" We'll leave it alone; the XENIX version might be different. --LK
Default is .5i.
.IP \f(CWOc\fP \n(iN
Table of contents page numbering style.
0=lower case roman; 1=arabic.
(Default is 0.)
.IP \f(CWOf\fP \n(iN
Figure caption style.
0=period separator; 1=hyphen separator.
(Default is 0.)
.IP \f(CWP\fP \n(iN
Current page number.
.IP \f(CWPi\fP \n(iN
Amount of indent for paragraph.
(Default is 5 for \f(CWnroff\fP, 3 for \f(CWtroff\fP.)
.IP \f(CWPs\fP \n(iN
Amount of spacing between paragraphs.
.\" The "v" in "3v" is \f(CW in the paper book.  Let us leave
.\" it as \fR since almost all other units are \fR in the book.
.\" /Andreas 2002-09-29
.\" I think this is supposed to be *0.3v* not *3v*, also in ch06.
.\" Both XENIX & groff mm use 1 (aka 1v) for the default.
.\" See the \n(PD register in the ms macros. --LK
(Default is 3v.)
.IP \f(CWPt\fP \n(iN
Paragraph type.
Legal values are: 0 left justified, 1 indented,
2 indented except after \f(CW.H\fP, \f(CW.LC\fP, \f(CW.DE\fP.
(Default is 0.)
.IP \f(CWPv\fP \n(iN
Inhibits ``PRIVATE'' header.
See \f(CW.PV\fP macro for values.
.IP \f(CWRf\fP \n(iN
Reference counter, incremented for each \f(CW.RS\fP.
.IP \f(CWS\(dg\fP \n(iN
Default point size for \f(CWtroff\fP.
Default is 10.
(Vertical spacing is \f(CW\en5+2\fP.)
.IP \f(CWSi\fP \n(iN
Standard indent for displays.
(Default is 5 for \f(CWnroff\fP, 3 for \f(CWtroff\fP.)
.IP \f(CWT\(dg\fP \n(iN
Type of \f(CWnroff\fP output device.
Causes register settings for specific devices.
.IP \f(CWTb\fP \n(iN
Table counter, incremented for each \f(CW.TB\fP.
.IP \f(CWU*\fP \n(iN
Underlying style (\f(CWnroff\fP) for \f(CW.H\fP and \f(CW.HU\fP.
If not set, use continuous underline; otherwise, don't underline
punctuation and white space.
(Default is 0.)
.IP \f(CWW\(dg\fP \n(iN
.\" The "i" in "6i" is \f(CW in the paper book.  Let us leave
.\" it as \fR since almost all other units are \fR in the book.
.\" /Andreas 2002-09-29
Width of page (line and title length).
(Default is 6i.)
.poE
.\" _page 616
.Bh "Other Reserved Macro and String Names"
.ix	[mm] macros, reserved macro~and~string~names %key mm macros, reserved macro and~string~names
In \f(CWmm\fP, the only macro and string names you can safely use are
names containing a single lowercase letter, or two character names whose
first character is a lowercase letter and whose second character is
\fIanything but\fP a lowercase letter.
Of these, \f(CWc2\fP and \f(CWnP\fP are already used.
.ix	%end [mm] macros, summary~of macros %key mm macros, summary of macros
.Ah "\f(CBtbl\fP Command Characters and Words"
.ix	%begin [tbl] preprocessor, summary~of commands %key tbl preprocessor, summary of commands
.poS
.IP \f(CW.TS\fP \n(iN
Start table.
.IP \f(CW.TE\fP \n(iN
End table.
.IP "\f(CW.TS H\fP" \n(iN
Used when the table will continue onto more than one page.
Used with \f(CW.TH\fP to define a header that will print on
every page.
.IP \f(CW.TH\fP \n(iN
With \f(CW.TS H\fP, ends the header portion of the table.
.IP \f(CW.T&\fP \n(iN
Continue table after changing format line.
.poE
.Bh "Options"
.ix	[tbl] preprocessor, global format~options %key tbl preprocessor, global format options
Options affect the entire table.
The options should be separated by commas,
and the option line must be terminated by a semicolon.
.poS
.IP \f(CWcenter\fP \n(iN
Center with current margins.
.IP \f(CWexpand\fP \n(iN
Flush with current left and right margins.
.IP (\fIblank\fP) \n(iN
Flush with current left margin (default).
.IP \f(CWbox\fP \n(iN
Enclose table in a box.
.IP \f(CWdoublebox\fP \n(iN
Enclose table in two boxes.
.IP \f(CWallbox\fP \n(iN
Enclose each table entry in a box.
.IP "\f(CWtab (\fIx\fP)\fP" \n(iN
Define the tab symbol as \fIx\fP.
.IP "\f(CWlinesize (\fIn\fP)\fP" \n(iN
Set lines or rules (e.g., from box) to \fIn\fP point type.
.IP "\f(CWdelim (\fIxy\fP)\fP" \n(iN
Recognize \fIx\fP and \fIy\fP as the \f(CWeqn\fP delimiters.
.poE
.\" _page 617
.Bh Format
.ix	[tbl] preprocessor, column format~options %key tbl preprocessor, column format options
The format line affects the layout of individual columns and rows of the
table.
Each line contains a key letter for each column of the table.
The column entries should be separated by spaces, and the format section
must be terminated by a period.
Each line of format corresponds to one line of the table, except for the
last, which corresponds to all following lines up to the next
\&\f(CW.T&\fP, if any.
.Ch "Key letters"
.poS
.TS
tab (:);
l:l:l.
\f(CWc\fP:	:Center.
\f(CWl\fP:	:Left justify.
\f(CWr\fP:	:Right justify.
\f(CWn\fP:	:Align numerical entries.
\f(CWa\fP:	:Align alphabetic subcolumns.
\f(CWs\fP:	:Horizontally span previous column entry across this column.
\f(CW^\fP:	:T{
.fi
Vertically continue entry from previous row down through this
row.
T}
.TE
.poE
.Ch "Other choices \fR(must follow a key letter)\fP"
.\" Right parenthasis of w(n) below is \fP in original book,
.\" while left one is \f(CW.  This was corrected to \f(CW for
.\" both.  /Andreas 2002-09-29
.poS
.TS
tab(:);
l:l:l.
\f(CWb\fP:	:T{
.fi
Boldface.
Must be followed by a space.
T}
\f(CWi\fP:	:T{
Italics.
Must be followed by a space.
T}
\f(CWp\fP\fIn\fP:	:Point size \fIn\fP.
\f(CWt\fP:	:T{
Begin any corresponding vertically spanned table
entry at the top line of its range.
T}
\f(CWe\fP:	:Equal width columns.
\f(CWw(\fP\fIn\fP\f(CW)\fP:	:T{
Minimum column width.
Also used with text blocks.
\fIn\fP can be given in any acceptable \f(CWtroff\fP units.
T}
\f(CWv\fP\fIn\fP:	:T{
Vertical line spacing.
Used only with text blocks.
T}
\f(CWn\fP:	:Amount of separation between columns (default is 3n).
\f(CW|\fP:	:T{
Single vertical line.
Typed between key letters.
T}
\f(CW||\fP:	:Double vertical line. Typed between key letters.
\f(CW_\fP:	:Single horizontal line. Used in place of a key letter.
\f(CW=\fP:	:Double horizontal line. Used in place of a key letter.
.TE
.poE
.\" _page 618
.Ch Data
.ix	[tbl] preprocessor, data %key tbl preprocessor, data
The data portion includes both the heading and text of the table.
Each table entry must be separated by a tab symbol.
.TS
center, tab(:);
l:l.
\f(CW.xx\fP:T{
.ll 4.5i
\f(CWtroff\fP commands may be used (such as \f(CW.sp #\fP and \f(CW.ce
#\fP).
Do not use macros, unless you know what you're doing.
T}
\f(CW\e\fP:T{
As last character in a line, combine following line with current
line (\f(CW\e\fP is hidden).
T}
\f(CW\e^\fP:T{
Vertically spanned table entry.
Span table entry immediately above over this row.
T}
\f(CW_\fP or \f(CW=\fP:T{
As the only character in a line, extend a single or double horizontal
line the full width of the table.
T}
\f(CW\e$_\fP or \f(CW\e$=\fP:T{
Extend a single or double horizontal line the full width of the column.
T}
\f(CW\e_\fP:T{
Extend a single a single horizontal line the width of the contents of
the column.
T}
\f(CW\eR\fP\fIx\fP:T{
Print \fIx\fP's as wide as the contents of the
column.
T}
\f(CW...T\&{\fP:T{
Start text block as a table entry.
Must be used with \f(CWw\fP\fIn\fP, column width option.
T}
\f(CW...T}\fP:T{
End text block.
T}
.TE
.ix	%end [tbl] preprocessor, summary~of commands %key tbl preprocessor, summary of commands
.Ah "\f(CBeqn\fP Command Characters"
.ix	%begin [eqn] preprocessor, summary~of command~characters %key eqn preprocessor, summary of command~characters
.EQ
delim $$
.EN
.poS
.TS
tab(:);
l:l.
\f(CW.EQ\fP:Start typesetting mathematics
\f(CW.EN\fP:End typesetting mathematics
.TE
.poE
.Bh "Character Translations"
The following character sequences are recognized and translated as
shown.
.\" _page 619
.poS
.TS
tab(:);
l:l:l:l:l.
\f(CW>=\fP:\(>=:	:\f(CWapprox\fP:\(~=
\f(CW<=\fP:\(<=:	:\f(CWnothing\fP:
\f(CW==\fP:\(==:	:\f(CWcdot\fP:$cdot$
\f(CW!=\fP:\(!=:	:\f(CWtimes\fP:\(mu
\f(CW+-\fP:\(+-:	:\f(CWdel\fP:$del$
\f(CW->\fP:\(->:	:\f(CWgrad\fP:$del$
\f(CW<-\fP:\(<-:	:\f(CW...\fP:$...$
\f(CW<<\fP:$<<$:	:\f(CW,...,\fP:$,...,$
\f(CW>>\fP:$>>$:	:\f(CWsum\fP:$SIGMA$
\f(CWinf\fP:\(if:	:\f(CWint\fP:$int$
\f(CWpartial\fP:\(pd:	:\f(CWprod\fP:$PI$
\f(CWhalf\fP:\(12:	:\f(CWunion\fP:\(cu
\f(CWprime\fP:$'$:	:\f(CWinter\fP:\(ca
.TE
.poE
.LP
Digits, parentheses, brackets, punctuation marks, and the following words
are converted to roman when encountered:
.nf
.poS
\f(CWsin cos tan sinh cosh tanh arc
max min lin log ln exp
Re Im and if for det\fP
.poE
.fi
.PP
Greek letters can be printed in uppercase or lowercase.
To obtain Greek letters, simply spell them out in the case you want:
.poS
.TS
tab(:);
l:l:l:l:l.
\f(CWalpha\fP:\(*a:	:\f(CWsigma\fP:\(*s
\f(CWbeta\fP:\(*b:	:\f(CWtau\fP:\(*t
\f(CWgamma\fP:\(*g:	:\f(CWupsilon\fP:\(*u
\f(CWdelta\fP:\(*d:	:\f(CWphi\fP:\(*f
\f(CWepsilon\fP:\(*e:	:\f(CWchi\fP:\(*x
\f(CWzeta\fP:\(*z:	:\f(CWpsi\fP:\(*q
\f(CWeta\fP:\(*y:	:\f(CWomega\fP:\(*w
\f(CWtheta\fP:\(*h:	:\f(CWGAMMA\fP:\(*G
\f(CWiota\fP:\(*i:	:\f(CWDELTA\fP:\(*D
\f(CWkappa\fP:\(*k:	:\f(CWTHETA\fP:\(*H
\f(CWlambda\fP:\(*l:	:\f(CWLAMBDA\fP:\(*L
\f(CWmu\fP:\(*m:	:\f(CWXI\fP:\(*C
\f(CWnu\fP:\(*n:	:\f(CWPI\fP:\(*P
\f(CWxi\fP:\(*c:	:\f(CWSIGMA\fP:\(*S
\f(CWomicron\fP:\(*o:	:\f(CWUPSILON\fP:\(*U
\f(CWpi\fP:\(*p:	:\f(CWPHI\fP:\(*F
\f(CWrho\fP:\(*r:	:\f(CWPSI\fP:\(*Q
::	:\f(CWOMEGA\fP:\(*W
.TE
.poE
.LP
The following words translate to marks on the tops of characters.
.\" _page 620
.poS
.TS
tab(:);
l:l:l:l:l.
\f(CWx dot\fP:$x dot$:	:\f(CWx vec\fP:$x vec$
\f(CWx dotdot\fP:$x dotdot$:	:\f(CWx dyad\fP:$x dyad$
\f(CWx hat\fP:$x hat$:	:\f(CWx bar\fP:$x bar$
\f(CWx tilde\fP:$x tilde$:	:\f(CWx under\fP:$x under$
.TE
.poE
.EQ
delim off
.EN
.Bh "Words Recognized By \f(CBeqn\fP"
.poS
.IP "\f(CWabove\fP" \n(iN
Separate the pieces of a pile or matrix column.
.IP "\f(CWback \fIn\fP\fP" \n(iN
Move backwards horizontally \fIn\fP 1/100's of an em.
.IP "\f(CWbold\fP" \n(iN
Change to bold font.
.IP "\f(CWccol\fP" \n(iN
Center a column of a matrix.
.IP "\f(CWcol???\fP" \n(iN
Used with a preceding \f(CWl\fP or \f(CWr\fP to left or right
adjust the columns of the matrix.
.IP "\f(CWcpile\fP" \n(iN
Make a centered pile (same as a pile).
.IP "\f(CWdefine\fP" \n(iN
Create a name for a frequently used string.
.IP "\f(CWdelim\fP" \n(iN
Define two characters to mark the left and right ends of an \f(CWeqn\fP
equation to be printed in line.
.IP "\f(CWdown \fIn\fP\fP" \n(iN
Move down \fIn\fP 1/100's of an em.
.IP "\f(CWfat\fP" \n(iN
Widen the current font by overstriking it.
.IP "\f(CWfont \fIx\fP\fP" \n(iN
Change to font \fIx\fP, where \fIx\fP is the one-character name or the
number of a font.
.IP "\f(CWfrom\fP" \n(iN
Used in summations, integrals and other similar constructions to signify
the lower limit.
.IP "\f(CWfwd \fIn\fP\fP" \n(iN
Move forward \fIn\fP 1/100's of an em.
.IP "\f(CWgfont \fIx\fP\fP" \n(iN
Set a global font \fIx\fP for all equations.
.IP "\f(CWgsize \fIn\fP\fP" \n(iN
Set a global size for all equations.
.IP "\f(CWup \fIn\fP\fP" \n(iN
Move up \fIn\fP 1/100's of an em.
.IP "\f(CWitalic\fP" \n(iN
Change to italic font.
.IP "\f(CWlcol\fP" \n(iN
Left justify a column of a matrix.
.IP "\f(CWleft\fP" \n(iN
Create large brackets, braces, bars, etc.
.IP "\f(CWlineup\fP" \n(iN
Line up marks in equations on different lines.
.IP "\f(CWlpile\fP" \n(iN
Left justify the elements of a pile.
.IP "\f(CWmark\fP" \n(iN
Remember the horizontal position in an equation.
Used with \f(CWlineup\fP.
.IP "\f(CWmatrix\fP" \n(iN
Create a matrix.
.IP "\f(CWndefine\fP" \n(iN
Create a definition which only takes effect when \f(CWneqn\fP is
running.
.IP "\f(CWover\fP" \n(iN
Make a fraction.
.IP "\f(CWpile\fP" \n(iN
Make a vertical pile with elements centered above one another.
.IP "\f(CWrcol\fP" \n(iN
Right adjust a column of a matrix.
.IP "\f(CWright\fP" \n(iN
Create large brackets, braces, bars, etc.
.IP "\f(CWroman\fP" \n(iN
Change to roman font.
.\" _page 621
.IP "\f(CWrpile\fP" \n(iN
Right justify the elements of a pile.
.IP "\f(CWsize \fIn\fP\fP" \n(iN
Change the size of the font to \fIn\fP.
.IP "\f(CWsqrt\fP" \n(iN
Draw a square root sign.
.IP "\f(CWsub\fP" \n(iN
Start a subscript.
.IP "\f(CWsup\fP" \n(iN
Start a superscript.
.IP "\f(CWtdefine\fP" \n(iN
Make a definition that will apply only for \f(CWeqn\fP.
.IP "\f(CWto\fP" \n(iN
Used in summations, integrals, and other similar constructions to signify
the upper limit.
.IP "\f(CW~\fP" \n(iN
Forces extra space into the output.
.IP "\f(CW^\fP" \n(iN
Force a space one half the size of the space forced by \f(CW~\fP.
.IP "\f(CW{ }\fP" \n(iN
Force \f(CWeqn\fP to treat an element as a unit.
.IP "\f(CW'...'\fP" \n(iN
String within quotation marks is not subject to alteration by
\f(CWeqn\fP.
.poE
.Bh "Precedence"
.ix	[eqn] preprocessor, precedence~of operations %key eqn preprocessor, precedence of operations
If you don't use braces, \f(CWeqn\fP will do operations in the order
shown in the following list.
.poS
.nf
\f(CWdyad vec under bar tilde hat dot dotdot
fwd back down up
fat roman italic bold size
sub sup sqrt over
from to\fP
.fi
.poE
These operations group to the left:
.poS
.nf
\f(CWover sqrt left right\fP
.fi
.poE
All others group to the right.
.ix	%end [eqn] preprocessor, summary~of command~characters %key eqn preprocessor, summary of command~characters
.Ah "The \f(CBpic\fP Preprocessor"
.ix	%begin [pic] preprocessor, summary~of command~characters %key pic preprocessor, summary of command~characters
In \f(CWpic\fP there are often dozens of ways to draw a picture, not only
because of the many permissible abbreviations, but because \f(CWpic\fP
combines the language of geometry with English.
You can specify a line, for example, with direction, magnitude, and
starting point, yet often achieve the same effect by stating ``from
\fIthere\fP to \fIthere\fP.''
.PP
Full descriptions of primitive objects in \f(CWpic\fP can be ended by
starting another line, or by the semicolon character (\f(CW;\fP).
A single primitive description can be continued on the next line,
however, by ending the first with a backslash character (\f(CW\e\fP).
Comments may be placed on lines beginning with \f(CW#\fP.
.\" _page 622
.Bh "\f(CWpic\fP Macros"
The following macros are used to delimit \f(CWpic\fP input from the body
of the source file.
Only text within these macros will be processed by \f(CWpic\fP.
.poS
.IP "\f(CW.PS\fP [\fIh\fP[\fIw\fP]]" \n(iN
Start \f(CWpic\fP description.
\fIh\fP and \fIw\fP, if specified, are the desired height and width of
the picture;
the full picture will expand or contract to fill this space.
.IP "\f(CW.PS <\fP\fIfile\fP" \n(iN
Read contents of \fIfile\fP in place of current line.
.IP "\f(CW.PE\fP" \n(iN
End \f(CWpic\fP description.
.IP "\f(CW.PF\fP" \n(iN
End \f(CWpic\fP description and return to vertical position before
matching \f(CWPS\fP.
.poE
.Bh "Declarations"
.ix	[pic] preprocessor, declarations %key pic preprocessor, declarations
At the beginning of a \f(CWpic\fP description, you may declare a new
scale, and declare any number of variables.
.PP
\f(CWpic\fP assumes you want to do a 1-to-1 scale, with 1 = one inch.
You can declare a different scale, say 1 = one-\fIn\fPth of an inch, by
declaring \f(CWscale = \fP\fIn\fP.
.PP
\f(CWpic\fP takes variable substitutions for numbers used in the
description.
Instead of specifying, \f(CWline right \fP\fIn\fP, you may use a lower
case character as a variable, for example, \f(CWa\fP, by declaring at
the top of the description:
.DS
\f(CWa = \fP\fIn\fP
.DE
You may then write \f(CWline right a\fP.
.Bh Primitives
.ix	[pic] preprocessor, summary~of graphics~primitives %key pic preprocessor, summary of graphics~primitives
Primitives may be followed by relevant options.
Options are discussed later in this section.
.poS
.IP "\f(CWarc\fP [\f(CWcw\fP] [\fIoptions\fP] [\f(CW``\fP\fItext\fP\f(CW''\fP]" \n(iN
A fraction of a circle.
(Default 1/4 of a circle.)
The \f(CWcw\fP option specifies a clockwise arc; default is
counterclockwise.
.IP "\f(CWarrow\fP [\fIoptions\fP] [\f(CW``\fP\fItext\fP\f(CW''\fP] [\f(CWthen...]\fP" \n(iN
Draw an arrow.
Essentially the same as \f(CWline ->\fP.
.IP "\f(CWbox\fP [\fIoptions\fP] [\f(CW``\fP\fItext\fP\f(CW''\fP]" \n(iN
Draw a box.
.IP "\f(CWcircle\fP [\fIoptions\fP] [\f(CW``\fP\fItext\fP\f(CW''\fP]" \n(iN
Draw a circle.
.\" _page 623
.IP "\f(CWellipse\fP [\fIoptions\fP] [\f(CW``\fP\fItext\fP\f(CW''\fP]" \n(iN
Draw an ellipse.
.IP "\f(CWline\fP [\fIoptions\fP] [\f(CW``\fP\fItext\fP\f(CW''\fP] [\f(CWthen...]\fP" \n(iN
Draw a line.
.IP "\f(CWmove\fP [\fIoptions\fP] [\f(CW``\fP\fItext\fP\f(CW''\fP]" \n(iN
A move of position in the drawing.
(Essentially, an invisible line.)
.IP "\f(CWspline\fP [\fIoptions\fP] [\f(CW``\fP\fItext\fP\f(CW''\fP] [\f(CWthen...]\fP" \n(iN
A line, with the feature that a ``then'' results in a gradual (sloped)
change in direction.
.IP "\f(CW``\fP\fItext\fP\f(CW''\fP" \n(iN
Text at the current point.
.poE
.Bh Options
.poS
.TS
tab(:);
l:l.
T{
.nf
\f(CWright\fP [\fIn\fP]
\f(CWleft\fP [\fIn\fP]
\f(CWup\fP [\fIn\fP]
\f(CWdown\fP [\fIn\fP]
T}:T{
.ll 4.0i
Specifies direction of primitive; default is direction in which the
previous description has been heading.
Diagonals result by using two directions on the option line.
Each direction can be followed by a specified length \fIn\fP.
T}
:
T{
.nf
\f(CWrad\fP \fIn\fP
\f(CWdiam\fP \fIn\fP
T}:T{
Specifies a primitive to have radius \fIn\fP (or diameter \fIn\fP).
T}
:
T{
.nf
\f(CWht\fP \fIn\fP
\f(CWwid\fP \fIn\fP
T}:T{
Specifies the height or width of the primitive to be \fIn\fP.
For an arrow, line, or spline, refers to the size of arrowhead.
T}
:
\f(CWsame\fP:T{
Specifies a primitive of the same dimensions of the most recent matching
primitive.
T}
:
\f(CWat\fP \fIpoint\fP:T{
Specifies primitive to be centered at \fIpoint\fP.
T}
:
\f(CWwith\fP \fI.position\fP \f(CWat\fP \fIpoint\fP:T{
Specifies the designated \fIposition\fP of the primitive to be at
\fIpoint\fP.
T}
:
\f(CWfrom\fP \fIpoint1\fP \f(CWto\fP \fIpoint2\fP:T{
Specifies the primitive to be drawn from \fIpoint1\fP to \fIpoint2\fP.
Points may be expressed as Cartesian coordinates or in respect to
previous objects.
T}
:
\f(CW->\fP:Specify the arrowhead to be directed forwards.
:
\f(CW<-\fP:Specify the arrowhead to be directed backwards.
:
\f(CW<->\fP:Specify the arrowhead to be directed both ways.
:
\f(CWchop\fP \fIn m\fP:T{
Chop off \fIn\fP from beginning of primitive, and \fIm\fP from end.
With only one argument, the same value will be chopped off from both
ends.
T}
.\" _page 624
:
T{
.nf
\f(CWdotted\fP
\f(CWdashed\fP
\f(CWinvis\fP
T}:T{
Specifies the primitive to be drawn dotted, dashed, or to be invisible.
T}
:
\f(CWthen...\fP:T{
Continue primitive in a new direction.
Relevant only to lines, splines, moves, and arrows.
T}
.TE
.poE
.Bh Text
Place text within quotation marks.
To break the line, break into two (or more) sets of quotation marks.
Text always appears centered within the object, unless given one of the
following arguments:
.poS
.TS
tab(:);
l:l.
\f(CWljust\fP	:Text appears left justified to the center.
\f(CWrjust\fP	:Text appears right justified to the center.
\f(CWabove\fP	:Text appears above the center.
\f(CWbelow\fP	:Text appears below the center.
.TE
.poE
.Bh "Object Blocks"
.ix	[pic] preprocessor, defining object~blocks %key pic preprocessor, defining object blocks
.ix	[pic] preprocessor, labeling objects %key pic preprocessor, labeling objects
A complex object that is the combination of several primitives (for
example, an octagon) can be treated as a single object by declaring it
as a block:
.poS
.nf
\f(CWObject:\fP[
  \fIdescription\fP
	.
	.
	.
  ]
.fi
.poE
Brackets are used as delimiters.
Note that the object is declared as a proper noun, hence it should begin
with a capital letter.
.Bh Macros
.ix	[pic] preprocessor, defining macros %key pic preprocessor, defining macros
The same sequence of commands can be repeated by using macros.
The syntax is:
.poS
.nf
\f(CWdefine\fP \fIsequence\fP \f(CW%\fP
  \fIdescription\fP
	.
	.
	.
  \f(CW%\fP
.fi
.poE
.\" _page 625
In this example, we have used the percent sign (\f(CW%\fP) as the
delimiter,
but any character that is not in the description may be used.
.PP
Macros can take variables, expressed in the definition as ``$1'' through
``$9''.
Invoke the macro with the syntax: \fIsequence\fP(\fIvalue1,
value2\fP,...)
.Bh Positioning
.ix	[pic] preprocessor, positioning object~blocks %key pic preprocessor, positioning object blocks
In a \f(CWpic\fP description, the first action will begin at (0,0),
unless otherwise specified with coordinates.
Thus, the point (0,0) will move down and right on the drawing, as
objects are placed above and to the left of the first object.
.PP
All points are ultimately translated by the formatter into x- and
y-coordinates.
You may therefore refer to a specific point in the picture by
incrementing or decrementing the coordinates, i.e., \f(CW2nd ellipse -
(3,1)\fP.
.PP
You may refer to the x- and y-coordinates of an object by placing
\&\f(CW.x\fP or \f(CW.y\fP at the end.
For example, \f(CWlast box.x\fP will refer to the x-coordinate of the
most recent box drawn.
Some of the physical attributes of the object may
also be referred to similarly, as follows:
.poS
.nf
\f(CW\&.x\fP			X-coordinate of the object's center.
\f(CW\&.y\fP			Y-coordinate of the object's center.
\f(CW\&.ht\fP			Height of object.
\f(CW\&.wid\fP			Width of object.
\f(CW\&.rad\fP			Radius of object.
.fi
.poE
.PP
Unless otherwise positioned, each object will begin at the point where
the last object left off.
If a command (or a sequence of commands) is set off by braces
(\f(CW{}\fP), however, \f(CWpic\fP will then return to the point before
the first brace.
.Ch "Positioning between Objects"
When referring to a previous object, you must use proper names.
This can be done two ways:
.ix	[pic] preprocessor, expressions %key pic preprocessor, expressions
.poS
.IP \(bu \" \n(iN
By referring to it by order, e.g., \f(CW1st box, 3rd box, last box, 2nd
last box,\fP etc.
.IP \(bu
By declaring it with a name, in initial caps, on its declaration line,
e.g., \f(CWLine1: line 1.5 right from last box.sw\fP
.poE
.LP
To refer to a point between two objects, or between two points on the
same object, you may write:\|\fIfraction\fP \f(CWof the way between\fP
\fIfirst.position\fP \f(CWand\fP \fIsecond.position\fP or (abbreviated)
\fIfraction\fP<\fIfirst.position\f(CW,\fP second.position\fP>.
.\" _page 626
.Ch Corners
When you refer to a previous object, \f(CWpic\fP will assume that you
mean the \fIcenter\fP of the object, unless you use a \fIcorner\fP to
specify a particular point on the object.
The syntax is:
.poS
\&\fI.corner\fP \f(CWof\fP \fIobject\fP
.poE
for example, \f(CW.sw of last box\fP.
You can also use an abbreviated syntax:
.poS
\fIobject.corner\fP
.poE
for example, \f(CWlast box.sw\fP.
.PP
These corners may be:
.poS
.nf
\f(CWn\fP		North (same as \f(CWt\fP)
\f(CWs\fP		North (same as \f(CWb\fP)
\f(CWe\fP		East (same as \f(CWr\fP)
\f(CWw\fP		West (same as \f(CWl\fP)
\f(CWne\fP		Northeast
\f(CWnw\fP		Northwest
\f(CWse\fP		Southeast
\f(CWsw\fP		Southwest
\f(CWt\fP		Top (same as \f(CWn\fP)
\f(CWb\fP		Bottom (same as \f(CWs\fP)
\f(CWr\fP		Right (same as \f(CWe\fP)
\f(CWl\fP		Left (same as \f(CWl\fP)
\f(CWstart\fP	Point where drawing of object began
\f(CWend\fP		Point where drawing of object ended
.fi
.poE
You may also refer to the \f(CWupper right\fP, \fPupper left\fP, \fPlower right\fP,
and \f(CWlower left\fP of an object.
.Bh "Numerical Operators"
.ix	numerical operators, in [pic] %key numerical operators, in pic
Several operators are functional in \f(CWpic\fP.
These are:
.poS
.nf
+	Addition
-	Subtraction
*	Multiplication
/	Division
%	Modulo
.fi
.poE
.\" _page 627
.Bh "Default Values"
.poS
.TS
tab(:);
l:n:l:l:n.
\f(CWarcrad\fP:0.25:	:\f(CWellipsewid\fP:0.75
\f(CWarrowwid\fP:0.05:	:\f(CWlinewid\fP:0.5
\f(CWarrowht\fP:0.1:	:\f(CWlineht\fP:0.5
\f(CWboxwid\fP:0.75:	:\f(CWmovewid\fP:0.5
\f(CWboxht\fP:0.5:	:\f(CWmoveht\fP:0.5
\f(CWcirclerad\fP:0.25:	:\f(CWscale\fP:1
\f(CWdashwid\fP:0.05:	:\f(CWtextht\fP:0
\f(CWellipseht\fP:0.5:	:\f(CWtextwid\fP:0
.TE
.poE
.ix	%end [pic] preprocessor, summary~of command~characters %key pic preprocessor, summary of command~characters


