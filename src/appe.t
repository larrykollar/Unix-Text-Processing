.ig
Ralph Corderoy's $Revision: 1.1 $.
..
.
.\" TROFF source proof read
.\" by
.\" Andreas Kähäri <andreas.kahari@unix.net>
.
.so utp.mac
.utp
.
.page 640
.ix %begin [mm] macros, compared~to~[ms] %key mm macros, compared to~[ms]
.ix %begin [ms] macros, compared~to~[mm] %key ms macros, compared to~[mm]
.ix %begin macros, comparing [mm]~and~[ms] %key macros, comparing mm and~[ms]
.
.chapter E "Comparing \f(CBmm\fP and \f(CBms\fP" Appendix 1
.Rn "Markup problem: `mm' and `me' should be lower case from .chapter."
.\" I leave that .Rn in.  I can't possibly fix it.
.\" /Andreas 2002-10-02
.
.\" Lines appears far longer in this version than in printed copy.
.\" /Andreas 2002-10-02
.
.LP
If you have both
.CW ms
and
.CW mm
on your system, you may be interested in looking at both packages,
perhaps evaluating features.
In general,
.CW ms
has many of the same capabilities as
.CW mm .
.ix lists, [mm]~vs.~[ms] %key lists, mm vs.~[ms]
However, it lacks some essential features, such as automatically
numbered lists and table of contents generation.
On the other hand, it is much easier to learn the internals of
.CW ms ,
and therefore easier to extend it with your own macros.
.Ah Paragraphs
.LP
The basic paragraph types are block and indented.
.\" .Rn "Book errata: Shouldn't mm and ms be the other way around on the first line?
.\" Correct.  I will swap the column headers.
.\" /Andreas 2002-10-02
.in +3
.TS
tab(:);
lfCW lfCW l.
mm:ms:\fIDescription\fP
.sp
\&.P:.LP:Begin a block paragraph.
\&.P 1:.PP:Begin a paragraph with indented first line.
.TE
.in -3
.LP
In
.CW mm ,
the default paragraph type can be changed from block to indented by
setting the number register
.CW Pt
to 1 or 2.
The
.CW ms
macros lack this generalizing mechanism.
.
.Ah Justification
.LP
When using the
.CW nroff
formatter,
.CW mm
does not justify the right margin.
.CW ".SA 1"
turns on justification for both formatters.
.CW ".SA 0"
turns it off.
.PP
The
.CW ms
macros do not provide a macro for inhibiting the normal justification of
paragraphs.
However, the
.CW .na
request can be used to do this.
.
.Ah Displays
.ix displays, [mm]~vs.~[ms] %key displays, mm vs.~[ms]
.
.\" .Rn "Book errata: should be `displays are left justified'
.\" Added final 's' to "displays".  /Andreas 2002-10-02
.LP
Displays are produced in a very similar way in both macro packages,
using the
.CW "DS\fP/\f(CWDE
pair of macros.
In
.CW mm ,
displays are left justified; in
.CW ms ,
displays are indented.
The options that allow you to change the placement of the display are
basically the same.
.PP
The
.CW mm
macros provide
for static and floating displays
.CW .DF ). (
In
.CW ms ,
this is done with a separate pair of keep macros
.CW KS\fP/\f(CWKF \& (
and
.CW KE ).
.PP
In
.CW mm ,
you can turn on fill mode within the display and specify an indent from
the right margin.
This is used for quoted material and has its equivalent in
.CW ms
with the
.CW Qp
or the
.CW QS\fP/\f(CWQE
pair.
.PP
In addition, the same set of delimiter pairs for
.CW tbl ,
.CW eqn ,
and
.CW pic
are available in both packages.
.
.Ah "Formatting Lists
.LP
The
.CW mm
macros have sophisticated list formatting macros that are lacking
in
.CW ms .
The
.CW .IP
macro in
.CW ms
produces the equivalent of a variable-item list in
.CW mm .
In other words, you can get a numbered list by specifying the number as
a label to an indented paragraph, but you cannot get an automatically
numbered list.
.
.Ah "Change Font
.LP
The
.CW .B
(change to bold),
.CW .I
(change to italic), and
.CW .R
(change to roman) macros used for changing fonts are the same.
The
.CW mm
macros allow up to seven arguments for alternating with the previous
font, but
.CW ms
is limited to two.
.
.Ah "Change Point Size
.LP
Both packages allow you to change point size.
In
.CW mm ,
.CW .S
specifies a new point size and
.CW .SM
reduces point size relative to the current size.
.PP
When you change the point size using
.CW ms
macros, it is always done relative to the current point size.
The
.CW .LG
and
.CW .SM
macros increase and decrease the current point size by 2 points.
The
.CW .NL
macro restores the default point size.
.
.page 642
.
.Ah "Headers and Footers
.LP
The
.CW mm
macros provide macros for specifying a delimited string that will appear
left justified, centered, and right justified in a page header or
footer.
The
.CW .PH
macro defines a page header and
.CW .PF
defines a page footer.
In addition,
.CW mm
provides variations of these macros for specifying headers and footers
for odd and even pages.
.PP
The
.CW ms
macros handle this through setting individual strings.
To define a string that appears left justified in a header, use:
.Ps
\&.ds LH \fIstring\fP
.Pe
The other strings for the header are
.CW CH
and
.CW RH ;
other strings for the footer are
.CW LF ,
.CW CF ,
and
.CW RF .
.
.Ah "Section Headings
.LP
Numbered and unnumbered section headings are available in both packages.
The
.CW .SH
and
.CW .NH
macros are used in
.CW ms .
The
.CW .H
and
.CW .HU
macros are used in
.CW mm .
The main difference is where you specify the heading string.
In
.CW mm ,
it is the first argument on the line with the macro.
In
.CW ms ,
it follows on the line after the macro and continues up to the first
paragraph macro.
.
.Ah Footnotes
.ix footnotes
.LP
The pair of macros used for footnotes is the same
.CW .FS \& (
and
.CW .FE ),
although automatic numbering of footnotes is provided in
.CW mm .
One difference is that in
.CW mm
the footnote at the bottom of the page is printed in 8 points.
The
.CW mm
macros also provide a pair of macros
.CW .RF \& (
and
.CW .RE )
for collecting a page of references.
.ix %end [mm] macros, compared~to~[ms] %key mm macros, compared to~[ms]
.ix %end [ms] macros, compared~to~[mm] %key ms macros, compared to~[mm]
.ix %end macros, comparing [mm]~and~[ms] %key macros, comparing mm and~[ms]
