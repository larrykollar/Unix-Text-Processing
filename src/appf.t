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
.page 643
.ix %begin extended [ms] macros %key extended ms macros
.ix %begin extended [ms] macros, summary~of %key extended ms macros, summary of
.
.chapter F "The \f(CBformat\fP Macros" Appendix 1
.Rn "Markup problem: `format' should be lower case from .chapter."
.\" Yes, and I can't really see why the .chapter macro should
.\" make the title upper case at all as all chapter titles in
.\" the printed book are mixed case.  /Andreas 2002-10-13
.LP
Throughout this book, we've made extensive references to portions of the
extended
.CW ms
macro package that we use in our technical writing business.
These macros are used in conjunction with the
.CW format
shell script to provide a complete document formatting environment.
.PP
This package was originally developed by Steve Talbott of Massachusetts
Computer Corp. (MASSCOMP).
We have extended and generalized it to meet the document design needs of
many different clients.
.PP
The purpose of this appendix is to summarize, in one place, the function
of the macros that the package contains.
We have found that this set of macros covers the basic needs of people
involved in the development of technical books and manuals.
.PP
The package relies on the existence of the underlying
.CW ms
macros.
In this sense, it is not a complete package.
However, it is possible to define a simple subset of the
.CW ms
macros to cover the basics if the full implementation of
.CW ms
is not available.
.PP
For more information on the full implementation of these macros, please
feel free to contact us in care of the publisher.
.
.Ah "Summary of the Macros
.LP
The following list summarizes the user-callable macros in the
.CW format
macro package.
.\" .Rn "Markup problem: The list needs to be indented.  How?
.\" Fixed by using .RS ... .RE.  /Andreas 2002-10-13
.RS
.IP "\f(CW.\fP[\fPABCD\fP]\fPh\fP" 19
A-level head, B-level head, and so on.
.IP "\f(CW.Dr\fP
Specify whether the current version is a draft.
(Drafts are dated.)
.IP "\f(CW.Fs\fP
Start a figure.
.IP "\f(CW.Fe\fP \fItitle\fP
Figure end.
Figures are automatically numbered, and given the specified
.I title .
.IP "\f(CW.Hl\fP [\fIc\fP]
Print a horizontal line the width of the page, using character
.I c .
(Default is underscore.)
.IP "\f(CW.IOC\fP [\fIstrings\fP]
Start an interoffice memo.
.IP "\f(CW.TO\fP
List of names following
.CW ".TO """""
will be placed in separate distribution list.
.\" The printed copy of the UTP typesat the above line in
.\" courier.  This must be a bug in the UTP.
.\" /Andreas 2002-10-13
.IP "\f(CW.TO\fP \fIname\fP
.I name
is addressee.
Maximum of five such
.CW .TO
lines.
.IP "\f(CW.DA\fP \fIdate\fP
.I date
is date of the memo; will be included in page footer.
.IP "\f(CW.ND\fP \fIdate\fP
.I date
is date of the memo; will be omitted from page footer.
.IP "\f(CW.FR\fP \fIname\fP
.I name
is sender.
Maximum of five such
.CW .FR
lines.
.IP "\f(CW.CC\fP \fIname\fP
.I name
is person to receive copy of memo.
Maximum of five
.CW .CC
lines.
.IP "\f(CW.SU\fP \fIsubject\fP
.I subject
is subject of the memo.
.IP "\f(CW.IP\fP \fIlabel indent\fP [0]
Begin paragraph with \(lqhanging indent.\(rq
Following text is indented, while
.I label
remains at the margin.
.IP "\f(CW.LP\fP [0]
Start a (left-justified) paragraph.
0 suppresses blank line.
.IP "\f(CW.Ls\fP [\fItype\fP] [\fIindent\fP] [\fIbullet\fP]
Start a (possibly nested) list.
.I type
is
.CW N
(number),
.CW A
(alphabetical uppercase),
.CW a
(alphabetical lowercase),
.CW I
(Roman numeral uppercase),
.CW i
(Roman numeral lowercase),
.CW B
(bullet).
Default indent is 5.
.I bullet
is alternative bullet string (null string is acceptable).
.IP "\f(CW.Li\fP [0]
List item.
0 suppresses preceding blank line.
.IP "\f(CW.Le\fP [0]
End of innermost list.
0 suppresses preceding blank line.
.IP "\f(CW.Lt\fP [1 | 2]
Enter address blocks and date (1), and salutation (2) of a letter.
.IP "\f(CW.Nd\fP \fIn\fP
Need
.I n
lines.
If
.I n
lines do not remain on the page, eject new page.
Unlike
.CW .ne ,
.CW .Nd
causes a break.
.IP "\f(CW.Nh\fP [1 | 0]"
Enable/disable numbered headings (enabled by default).
.IP "\f(CW.Ns\fP \fItype\fP
Start a NOTE of type
.CW N
(Note),
.CW C
(Caution),
.CW W
(Warning),
.CW R
(Review Note), or
.CW P
(Private Note).
Review notes are printed in the text and summarized in a list at the
end.
Private notes appear only in the end list.
.
.page 645
.
.IP "\f(CW.Ne\fP
End a note.
.IP "\f(CW.OB\fP \fIstring\fP
Print an overbar (over a string).
.IP "\f(CW.Ps\fP [\fIindent\fP]
Start a \(lqprintout\(rq (display).
Text is printed in the
.CW CW
font and preserved as is\(emthere is no filling.
.IP "\f(CW.Pe\fP
End a printout.
See
.CW .Ps .
.IP "\f(CW.Rh\fP [0 | 1] [\fIdesc\fP] \fIhead\fP . . .
Create reference page header.
.IP "\f(CW.Se\fP [\fInumber\fP] [\fItitle\fP]
Start a section (chapter).
This sets up many defaults, and is desirable to use for most
documents.
.IP "\f(CW.SE\fP
Screen end.
End a computer screen illustration begun with
.CW .SS .
.IP "\f(CW.SS\fP [\fIwidth\fP] [\fIheight\fP]
Start a screen illustration (box with curved corners).
If width and height are not specified, scale to size of contents.
.\" .Rn "Book errata: missing full stop after close parenthesis.
.\" Fixed by inserting full stop.  /Andreas 2002-10-13
.IP "\f(CW.Tc\fP \fIlevel\fP
Specify what level of heading will be saved in the table of contents
(\f(CWAh\fP to \fPDh\fP).
.IP "\f(CW.Ti\fP \fItext\fP
Title\(emgoes in left page footer.
.IP "\f(CW.St\fP \fItext\fP
Subtitle\(emgoes in right page footer.
.IP "\f(CW.Ts\fP \fItitle\fP
Start a table with given caption.
Tables are automatically numbered.
.IP "\f(CW.Te\fP
End a table.
(Output a blank line.)
.IP "\f(CW.XX\fP \fItext\fP
Make an index entry out of
.I text ,
with automatic addition of a page number.
.IP "\f(CW.XN\fP \fItext\fP
Make an index cross-reference out of
.I text
(no page number).
.RE
.ix %end extended [ms] macros %key extended ms macros
.ix %end extended [ms] macros, summary~of %key extended ms macros, summary of
