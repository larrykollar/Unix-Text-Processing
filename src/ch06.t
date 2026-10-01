.ig
	Typed by: Larry Kollar
	Marked up by: Larry Kollar
	Proofed on 10 Oct 2002
..
.so utp.mac
.utp
.ds my_a \a
.de UTPSD
.br
.ev simulate_display
.ns
.ft CW
.ps 9
.vs 10
.nf
.ll 6i
.in 0
..
.de UTPED
.br
.ev
..
.chapter 6 "The \f(CBmm\fP Macros" "Chapter" 1
.LP
.page 128
A macro package provides a way of describing the format of
various kinds of documents.
Each document presents its own
specific problems, and macros help to provide a simple and
flexible solution.
The
.CW mm
macro package is designed to help
you format letters, proposals, memos, technical papers, and reports.
A text file that contains
.CW mm
macros can be processed by either
.CW nroff
or
.CW troff ,
the two text formatting programs in UNIX.
The output from these programs can be displayed on a
terminal screen or printed on a line printer, a laser printer,
or a typesetter.
.PP
Some users of the
.CW mm
macro package learn only a few macros
and work productively.
Others choose from a variety of macros
to produce a number of different formats.
More advanced users
modify the macro definitions
and extend the capabilities of the package
by defining their own special-purpose macros.
.PP
Macros are the
.I words
that make up a format description language.
Like words, the result of a macro is often determined
by context.
That is, you may not always understand your
output by looking up an individual macro, just like you may
not understand the meaning of an entire sentence by looking
up a particular word.
Without examining the macro definition,
you may find it hard to figure out which macro is causing a
particular result.
Macros are interrelated; some macros call
other macros, like a subroutine in a program, to perform a
particular function.
.PP
After finding out what the macro package allows you to do,
you can decide upon a particular format that you like
(or one that has evolved according to the decisions of a group
of people).
To describe that format, you are likely to use only
a few of the macros, those that do the job.
In everyday use,
you want to minimize the number of codes you need to format
documents in a consistent manner.
.
.Ah "Formatting a Text File"
.LP
To figure out the role of a macro package such as
.CW mm ,
it may help to consider the distinction between
.I formatting
and
.I format .
Formatting is an operation, a process of supplying and
executing instructions.
You can achieve a variety of results,
some pleasing,
.page 129
some not, by any combination of
formatting instructions.
A format is a consistent product,
achieved by a selected set of formatting instructions.
A macro package makes it possible for a format
to be recreated again and again with minimal difficulty.
It encourages the user to
concentrate more on the requirements of a document
and less on the operations of the text formatter.
.PP
Working with a macro package reduces the number
of formatting instructions you need to supply.
This means that a macro package
takes care of many things automatically.
However, you should gradually become familiar
with the operations of the
.CW nroff /\c
.CW troff
formatter and the
additional flexibility it offers to define new formats.
If you have a basic understanding of how the formatter works,
as described in Chapter 4, you will find it easier to learn
the intricacies of a macro package.
.
.Bh "Invoking \f(CBnroff\fP/\f(CBtroff\fP with \f(CBmm\fP"
.ix [mm] macros, invoking %key mm macros, invoking
.LP
The
.CW mm
.ix [mm] command %key mm command
command is a shell script that invokes the
.CW nroff
formatter and reads in the files that contain the
.CW mm
macro definitions before processing the text file(s)
specified on the command line.
.Ps
$ \f(CBmm\fP \fIoption(s) filename(s)\fP
.Pe
.LP
If more than one file is specified on the command line, the
files are concatenated before processing.
There are a variety
of options for invoking preprocessors and postprocessors,
naming an output device, and setting various number registers
to alter default values for a document.
Using the
.CW mm
command is the same as invoking
.CW nroff
explicitly with the
.CW -mm
option.
.PP
Unless you specify otherwise, the
.CW mm
command sets
.CW nroff 's
.CW -T
option to the terminal type set in your login environment.
By default, output is sent to the terminal screen.
If you have problems viewing your output, or if you have
a graphics terminal, you may want to specify another
device name using the
.CW -T
option.
For a list of available devices, see
.pdfhref L -D AppendixB -P . -- Appendix B
The
.CW mm
command also has a
.CW -c
option, which invokes the
.CW col
filter to remove reverse linefeeds, and options to invoke
.CW tbl
.CW -t ) (
and
.CW eqn
.CW -e ). (
.PP
When you format a file to the screen, the output usually streams
by too swiftly to read, just as when you
.CW cat
.ix [cat] command %key cat command
a file to the screen.
Pipe the output of the
.CW mm
command through
.CW less
.ix [less] command %key less command
to view one screen at a time.
This gives you a general indication that the formatting
commands achieved the results you had expected.
To print a file formatted with
.CW mm ,
pipe the output to the print spooler (e.g.,
.CW lp )
.ix [lp] command %key lp command
instead of to a screen paging program.
.PP
Many of the actions that a text formatter performs depend
on how you want to print the document.
If you want to format your document with
.CW troff
instead of
.CW nroff ,
use the
.CW mmt
.ix [mmt] command %key mmt command
command (another shell script) or invoke
.CW troff
directly, using the
.CW -mm
option.
The
.CW mmt
command prepares output for laser printers and typesetters.
Pipe the formatted output directly to the print
spooler (e.g.,
.CW lp ),
or redirect to a file to view it, then print if all looks right.
Use the
.CW dpost
postprocessor with
.CW mmt
to produce PostScript,
unless you have a postprocessor
that has printer-specific capabilities.
.PP
Note that
.CW mm
and
.CW mmt
are available for the modernized Plan9
.CW troff
derivatives;
.CW groff
does not use them.
.page 130
.PP
In this chapter, we generally show the results of the
.CW mm
command, rather than
.CW mmt \c
\(emthat is, we show
.CW nroff
rather than
.CW troff .
Where the subject under discussion
is better demonstrated by
.CW troff ,
we show
.CW troff
output instead.
We assume that by now,
you can tell which formatter we used,
without our mentioning the actual commands.
.
.Bh "Problems in Getting Formatted Output"
.ix [mm] macros, errors %key mm macros, errors
.ix errors, in [mm] %key errors, in mm
.LP
When you format an
.CW mm -coded
document, you may only get a portion
of your formatted document.
Or you may get none of it.
Usually, this is because the formatter
had a problem executing the codes
as they were entered in the input file.
Most of the time, the problem stems from
omitting one of the macros that must be used in pairs.
.PP
When formatting stops like this,
one or more error messages might appear on your screen,
helping you to diagnose the problems.
These messages refer to the line numbers
in the input file where the problems appear to be,
and try to tell you what is missing:
.Ps
\f(CBERROR\fP\fR:(\fP\fIfilename\fP\fR)\fP \fIline number\fP
\fI   Error message\fP
.Pe
.LP
Sometimes, you don't get error messages,
but your output breaks midway.
When that happens,
you have to open the file at the point where output broke,
work your way back,
and examine the macros or a sequence of macros.
A legacy program,
.CW checkmm ,
.ix [checkmm] command %key checkmm command
examined the specified file and provided information
about issues such as lists or displays not closed.
If you are using
.CW groff ,
you can use the backtrace and warning functions
to provide a rough equivalent.
For example, the command:
.Ps
.CW "groff -mm -b -ww file.mm"
.Pe
detects and prints syntax errors,
unmatched macros, and structural issues.
.
.Bh "Default Formatting
.ix [mm] macros, default formatting %key mm macros, default formatting
.ix formatting defaults, [mm] %key formatting defaults, mm
.LP
In Chapter 4, we looked at a sample letter formatted by
.CW nroff .
It might be interesting,
before putting any macros in the file,
to see what happens if we format
.CW letter
as it is, this time using the
.CW mm
command to read in the
.CW mm
macro package.
.PP
Refer to Figure 6-1 and note that
.RS
.Ls B
.Li
a page number appears in a header at the top of the page;
.ix page number, in [mm] %key page number, in mm
.Li
the address block still forms two long lines;
.Li
lines of input text have been filled, forming block paragraphs;
.Li
the right margin is ragged, not justified as with
.CW nroff ;
.Li
the text is not hyphenated;
.Li
space has been allocated for a page with top, bottom, left,
and right margins.
.Le
.RE
.page 131
.sp .7v
.Fs
.SS
.UTPSD
.rs
.in 18n
.sp -2v
                      - 1 -
.sp 2v
                                   April 1, 1987
.sp
Mr. John Fust Vice President, Research and
Development Gutenberg Galaxy Software Waltham,
Massachusetts 02159
.sp
Dear Mr. Fust:
.sp
In our conversation last Thursday, we discussed a
documentation project that would produce a user's
manual on the Alcuin product. Yesterday, I
received the product demo and other materials that
you sent me.
.sp
Going through a demo session gave me a much better
understanding of the product.  I confess to being
amazed by Alcuin.  Some people around here,
looking over my shoulder, were also astounded by
the illustrated manuscript I produced with Alcuin.
One person, a student of calligraphy, was really
impressed.
.sp
In the next couple of days, I'll be putting
together a written plan that presents different
strategies for documenting the Alcuin product.
After I submit this plan, and you have had time to
review it, let's arrange a meeting at your company
to discuss these strategies.
.sp
Thanks again for giving us the opportunity to bid
on this documentation project.  I hope we can
decide upon a strategy and get started as soon as
possible in order to have the manual ready in time
for the first customer shipment. I look forward to
meeting with you towards the end of next week.
.sp
                                   Sincerely,
.sp 2v
                                   Fred Caslon
.sp
.UTPED
.sp
.SE
.Fe "A Raw \f(CBmm\fP-formatted File
.sp .8v
.
.Ah "Page Layout
.ix [mm] macros, page~layout %key mm macros, page layout
.ix page~layout, in [mm] %key page layout, in mm
.LP
.page 132
When you format a page with
.CW mm ,
the formatter provides several lines
at the top and the bottom of the page
for a header and a footer.
By default, a page number appears
on a single line in the header
and only blank lines are printed for the footer.
.PP
There are two different ways
to change the default header and footer.
The first way is to specify a command-line parameter with the
.CW mm
or
.CW mmt
commands to set the number
register
.CW N .
This allows you to affect how pages are numbered
and where the page number appears.
The second way is to specify
in the input file
a macro that places text in the header or footer.
Let's look at both of these techniques.
.
.Bh "Setting Page Numbering Style
.ix [mm] macros, page~numbering styles %key mm macros, page numbering styles
.ix %begin page number, in [mm] %key page number, in mm
.LP
When you format a document,
.CW mm
numbers pages in sequence
up to the end of the document.
This page number usually appears
in the header, set off by dashes.
.Ps
-1-
.Pe
.LP
Another style of page numbering,
used in documents such as technical manuals,
numbers pages specific to a section.
The first page of the second section would be printed as:
.Ps
2-1
.Pe
.LP
The other type of change
affects whether or not the page number
prints in the header at the top of the first page.
.PP
The number register
.CW N
controls these actions.
This register has a default setting of 0,
and can take values from 0 through 5.
Table 6-1 shows the effect of these values.
.Ts "Page Number Styles, Register \f(CBN\fP
.TS
center box;
c cw(4i)
cf(CW) l .
Value	Action
_
.sp 4p
0	T{
Places the page number in the header on all pages.
This is the default page numbering style.
T}
.sp 4p
1	T{
Places the page number in the footer.
T}
2	T{
Omits the page number on page 1.
T}
.sp 4p
3	T{
All pages are numbered by section,
and the page number appears in the footer.
This setting affects the defaults of several section-related
registers and macros.
It causes a page break for a top-level heading
.CW Ej=1 ), (
and invokes both the
.CW \&.FD
.ix [.FD] macro ([mm]) %key FD macro mm
.ix [mm] macros, [.FD] macro %key mm macros, .FD macro
and
.CW \&.RP
.ix [.RP] macro ([mm]) %key RP macro mm
.ix [mm] macros, [.RP] macro %key mm macros, .RP macro
macros to reset footnote and reference numbering.
T}
.sp 4p
.page 133
4	T{
Suppresses the default header containing the page number,
but has no effect on a header supplied by a page header macro.
T}
.sp 4p
5	T{
Numbers all pages by section,
and places the page number in the footer.
In addition, labeled displays
.CW \&.FC , (
.ix [.FC] macro ([mm]) %key FC macro mm
.ix [mm] macros, [.FC] macro %key mm macros, FC macro
.CW \&.TB ,
.ix [.TB] macro ([mm]) %key TB macro mm
.ix [mm] macros, [.TB] macro %key mm macros, TB macro
.CW \&.EX ,
.ix [.EX] macro ([mm]) %key EX macro mm
.ix [mm] macros, [.EX] macro %key mm macros, EX macro
and
.CW \&.EC )
.ix [.EC] macro ([mm]) %key EC macro mm
.ix [mm] macros, [.EC] macro %key mm macros, EC macro
are also numbered by section.
T}
.sp 4p
.TE
.Te
.PP
You can set the register
.CW N
from the command line using the
.ix page number, setting~from command~line
.CW -r
option.
If we set it to 2, no page number appears at the
top of page 1 when we print the sample letter:
.Ps
$ \f[CB]mm -rN2 letter | lp\fP
.Pe
.ix %end page number, in [mm] %key page number, in mm
.
.Bh "Header and Footer Macros"
.ix [mm] macros, footers %key mm macros, footers
.ix [mm] macros, headers %key mm macros, headers
.ix footers
.ix headers
.LP
The
.CW mm
package has a pair of macros to define what should
appear in a page header
.CW .PH ), (
.ix [.PH] macro ([mm]) %key PH macro mm
.ix [mm] macros, [.PH] macro %key mm macros, PH macro
and a page footer
.CW .PF ). (
.ix [.PF] macro ([mm]) %key PF macro mm
.ix [mm] macros, [.PF] macro %key mm macros, PF macro
There
is also a set of related macros for specifying page headers
and footers for odd-numbered pages
.CW .OH "" (
and
.CW .OF )
for even numbered pages (\c
.CW \&.EH
.ix [.EH] macro ([mm]) %key EH macro mm
.ix [mm] macros, [.EH] macro %key mm macros, EH macro
and
.CW \&.EF ).
.ix [.EF] macro ([mm]) %key EF macro mm
.ix [mm] macros, [.EF] macro %key mm macros, EF macro
All of these macros have the same form,
allowing you to place text in three places
in the header or footer:
left justified, centered, and right justified. This
is specified as a single argument in double quotation marks,
consisting of three parts delimited by single quotation marks.
.Ps
.I \&'left'center'right'
.Pe
.ig
	As an aside, the original printed book contained a goof
	here.  It was printed in a much larger font than normal.
	This note is here just for documentation purposes, since
	we are fixing and annotating all mistakes in the
	original book.
	--Michael Hobgood
..
For example, we could place the name of a client, the title
of the document, and the date in the page header, and we could
place the page number in the footer:
.Ps
\&.PH "'GGS'Alcuin Project Proposal'\\*(DT'"
\&.PF "''Page % ''"
.Pe
You may notice that we use the string
.CW DT
to supply today's date in the header.
The following header appears at the top of the page.
.sp .7v
.SS
.Ps
GGS              Alcuin Project Proposal      April 26, 1987
.sp
.Pe
.SE
.sp .8v
.LP 0
In the footer, we use a special symbol
.CW % ) (
to access the current page number.
Only text to be centered was specified;
however, the four delimiters were still required to place the
text correctly.
This footer appears at the bottom of the page:
.page 134
.sp .7v
.SS
.Ps
.ti 3i
\&.
.ti 3i
\&.
.ti 3i
\&.
.ti 2.77i
Page  2
.sp
.Pe
.SE
.sp .8v
.LP
The header and footer macros override
the default header and footer.
.
.Bh "Setting Other Page Control Registers"
.ix [mm] macros, page~layout %key mm macros, page layout
.ix page~layout, in [mm] %key page layout, in mm
.LP
The
.CW mm
package uses number registers
to supply the values that control
line length, page offset, point size, and page length,
as shown in Table 6-2.
.KF
.Ts "Number Registers
.TS
center box;
l l l l .
Register	Contains	\fCtroff\fP Default	\fCnroff\fP Default
_
\fCO\fP	Page offset (left margin)	\&.75i	\&.5i
\fCN\fP	Page numbering style	0	0
\fCL\fP	Page length	66v	66 lines
\fCS\fP	Point size (\fCtroff\fP only)	10	NA
\fCW\fP	Line length or width	6i	60
.TE
.Te
.KE
.PP
These registers must be defined before
.CW nroff
or
.CW troff
reads the
.CW mm
macro package.
Thus, you can set it from the command line using the
.CW -r
option, as we showed when we gave a new value for register
.CW N .
For
.CW nroff ,
specify values of registers
.CW O
and
.CW W
in character positions
(depending on the character size
of the output device for
.CW nroff ,
\&.5i might translate as either
5 or 6 character positions), but
.CW troff
can accept any of the units described in Chapter 4.
For example:
.Ps
.ig
	I _think_ the original book has an error in the next
	line.  It reads "-r10" which makes no sense, considering
	that the example is supposed to demonstrate the O and W
	number registers.  I changed it to read "-rO10" which
	would go with the previous paragraph, and the example
	below this one.
	--Michael Hobgood
..
$ \f[CB]mm -rN2 -rW65 -rO10\fP \fIfile\fP
.Pe
.LP
but:
.Ps
$ \f[CB]mmt -rN2 -rW6.5i -rO1i\fP \fIfile\fP
.Pe
.LP
The
.CW groff_mm
manual page says (for
.CW groff ),
\[lq]When setting the registers L or W from the command line,
use an explicit scaling unit to avoid surprises.\[rq]
This manual page lists several other differences between
.CW groff 's
.CW -mm
package and the DWB version, as well as many extensions.
.PP
You can set the page control registers
at the top of your file, using the
.CW \&.so
request to read in the
.CW mm
macro package, as follows:
.Ps
\&.nr N 2
\&.nr W 65
\&.nr O 10
\&.so /usr/lib/tmac/tmac.m
.Pe
.LP
If you do it this way, you cannot use the
.CW mm
command.
Use
.CW nroff
or
.CW troff
without the
.CW -mm
option.
Specifying
.CW -mm
would cause the
.CW mm
macro package to be read twice;
.CW mm
would trap that error and bail out.
.
.Bh "Paragraphs"
.ix [mm] macros, paragraphs %key mm macros, paragraphs
.ix paragraphs, [mm] macros %key paragraphs, mm macros
.LP
.page 135
The
.CW \&.P
.ix %begin [.P] macro ([mm]) %key P macro mm
.ix %begin [mm] macros, [.P] macro %key mm macros, P macro
macro marks the beginning of a paragraph.
.Ps
\&.P
In our conversation last Thursday, we discussed a
.Pe
.LP
This macro produces a left-justified, block paragraph.
A blank line in the input file also results in a left-justified,
block paragraph, as you saw when we formatted an uncoded file.
.PP
However, the paragraph macro controls a number of actions
in the formatter, many of which can be changed by overriding
the default values of several number registers.
The
.CW \&.P
macro takes a numeric argument that overrides the
default paragraph type, which is a block paragraph.
Specifying 1 results in an indented paragraph:
.ix [mm] macros, indented paragraphs %key mm macros, indented paragraphs
.ix indented ([mm]) %key indented mm
.ix indents
.Ps
\&.P 1
Going through a demo session gave me a much better
.Pe
.LP
The first three paragraphs formatted for the screen follow:
.sp .7v
.SS
.Ps
In our conversation last Thursday, we discussed a
documentation project that would produce a user's manual
on the Alcuin product.  Yesterday, I received the product
demo and other materials that you sent me.
.sp
     Going through a demo session gave me a much better
understanding of the product.  I confess to being amazed
by Alcuin.  Some people around here, looking over my
shoulder, were also astounded by the illustrated
manuscript I produced with Alcuin.  One person, a student
of calligraphy, was really impressed.
.sp
In the next couple of days, I'll be putting together a
written plan that presents different strategies for
documenting the Alcuin product. After I submit this plan,
and you have had time to review it, let's arrange a
meeting at your company to discuss these strategies.
.sp
.Pe
.SE
.sp .8v
.LP
The first line of the second paragraph is indented five spaces.
(In
.CW troff
the default indent is three ens).
Notice that the paragraph type specification
changes only the second paragraph.
The third paragraph, which is preceded in the input file by
.CW \&.P
without an argument, is a block paragraph.
.PP
As with the
.CW -ms
macro package, you can use the
.CW \&.blm
request to call the
.CW \&.P
macro:
.Ps
\&.blm P
.Pe
If you want to create a document
in which all the paragraphs are indented,
you can change the number register
that specifies the default paragraph type.
The value of
.CW Pt
is 0 by default, producing block paragraphs.
For indented paragraphs, set
the value of
.CW Pt
to 1.
Now the
.CW \&.P
macro produces indented paragraphs.
.Ps
\&.nr Pt 1
.Pe
.PP
If you want to obtain a block paragraph after you have changed
the default type, specify an argument of 0:
.page 136
.Ps
\&.P 0
.Pe
.LP
When you specify a type argument,
it overrides whatever paragraph type is in effect.
.PP
There is a third paragraph type
that produces an indented paragraph
with some exceptions.
.ix [mm] macros, paragraphs~indented~with exceptions %key mm macros, paragraphs indented~with exceptions
.ix indented ([mm]), indented~with exceptions %key indented (mm), indented with exceptions
If you set
.CW Pt
to 2, paragraphs are indented except those
following section headings, lists, and displays.
It is the paragraph type used in this book.
.PP
The following list summarizes the three default paragraph types.
.RS
.TS
tab (#);
lf(CW) l l l .
0###Block
1###Indented
2###Indented with exceptions
.TE
.RE
.ix %end [.P] macro ([mm]) %key P macro mm
.ix %end [mm] macros, [.P] macro %key mm macros, P macro
.
.Bh "Vertical Spacing"
.ix vertical spacing
.LP
The paragraph macro also controls the spacing between paragraphs.
.ix [mm] macros, spacing~between paragraphs %key mm macros, spacing between paragraphs
.ix paragraphs, spacing between %key paragraphs, spacing between
The number register
.CW Ps
specifies the amount of space used.
The default amount differs between
.CW nroff
and
.CW troff .
.PP
With
.CW nroff ,
the
.CW \&.P
macro has the same effect as a blank line,
producing a full space between paragraphs.
However, with
.CW troff ,
the
.CW \&.P
macro outputs a blank space equal to
one-half of the current vertical spacing setting.
Basically, this means that a blank line
outputs one full space, and the
.CW \&.P
macro outputs half that space.
.PP
The
.CW \&.P
macro invokes the
.CW \&.SP
.ix %begin [.SP] macro ([mm]) %key SP macro mm
.ix %begin [mm] macros, [.SP] macro %key mm macros, SP macro
.ix %begin [mm] macros, vertical spacing %key mm macros, vertical spacing
macro for vertical spacing.
This macro
.ig
	In the original the following line read "take"
	It should be "takes".  Fixed by Larry Kollar
	--Michael Hobgood
..
takes a numeric argument requesting that many lines of space.
.Ps
Sincerely,
\&.SP 3
Fred Caslon
.Pe
.LP
This example puts three lines of space
between the salutation and the signature lines.
.PP
Entering
.CW \&.SP
macros on three consecutive lines
produces a different result.
The vertical space does not accumulate,
so they output one line of space, not three.
.PP
Two or more consecutive
.CW \&.SP
macros with numeric arguments
specifies the spacing of the greatest argument
and ignores the other arguments.
.Ps
\&.SP 5
\&.SP
\&.SP 2
.Pe
.LP
This example outputs five lines, not eight.
.PP
Because the
.CW \&.P
macro calls the
.CW \&.SP
macro, two or more consecutive paragraph
macros have the same effect as one.
.
.Bh "The \f(CB.SP\fP Macro versus the \f(CB.sp\fP Request
.LP
.page 137
There are several differences between the
.CW \&.SP
macro and the
.CW \&.sp
request.
A series of
.CW \&.sp
requests does cause vertical spacing to accumulate.
The following three requests produce eight blank lines:
.Ps
\&.sp 5
\&.sp
\&.sp 2
.Pe
.PP
The argument specified with the
.CW \&.SP
macro cannot be scaled, nor can it be a negative number.
The
.CW \&.SP
macro automatically works
in the scale
.CW (v)
of the current vertical spacing.
However, both
.CW \&.SP
and
.CW \&.sp
accept fractions, so that each of the following
codes has the same result:
.Ps
\&.sp .3v
\&.SP .3
\&.sp .3
.Pe
.ix %end [.SP] macro ([mm]) %key SP macro mm
.ix %end [mm] macros, [.SP] macro %key mm macros, SP macro
.ix %end [mm] macros, vertical spacing %key mm macros, vertical spacing
.
.Ah Justification
.ix justification, [mm] macros %key justification, mm macros
.ix [mm] macros, justification %key mm macros, justification
.LP
A document formatted by
.CW nroff
with
.CW mm
produces, by default,
unjustified text (an uneven or ragged-right margin).
When formatted by
.CW troff ,
.ix [troff] formatter, justification using [mm] %key troff formatter, justification using [mm]
the same document is automatically justified
(the right margin is even).
.PP
If you are using both
.CW nroff
and
.CW troff ,
you should set justification on or off rather than
depend upon the default chosen by the formatter.
Use the
.CW \&.SA
.ix [.SA] macro ([mm]) %key SA macro mm
.ix [mm] macros, [.SA] macro %key mm macros, .SA macro
macro
.I "set adjustment" ) (
to set document-wide justification.
An argument of 0 specifies no justification; 1 specifies
justification.
.PP
If you insert this macro at the top of your file:
.Ps
\&.SA 1
.Pe
.LP
both
.CW nroff
and
.CW troff
produce right-justified paragraphs like the following:
.sp .7v
.SS
.Ps
     In  our conversation  last Thursday,  we  discussed
a documentation  project  that  would produce  a  user's
manual on the Alcuin product.  Yesterday, I received the
product demo and other materials that you sent me.
.sp
.Pe
.SE
.sp .8v
.
.Ah "Word Hyphenation
.ix [mm] macros, hyphenation %key mm macros, hyphenation
.ix hyphenation, in [mm] %key hyphenation, in mm
.LP
One way to achieve better line breaks and more evenly filled
lines is to instruct the formatter to perform word hyphenation.
.PP
The
.CW mm
macro package default is to turn hyphenation off.
This means that the formatter
does not try to hyphenate words
to make them fit on a line
unless you request it
by setting the number register
.CW Hy
to 1.
If you want the formatter to
automatically hyphenate words,
insert the following line at the top of your file:
.page 138
.Ps
\&.nr Hy 1
.Pe
You can also set it from the command line using the
.CW -r
option:
.Ps
mm -rHy=1
.Pe 
.LP
Most of the time, the formatter breaks a word correctly
when hyphenating.
Sometimes, however, it does not
and you have to explicitly tell the formatter
either how to split a word (using the
.CW \&.hy
request) or not to hyphenate at all
(using the
.CW \&.nh
request).
.
.Ah Displays
.ix [mm] macros, displays %key mm macros, displays
.LP
When we format a text file,
.CW nroff /\c
.CW troff
ignores the line breaks caused by carriage returns.
How text is entered on lines in the input file
does not affect how lines are formed in the output.
It doesn't matter whether you type information
on three lines or four; it appears the same after formatting.
.PP
You probably noticed that the name and address at the beginning
of our sample file did not come out in block form.
The four lines of input ran together
and produced two filled lines of output:
.Ps
Mr. John Fust Vice President, Research and Development
Gutenberg Galaxy Software Waltham, Massachusetts 02159
.Pe
.LP
The formatter, instead of paying attention to carriage returns,
acts on specific macros or requests that cause a break, such as
.CW \&.P ,
.CW \&.SP ,
or a blank line.
The formatter request
.CW \&.br
is probably the simplest way to break a line:
.Ps
Mr. John Fust
\&.br
Vice President, Research and Development
.Pe
.LP
The
.CW \&.br
request is most appropriate when you are forcing a
break of a single line.
For larger blocks of text, the
.CW mm
macro package provides a pair of macros to indicate that a block
of text should be output
just as it was entered in the input file.
Place the
.CW \&.DS
.ix [.DS] macro ([mm]) %key DS macro mm
.ix [mm] macros, [.DS] macro %key mm macros, DS macro
.I "display start" ) (
macro at the start of the text, and the
.CW \&.DE
.ix [.DE] macro ([mm]) %key DE macro mm
.ix [mm] macros, [.DE] macro %key mm macros, DE macro
.I "display end" ) (
macro at the end:
.Ps
\&.DS
Mr. John Fust
Vice President, Research and Development
Gutenberg Galaxy Software
Waltham, Massachusetts 02159
\&.DE
.Pe
.LP
The formatter does not fill these lines,
so the address block prints on four lines,
just as it was typed.
In addition, the
.CW \&.DE
macro provides a line of space following the display.
.
.Bh "Our Coding Efforts, So Far"
.LP
We have pretty much exhausted what we can do
using the sample letter.
Before going on to larger documents,
you may want to compare the coded file in Figure 6-2
with the
.CW nroff -formatted
output in Figure 6-3.
Look them over and make sure you
understand what the different macros are accomplishing.
.page 139
.Fs 0 F
.Ps
\&.nr Pt 1
\&.SA 1
                                       April 1, 1987
\&.SP 2
\&.DS
Mr. John Fust
Vice President, Research and Development
Gutenberg Galaxy Software
Waltham, Massachusetts 02159
\&.DE
Dear Mr. Fust:
\&.P
In our conversation last Thursday, we discussed a
documentation project that would produce a user's manual
on the Alcuin product.  Yesterday, I received the product
demo and other materials that you sent me.
\&.P
Going through a demo session gave me a much better
understanding of the product.  I confess to being amazed
by Alcuin.  Some people around here, looking over my
shoulder, were also astounded by the illustrated
manuscript I produced with Alcuin. One person, a student
of calligraphy, was really impressed.
\&.P
In the next couple of days, I'll be putting together a
written plan that presents different strategies for
documenting the Alcuin product. After I submit this plan,
and you have had time to review it, let's arrange a
meeting at your company to discuss these strategies.
\&.P
Thanks again for giving us the opportunity to bid on this
documentation project.  I hope we can decide upon a
strategy and get started as soon as possible in order to
have the manual ready in time for the first customer
shipment.  I look forward to meeting with you towards the
end of next week.
\&.SP
                                       Sincerely,
\&.SP 2
                                       Fred Caslon
.Pe
.Fe "Coded File"
.page 140
.sp .7v
.Fs 0 F
.SS
.UTPSD
.rs
.in 18n
.sp -2v
                      - 1 -
.sp 2v
                                     April 1, 1987
.sp
Mr. John Fust
Vice President, Research and Development
Gutenberg Galaxy Software
Waltham, Massachusetts 02159
.sp
Dear Mr. Fust:
.sp
     In  our  conversation   last   Thursday,   we
discussed   a  documentation  project  that  would
produce a user's manual  on  the  Alcuin  product.
Yesterday,  I  received the product demo and other
materials that you sent me.
.sp
     Going through a demo session gave me  a  much
better understanding of the product.  I confess to
being amazed by Alcuin.  Some people around  here,
looking  over  my shoulder, were also astounded by
the illustrated manuscript I produced with Alcuin.
One  person,  a student of calligraphy, was really
impressed.
.sp
     In the next couple of days, I'll  be  putting
together  a  written  plan that presents different
strategies for  documenting  the  Alcuin  product.
After I submit this plan, and you have had time to
review it, let's arrange a meeting at your company
to discuss these strategies.
.sp
     Thanks again for giving us the opportunity to
bid  on this documentation project.  I hope we can
decide upon a strategy and get started as soon  as
possible in order to have the manual ready in time
for the first customer shipment. I look forward to
meeting with you towards the end of next week.
.sp
                                       Sincerely,
.sp 2
                                       Fred Caslon
.sp
.UTPED
.SE
.sp .8v
.Fe "Formatted Output"
.page 141
.PP
We have worked through some of the problems presented by a
very simple one-page letter.
As we move on, we describe specialized macros
that address the problems of multiple page documents,
such as proposals and reports.
In many ways,
the macros for more complex documents
are the feature performers in a macro package,
the ones that really convince you
that a markup language is worth learning.
.
.Ah "Changing Font and Point Size"
.LP
When you format with
.CW nroff
and print on a line printer,
you can put emphasis on individual words or phrases
by underlining or overstriking.
When you are using
.CW troff
and send your output
to a laser printer or typesetter,
you can specify variations
of type, font, and point size
based on the capabilities of the output device.
.
.Bh "Roman, Italic, and Bold Fonts"
.LP
Most typefaces have at least three fonts available:
roman,
.ix [mm] macros, roman font %key mm macros, roman font
.B bold,
.ix [mm] macros, bold font %key mm macros, bold font
and
.I italic .
.ix [mm] macros, italic font %key mm macros, italic font
Many have a fourth:
.BI bold-italic .
Normal body copy prints in the roman font.
You can change temporarily to a bold or italic font
for emphasis.
In Chapter 4, you learned how to specify font
changes using the
.ix [mm] macros, changing fonts %key mm macros, changing fonts
.CW \&.ft
request and inline
.CW \ef
requests.
The
.CW mm
package provides a set of mnemonic macros for changing fonts:
.RS
.TS
tab (#);
lf(CW) l l l .
\&.B##Bold
\&.I##Italic
\&.R##Roman
.TE
.ix %begin [.B] macro ([mm]) %key B macro mm
.ix %begin [mm] macros, [.B] macro %key mm macros, B macro
.ix %begin [.I] macro ([mm]) %key I macro mm
.ix %begin [mm] macros, [.I] macro %key mm macros, I macro
.ix %begin [.R] macro ([mm]) %key R macro mm
.ix %begin [mm] macros, [.R] macro %key mm macros, R macro
.RE
.LP
Each macro prints a single argument in a particular font.
You might code a single sentence as follows:
.Ps
\&.B Alcuin
revitalizes an
\&.I age-old
tradition.
.Pe
.LP
The printed sentence has a word in bold and one in italic
(in
.CW nroff ,
bold space is simulated by overstriking, and italics
by underlining, but modern terminals can display
bold and italic text).
.sp .7v
.SS
.Ps
\fBAlcuin\fP revitalizes an \fIage-old\fP tradition.
.Pe
.SE
.sp .8v
.page 142
.LP
With no argument, the selected font is current
until you change it:
.Ps
The art of
\&.B
calligraphy
\&.R
is, quite simply,
\&.I
beautiful
\&.R
handwriting;
.Pe
.LP
The previous example produces:
.SS
.Ps
The art of \fBcalligraphy\fP is, quite simply,
\fIbeautiful\fP handwriting;
.sp
.Pe
.SE
.sp .8v
.PP
You've already seen that the first argument prints
in the selected font.
If you supply a second argument, it prints in the previous font
with no spacing between it and the first argument.
Each macro takes up to six arguments for alternating font changes.
(An argument is set off by a space; a phrase
must be enclosed within quotation marks to be taken as a
single argument). A good use for the alternate argument is
to supply punctuation, especially because of the restriction
that you cannot begin an input line with a period.
.Ps
its opposite is
\&.B cacography .
.Pe
.LP
This example produces:
.sp .7v
.SS
.Ps
its opposite is \fBcacography\fP.
.sp
.Pe
.SE
.sp .8v
.LP
If you specify alternate arguments consisting of words or
phrases, you must supply the spacing:
.Ps
The ink pen has been replaced by a
\&.I light " pen."
.Pe
.LP
This produces:
.sp .7v
.SS
.Ps
The ink pen has been replaced by a \fIlight\fP pen.
.sp
.Pe
.SE
.sp .8v
.LP
Here's an example using all six arguments:
.Ps
Alcuin uses three input devices, a
\&.B "light pen" ", a " "mouse" ", and a " "graphics tablet."
.Pe
.LP
This produces:
.sp .7v
.SS
.Ps
Alcuin uses three input devices, a \fBlight pen\fP,
a \fBmouse\fP, and a \fBgraphics tablet\fP.
.sp
.Pe
.SE
.sp .8v
.ix %end [.B] macro ([mm]) %key B macro mm
.ix %end [.I] macro ([mm]) %key I macro mm
.ix %end [.R] macro ([mm]) %key R macro mm
.ix %end [mm] macros, [.B] macro %key mm macros, B macro
.ix %end [mm] macros, [.I] macro %key mm macros, I macro
.ix %end [mm] macros, [.R] macro %key mm macros, R macro
.page 143
.LP
There are additional macros for selecting other main and
alternate fonts.
These macros also take up to six arguments,
displayed in alternate fonts:
.RS
.TS
tab (#);
lf(CW) l l l .
\&.BR##Alternate bold and roman
\&.IB##Alternate italic and bold
\&.RI##Alternate roman and italic
\&.BI##Alternate bold and italic
\&.IR##Alternate italic and roman
\&.RB##Alternate roman and bold
.TE
.ix [.BI] macro ([mm]) %key BI macro mm
.ix [mm] macros, [.BI] macro %key mm macros, BI macro
.ix [.BR] macro ([mm]) %key BR macro mm
.ix [mm] macros, [.BR] macro %key mm macros, BR macro
.ix [.IB] macro ([mm]) %key IB macro mm
.ix [mm] macros, [.IB] macro %key mm macros, IB macro
.ix [.IR] macro ([mm]) %key IR macro mm
.ix [mm] macros, [.IR] macro %key mm macros, IR macro
.ix [.RB] macro ([mm]) %key RB macro mm
.ix [mm] macros, [.RB] macro %key mm macros, RB macro
.ix [.RI] macro ([mm]) %key RI macro mm
.ix [mm] macros, [.RI] macro %key mm macros, RI macro
.RE
.LP
If you are using
.CW nroff ,
specifying a bold font results in
character overstrike; specifying an italic font results
in an underline for each character (not a continuous rule).
Overstriking and underlining can cause problems on some printers
and terminals.
.
.Bh "Changing Point Size"
.ix %begin [mm] macros, changing point~size %key mm macros, changing point size
.ix %begin point~size, changing ([mm]) %key point size, changing mm
.LP
When formatting with
.CW troff ,
you can request a larger or smaller
point size for the type.
A change in the point size affects how much
vertical space is needed for the larger or smaller characters.
Normal body copy is set in 10-point type with the
vertical spacing 2 points larger.
.PP
You learned about the
.CW \&.ps
.I "point size" ) (
and
.CW \&.vs
.I "vertical spacing" ) (
.ix %begin [mm] macros, vertical spacing %key mm macros, vertical spacing
.ix vertical spacing
requests in Chapter 4.
These work in
.CW mm ;
however,
.CW mm
also has a single macro
for changing both the point size
and vertical space:
.Ps
\&.S [\fIpoint size\fP] [\fIvertical spacing\fP]
.Pe
.ix %begin [.S] macro ([mm]) %key S macro mm
.ix %begin [mm] macros, [.S] macro %key mm macros, S macro
.LP
The values for
.I "point size"
and
.I "vertical spacing"
can be set in relation to the current setting:
.CW +
increments and
.CW -
decrements the current value.
For example, you could specify relative point size changes:
.Ps
\&.S +2 +2
.Pe
.LP
or absolute ones:
.Ps
\&.S 12 14
.Pe
.LP
By default, if you don't specify vertical spacing, a relation
of 2 points greater than the point size will be maintained.
A null value ("") does not change the current setting.
.PP
The new point size and vertical spacing
remain in effect until you change them.
Entering the
.CW \&.S
macro without arguments restores the previous settings:
.Ps
\&.S
.Pe
.LP
The
.CW mm
package keeps track of the default, previous, and
current values, making it easy to switch between different
settings using one of these three arguments:
.RS
.TS
tab (#);
lf(CW) l l l .
D##Default
P##Previous
C##Current
.TE
.RE
.page 144
.LP
To restore the default values, enter:
.Ps
\&.S D
.Pe
.LP
The point size returns to 10 points and the vertical spacing
is automatically reset to 12 points.
To increase the vertical
space to 16 points while keeping the point size the same, enter:
.Ps
\&.S C 16
.Pe
.LP
In the following example for a letterhead, the company name
is specified in 18-point type and a tag line in 12-point type;
then the default settings are restored:
.Ps
\&.S 18
Caslon Inc.
\&.S 12
Communicating Expertise
\&.S D
.Pe
.LP
The result is:
.sp .7v
.SS
.Ps
.ft R
.ps 18
Caslon Inc.
.sp 3p
.ps 12
Communicating Expertise
.ps 9
.ft P
.sp
.Pe
.SE
.sp .8v
.ix %end [.S] macro ([mm]) %key S macro mm
.ix %end [mm] macros, [.S] macro %key mm macros, S macro
.LP
You can also change the font along with the point size,
using the
\&.I
macro described previously.
Following is the tag line in 12-point italic.
.sp .7v
.SS
.Ps
.ps 12
\fICommunicating Expertise\fP
.ps 9
.sp
.Pe
.SE
.sp .8v
.LP
A special-purpose macro in
.CW mm
reduces by 1 point the point size
of a specified string.
The
.CW \&.SM
.ix %begin [.SM] macro ([mm]) %key SM macro mm
.ix %begin [mm] macros, [.SM] macro %key mm macros, SM macro
macro can be followed by one, two, or three strings.
Only one argument is reduced; which one
depends upon how many arguments are given.
If you specify one
or two arguments, the first argument will be reduced by 1 point:
.Ps
using
\&.SM UNIX ,
you will find
.Pe
.LP
The first and second argument print without spacing,
so that the comma immediately follows the word
.I UNIX :
.sp .7v
.SS
.Ps
\fRusing \s-1UNIX\s0, you will find\fP
.sp
.Pe
.SE
.sp .8v
.LP
If you specify three arguments:
.Ps
\&.SM [ UNIX ]
.Pe
.LP
The second argument is reduced by one point, but the first
and third arguments print in the current point size,
and all three print without spacing:
.page 145
.sp .7v
.SS
.Ps
\fR[\s-1UNIX\s0]\fP
.sp
.Pe
.SE
.ix %end [mm] macros, changing point~size %key mm macros, changing point size
.ix %end [mm] macros, vertical spacing %key mm macros, vertical spacing
.ix %end point~size, changing ([mm]) %key point size, changing mm
.ix %end [.SM] macro ([mm]) %key SM macro mm
.ix %end [mm] macros, [.SM] macro %key mm macros, SM macro
.sp .8v
.
.Ah "More about Displays"
.ix %begin [mm] macros, displays %key mm macros, displays
.ix %begin displays, in [mm] macros %key displays, in mm macros
.LP
Broadly speaking, a display is any kind of information
in the body of a document that cannot be set as a normal
paragraph.
Displays can be figures, quotations, examples,
tables, lists, equations, or diagrams.
.PP
The display macros position the display on the page.
Inside the display, you might use other macros
or preprocessors such as
.CW tbl
or
.CW eqn .
You might simply have a block of text that
deserves special treatment.
.PP
The display macros can be relied upon to provide
.RS
.Ls B
.Li
adequate spacing before and after the display;
.Li
horizontal positioning of the display as a left justified,
indented, or centered block;
.Li
proper page breaks by keeping the entire display together.
.Le
.RE
.LP
The default action of the
.CW \&.DS
.ix %begin [.DS] macro ([mm]) %key DS macro mm
.ix %begin [mm] macros, [.DS] macro %key mm macros, DS macro
macro is to left justify the text block in no-fill mode.
It provides no indentation from the current margins.
.PP
You can specify a different format for
a display by specifying up to three arguments with the
.CW \&.DS
macro.
The syntax is:
.Ps
.ft R
\f[CW]\&.DS\fP [\fIformat\fP] [\fIfill mode\fP] [\fIright indent\fP]
.ft CW
.Pe
.ix [mm] macros, display formatting~options %key mm macros, display formatting options
The
.I format
argument allows you to specify an indented or centered display.
The argument can be set by a numeric value
or a letter corresponding to the following options:
.RS
.TS
lf(CW) lf(CW) l .
0	L	No indent (default)
1	I	Indented
2	C	Center each line
3	CB	Center entire display
.TE
.RE
.LP
For consistency, the indent of displays is initially set to
be the same as indented paragraphs (five spaces in
.CW nroff
and three ens in
.CW troff ),
although these values are maintained
independently in two different number registers,
.CW Pi
for paragraph indents, and
.CW Si
for display indents.
To change the defaults, use the
.CW \&.nr
request to put the desired value in the appropriate register.
.PP
You can center a display in two ways:
either each individual line in the display is centered
.CW C ) (
or the entire display is centered
as a block based on the longest line of the display
.CW CB ). (
.PP
For instance, the preceding list was formatted using
.CW tbl ,
but its placement was controlled by the display macro.
.page 146
.Ps
\&.DS CB
\&.TS
\fItable specifications\fP
\&.TE
\&.DE
.Pe
.PP
The
.I "fill mode"
.ix displays, fill options ([mm]) %key displays, fill options mm
.ix [mm] macros, display fill~options %key mm macros, display fill options
argument is represented by either a number or a letter.
.RS
.TS
lf(CW) lf(CW) l .
0	N	No-fill mode (default)
1	P	Fill mode
.TE
.ix no-fill mode
.RE
.PP
The
.I "right indent"
argument is a numeric value that is subtracted
from the right margin.
In
.CW nroff ,
this value is automatically scaled in ens.
In
.CW troff ,
you can specify a scaled number;
otherwise, the default is ems.
.PP
The use of fill mode,
along with other indented display options,
can provide a paragraph indented on both sides.
Reports and proposals
that quote at length from another source
often use fill mode.
For example:
.Ps
\&.P
I was particularly interested in the following comment
found in the product specification:
\&.DS I F 5
Users first need a brief introduction to what the product
does.  Sometimes this is more for the benefit of people
who haven't yet bought the product, and
are just looking at the manual.
However, it also serves to put the rest of
the manual, and the product itself, in the proper context.
\&.DE
.Pe
.LP
The result of formatting is:
.sp .7v
.SS
.Ps
I was particularly interested in the following comment
.ig
	The next line in the printed book reads:
	"found in the the product specification:"
	which is wrong.  Fixed.
	--Michael Hobgood
..
found in the product specification:
.sp
     Users first  need  a  brief  introduction to
     what the product  does.   Sometimes  this is
     more for the  benefit of people  who haven't
     yet bought the product, and are just looking
     at the manual.  However, it  also  serves to
     put the rest of the manual,  and the product
     itself, in the proper context.
.sp
.Pe
.SE
.ix %end [.DS] macro ([mm]) %key DS macro mm
.ix %end [mm] macros, [.DS] macro %key mm macros, DS macro
.ix %end [mm] macros, displays %key mm macros, displays
.ix %end displays, in [mm] macros %key displays, in mm macros
.sp .8v
.PP
The use of tabs often presents a problem outside of
displays.
Format material containing tabs in no-fill mode,
the default setting of the display macros.
The following table was designed using
tabs to provide the spacing:
.page 147
.RS
.TS
tab (#);
lfC l l l l lfC .
\&.DF I#####
Dates#####Description of Task
#####
June 30#####Submit audience analysis
July 2#####Meeting to review audience analysis
July 15#####Submit detailed outline
August 1#####Submit first draft
August 5#####Return of first draft
August 8#####Meeting to review comments
\&.DE#####
.TE
.RE
.LP
This table appears in the output just as it looks in the
file.
If this material had not been processed inside a display
in no-fill mode, the columns would be improperly aligned.
.
.Bh "Static and Floating Displays"
.LP
There are two types of displays,
.I static
.ix [mm] macros, static displays %key mm macros, static displays
.ix displays, static ([mm]) %key displays, static mm
and
.I floating .
.ix [mm] macros, floating displays %key mm macros, floating displays
.ix displays, floating ([mm]) %key displays, floating mm
The difference between them has to do with what happens when
a display cannot fit in its entirety on the current page.
Both the static and the floating display output the block at
the top of the next page if it doesn't fit on the current page;
however, only the floating display allows text that follows
the display to be used to fill up the preceding page.
A static display maintains the order
in which a display was placed in the input file.
.PP
We have already used
.CW \&.DS
and
.CW \&.DE
to begin and end a static display.
To specify a floating display, the closing macro is the same,
but the beginning macro is
.CW \&.DF
.ix %begin [.DF] macro ([mm]) %key DF macro mm
.ix %begin [mm] macros, [.DF] macro %key mm macros, DF macro
macro.
The options are the same as for the
.CW \&.DS
macro.
.PP
In the following example of an input file, numbers are used
instead of actual lines of text:
.Ps
1
2
3
4
5
\&.DF
.I "Long Display"
\&.DE
6
7
8
9
10
.Pe
.LP
The following two formatted pages might be produced, assuming
that there are a sufficient number of lines in the display to
cause a page break:
.sp 1.5v
.page 148
.ne 12
.X1
.ce
- 1 -

1
2
3
4
5
6
7

.X2
.X3
.ce
- 2 -

\fILong Display\fP

8
9
10



.X4
.sp 1v
.LP
If there is room on page 1 to fit the display,
it would appear there,
with lines 6 and 7 following the display,
as they do in the input file.
.PP
If a static display is too long to fit on page\~1,
the display appears at the beginning of page\~2,
with lines 6 and 7 following it,
leaving extra space at the bottom of page\~1.
A floating display attempts to make the best use of
the available space on a page.
.PP
The formatter maintains a queue
to hold floating displays that it has not yet output.
When a new page begins,
the formatter outputs the next display in the queue.
The formatter empties the queue
in the order in which it was filled: first in, first out.
Two number registers,
.CW De
and
.CW Df ,
allow you to control when the formatter
removes displays from the queue and places them in position.
.PP
At the end of a section, as indicated by the section macros
.CW \&.H
and
.CW \&.HU
(which we will see shortly),
or at the end of the input file,
the formatter places
any floating displays that remain in the queue.
.ix %end [.DF] macro ([mm]) %key DF macro mm
.ix %end [mm] macros, [.DF] macro %key mm macros, DF macro
.
.Bh "Display Labels"
.ix [mm] macros, display labels %key mm macros, display labels
.ix [mm] macros, displays %key mm macros, displays
.ix displays, labels ([mm]) %key displays, labels mm
.LP
You can provide a title or caption for tables, equations,
exhibits, and figures.
In addition, you can label and number the display in sequence,
and print the titles in a table of contents
at the end of the file.
The following macros are available:
.RS
.TS
lf(CW) l .
\&.EC	Equation
\&.EX	Exhibit
\&.FG	Figure
\&.TB     Table
.TE
.ix %begin [.EC] macro ([mm]) %key EC macro mm
.ix %begin [mm] macros, [.EC] macro %key mm macros, EC macro
.ix %begin [.EX] macro ([mm]) %key EX macro mm
.ix %begin [mm] macros, [.EX] macro %key mm macros, EX macro
.ix %begin [.FG] macro ([mm]) %key FG macro mm
.ix %begin [mm] macros, [.FG] macro %key mm macros, FG macro
.RE
.PP
All of these macros work the same way and are usually specified
within a pair of
.CW .DS /\c
.CW .DE
or
.CW .DF /\c
.CW .DE
macros, so that the title and the
display appear on the same page.
Each macro can be followed by a title.
If the title contains spaces, enclose
it in quotation marks.
The title of a table usually appears at
the top of a table,
so specify it before the
.CW \&.TS
macro that signals to
.CW tbl
the presence of a table (see Chapter 8).
.page 149
.Ps
\&.TB "List of Required Resources"
\&.TS
.Pe
.LP
The label is centered:
.sp .7v
.SS
.Ps
.ti 33n
\fBTable 1.\fP\fR  List of Required Resources\fP
.sp
.Pe
.SE
.sp .8v
.PP
If the title exceeds the line length,
the formatter breaks it onto as many lines as needed,
indenting additional lines to begin
at the first character of the title.
.sp .7v
.SS
.Ps
.ti 33n
\fBTable 1.\fP\fR  List of Required Resources\fP
.ti 40n
\fR\| Provided by Gutenberg Galaxy\fP
.ti 40n
\fR\| Software\fP
.sp
.Pe
.SE
.sp .8v
.PP
The label for equations, exhibits, and figures
usually follows the display.
The following:
.Ps
\&.FG "Drawing with a Light Pen"
.Pe
.LP
produces a centered line:
.sp .7v
.SS
.Ps
.ti 33n
\fBFigure 1.\fP\fR  Drawing with a Light Pen\fP
.sp
.Pe
.SE
.sp .8v
.PP
You can make small changes
to the default format of the label
by setting the number register
.CW Of
to 1.
This replaces the period with a dash.
.sp .7v
.SS
.Ps
.ti 33n
\fBFigure 1\fP\fR \(em Drawing with a Light Pen\fP
.sp
.Pe
.SE
.sp .8v
.PP
Use the second and third arguments to the label macros
to modify or override the default numbering.
Basically, the second argument is a literal and
the third argument a numeric value that specifies what the
literal means.
.PP
If the third argument is
.RS
.TS
tab (#);
lf(CW) l.
0#the second argument is a prefix;
.sp 3p
1#the second argument is a suffix;
.sp 3p
2#the second argument replaces the normal table number.
.TE
.RE
.LP
Thus, you could specify a pair of related tables
as 1a and 1b using the following labels:
.Ps
\&.TB "Estimated Hours: June, July, and August" a 1
\&.TB "Estimated Hours: September and November," 1b 2
.Pe
.LP
These labels show two different uses of the third argument.
Usually, you would consistently use one technique
or the other for a given set of tables.
.PP
For
.CW tbl ,
the delimiters for tables are
.CW .TS /\c
.CW .TE .
For
.CW eqn ,
the delimiters for equations are
.CW \&.EQ /\c
.CW .EN .
For
.CW pic ,
the delimiters for pictures or diagrams are
.CW \&.PS /\c
.CW .PE .
.ix %end [.EC] macro ([mm]) %key EC macro mm
.ix %end [mm] macros, [.EC] macro %key mm macros, EC macro
.ix %end [.EX] macro ([mm]) %key EX macro mm
.ix %end [mm] macros, [.EX] macro %key mm macros, EX macro
.ix %end [.FG] macro ([mm]) %key FG macro mm
.ix %end [mm] macros, [.FG] macro %key mm macros, FG macro
These pairs of macros indicate a block
to be processed by a specific preprocessor.
.page 150
See Chapters 8 through 10 for information
about each of the preprocessors.
The preprocessor creates the display,
the display macros position it,
and the label macros add titles and a number.
.PP
Although it may seem a minor point,
each of these steps is independent,
and because they are not fully integrated,
there is some overlap.
.PP
The label macros, being independent of the preprocessors,
do not make sure that a display exists
or (for example) check whether a table exists.
You can create a two-column table using tabs,
or create a figure using character symbols,
and still give it a label.
Or you can create a table heading
as the first line of your table and let
.CW tbl
process it
.CW tbl "" (
won't provide a number
and the title won't be collected for the table of contents).
.PP
In
.CW tbl ,
you can specify a centered table and not use the
.CW .DS /\c
.CW .DE
macros.
But, as a consequence,
.CW nroff /\c
.CW troff
won't make
a very good attempt at keeping the table together on one page,
and you may have to manually break the page.
Therefore, use the display macros throughout a document,
regardless of whether you can get the same effect another way,
because if nothing else you will achieve consistency.
.
.Ah "Forcing a Page Break"
.LP
Occasionally, you may want to force a page break,
whether to ensure that
a block of related material is kept together
or to allow blank pages for material
that will be manually pasted in, such as a figure.
This is usually not an issue in modern times,
as each version of
.CW troff
has ways to allow including graphics,
but you may encounter this
when working with older documents.
The
.CW \&.SK
.ix [.SK] macro ([mm]) %key SK macro mm
.ix [mm] macros, [.SK] macro %key mm macros, SK macro
.ix [mm] macros, page~break %key mm macros, page break
.ix page breaks, [mm] macros %key page breaks, mm macros
.I skip ) (
macro forces a page break.
The formatter outputs text following this macro
at the top of the next page.
If supplied with an argument greater than 0,
it skips that number of pages 
before resuming text output.
The \(lqblank\(rq pages have the normal header and footer.
.Ps
On the next page, you will find a sample page from an
Alcuin manuscript printed with a 16-color plotter.
\&.SK 1
.Pe
.
.Ah "Formatting Lists"
.ix %begin [mm] macros, lists %key mm macros, lists
.ix %begin lists, [mm] macros %key lists, mm macros
.LP
The
.CW mm
macro package provides a variety of different formats
for presenting a list of items.
You can select from these list types:
.RS
.Ls B
.Li
bulleted
.Li
dashed
.Li
numbered
.Li
alphabetized
.Li
variable/tagged (\c
.CW groff -only)
.Li
broken variable/tagged (\c
.CW groff -only)
.Li
marked (\c
.CW groff -only)
.Le
.RE
.page 151
.LP
In addition, you can create lists with
nonstandard marks or text labels.
You can also use list macros
to produce paragraphs with a hanging indent.
.PP
Each list item consists of a special mark, letter,
number, or label in a left-hand column
with a paragraph of text indented in a right-hand column.
.
.Bh "Structuring a List"
.LP
The list macros simplify what could be a much larger
and tedious formatting task.
Here's the coding for the bulleted list just shown:
.Ps
\&.BL
\&.LI
bulleted
\&.LI
dashed
\&.LI
numbered
\&.LI
alphabetized
\&.LI
...
\&.LE
.Pe
.LP
The list structure has three parts:
a list-initialization macro
.CW .BL ), (
.ix [.BL] macro ([mm]) %key BL macro mm
.ix [mm] macros, [.BL] macro %key mm macros, BL macro
an item-mark macro
.CW .LI ), (
.ix %begin [.LI] macro ([mm]) %key LI macro mm
.ix %begin [mm] macros, [.LI] macro %key mm macros, LI macro
and a list-end macro
.CW .LE ). (
.ix %begin [.LE] macro ([mm]) %key LE macro mm
.ix %begin [mm] macros, [.LE] macro %key mm macros, LE macro
.PP
First, you initialize the list,
specifying the particular macro
for the type of list that you want.
For instance,
.CW BL
initializes a bulleted list.
.PP
You can specify arguments
with the list-initialization macro
that change the indentation of the text
and turn off automatic spacing between items in the list.
We examine these arguments when we look at
the list-initialization macros
in more detail later.
.PP
Next, you specify each of the items in the list.
Place the list-item macro,
.CW \&.LI ,
before each item.
You can enter one or more lines of text following the macro.
.Ps
\&.BL
\&.LI
Item 1
\&.LI
Item 2
is somewhat longer
\&.LI
Item 3
.Pe
.LP
The
.CW \&.LI
macro adds a line of space before each item.
You can omit this space, using an argument
to the list-initialization macro,
if you want to produce a more compact list.
.PP
If you add a single argument to the
.CW \&.LI
macro,
it replaces the current mark.
For example:
.page 152
.Ps
\&.LI o
Item 4
.Pe
.LP
If you supply a mark as the first argument,
followed by a second argument of 1,
.CW -mm
prefixes the specified mark to the current mark.
The following:
.Ps
\&.LI - 1
Item 5
.Pe
.LP
produces:
.sp .7v
.SS
.Ps
.ti 10n
\fB-\(bu\fP\fR     Item 5\fP
.sp
.Pe
.SE
.sp .8v
.PP
You can specify a text label
in place of the mark,
but it presents some additional problems
for proper list alignment.
.PP
The
.CW \&.LI
macro does not automatically provide spacing
after each list item.
Use an argument of 1 to set a line of space.
.PP
The list-end macro
.CW \&.LE
ends the list.
It restores page formatting settings
that were in effect before invoking
the last list-initialization macro.
The
.CW \&.LE
macro does not output any space following the list,
unless you specify an argument of 1.
Don't specify this argument when
a paragraph macro, or another macro that outputs space,
immediately follows.
.PP
Be sure you are familiar with the basic structure of a list.
A common problem is not closing the list with
.CW \&.LE .
Most of the time, this error causes the formatter
to quit.
A less serious, but nonetheless frequent,
oversight is omitting the first
.CW \&.LI
between the list-initialization
macro and the first item in the list.
The list is output, but the first item is askew.
.PP
Here is a sample list:
.Ps
\&.BL
\&.LI
Item 1
\&.LI
Item 2
\&.LI
Item 3
\&.LI o
Item 4
\&.LI - 1
Item 5
\&.LE
.Pe
.page 153
.PP
The
.CW troff
output produced by the sample list is:
.sp .7v
.SS
.Ps
.ti 10n
\fB\(bu\fP\fR     Item 1\fP
.ti 10n
\fB\(bu\fP\fR     Item 2\fP
.ti 10n
\fB\(bu\fP\fR     Item 3\fP
.ti 10n
\fBo\fP\fR     \h'-1p'Item 4\fP
.ti 10n
\fB-\(bu\fP\fR     \h'-3p'Item 5\fP
.sp
.Pe
.SE
.sp .8v
.PP
You can nest complete list structures
within other lists,
.ix [mm] macros, nested lists %key mm macros, nested lists
.ix lists, nested ([mm]) %key lists, nested mm
up to six levels.
You can nest different types of lists,
making it possible to produce indented outline structures.
But, like nested if-then structures in a program,
make sure you know which level you are at
and remember to close each list.
.PP
For instance, we could nest a bulleted list
inside a numbered list.
The list-initialization macro
.CW \&.AL
generates alphabetized and numbered lists.
.Ps
\&.AL
\&.LI
Don't worry, we'll get to the list-initialization macro .AL.
You can specify five different variations of
alphabetic and numbered lists.
\&.BL
\&.LI
Item 1
\&.LI
Item 2
\&.LI
Item 3
\&.LE
\&.LI
We'll also look at variable-item lists.
\&.LE
.Pe
.LP
This input produces the following formatted list from
.CW troff :
.page 154
.sp .7v
.SS
.UTPSD
.in 10n
.ft R
1.\h'.75i'\h'-7p'Don't worry, we'll get to the list-initialization macro \fC\&.AL\fP.
\h'.75i'You can specify five different variations of alphabetic and
\h'.75i'numbered lists.

\h'1.125i'\fB\(bu\fP     Item 1

\h'1.125i'\fB\(bu\fP     Item 2

\h'1.125i'\fB\(bu\fP     Item 3

2.\h'.75i'\h'-7p'We'll also look at variable-item lists.
.sp
.UTPED
.SE
.ix %end [.LE] macro ([mm]) %key LE macro mm
.ix %end [mm] macros, [.LE] macro %key mm macros, LE macro
.ix %end [.LI] macro ([mm]) %key LI macro mm
.ix %end [mm] macros, [.LI] macro %key mm macros, LI macro
.sp .8v
.PP
You can now see how you can make
changes to a list.
You can:
.Ls B
.Li
reorder items in a list;
.Li
add new items to a numbered list
without readjusting the numbering scheme;
.Li
change a bulleted list to an alphabetized list
by changing the list-initialization macro.
.Le
You don't have to worry about
a variety of specific formatting requests,
like setting indentation levels
or specifying spacing between items.
.PP
On the other hand,
because the structure of the list is
not as easy to recognize in the input file
as it is in formatted output,
you may find it difficult to interpret complicated lists,
especially those nested several levels deep.
The code checking program,
.CW checkmm ,
.ix [checkmm] command %key checkmm command
can help if it's available on your system;
in addition, you may want to format and print
repeatedly to examine and correct problems with lists.
The
.CW groff
version of
.CW -mm
has built-in diagnostics that you can use
in place of the
.CW checkmm
command.
.
.Bh "Marked Lists"
.ix [mm] macros, marked lists %key mm macros, marked lists
.ix lists, marked ([mm]) %key lists, marked mm
.LP
Long a standby of technical documents,
a marked list clearly organizes a group of related items
and sets them apart for easy reading.
A list of items marked by a bullet (\[bu])
is perhaps the most common type of list.
Another type of marked list uses
a dash (\(em).
A third type of list allows the user to specify
a mark, such as a square (\[sq]).
The list-initialization macros
for these lists are:
.RS
.TS
tab (#);
lf(CW) l l.
\&.BL##[\fItext indent\fP] [1]
\&.DL##[\fItext indent\fP] [1]
\&.ML##[\fImark\fP] [\fItext indent\fP] [1]
.TE
.ix %begin [.BL] macro ([mm]) %key BL macro mm
.ix %begin [mm] macros, [.BL] macro %key mm macros, BL macro
.ix %begin [.DL] macro ([mm]) %key DL macro mm
.ix %begin [mm] macros, [.DL] macro %key mm macros, DL macro
.ix [.ML] macro ([mm]) %key ML macro mm
.ix [mm] macros, [.ML] macro %key mm macros, ML macro
.RE
.LP
The
.CW \&.BL
macro indents text by the same amount as
the first line of an indented paragraph.
It maintains a single space
between the bullet and the text.
The bullet is right justified,
thus indented several spaces from the left margin.
.PP
As you can see from this
.CW nroff -formatted
output, the bullet is simulated in
.CW nroff
by a
.CW +
overstriking an
.CW o :
.page 155
.sp .7v
.SS
.Ps
     Currently, the following internal documentatation is
available on the Alcuin product:
.sp
   \zo+ GGS Technical Memo 3200
.sp
   \zo+ GGS Product Marketing Spec
.sp
   \zo+ Alcuin/UNIX interface definition
.sp
   \zo+ Programmer's documentation for Alcuin
.sp
.Pe
.SE
.sp .8v
.LP
If you specify a
.I "text indent" ,
the first character of the text starts at that position.
The position of the bullet is relative to the text,
always one space to its left.
.PP
If the last argument is 1,
the list item macro omits the blank line of space
separating items.
If you want to specify only this argument,
you must specify either a value or a null value (\c
.CW \(dq\(dq )
for a
.I "text indent" .
.Ps
\&.BL "" 1
.Pe
.LP
It produces a compact list:
.sp .7v
.SS
.Ps
   \zo+ GGS Technical Memo 3200
   \zo+ GGS Product Marketing Spec
   \zo+ Alcuin/UNIX interface definition
   \zo+ Programmer's documentation for Alcuin
.sp
.Pe
.SE
.sp .8v
.PP
Because the bullets produced by
.CW nroff
are not always appropriate due to the overstriking,
a dashed list provides a suitable alternative.
The
.CW \&.DL
macro places a dash in the same position
as a bullet in a bulleted list.
It maintains a single space
between the dash and the text, and,
like the text with a bulleted list,
indents list items by the amount specified
in the number register for indented paragraphs
.CW Pi ). (
.PP
The
.CW nroff
formatter supplies a dash that is a single hyphen, and
.CW troff
supplies an em dash.
Because the em dash is longer,
and the dash is right justified, the alignment with the left
margin is noticeably different.
It appears left justified in
.CW troff;
in
.CW nroff ,
the dash appears indented several spaces
because it is smaller.
.sp .7v
.SS
.Ps
     The third chapter on the principles of computerized
font design should cover the following topics:
.sp
   - Building a Font Dictionary
.sp
   - Loading a Font
.sp
   - Scaling a Font
.sp
.Pe
.SE
.sp .8v
.LP
You can specify a
.I "text indent"
and a second argument of 1 to inhibit spacing between items.
.page 156
.PP
With the
.CW \&.ML
.ix [.ML] macro ([mm]) %key ML macro mm
.ix [mm] macros, [.ML] macro %key mm macros, ML macro
.ix [mm] macros, user-supplied list~marks %key mm macros, user-supplied list marks
.ix lists, user-supplied marks ([mm]) %key lists, user-supplied marks mm
macro, you specify the mark for the list.
Some possible candidates are the square (enter
.CW \e(sq
to get \(sq), the square root (enter
.CW \e(sr
to get \(sr), which
resembles a check mark, and the gradient symbol (enter
.CW \e(gr
to get \(gr).
The user-specified mark is the first argument.
.Ps
\&.ML \\(sq
.Pe
.LP
Not all of the characters or symbols that you can use in
.CW troff
have the same effect in
.CW nroff .
.PP
Unlike bulleted and dashed lists, the
.CW \&.ML
macro does not automatically
indent list items.
However, it does add a space after the mark.
The following example of an indented paragraph
and a list, which specifies a square as a mark,
has been formatted using
.CW nroff .
The square appears as a pair of brackets.
.sp .7v
.SS
.Ps
[] Remove old initialization files.

[] Run install program.

[] Exit to main menu and choose selection 3.
.sp
.Pe
.SE
.sp .8v
You can follow the user-supplied mark
by a second argument that specifies a
.I "text indent" ,
and a third argument of 1 to omit spacing between items.
.PP
The following example uses the list-initialization command:
.Ps
\&.ML \\(sq 5 1
.Pe
.LP
The specified indent of 5 aligns the text with an indented
paragraph:
.\" XXX test: could you use \n[Pi] for this?
.sp .7v
.SS
.Ps
     Check to see that you have completed the following
steps:
.sp
  [] Remove old initialization files.
.sp
  [] Run install program.
.sp
  [] Exit to main menu and choose selection 3.
.sp
.Pe
.SE
.ix %end [.BL] macro ([mm]) %key BL macro mm
.ix %end [.DL] macro ([mm]) %key DL macro mm
.ix %end [mm] macros, [.BL] macro %key mm macros, BL macro
.ix %end [mm] macros, [.DL] macro %key mm macros, DL macro
.sp .8v
.
.Bh "Numbered and Alphabetic Lists"
.ix %begin [.AL] macro ([mm]) %key AL macro mm
.ix %begin [mm] macros, [.AL] macro %key mm macros, AL macro
.ix %begin [mm] macros, alphabetic lists %key mm macros, alphabetic lists
.ix %begin alphabetic lists, [mm] macros %key alphabetic lists, mm macros
.ix %begin lists, alphabetic ([mm]) %key lists, alphabetic mm
.ix %begin [mm] macros, numbered lists %key mm macros, numbered lists
.ix %begin lists, numbered ([mm]) %key lists, numbered mm
.ix %begin numbered lists, [mm] macros %key numbered lists, mm macros
.LP
Use the
.CW \&.AL
macro to initialize automatically numbered or
alphabetized lists.
The syntax for this macro is:
.Ps
.ft R
\f[CW]\&.AL \fP[\fItype\fP] [\fItext indent\fP] [1]
.ft CW
.Pe
.LP
With no arguments, the
.CW \&.AL
macro produces a numbered list.
For instance, we can code the following paragraph with
the list-initialization macro
.CW \&.AL :
.page 157
.Ps
User-oriented documentation recognizes three things:
\&.AL
\&.LI
that a new user needs to learn the system in stages,
getting a sense of the system as a whole while becoming
proficient in performing particular tasks;
\&.LI
that there are different levels of users, and not every
user needs to learn all the capabilities of the system
in order to be productive;
\&.LI
that an experienced user must be able to rely on the
documentation for accurate and thorough reference
information.
\&.LE
.Pe
.LP
to produce a numbered list:
.sp .7v
.SS
.Ps
User-oriented documentation recognizes three things:
.sp
  1.  that a new user needs to learn the system in stages,
      getting a sense of the system as a whole while
      becoming proficient in performing particular tasks;
.sp
  2.  that there are different levels of users, and not
      every user needs to learn all the capabilities of
      the system in order to be productive;
.sp
  3.  that an experienced user must be able to rely on the
      documentation for accurate and thorough reference
      information.
.sp
.Pe
.SE
.sp .8v
.LP
A period follows the number,
and the macro maintains two spaces
between the period and the first character of text.
.PP
The level of
.I "text indent" ,
specified in the number register
.CW Li ,
is 6 in
.CW nroff
and 5n in
.CW troff .
This value is added to the current indent.
If you specify a
.I "text indent" ,
that value is added to the current indent,
but it does not change the value of
.CW Li .
.PP
The third argument inhibits spacing between items in the list.
Additionally, you can set the number register
.CW Ls
to a value from 0 to 6, indicating a nesting level.
Lists after this level do not have spacing between items.
The default is 6, the maximum nesting depth.
If
.CW Ls
were set to 2, lists only up to
the second level would have a blank line of space between items.
.\" XXX test: does the 3rd argument override \n[Ls]?
.PP
You can specify other types of lists with
.CW \&.AL ,
using the first argument to specify the list type, as follows:
.page 158
.RS
.TS
tab (#);
cf(CW) l l.
\fRValue\fP#Sequence#Description
1#1, 2, 3#Numbered
A#A, B, C#Alphabetic (uppercase)
a#a, b, c#Alphabetic (lowercase)
I#I, II, III#Roman numerals (uppercase)
i#i, ii, iii#Roman numerals (lowercase)
.TE
.RE
.LP
You can produce various list types by changing the
.I type
argument.
You can create a traditional outline format
by nesting different types of lists.
The example we show of
such an outline is one that is nested to four levels using
.CW I ,
.CW A ,
.CW 1 ,
and
.CW a ,
in that order.
The rather complicated looking
input file is shown in Figure 6-4 (indented for easier viewing
of each list, although it could not be formatted this way),
and the
.CW nroff -formatted
output is shown in Figure 6-5.
.PP
Another list-initialization macro that produces a numbered
list is
.CW \&.RL
.ix [.RL] macro ([mm]) %key RL macro mm
.ix [mm] macros, [.RL] macro %key mm macros, RL macro
.ix [mm] macros, reference lists %key mm macros, reference lists
.ix lists, reference ([mm]) %key lists, reference mm
.ix reference lists, [mm] macros %key reference lists, mm macros
.I "reference list" ). (
The only difference is that the
reference number is surrounded by brackets (\c
.CW [] ).
.Ps
.ft R
\f[CW]\&.RL \fP[\fItext indent\fP] [1]
.ft CW
.Pe
.LP
The arguments have the same effect as those specified with the
.CW \&.AL
macro.
To initialize a reference list with no spacing
between items, use:
.Ps
\&.RL "" 1
.Pe
.LP
It produces the following reference list:
.sp .7v
.SS
.Ps
[1]	The Main Menu
[2]	Menus or Commands?
[3]	Error Handling
[4]	Getting Help
[5]	Escaping to UNIX
.sp
.Pe
.SE
.sp .8v
.\" Figure 6-4
.KS
.Fs
.Ps
\&.AL I
\&.LI
Quick Tour of Alcuin
     .AL A
     .LI
     Introduction to Calligraphy
     .LI
     Digest of Alcuin Commands
          .AL 1
          .LI
          Three Methods of Command Entry
               .AL a
               .LI
               Mouse
               .LI
               Keyboard
               .LI
               Light Pen
               .LE
          .LI
          Starting a Page
          .LI
          Drawing Characters
               .AL a
               .LI
               Choosing a Font
               .LI
               Switching Fonts
               .LE
          .LI
          Creating Figures
          .LI
          Printing
          .LE
     .LI
     Sample Illuminated Manuscripts
    .LE
\&.LI
Using Graphic Characters
     .AL A
     .LI
     Modifying Font Style
     .LI
     Drawing Your Own Font
    .LE
\&.LI
Library of Hand-Lettered Fonts
\&.LE
.Pe
.Fe "Input for a Complex List
.KE
.\" Figure 6-5
.sp .7v
.KS
.Fs
.SS
.Ps
                              - 1 -
.sp 2
    I.  Quick Tour of Alcuin
.sp
          A.  Introduction to Calligraphy
.sp
          B.  Digest of Alcuin Commands
.sp
                1.  Three Methods of Command Entry
.sp
                      a.  Mouse
.sp
                      b.  Keyboard
.sp
                      c.  Light Pen
.sp
                2.  Starting a Page
.sp
                3.  Drawing Characters
.sp
                      a.  Choosing a Font
.sp
                      b.  Switching Fonts
.sp
                4.  Creating Figures
.sp
                5.  Printing
.sp
          C.  Sample Illuminated Manuscripts
.sp
   II.  Using Graphic Characters
.sp
          A.  Modifying Font Style
.sp
          B.  Drawing Your Own Font
.sp
  III.  Library of Hand-Lettered Fonts
.sp
.Pe
.SE
.Fe "Output of a Complex List
.KE
.ix %end [.AL] macro ([mm]) %key AL macro mm
.ix %end [mm] macros, [.AL] macro %key mm macros, AL macro
.ix %end [mm] macros, alphabetic lists %key mm macros, alphabetic lists
.ix %end alphabetic lists, [mm] macros %key alphabetic lists, mm macros
.ix %end lists, alphabetic ([mm]) %key lists, alphabetic mm
.ix %end [mm] macros, numbered lists %key mm macros, numbered lists
.ix %end lists, numbered ([mm]) %key lists, numbered mm
.ix %end numbered lists, [mm] macros %key numbered lists, mm macros
.sp .8v
.
.Bh "Variable-Item Lists"
.ix [mm] macros, variable-item lists %key mm macros, variable-item lists
.ix lists, variable-item ([mm]) %key lists, variable-item mm
.ix variable-item lists, [mm] macros %key variable-item lists, mm macros
.LP
With a variable-item list, you do not supply a mark;
instead, you specify a text label with each
.CW \&.LI .
One or more lines of text following
.CW \&.LI
are used to form a block paragraph indented from the label.
If no label is specified, a paragraph with a
hanging indent is produced.
.ix [.VL] macro ([mm]) %key VL macro mm
.ix [mm] macros, [.VL] macro %key mm macros, VL macro
The syntax is:
.Ps
.ft R
\f[CW]\&.VL \fP\fItext indent\fP [\fIlabel indent\fP] [1]
.ft CW
.Pe
.LP
Unlike the other list-initialization macros, a
.I "text indent"
is required.
By default, the label is left justified, unless a
.I "label indent"
is given.
If you specify both a
.I "text indent"
and a
.I "label indent" ,
the indent for the text will be added to the
.I "label indent" .
.page 159
.\" 		Figure 6-4 (moved)
.page 160
.\" 		Figure 6-5 (moved)
.page 161
.PP
Variable-item lists are useful
in preparing command reference pages,
which describe various syntax items,
and glossaries, which present a term in one column
and its definition in the other.
The text label should be a single word;
if you use a phrase, see below.
The following example
shows a portion of the input file for a reference page:
.Ps
\&.VL 15 5
\&.LI figure
is the name of a cataloged figure.  If
a figure has not been cataloged, you need to use
the LOCATE command.
\&.LI f:p
is the scale of the
figure in relation to the page.
\&.LI font
is the two-character abbreviation or
full name of one of the available fonts
from the Alcuin library.
\&.LE
.Pe
.LP
The following variable-item list is produced:
.sp .7v
.SS
.Ps
   figure   is the name of a cataloged figure. If a
            figure has not been cataloged, you need to
            use the LOCATE command.
.sp
   f:p      is the scale of the figure in relation to
            the page.
.sp
   font     is the two-character abbreviation or full
            name of one of the available fonts from the
            Alcuin library.
.sp
.Pe
.SE
.sp .8v
.PP
If you don't provide a text label with
.CW \&.LI
or give a null argument (\c
.CW \(dq\(dq ),
you get a paragraph with a hanging indent.
If you want to print an item without a label,
specify a backslash followed by a space (\c
.CW "\e " )
or
.CW \e0
after
.CW \&.LI .
If you want to specify a label that contains a space,
precede the space with a backslash
and enclose the entire label within quotation marks:
.Ps
\&.LI "point\e size"
.Pe
.LP
or substitute a \\0 for a space:
.Ps
\&.LI point\\0size
.Pe
.LP
A variable list left-justifies the first line of text
(or indents by the amount specified in
.I "label indent" ),
and indents the remaining lines
by the amount specified by
.I "text indent" .
This produces a paragraph with a hanging indent:
.page 162
.Ps
\&.VL 15
\&.LI
There are currently 16 font dictionaries in the Alcuin
library.  Any application may have up to 12 dictionaries
resident in memory at the same time.
\&.LE
.Pe
.LP
When formatted, this item has a hanging indent of 15:
.sp .7v
.SS
.Ps
There are currently 16 font dictionaries in the Alcuin
               library.  Any application may have up to
               12 dictionaries resident in memory at the
               same time.
.sp
.Pe
.SE
.ix %end lists, [mm] macros %key lists, mm macros
.ix %end [mm] macros, lists %key mm macros, lists
.sp .8v
.
.Ah Headings
.ix %begin headings, in [mm] %key headings, in mm
.LP
Earlier, we used the list macros to produce an indented outline.
That outline, indented to four levels,
is a visual representation of the structure of a document.
Headings perform a related function,
showing how the document is organized
into sections and subsections.
In technical documentation and book-length manuscripts,
having a structure that is easily
recognized by the reader is very important.
.
.Bh "Numbered and Unnumbered Headings"
.LP
Using
.CW mm ,
you can have up to seven levels of numbered and
unnumbered headings, with variable styles.
There are two heading macros:
.CW \&.H
for numbered headings and
.ix %begin [.H] macro ([mm]) %key H macro mm
.ix %begin [mm] macros, [.H] macro %key mm macros, H macro
.ix %begin [mm] macros, numbered headings %key mm macros, numbered headings
.CW \&.HU
for unnumbered headings.
.ix %begin [.HU] macro ([mm]) %key HU macro mm
.ix %begin [mm] macros, [.HU] macro %key mm macros, HU macro
.ix %begin [mm] macros, unnumbered headings %key mm macros, unnumbered headings
You can specify a different style for each level of heading
by setting various number registers and defining strings.
.PP
Let's first look at how to produce numbered headings.
The syntax for the
.CW \&.H
macro is:
.Ps
.ft R
\f[CW]\&.H \fP\fIlevel\fP [\fIheading text\fP] [\fIheading suffix\fP]
.ft CW
.Pe
.LP
The simplest use of the
.CW \&.H
macro is to specify the
.I level
as a number between\~1 and\~7
followed by the text that is printed
as a heading.
If the
.I "heading text"
contains spaces, enclose it within quotation marks.
A heading that is longer than a single line
wraps on to the next line.
A multiline heading does not break across pages.
.PP
If you specify a
.I "heading suffix" ,
this text or mark appears in the heading
but is not collected for a table of contents.
.PP
An argument of 1 indicates a top-level heading:
.Ps
\&.H 1 "Quick Tour of Alcuin"
.Pe
.page 163
.LP
The result is a heading preceded by a heading-level number.
The first-level heading has the number 1.
.Ps
1.  Quick Tour of Alcuin
.Pe
.LP
An argument of 2 indicates a second-level heading:
.Ps
\&.H 2 "Introduction to Calligraphy"
.Pe
.LP
The first second-level heading number is printed:
.Ps
1.1  Introduction to Calligraphy
.Pe
.LP
When another heading is specified at the same level,
the heading-level number automatically increments.
If the next heading is at the second level:
.Ps
\&.H 2 "Digest of Alcuin Commands"
.Pe
.LP
it produces:
.Ps
1.2  Digest of Alcuin Commands
.Pe
.LP
Each time you go to a new (higher-numbered) level, the
.CW \&.H
macro appends .1 to the number representing the existing level.
That number increments for each call at the same level.
When you back out of a level (for instance, from level\~4 to\~3),
the counter for the level (in this case level\~4), is reset to\~0.
.PP
An unnumbered heading is really a zero-level heading:
.Ps
\&.H 0 "Introduction to Calligraphy"
.Pe
.PP
A separate macro,
.CW \&.HU ,
sets unnumbered headings, although its effect is the same.
.Ps
\&.HU "Introduction to Calligraphy"
.Pe
.LP
Even though an unnumbered heading does not display a number, it
increments the counter for second-level headings.
Thus, in the following example,
the heading \(lqIntroduction to Calligraphy\(rq
is unnumbered, but it has the same effect on the numbering
scheme as if it had been a second-level heading (1.1).
.sp .7v
.SS
.Ps
1.  Quick Tour of Alcuin
.sp
Introduction to Calligraphy
.sp
1.2  Digest of Alcuin Commands
.sp
.Pe
.SE
.sp .8v
.PP
If you are going to intermix numbered and unnumbered headings,
you can change the number register
.CW Hu
to the lowest-level heading that is in the document.
By changing
.CW Hu
from 2 to a higher number:
.Ps
\&.nr Hu 5
\&.H 1 "Quick Tour of Alcuin"
\&.HU "Introduction to Calligraphy"
\&.H 2 "Digest of Alcuin Commands"
.Pe
.page 164
.LP
the numbering sequence is preserved for the numbered heading
following an unnumbered heading:
.sp .7v
.SS
.Ps
1.  Quick Tour of Alcuin
.sp
Introduction to Calligraphy
.sp
1.1  Digest of Alcuin Commands
.sp
.Pe
.SE
.sp .8v
.LP
Headings are meant to be visible keys to your document's
structure.
If you are using unnumbered headings, it becomes
even more important to make headings stand out.
A simple thing
you can do is use uppercase letters for a first-level heading.
.PP
Here is a list of some of the other things you can do to affect
the appearance of headings,
although some of the items depend
.ix %begin [mm] macros, altering heading~style %key mm macros, altering heading style
upon whether you are formatting with
.CW nroff
or
.CW troff :
.RS
.Ls B
.Li
change to roman, italic, or bold font
.Li
change the point size of the heading
.Li
adjust spacing after the heading
.Li
center or left justify the heading
.Li
change the numbering scheme
.Li
select a different heading mark
.Le
.RE
.LP
The basic issue in designing a heading style is to help the
reader distinguish between different levels of headings.
For instance, in an outline form,
different levels of indent show
whether a topic is a section or subsection.
Using numbered headings is an effective way to accomplish this.
If you use unnumbered headings,
you probably want to vary
the heading style for each level;
but for practical purposes, limit yourself to two or three levels.
.PP
First, let's look at what happens if we use the default
heading style.
.PP
The first two levels of headings are set up to produce
italicized text in
.CW troff
and underlined text in
.CW nroff .
After the heading, there is a blank line before
the first paragraph of text.
In addition, a top-level heading has two blank lines
before the heading;
all other levels have a single line of space.
.sp .7v
.SS
.UTPSD
.ft R
.in 16n
.ps 10
1.2  \fIIntroduction to Calligraphy\fP
.in 5n
.ps 9
.sp
Alcuin revitalizes an age-old tradition.  Calligraphy, quite simply, is the art of
beautiful handwriting.
.sp
.UTPED
.SE
.sp .8v
.LP
Levels three through seven all have the same appearance.
The text is italicized or underlined and no line break occurs.
Two blank lines are maintained before and after the
text of the heading.
For example:
.page 165
.sp .7v
.SS
.UTPSD
.ft R
.fi
.in 5n
1.2.1.3   \fILight Pen\fP The copyist's pen and ink has been replaced
by a light pen.
.sp
.UTPED
.SE
.sp .8v
.PP
To change the normal appearance of headings in a document,
you specify new values for the two strings:
.ix [mm] macros, heading strings %key mm macros, heading strings
.RS
.TS
tab (#);
lf(CW) l l .
HF##Heading font
HP##Heading point size
.TE
.RE
.LP
You can specify individual settings for each level, up to
seven values.
.PP
The font for each level of heading can be set by the string
.CW HF .
Use the following codes to select a font:
.RS
.TS
tab (#);
lf(CW) l l .
1##Roman
2##Italic
3##Bold
.TE
.RE
.LP
By default, the arguments for all seven levels are set to 2,
resulting in italicized headings in
.CW troff
and underlining in
.CW nroff .
Here the
.CW  HF
.ig
	The original printed book had: .HF
	This is wrong, it should be HF.  Fixed
	by Larry Kollar.
	--Michael Hobgood
..
string specifies bold for the top three
levels followed by two italic levels:
.Ps
\&.ds HF 3 3 3 2 2
.Pe
.LP
If you do not specify a level, it defaults to 1.
Thus, in the previous example, level 6 and 7 headings
print in Roman font.
.PP
The point size is set by the string
.CW HP .
Normally, headings print in the same size
as the body copy, except for bold headings.
A bold heading is reduced by 1 point when it
is a standalone heading, as are the top-level headings.
The
.CW HP
string can take up to seven arguments, setting the point
size for each level.
.Ps
\&.ds HP 14 14 12
.Pe
.LP
If an argument is not given, or a null value or 0 is given,
the default setting of 10 points is used for that level.
Point size can also be given relative to the current point size:
.Ps
\&.ds HP +4 +4 +2
.Pe
.PP
A group of number registers control other default formats
of headings:
.ix [mm] macros, heading number~registers %key mm macros, heading number registers
.RS
.TS
tab (#);
lf(CW) l l .
Ej##Eject page
Hb##Break follows heading
Hc##Center headings
Hi##Align text after heading
Hs##Vertical spacing after heading
.TE
.RE
.LP
For each of these number registers, you specify the number of
the level at which some action is to be turned on or off.
.page 166
.PP
The
.CW Ej
register is set to the highest-level heading, usually\~1,
that should start on a new page.
Its default setting is 0.
This ensures that the major sections of a document
begin on their own page.
.Ps
\&.nr Ej 1
.Pe
.LP
The
.CW Hb
register determines if a line break occurs after the heading.
The
.CW Hs
register determines if a blank line occurs after the heading.
Both are set to\~2 by default.
Settings of\~2 mean that, for levels\~1 and\~2,
the section heading is printed,
followed by a line break and a blank line separating
the heading from the first paragraph of text.
For lower-level headings (an argument greater than\~2),
the first paragraph
follows immediately on the same line.
.PP
Set the
.CW Hc
register to the highest-level heading that
you want centered.
Normally, this is not used with numbered
headings and its default value is 0.
However, unnumbered heads are often centered.
A setting of\~2 centers first- and second-level headings:
.Ps
\&.nr Hc 2
.Pe
.LP
With unnumbered headings, remember that the value of
.CW Hc
must be greater than or equal to
.CW Hb
and
.CW Hu .
The heading must be on a line by itself;
therefore you must set a break in
.CW Hb
for that level.
The
.CW Hu
register sets the level
of an unnumbered heading to 2, requiring that
.CW Hc
be at least 2 to have an effect on unnumbered headings.
.PP
There really is no way, using these registers,
to get the first and second levels left justified
and have the rest of the headings centered.
.PP
The number register
.CW Hi
determines the paragraph type for a
heading that causes a line break
.CW Hb ). (
It can be set to one of three values:
.RS
.TS
tab (#);
lf(CW) l l .
0##Left justified
1##Paragraph type determined by \f[CW]Pt\fP
2##Indented to align with first character in heading
.TE
.RE
.LP
If you want to improve the visibility of numbered headings, set
.CW Hi
to 2:
.Ps
\&.nr Hi 2
.Pe
.LP
It produces the following results:
.sp .7v
.SS
.Ps
4.1  Generating Output
.sp
An  Alcuin manuscript  is a computer  representation
that has to be converted for output on various kinds
of devices, including plotters and laser printers.
.sp
.Pe
.SE
.ix %end [.HU] macro ([mm]) %key HU macro mm
.ix %end [.H] macro ([mm]) %key H macro mm
.ix %end [mm] macros, [.HU] macro %key mm macros, HU macro
.ix %end [mm] macros, [.H] macro %key mm macros, H macro
.ix %end [mm] macros, numbered headings %key mm macros, numbered headings
.ix %end [mm] macros, unnumbered headings %key mm macros, unnumbered headings
.sp .8v
.page 167
.
.Bh "Changing the Heading Mark"
.ix %begin [mm] macros, changing~the heading~mark %key mm macros, changing the heading~mark
.LP
Remember how the list-initialization macro
.CW \&.AL
allowed you to change the mark used for a list,
producing an alphabetic list
instead of a numbered list?
These same options are available for headings using the
.CW \&.HM
.ix %begin [.HM] macro ([mm]) %key HM macro mm
.ix %begin [mm] macros, [.HM] macro %key mm macros, HM macro
macro.
.PP
The
.CW \&.HM
macro takes up to seven arguments
specifying the mark for each level.
You can specify the following codes:
.RS
.TS
tab (#);
lf(CW) l l .
1##Arabic
001##Arabic with leading zeros
A##Uppercase alphabetic
a##Lowercase alphabetic
I##Uppercase roman
i##Lowercase roman
.TE
.RE
.LP
With no specified mark,
headings use the default numbering system (arabic).
You can use uppercase alphabetic marks to put
together a series of appendices.
You can specify A for the top level:
.Ps
\&.HM A
.Pe
.LP
and retain the default section numbering
for the rest of the headings.
This could produce sections in the following series:
.Ps
.ft R
A, A.1, A.2, A.2.1, etc.
.ft CW
.Pe
.LP
You can mix marks for an outline style,
similar to the one we
produced using the list macros:
.Ps
\&.HM I A 1 a i
.Pe
.LP
You can use Roman numerals
to indicate sections or parts.
If you specify:
.Ps
\&.HM I i
.Pe
.LP
the headings for the first two levels are marked by roman
numerals.
A third-level heading demonstrates that
the heading mark reverted to arabic by default:
.sp .7v
.SS
.Ps
I.  Quick Tour of Alcuin
.sp
I.i  Introduction to Calligraphy
.sp
I.ii  Digest of Alcuin Commands
.sp
I.ii.1  Three Methods of Command Entry
.sp
.Pe
.SE
.sp .8v
.page 168
.LP
When you use marks consisting of roman numerals
or alphabetic characters,
you might not want the mark of the current level
to be concatenated to the mark of the previous level.
You can suppress concatenation
by setting the number register
.CW Ht
to 1:
.Ps
\&.HM I i
\&.nr Ht 1
.Pe
.LP
Now, each heading in the list has only the mark representing
that level:
.sp .7v
.SS
.Ps
I.  Quick Tour of Alcuin
.sp
i.  Introduction to Calligraphy
.sp
ii.  Digest of Alcuin Commands
.sp
1.  Three Methods of Command Entry
.sp
.Pe
.SE
.ix %end [.HM] macro ([mm]) %key HM macro mm
.ix %end [mm] macros, [.HM] macro %key mm macros, HM macro
.ix %end [mm] macros, altering heading~style %key mm macros, altering heading style
.ix %end [mm] macros, changing~the heading~mark %key mm macros, changing the heading~mark
.ix %end headings, in [mm] %key headings, in mm 
.sp .8v
.
.Ah "Table of Contents"
.ix %begin [mm] macros, table~of~contents %key mm macros, table of~contents
.ix %begin table~of~contents, [mm] macros %key table of~contents, mm macros
.LP
Getting a table of contents easily and automatically is
almost reason enough to justify all the energy, yours and the
computer's, that goes into text processing.
You realize that this is something
that the computer was really meant to do.
.PP
The reason that producing a table of contents seems so easy is
that most of the work happens while setting headings.
That means entering codes to
mark each level of heading and all the
figures, tables, exhibits, and equations.
Processing a table of contents
is simply a matter of telling the formatter to
collect the information that's already in the file.
.PP
There are only two simple codes to put in a file,
one at the beginning and one at the end,
to generate a table of contents automatically.
.PP
At the beginning of the file, set the number register
.CW Cl
to the level of headings
that you want collected for a table of contents.
For example, setting
.CW Cl
to 2 saves first- and second-level headings.
.PP
Place the
.CW \&.TC
.ix [.TC] macro ([mm]) %key TC macro mm
.ix [mm] macros, [.TC] macro %key mm macros, TC macro
macro at the end of the file.
This macro actually does the processing and formatting
of the table of contents.
The table of contents page outputs at the end of a document.
.PP
A sample table of contents page follows.
The header \(lqCONTENTS\(rq
is printed at the top of the page.
At the bottom of the page,
lowercase roman numerals are used as page numbers.
.page 169
.sp .7v
.SS
.UTPSD
.ta 3n \n[.ll]u-15nR
.ft R
.in 5n
\h'173p'CONTENTS
.sp
1.	Quick Tour of Alcuin\*[my_a]\0\01
	1.1  Introduction to Calligraphy\*[my_a]\0\03
	1.2  Digest of Alcuin Commands\*[my_a]\0\08
	1.3  Sample Illuminated Manuscripts\*[my_a]\021

2.	Using Graphic Characters\*[my_a]\031
	2.1  Scaling a Font\*[my_a]\033
	2.2  Modifying Font Style\*[my_a]\037
	2.3  Drawing Your Own Font\*[my_a]\041

3.	Library of Hand-Lettered Fonts\*[my_a]\051
.sp 2
.ce
- i -
.TA
.UTPED
.SE
.sp .8v
.LP
One blank line is output before each first-level heading.
All first-level headings are left justified.
Lower-level headings are indented
so that they line up with the start of
text for the previous level.
.PP
If you have included various displays in your document, and used
the macros
.CW \&.FG ,
.ix %begin [mm] macros, [.FG] macro %key mm macros, FG macro
.ix %begin [.FG] macro ([mm]) %key FG macro mm
.CW \&.TB ,
.ix %begin [mm] macros, [.TB] macro %key mm macros, TB macro
.ix %begin [.TB] macro ([mm]) %key TB macro mm
and
.CW \&.EX
.ix %begin [.EX] macro ([mm]) %key EX macro mm
.ix %begin [mm] macros, [.EX] macro %key mm macros, EX macro
to specify captions and headings for the displays,
this information is collected and output when the
.CW \&.TC
macro is invoked.
A separate page prints for each
list of figures, tables, and exhibits.
For example:
.sp .7v
.SS
.UTPSD
.ll 4i
.ta \n[.ll]u-15nR
.ft R
.in 5n
\h'40p'LIST OF TABLES
.sp 2
TABLE 1. List of Required Resources\*[my_a]\0\07
.sp
TABLE 2. List of Available Resources\*[my_a]\016
.sp
.TA
.UTPED
.SE
.sp .8v
.LP
If you want the lists of displays to be printed immediately
following the table of contents (no page breaks), set
the number register
.CW Cp
to 1.
.PP
If you want to suppress the printing of individual lists,
you can set the following number registers to 0:
.RS
.TS
tab (#);
lf(CW) l l .
Lf##If 0, no figures
Lt##If 0, no tables
Lx##If 0, no exhibits
.TE
.RE
.page 170
.LP
In addition, there is a number register for equations
that is set to 0 by default.
If you want equations marked by
.CW \&.EC
to be listed, specify:
.Ps
\&.nr Le 1
.Pe
.LP
There are a set of strings,
using the same names as the number registers,
that define the titles used for the top of the lists:
.RS
.TS
tab (#);
lf(CW) l l .
Lf##LIST OF FIGURES
Lt##LIST OF TABLES
Lx##LIST OF EXHIBITS
Le##LIST OF EQUATIONS
.TE
.RE
.LP
You can redefine a string using the
.CW \&.ds
.I "define string" ) (
request.
For instance, we can redefine the title for figures
as follows:
.Ps
\&.ds Lf LIST OF ALCUIN DRAWINGS
.Pe
.ix %end [.EX] macro ([mm]) %key EX macro mm
.ix %end [mm] macros, [.EX] macro %key mm macros, EX macro
.ix %end [mm] macros, [.FG] macro %key mm macros, FG macro
.ix %end [.FG] macro ([mm]) %key FG macro mm
.ix %end [mm] macros, [.TB] macro %key mm macros, TB macro
.ix %end [.TB] macro ([mm]) %key TB macro mm
.ix %end [mm] macros, table~of~contents %key mm macros, table of~contents
.ix %end table~of~contents, [mm] macros %key table of~contents, mm macros
.
.Ah "Footnotes and References"
.LP
Footnotes and references present special problems,
as anyone who has ever typed a term paper knows.
Fortunately,
.CW mm
has two pairs of specialized macros.
Both of them follow a marker
in the text, save lines of delimited text,
and outputs them either at the bottom of the page, as a footnote,
or at end of the document, as a reference.
.
.Bh Footnotes
.ix %begin footnotes, [mm] macros %key footnotes, mm macros
.LP
A footnote is marked in the body of a document by the string
.CW \e*F .
It follows immediately after the text (no spaces).
.Ps
in an article on desktop publishing.\\*F
.Pe
.LP
The string
.CW F
supplies the number for the footnote.
.CW Troff )
prints it as a superscript in the text (\c
.CW nroff
prints it normally);
both formatters increment its value with each use.
.PP
The
.CW \&.FS
.ix %begin [mm] macros, [.FS] macro %key mm macros, FS macro
.ix %begin [.FS] macro ([mm]) %key FS macro mm
macro indicates the start, and
.CW \&.FE
.ix %begin [.FE] macro ([mm]) %key FE macro mm
.ix %begin [mm] macros, [.FE] macro %key mm macros, FE macro
the end, of the text for the footnote.
These macros surround the footnote text
that appear at the bottom of the page.
The
.CW \&.FS
macro starts the line immediately following the marker.
.Ps
\&.FS
"Publish or Perish: Start-up grabs early page language lead,"
\\fIComputerworld\\fR, April 21, 1986, p. 1.
\&.FE
.Pe
.LP
You can use labels instead of numbers to mark footnotes.
Specify the label as a mark in the text and as an argument to
.CW \&.FS .
.Ps
\&...in accord with the internal specs.[APS]
\&.FS [APS]
"Alcuin Product Specification," March 1986
\&.FE
.Pe
.page 171
.LP
You can use both numbered and labeled footnotes
in the same document.
The formatters collect all the footnotes
and output them at the
bottom of each page underneath a short line rule.
If you are using
.CW troff ,
the footnote text is set in a type size 2
points smaller than the body copy.
.PP
If you want to change the standard format of footnotes,
specify the
.CW \&.FD
.ix [.FD] macro ([mm]) %key FD macro mm
.ix [mm] macros, [.FD] macro %key mm macros, FD macro
macro.
It controls hyphenation,
text adjustment, indentation, and justification of the label.
.PP
Normally, the text of a footnote is indented from the left
margin and the mark or label is left justified in relation to
the start of the text.
It is possible that a long footnote could
run over to the next page.
Hyphenation is turned off so that a
word will not be broken at a page break.
These specifications
can be changed by giving a value between 0 and 11 as the first
argument with
.CW \&.FD ,
as shown in Table 6-3.
.Ts "\f[CB].FD\fP Argument Values"
.TS
center box;
c c c c c.
			Text	Label
Argument	Hyphenation	Adjust	Indent	Justification
_
\00	no	yes	yes	left
\01	yes	yes	yes	left
\02	no	no	yes	left
\03	yes	no	yes	left
\04	no	yes	no	left
\05	yes	yes	no	left
\06	no	no	no	left
\07	yes	no	no	left
\08	no	yes	yes	right
\09	no	yes	yes	right
10	no	no	yes	right
11	yes	no	yes	right
.TE
.Te
.PP
The second argument for
.CW \&.FD ,
if 1, resets the footnote numbering counter to 1.
Use this at the end of a section or paragraph
to restart the numbering sequence.
If specified by itself, the first argument must be null:
.Ps
\&.FD "" 1
.Pe
.ix %end [.FE] macro ([mm]) %key FE macro mm
.ix %end [mm] macros, [.FE] macro %key mm macros, FE macro
.ix %end [.FS] macro ([mm]) %key FS macro mm
.ix %end [mm] macros, [.FS] macro %key mm macros, FS macro
.ix %end footnotes, [mm] macros %key footnotes, mm macros
.
.Bh "References"
.ix %begin [mm] macros, references %key mm macros, references
.LP
A reference differs from a footnote
in that the formatter collects all references
and prints them on a single page
at the end of the document.
In addition, you can label a reference so that you
can refer to it later.
.page 172
.PP
A reference is marked where it occurs in the text with
.CW \e*(Rf .
The formatter converts the string into a value printed
in brackets, such as [1].
The mark is followed by a pair of
macros surrounding the reference text.
The
.CW \&.RS
.ix %begin [.RS] macro ([mm]) %key RS macro mm
.ix %begin [mm] macros, [.RS] macro %key mm macros, RS macro 
macro indicates the start, and
.CW \&.RF
.ix %begin [.RF] macro ([mm]) %key RF macro mm
.ix %begin [mm] macros, [.RF] macro %key mm macros, RF macro
the end, of the text for the reference.
.Ps
You will find information on this page description language
in their reference manual, which has been published
as a book.\\*(Rf
\&.RS
Adobe Systems, Inc. PostScript Reference Manual.
Reading, Massachusetts: Addison-Wesley; 1985.
\&.RF
.Pe
.LP
You can also give a
.I "string label"
argument to
.CW \&.RS
to assign a string to the current reference number.
You can reference this string later in the document.
For instance, if we specified a
.I "string label"
in the previous example:
.Ps
\&.RS As
.Pe
.LP
We could refer back to the first reference in another place:
.Ps
The output itself is a readable file which you can interpret
with the aid of the PostScript manual.\\*(As
.Pe
.PP
The reference page prints at the end of the document.
The string
.CW Rp
defines the title printed on the reference page.
You can replace \(lqREFERENCES\(rq with another title
by redefining this string with
.CW \&.ds .
.sp .7v
.SS
.UTPSD
.ft R
\h'60p'\fIREFERENCES\fP
.sp 2
.in 5n
1. Adobe Systems, Inc.; PostScript Reference Manual.
   Reading, Massachusetts: Addison-Wesley; 1985.
.sp
.UTPED
.SE
.ix %end [.RF] macro ([mm]) %key RF macro mm
.ix %end [mm] macros, [.RF] macro %key mm macros, RF macro
.ix %end [.RS] macro ([mm]) %key RS macro mm
.ix %end [mm] macros, [.RS] macro %key mm macros, RS macro
.sp .8v
.LP
In a large document, you might want to print a list of
references at the end of a chapter or a long section.
You can invoke the
.CW \&.RP
.ix %begin [.RP] macro ([mm]) %key RP macro mm
.ix %begin [mm] macros, [.RP] macro %key mm macros, RP macro
macro anywhere in a document.
.Ps
\&.RP
\&.H 1 "Detailed Outline of User Guide"
.Pe
.LP
It will print the list of references on a separate page and
reset the reference counter to 0.
You can supply a
.I reset
argument and a
.I paging
argument to change these actions.
The
.I reset
argument is the first value specified with the
.CW \&.RP
macro.
It is normally 0, resetting the reference counter to 1
so that each section is numbered independently.
If you want to maintain reference numbering 
in sequence for the entire document,
specify a value of 1.
.page 173
.PP
The
.I paging
argument is the second value specified.
It controls whether or not a page break occurs
before and after the list.
It is normally set to 0, putting the list on a new page.
Specify a value of 3 to suppress the page break
before and after the list;
this prints the list of references
following the end of the section
and the next section begins
immediately after the list.
A value of 1 suppresses only
the page break that occurs after the list,
and a value of 2 suppresses only the page break
that occurs before the list.
.PP
If you want an effect opposite that of the default settings,
.ix [mm] macros, changing reference~defaults %key mm macros, changing reference defaults
specify:
.Ps
\&.RP 1 3
.Pe
.LP
The first argument of 1 saves the current reference number for
use in the next section or chapter.
The second argument of 3
inhibits page breaks before and after the list of references.
.ix %end [mm] macros, references %key mm macros, references
.ix %end [.RP] macro ([mm]) %key RP macro mm
.ix %end [mm] macros, [.RP] macro %key mm macros, RP macro
.
.\" --------------------------------------------
.Ah "Extensions to \f[CB]mm\fP"
.ix [mm] macros, extensions~to %key mm macros, extensions to
.LP
So far, we have covered most but not all of the features of the
.CW mm
macro package.
.PP
We have not covered the Technical Memorandum macros,
a set of specialized macros
for formatting technical memos and reports.
Like the ones in the
.CW ms
macro package, these macros
were designed for internal use at AT&T's Bell Laboratories,
reflecting a company-wide set of standards.
Modify these macros before using them.\**
.FS
.CW Groff
makes the Technical Memorandum cover pages available, often under
.CW /usr/local/share/groff/\c
.I version \c
.CW /tmac/mm .
You can modify them as needed for your site.
.FE
The Technical Memorandum macros are a good example
of employing a limited set of user macros
to produce a standard format.
Seeing how they work is especially important
to those who are responsible for implementing
documentation standards for a group of people,
some of whom understand the basics of formatting
and some of whom do not.
.PP
Writing or rewriting macros is only one part of the process of
.ix [mm] macros, modifying %key mm macros, modifying
customizing
.CW mm .
The
.CW mm
macros were designed as a comprehensive formatting system.
As we've seen, there are even macros to replace
common primitive requests like
.CW \&.sp .
The developers of
.CW mm
recommend, in fact, that you not use
.CW nroff
or
.CW troff
requests unless absolutely necessary, lest you interfere with
the action of the macros.
.PP
Furthermore, as you will see if you print out the
.CW mm
macros, the internal code of
.CW mm
is extraordinarily dense, and uses
extremely un-mnemonic register names.\**
.FS
This is less true for
.CW groff \&'s
version of
.CW mm ,
as it was written as a ground-up work-alike using
.CW groff
extensions such as long names.
It also assumes the limitations
of 40-year old hardware no longer apply.
.FE
This makes it difficult for all but the most experienced user
to modify the basic structure of the package.
You can add your own macros,
as long as they don't conflict
with existing macro and number register names,
but you can't easily go in and change
the basic macros that make up the
.CW mm
package.
.PP
At the same time, the developers of
.CW mm
made it possible
for the user to make selective modifications\[em]those which
.CW mm
has allowed mechanisms for in advance.
There are two such mechanisms:
.RS
.Ls B
.Li
.CW mm 's
use of number registers to control all aspects of
.ix [mm] macros, number~registers %key mm macros, number registers
.ix number~registers, [mm] %key number registers, mm
document formatting
.Li
.CW mm 's
invocation of undefined (and therefore user-definable)
macros at various places in the
.ix macros, defining
.CW mm
code
.Le
.RE
.page 174
.LP
The
.CW mm
package is very heavily parameterized.
Almost every feature of the formatting system\[em]from
the fonts in which
.ig
	in the next line, the original printed book read:
	"levels of heading".  It should be "headings", I think.
	However, I have left it as is since I am not sure.
	--Michael Hobgood
..
different levels of heading are printed
to the size of indents
and the amount of space above and below displays\[em]is controlled
by values in number registers.
By learning and modifying these number registers,
you can make significant changes to
the overall appearance of your documents.
.PP
In addition, there are a number of values stored in strings.
These strings are used like number registers to supply
default values to various macros.
.PP
The registers you are most likely to want to change follow.
Registers marked with a dagger can only be changed on the
command line with the
.CW -r
option (e.g.,
.CW -rN4 ).
.TA
.RS
.TS
tab (#);
lf(CW) l l lw (4.5i) .
Cl###T{
Level of headings saved for table of contents.
See
.CW \&.TC
macro.
Default is 2.
T}
.sp 4p
Cp###T{
If set to 1, lists of figures and tables
appear on the same page as the table of contents.
Otherwise, they start on a new page.
Default is 1.
T}
.sp 4p
Ds###Sets the pre- and post-space used for static displays.
.sp 4p
Fs###Vertical spacing between footnotes.
.sp 4p
Hb###T{
Level of heading for which a line break occurs
before output of body text.
Default is 2.
T}
.sp 4p
Hc###T{
Level of heading for which centering occurs.
Default is 0 (disabled).
T}
.sp 4p
Hi###T{
Indent type after heading.
Default is 1 (paragraph indent).
.\" XXX test: does this or Pt take precedence?
Legal values are:
0=left justified;
1=indented;
2=indented except after
.CW \&.H ,
.CW \&.LC ,
.CW \&.DE .
T}
.sp 4p
Hs###T{
Level of heading for which space after heading occurs.
Default is 2,
i.e., space occurs after first- and second-level headings.
T}
.sp 4p
Hy###T{
Sets hyphenation.
.\" XXX can't be set from command line, at least by groff.
If set to 1, enables hyphenation.
Default is 0.
T}
.sp 4p
L\(dg###Sets length of page.  Default is 66v.
.sp 4p
Li###Default indent of lists.  Default is 5.
.sp 4p
Ls###T{
List spacing between items by level.
Default is 6, which is spacing between all levels of list.
T}
.sp 4p
N\(dg###T{
Page numbering style.
0=all pages get header;
1=header printed as footer on page 1;
2=no header on page 1;
3=section page as footer;
4=no header unless
.CW \&.PH
defined;
5=section page and section figure as footer.
Default is 0.
T}
.sp 4p
Np###T{
Numbering style for paragraphs.
0=unnumbered; 1=numbered.
T}
.sp 4p
O###T{
Offset of page.
For
.CW nroff ,
this value is an unscaled number representing character positions.
(Default is 9 characters; about .75i).
For
.CW troff ,
this value is scaled (.5i).
T}
.sp 4p
.page 175
Of###T{
Figure caption\ style.
0=period separator;
1=hyphen separator.
Default is 0.
T}
.sp 4p
Pi###T{
Amount of indent for paragraph.
Default is 5 for
.CW nroff ,
3n for
.CW troff .
T}
.sp 4p
Ps###T{
Amount of spacing between paragraphs.
Default is 3v.
.\" XXX test: that doesn't sound right. Maybe 0.3v?
T}
.sp 4p
Pt###Paragraph type.  Default is 0.
.sp 4p
S\(dg###T{
Default point size for
.CW troff .
Default is 10.
Vertical spacing is \f[CW]\\nS+2\fP.
T}
.sp 4p
Si###T{
Standard indent for displays.
Default is 5 for
.CW nroff ,
3 for
.CW troff .
T}
.sp 4p
W###T{
Width of page (line and title length).
Default is 6i in
.CW troff ,
60 characters in
.CW nroff .
T}
.sp 4p
.TE
.RE
.ig
Just to make it clear... I'm not terribly fond of
the multiple blank columns method of formatting
tables. However, it's everywhere it's everywhere so
there's no real profit in changing it back. I'm
going to request a "column width as percentage of
line width" option for gtbl, so maybe we can avoid
that kind of thing in the future. --LK
..
.PP
There are also some values that you would expect to be kept
in number registers that are actually kept in strings:
.ix [mm] macros, strings %key mm macros, strings
.ix strings, [mm] %key strings, mm
.RS
.TS
tab (#);
lf(CW) l l lw (4.5i) .
HF###Fonts used for each level of heading (1=roman, 2=italic, 3=bold)
HP###Point size used for each level of heading
.TE
.RE
.PP
For example, placing the following register settings at the
start of your document:
.Ps
\&.nr Hc 1
\&.nr Hs 3
\&.nr Hb 4
\&.nr Hi 2
\&.ds HF 3 3 3 3 3 2 2
\&.ds HP 16 14 12 10 10 10 10
.Pe
.LP
has the following effects:
.RS
.Ls B
.Li
Top-level headings (generated by
.CW \&.H1 )
are centered.
.Li
The first three levels of heading are followed by a
blank line.
.Li
The fourth-level heading are followed by a break.
.Li
Fifth- through seventh-level headings are run-in with
the text.
.Li
All headings have the following text indented under
the first word of the
heading, so that the section number hangs in the margin.
.Li
The first five levels of heading use bold type;
the sixth and seventh use italic.
.Li
A first-level heading prints in 16-point type;
a second-level heading in
14-point type; a third-level heading in 12-point type; and
all subsequent levels
in 10-point type.
.Le
.RE
.page 176
.LP
There isn't space in this book for a comprehensive discussion
of this topic.
However, a complete list of user-settable
.CW mm
number registers is given in Appendix B.
Study this list,
along with the discussion of the relevant macros, and you will
begin to get a picture of just how many facets of
.CW mm
you can
modify by changing the values in number registers and strings.
If you are using
.CW groff ,
the
.CW groff_mm
manual page has a long list of extended registers and strings
to aid with localization and letter writing.
.PP
The second feature\(emthe provision of so-called \(lquser exit macros\(rq
.ix [mm] macros, user~exit %key mm macros, user exit
.ix user exit macros ([mm]) %key user exit macros mm
at various points\(emis almost as ingenious.
The following macros
are available for user definition:
.Ps
\&.HX .HY .HZ .PX .TX .TY
.Pe
.LP
The
.CW \&.HX ,
.CW \&.HY ,
and
.CW \&.HZ
macros are associated with headings.
.ix [mm] macros, headings %key mm macros, headings
The
.CW \&.HX
.ix [.HX] macro ([mm]) %key HX macro mm
.ix [mm] macros, [.HX] macro %key mm macros, HX macro
macro is executed at the start of each heading macro,
.CW \&.HY
.ix [.HY] macro ([mm]) %key HY macro mm
.ix [mm] macros, [.HY] macro %key mm macros, HY macro
in the middle (to allow you to respecify any settings,
such as temporary indents, that were lost because of
.CW mm 's
own processing), and
.CW \&.HZ
.ix [.HZ] macro ([mm]) %key HZ macro mm
.ix [mm] macros, [.HZ] macro %key mm macros, HZ macro
at the end.
.PP
By default, these macros are undefined.
And, when
.CW troff
encounters an undefined macro name, it simply ignores it.
These macros thus lie hidden in the code until you define them.
By defining these macros, you can supplement the processing of
headings without actually modifying the
.CW mm
code.
Before you define these macros, be sure to study the
.CW mm
documentation for details of how to use them.
.PP
Similarly,
.ix [mm] macros, page~transition %key mm macros, page transition
.ix page~transition
.CW \&.PX
.ix [.PX] macro ([mm]) %key PX macro mm
.ix [mm] macros, [.PX] macro %key mm macros, PX macro
is executed at the top of each page, just after
.ix [mm] macros, top-of-page processing %key mm macros, top-of-page processing
.CW \&.PH .
Accordingly, it allows you to perform additional
top-of-page processing.
(In addition, you can redefine the
.CW \&.TP
.ix [.TP] macro ([mm]) %key TP macro mm
.ix [mm] macros, [.TP] macro %key mm macros, TP macro
macro, which prints the standard header, because this macro
is relatively self-contained).
.PP
There is a slightly different mechanism for generalized
bottom-of-page processing.
.ix [mm] macros, bottom-of-page processing %key mm macros, bottom-of-page processing
Use the
.CW .BS /\c
.CW .BE
.ix [.BS] macro ([mm]) %key BS macro mm
.ix [.BE] macro ([mm]) %key BE macro mm
.ix [mm] macros, [.BS] macro %key mm macros, BS macro
.ix [mm] macros, [.BE] macro %key mm macros, BE macro
macro pair to enclose text printed at the bottom of each page,
after any footnotes but before the footer.
To remove this text after you have defined it,
specify an empty block.
.PP
The
.CW \&.VM
.ix [.VM] macro ([mm]) %key VM macro mm
.ix [mm] macros, [.VM] macro %key mm macros, VM macro
.I "vertical margins" ) (
.ix [mm] macros, vertical margins %key mm macros, vertical margins
macro allows you to specify additional space at
the top of the page, bottom of the page, or both.
For example:
.Ps
\&.VM 3 3
.Pe
.LP
adds three lines each to the top and bottom margins.
The arguments to this macro should be unscaled.
The first argument
applies to the top margin, the second to the bottom.
.PP
The
.CW \&.TX
.ix [.TX] macro ([mm]) %key TX macro mm
.ix [mm] macros, [.TX] macro %key mm macros, TX macro
and
.CW \&.TY
.ix [.TY] macro ([mm]) %key TY macro mm
.ix [mm] macros, [.TY] macro %key mm macros, TY macro
macros let you control the appearance of
the table of contents pages.
.ix [mm] macros, table~of~contents %key mm macros, table of~contents
The
.CW \&.TX
macro executes at the
top of the first page of the table of contents, above the title;
.CW \&.TY
executes in place of the standard title (\(lqCONTENTS\(rq).
.PP
Chapter 14 shows you how to write macro definitions,
which should give you the information you need
to write these supplementary
\(lquser exit macros.\(rq
