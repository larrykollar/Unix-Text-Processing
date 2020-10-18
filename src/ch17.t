.ig
	Typed by: Michael Hobgood
	Marked up by: Michael Hobgood
	Proofed on: 31 Oct 2002
..
.de ch17@start
.br
.ev ch17
.ll 6i
.po 1i
.in 0
.ps 10
.vs 12
.ft R
.fi
..
.de ch17@end
.br
.fc
.tc
.ta T 5n
.po 1i
.ev
..
.de TOPHAT
.br
\\L'\\$1p'\\v'-(\\$1p-2.5p)'\\l'1i'\\h'4i'\\l'1i'\\v'-2.5p'\\L'\\$1p'
..
.so utp.mac
.utp
.page 509
.ix %begin extended [ms] macros %key extended ms macros
.Se 17 "An Extended \f[CB]ms\fP Macro Package" "Chapter" 1
.LP 0
In the previous chapter, we've looked at some of the essential
elements of a macro package\(emthe innards that make
it tick.
However, few people will write a macro package just because
they think they can do a better job at the basics than
.CW ms
or
.CW mm .
More often, users who need specific formatting effects will
build a macro set to achieve those effects.
.PP
The macros used to produce this book are a good example
of a custom macro package.
They were developed to create a distinctive and consistent
style for a series of books on UNIX by different authors.
Although this macro package must of course do all of the
basics we've talked about, many of its macros provide
solutions to more specific problems.
For example, there are macros for showing side-by-side
before and after screens for
.CW vi
and macros for inserting italicized commentary in examples.
.PP
To illustrate more concretely the issues that force you to
create or significantly extend a macro package, this chapter
will look at a set of extended
.CW ms
macros for typesetting technical manuals.
Extensions built into this package fall into two major
categories:
.RS
.Ls B
.Li
Extensions that make it easier to control the appearance
of a document, particularly the page size (described in the
last chapter) and the style of section headings, tables,
and figures.
.Li
Extensions that address needs of books, manuals, and
other documents larger than the technical papers that
.CW ms
and
.CW mm
were originally designed for.
These extensions include improved methods for handling
tables of contents and indexes.
.Le
.RE
.PP
One of the chief weaknesses of the
.CW ms
and
.CW mm
packages is that they were designed for smaller documents.
For example,
.CW ms
does not provide table of contents generation, and the
approach used by
.CW mm
is suitable only for short documents.
Neither package supports automatic index generation.
In this chapter and the next, we will also look at
ways to redress these problems.
.page 510
.Ah "Creating a Custom Macro Package"
In this chapter, we will present an extended macro package
designed for technical documentation.
Based on the
.CW ms
macro package, these extensions were originally developed
by Steve Talbott of Masscomp; they have been extended and
altered during several years of use in our technical writing
and consulting business.
Because we needed to produce technical manuals for a number
of different clients, we needed a macro package that
allowed us the flexibility to achieve a variety of
document formats.
.PP
An important step in implementing this package was to
establish the relation of new and redefined macros to the
original
.CW ms
package.
We wanted to read in the standard
.CW tmac.s
package, and then simply overwrite or remove unwanted macros.
Then we organized our extensions into three groups:
redefinitions of standard
.CW ms
macros, common macros we added to provide specific features
or capabilities for all documents, and format macros that
were most often used to control the appearance or
structure of a document.
.PP
The format macros can be modified for the specifications
of a unique document format.
Each format design has its own file, and the user only
needs to specify which of these formats are to be read in
during the formatting run.
.PP
Following is a summary of the steps we followed to
implement our
.CW mS
macro package.
While describing this implementation, we don't pretend that
it is unique or right for all uses; we do hope that it
suggests ways to set up your own custom package.
.RS
.Ls N
.Li
Create a new directory to store the macro files.
.Li
Make a working copy of
.CW tmac.s
and any subordinate files it reads in, moving them to a
new directory.
.Li
Create the
.CW tmac.Sredefs
file to contain definitions of standard
.CW ms
macros that we've redefined, such as
.CW \&.VIZ .
.Li
Create the
.CW tmac.Scommon
file to contain utility and feature macros available in
all formats.
The list macros described in this chapter are kept here.
.Li
Create separate files containing definitions for unique
document formats.
.Li
Set up
.CW tmac.S
to control which files are read in and to handle certain
parameters that might be set from the command line.
.Li
Put
.CW tmac.S
in
.CW /usr/lib/tmac ,
either by placing the file in that directory or by
creating a
.CW tmac.S
file that sources the
.CW tmac.S
file in the macro directory.
.Le
.RE
The master file of this package is
.CW tmac.S ,
although it does not contain any macro definitions.
It allows users to set some parameters from the command
line, and then it reads in the standard
.CW ms
macro package and the two files that contain redefinitions
and common macros.
Last, it checks the value of a number register (\c
.CW v )
to determine which group of format macros are to be read in.
.page 511
.ix extended [ms] macros, structure~of %key extended ms macros, structure of
Here's what our
.CW tmac.S
file looks like:
.Ps
\&.\\" tmac.S \(em the main format macro package
\&.
\&.so /work/macros/tmac.s		\\" Read in standard ms
\&.so /work/macros/tmac.Sredefs	\\" Redefinitions of macros
\&.so /work/macros/tmac.Scommon	\\" Common utility macros
\&.					\\" Check register v for version
\&.					\\" and read in special format macros
\&.ie \\nv \\{\\
\&.if \\nv=9 .so /work/macros/tmac.Stest
\&.if \\nv=8 .so /work/macros/tmac.Squickref
\&.if \\nv=7 .so /work/macros/tmac.Slarge
\&.if \\nv=6 .so /work/macros/overheads
\&.if \\nv=5 .so /work/macros/tmac.Straining
\&.if \\nv=4 .so /work/macros/tmac.Sprime
\&.if \\nv=3 .so /work/macros/tmac.Scogx
\&.if \\nv=2 .so /work/macros/tmac.Smanuals
\&.if \\nv=1 .so /work/macros/tmac.Snutshell\\}
\&.el .so /work/macros/tmac.Sstandard
.Pe
.ix extended [ms] macros, invoking %key extended ms macros, invoking
The
.CW -r
option to
.CW nroff
and
.CW troff
is used to select a particular version of the format macros.
For instance, the first set of format macros is designed
for producing our Nutshell Handbooks.
To format a document using the macros defined in
.CW tmac.Snutshell ,
a user would enter:
.Ps
$ \f[CB]ditroff -Tps -mS -rv1 ch01 | devps | lp\fP
.Pe
One of the files,
.CW tmac.Stest ,
is available for use during the development and testing
of new versions of the macros.
We'll look at some of the different formats later in
this chapter.
.PP
A few other details about this implementation may help
you customize a package.
Both
.CW ms
and
.CW mm
include a number of Bell-specific macros that are not very
useful for users outside of AT&T.
For example, it is unlikely that you will require the
various styles of technical memoranda used internally
at Bell Labs.
Unused macro definitions need not get in your way, but
they do use up possible names and number registers that
may conflict with what you want to do.
.ix [.rm] request %key rm request
.ix [troff] formatter, [.rm] request %key troff formatter, [.rm] request
The
.CW \&.rn
macro allows you to rename a macro;
.CW \&.rm
will remove the definition of a macro.
.PP
You may want to remove selected macros.
For example, you might want to start the modifications to
a macro package built on
.CW ms
with the following request:
.Ps
\&.rm TM IM MF MR EG OK RP TR S2 S3 SG IE [] ][ [. .] [o \\
[c [5 [4 [3 [2 [1 [0 [< ]< [> ]> [- ]-
.Pe
(Note the use of the backslash to make this apparent
two-line request into a single long line).
.PP
There is a slight performance loss in reading in a large
macro package, and then removing a number of the macros.
For efficiency, you'd be better off removing the
undesirable macros from your copy of the
.CW ms
source file.
.page 512
.PP
Reading in
.CW tmac.Sredefs
after
.CW tmac.s
overwrites some of the standard
.CW ms
macros with our own definitions.
The standard versions are thus not available.
If you want to retain a standard macro definition, you can
make it available under a different name.
.ix [.rn] request %key rn request
.ix [troff] formatter, [.rn] request %key troff formatter, [.rn] request
Use the
.CW \&.rn
request to rename the standard macro before overwriting its
definition.
.PP
As discussed in the previous chapter, we redefined the
.CW \&.IZ
macro to allow the setting of various page sizes.
Because the standard
.CW \&.IZ
macro is invoked from
.CW tmac.s
at the start of the formatting run, we can't simply
overwrite its definition.
We must either delete the standard
.CW \&.IZ
macro definition or comment out its invocation.
Then the new
.CW \&.IZ
macro in
.CW tmac.Sredefs
will be executed.
.PP
As you develop your own set of extensions, you will
undoubtedly consider additional modifications.
Appendix F lists the set of extended macros that we use.
You may not need many of the specialized macros provided
in this package.
But it will show you how to build on an existing package
and how easy it is to modify the appearance of a document.
.Ah "Structured Technical Documents"
The
.CW ms
and
.CW mm
packages provide a number of macros to produce title pages,
abstracts, and so on for technical memoranda.
Subsections can be numbered or unnumbered.
.PP
Anyone who has used the
.I "UNIX Programmers' Manual"
is familiar with the output of these packages.
The technical papers collected in that volume bear
superficial resemblance to the chapters of a book.
However, they lack continuity\(emsection,
figure, and table numbers, where present, are
relative only to the current section, not to the entire
volume.
.PP
A macro package designed for producing technical books
or manuals may need at least some modification to produce
.ix section headings
section headings.
Chapter and section headings should make the structure of
a document visible.
In a nontechnical book, chapters are often the only major
structural element.
They divide the book into major topics, and give readers
stopping points to digest what they have read.
.PP
Chapters are usually distinguished from a formatting point
of view by a page break and some kind of nonstandard
typesetting.
For example, a chapter number and title may be set in large
type, and the text may begin lower on the page.
.PP
In technical books and manuals, which are often not read
straight through as much as they are used for reference,
frequent section headings within a chapter give the reader
guideposts.
There are often several levels of heading\(emmore
or less depending on whether the book is intended
primarily for reading or for reference.
This book uses three levels of heading within a chapter,
one for major changes in topic, the others for
less significant changes.
.PP
Section headings can be distinguished merely by type font
and size changes, as in this book, or by section numbering
as well.
Properly used, section numbers can be very helpful in a
technical manual.
They allow detailed cross references to different parts
of the book without using page numbers.
Referencing by page numbers can result in error because
page numbers are not fixed until the book is done.
.page 513
.PP
Detailed breakdown of a chapter into subsections can also
help the writer of a technical manual.
Because a manual (unlike an essay or other free-form work
of non-fiction) has definite material that must be covered,
it can be written successfully from an outline.
It is often possible to write technical material by
entering the outline in the form of section and subsection
headings and then filling in the details.
.PP
In this approach, numbered sections also have a place
because they make the outline structure of the document
more visible.
In reviewing technical manuals, we can often identify
many weaknesses simply by looking at the table of contents.
Sections in a technical manual should be hierarchical, and
the table of contents should look effective
.I "as an outline" .
For example, a chapter in our hypothetical
.I "Alcuin User's Guide"
might look like this:
.Ps
Chapter Two: Getting Started with Alcuin
.sp 1v
2.1\0\0\0\0Objectives of this Session
.sp 1v
2.2\0\0\0\0Starting Up the System
2.2.1\0\0\0\0Power-up Procedure
2.2.2\0\0\0\0Software Initialization
.sp 1v
2.3\0\0\0\0Creating Simple Glyphs
2.3.1\0\0\0\0Opening Font Files
2.3.2\0\0\0\0Using the Bit Pad
2.3.2.1\0\0\0\0The Cell Coordinate System
2.3.2.2\0\0\0\0Pointing and Clicking
\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0.
\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0.
\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0.
.Pe
How much easier it is to see the structure than in a case
where the proper hierarchical arrangement of topics has
not been observed.
How often have you seen a \(lqflat\(rq table
of contents like this:
.Ps
Chapter Two:  Using Alcuin
.sp 2v
2.0    Starting Up the System
2.1    Power-up Procedure
2.2    Software Initialization
2.3    Creating Simple Glyphs
2.4    Opening Font Files
2.5    Using the Bit Pad
2.6    The Cell Coordinate System
2.7    Pointing and Clicking
\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0.
\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0.
\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0.
.Pe
.page 514
.ix %begin headings, in~extended~[ms] %key headings, in extended~ms
.ix numbered headings
Even when numbered section headings are not appropriate,
they can be a useful tool for a writer during the draft
stage, because they indicate where the organization has
not been properly thought through.
For example, we often see manuals that start with a general
topic and then describe details, without a transitional
overview.
.PP
A macro package should allow the writer to switch between
numbered and unnumbered headings easily.
Both
.CW mm
and
.CW ms
do provide this capability, and we want to include it in
our macros.
However, we also want to include more flexibility than
either of these packages to define the format of headings.
.PP
Because headings are the signposts to the book's structure,
changing their appearance can make a big difference in
how the book is read.
Different levels of headings need to stand out from the
text to a greater or lesser degree, so that readers can
easily scan the text and find the topic that they want.
.PP
The mechanisms for emphasis (in
.CW troff )
are font and size changes, and the amount of space before
and after a heading.
Underlining and capitalization can also be used (especially
in
.CW nroff
but also in
.CW troff )
for alternate or additional emphasis.
.PP
.ix extended [ms] macros, chapter headings %key extended ms macros, chapter headings
In our package, we include five levels of heading: a
chapter-level heading and four levels of numbered or
unnumbered subsection headings.
.PP
As described in the previous section, our custom macro
package incorporates several different versions of the
basic macros required to produce technical documents.
In each version, the name of the heading macro is the
same, but its definition is modified slightly to produce
a different appearance.
These different versions help us conform to the document
styles used by our clients.
Whenever we have a client who needs a new format, we
customize the macro definitions, rather than add
new macros.
.PP
The beauty of this approach is that the input macros the
user needs to enter in a document are identical, or
nearly so.
Thus, we don't increase the number of new macros that
our users must learn, and it eliminates the recoding
of existing documents to achieve a new format.
.PP
This approach is also useful when you support different
types of output devices.
Originally, our designs were developed for the HP LaserJet
printer, which supports a limited set of fonts and sizes.
When we purchased an Apple LaserWriter and Linotronic L100
typesetter, our formatting options increased, making
available multiple fonts and variable point sizes.
In an environment supporting multiple types of printers,
you might want to adapt formats for specific printers.
.Bh "The Chapter Heading"
The chapter heading is in a class by itself, because it
requires more emphasis than subsection headings, and because
the macro that produces it may need to initialize or reset
certain registers used within the chapter (such as section,
figure, or table numbers).
.PP
In an arbitrary reversal of terminology, we call our
chapter macro
.CW \&.Se
.I section ). (
It could just as well be called
.CW \&.CH
for chapter, but we use
.CW \&.Ch
for a subsection heading (as we'll see in a moment) and
want to avoid confusion.
In addition, this macro can be used for appendices as well
as chapters, so the more general name seems appropriate.
.PP
The chapter heading has three major parts:
.page 515
.RS
.Ls B
.Li
chapter-specific register initialization, including registers
for section numbering, table and figure numbering, and
page numbering
.Li
appearance of the actual chapter break
.Li
table of contents processing
.Le
.RE
Because this is a long macro definition, let's look at
it in sections.
.Ps
\&.de Se				\\" section; $1 = number; $2 = name;
\&.				\\" $3 = type (Chapter, Appendix, etc)
\&.				\\"
\&.				\\" 1. Number Register Initialization
\&.				\\"
\&.ie !"\\\\$1"" \\{.		\\" Test for sect number
\&.	nr sE \\\\$1		\\" Assign to register sE
\&.	if !\\\\n(sE \\{.	\\" Test if not a numeric
\&.		.af sE A	\\" Handle appendices
.	\" Note:
.	\" does the above line have one too many dots?
\&.		if "\\\\$1"A" .nr sE 1
\&.		if "\\\\$1"B" .nr sE 2
\&.		if "\\\\$1"C" .nr sE 3
\&.		if "\\\\$1"D" .nr sE 4
\&.		if "\\\\$1"E" .nr sE 5
\&.		if "\\\\$1"F" .nr sE 6
\&.		if "\\\\$1"G" .nr sE 7
\&.		if "\\\\$1"H" .nr sE 8
\&.		if "\\\\$1"I" .nr sE 9
\&.		if "\\\\$1"J" .nr sE 10\\}\\}
\&.				\\" Only go as far as J
\&.el \\{\\
\&.	nr sE 0
\&.	tm Preface or if Appendix past letter J:
\&.	tm	Set number register sE to position
\&.	tm	of that letter in the alphabet
\&.	tm	and alter register format:
\&.	tm	 For Appendix K, enter:
\&.	tm	  .Se K "Title"
\&.	tm	  .nr sE 11
\&.	tm	  .af sE A
\&.\\}
\&.if \\\\n%>1 .bp		\\" Check if consecutive sections
\&.				\\" in same file and break page
\&.nr % 1			\\" Now reset page number
\&.nr PN 1
\&.af PN 1
\&.ie !"\\\\$1"" \\{.		\\" Test for sect number
\&.				\\" to set page number type
.page 516
\&.	ds NN \\\\\\\\n(sE-\\\\\\\\n(PN
\&.	ds H1 \\\\n(sE		\\" Set for subsection numbering
\&.	\\}
\&.el \\{
\&.	ds NN \\\\\\\\n(PN
\&.	nr sE 0\\}
\&.ds RF \\\\\\\\*(NN		\\" Assign page number to footer
\&.nr fG 0			\\" Initialize figure counter
\&.nr tB 0			\\" Initialize table counter
.Pe
The macro first initializes a number of registers.
Chapters are usually numbered on the first page, along
with the title.
If subsections are to be numbered, the chapter number is
the root number for all headings.
We need to take this number as an argument, and store
it into a register for later use.
.PP
Because appendices are usually lettered rather than numbered,
we also need to consider the special case of appendices.
(This could be done with a separate macro; however, this
package uses a single multipurpose macro).
The code for this is quite cumbersome, but works nonetheless:
if the first argument to the macro is non-numeric, it is
tested to see if it is one of the first ten letters in
the alphabet.
If so, a number is stored into the register, but the
output format is changed to alphabetic.
.PP
If the argument is not a letter between A and J, a message
is printed.
This message is more verbose than you would generally want
to use, but it is included to make the point that you
can include detailed messages.
.PP
The macro next sets up the special page numbering scheme
used in many computer manuals\(emthe chapter
number is followed by a hyphen and the page
number (e.g., 1-1).
This numbering scheme makes it easier to make last minute
changes without renumbering and reprinting the entire book.
.PP
Finally, the macro initializes counters for automatically
numbering figures and tables.
We'll see how these are used in a few pages.
.PP
The next portion of the macro is the part that is most
variable\(emit controls the actual
appearance of the chapter heading.
This is the part of the macro that has led us to develop
several different versions.
.PP
In designing chapter headings, let your imagination be your
guide.
Look at books whose design you like, and work from there.
Three different designs we used on the HP LaserJet
are shown in Figure 17-1.
(These designs are a compromise between aesthetics and the
capabilities of the output device).
This book is another model.
.ig
	In Figure 17-1, the code O'Reilly gives that supposedly
	produces the examples in part 1 and part 2, _will_not_
	produce what is on his printed page.  Check the fonts
	used in part 1 and part 2 (in the original book). They
	are different.  So, by experimenting, I came up with
	using HB for the first example.  It seems to be the
	closest of what groff offers.
	--Michael Hobgood
..
.page 517
.Fs 0 F
.ch17@start
.ad l
.nf
.TOPHAT 80
.ps 14
.vs 16
.sp 2v
.in 5n
\f[HB]CHAPTER 2
GETTING STARTED WITH ALCUIN\fP
.br
.ll 5.5i
.Hl
.ll 6i
.in 0
.sp 3v
.ps 10
.vs 12
.TOPHAT 80
.ig
	Look closely at O'Reillys output on page 517. There
	is no way that it was printed in 24 point type. However,
	his macro claims that it was. Therefore, I used the
	values in his macro rather than attempt to adjust down
	in size to match the original output.
..
.ps 24
.vs 26
.sp 1v
.fi
.ll 5.5i
.ad r
\f[B]2
.br
.ps 20
.vs 22
Getting Started with Alcuin\fP
.sp 2v
.ll 6i
.ps 10
.vs 12
.TOPHAT 80
.ig
	The point size and vertical spacing for the first two
	parts are given in the text.  The third one isn't, so
	I have selected sizes which seem to give output that
	matches the original book.
..
.sp 2v
.ps 14
.vs 26
.ce 2
\f[B]Chapter 2
.ps 16
.vs 18
Getting Started with Alcuin\fP
.vs 12
.sp 2v
.ad b
.ch17@end
.Fe "Some Different Styles of Chapter Heading"
.PP
The macro for the first heading in Figure 17-1 is used
as follows:
.Ps
\&.Se 2 "Getting Started with Alcuin"
.Pe
or:
.Ps
\&.Se A "Summary of Alcuin Drawing Primitives" "Appendix"
.Pe
The heading starts on a new page.
If a third argument is not present, it is assumed that the
section type is
.I Chapter ,
and the section is labeled accordingly.
An alternate section type can be specified in the optional
third argument.
This argument is usually
.I Appendix
but can be any string the user wants printed before the
section number.
.page 518
.ix %begin extended [ms] macros, chapter headings %key extended ms macros, chapter headings
.PP
The portion of the macro definition that creates the
first heading in Figure 17-1 follows:
.Ps
\&.\\" Part 2 of Se Macro: Output chapter heading
\&.RT
\&.in 0
\&.lg 0				\\" Disable ligature before .tr
\&.				\\" Translate title to uppercase
\&.tr aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ
\&.sp
\&.na
\&.				\\" Test for section type argument
\&.ie !"\\\\$3"" .ds cH \\\\$3
\&.el .ds cH Chapter		\\" Default is chapter
\&.				\\" If section number supplied
\&.				\\" output section number and type
\&.				\\" in 14 pt. bold.
\&.if !"\\\\$1"" \\{\\
\&\\s14\\f3\\\\*(cH \\\\$1\\f1\\s0
\&\\}
\&.				\\" If no section number but
\&.				\\" there is a type (i.e., Preface)
\&.				\\" then output section type
\&.if "\\\\$1"" .if !"\\\\$3"" \\{\\
\&\\s14\\f3\\\\*(cH\\f1\\s0
\&\\}
\&.sp 5p
\&.				\\" Test for section title
\&.				\\" Print it in 14 pt. bold
\&.if !"\\\\$2"" \\{\\
\&\\s14\\f3\\\\$2\\f1\\s0
\&\\}
\&.sp 6p
\&.ad b
\&.Hl				\\" Draw line
\&.				\\" Retranslate arguments
\&.tr aabbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyyzz
\&.sp 3
\&.ns				\\" Enable no-space mode
.Pe
There are a couple of points you may want to note about
this code:
.RS
.Ls B
.Li
The actual section title, as specified in the second argument,
is forced to all uppercase using the
.CW \&.tr
request.
.Li
.ix extended [ms] macros, drawing horizontal~lines %key extended ms macros, drawing horizontal lines
The horizontal line under the title is drawn using a utility
macro called
.CW \&.Hl
.I "horizontal line" ), (
which simply draws a line the width of the page, less any
indent that is in effect:
.page 519
.sp
.nf
.ft CW
.ti +5n
\&.de Hl  \\" Horizontal line. $1 = underline char
.ti +5n
\&.br
.ti +5n
\&\\l'\\\\n(.lu-\\\\n(.iu\\&\\\\$1'
.ti +5n
\&.br
.ti +5n
\&..
.fi
.ft P
.Li
.ix no-space mode
No-space mode is turned on at the end of the macro, to
inhibit inconsistent spacing caused by users placing
spacing requests or paragraph macros after the
.CW \&.Se
macro.
All of the heading macros use this technique because
inconsistent spacing around heading will give the page
an uneven look.
.Le
.RE
.PP
An alternate definition for this section of the macro follows.
This code produces the heading in Figure 17-1.
.Ps
\&.\\" Part 2 of Se Macro (Alternate):
\&.ad r			\\" Right justified
\&.fl
\&.rs
\&.sp .75i		\\" Move down from top
\&.			\\" Section number in 24 pt. bold
\&.if !"\\\\$1"" \\{\\
\&\\s24\\f3\\\\$1\\f1\\s0\\}
\&.sp 12p
\&.			\\" Section title in 20 pt. bold
\&.if !"\\\\$2"" \\s20\\f3\\\\$2\\fP\\s10
\&.sp 12p
\&.			\\" Optional 2nd line of title
\&.if !"\\\\$3"" \\s20\\f3\\\\$3\\fP\\s10
\&.sp 3
\&.ad b
\&.ns
.Pe
This version is much simpler; it doesn't print the section
type at all, just the number or letter.
However, because it prints a right-justified title, we
have given the user the option of splitting a long
title into two parts.
.PP
The final part of the macro (in either version) adds the
section title to the table of contents.
As was the case with
.CW \&.Hl ,
this is done by an internal utility routine that is
defined elsewhere.
We'll discuss how this works later.
.Ps
\&.			\\" Last Part of Se Macro
\&.			\\" Now to toc
\&.tC \\\\$1 \\\\$2 \\\\$3
\&..
.ix %end extended [ms] macros, chapter headings %key extended ms macros, chapter headings
.page 520
.Pe
.Bh "A Mechanism for Numbered Headings"
.ix extended [ms] macros, numbered headings %key extended ms macros, numbered headings
Before we describe the lower-level headings used within
a chapter, we need to explore how to generate automatically
numbered sections.
.ix [.NH] macro ([ms]) %key NH macro ([ms])
.ix [ms] macros, [.NH] macro %key ms macros, [.NH] macro
We have defined a version of the
.CW ms
.CW \&.NH
macro that is called internally by our own heading macros.
It has the same name and uses the same internal registers
as the
.CW ms
macro, but the font and spacing requests specified in the
.CW ms
.CW \&.NH
macro are removed.
All that this macro now does is generate the section
number string.
.Ps
\&.de NH				\\" redefine from -MS
\&.nr NS \\\\$1			\\" Set NS to arg 1
\&.if !\\\\n(.$ .nr NS 1	\\" Set NS to 1 if no arg
\&.if !\\\\n(NS .nr NS 1	\\" or NS is null or negative
\&.nr H\\\\n(NS +1		\\" Increment Heading level register
\&.				\\" Test which level is in effect
\&.if !\\\\n(NS-4 .nr H5 0	\\" then reset lower levels to 0
\&.if !\\\\n(NS-3 .nr H4 0
\&.if !\\\\n(NS-2 .nr H3 0
\&.if !\\\\n(NS-1 .nr H2 0
\&.					\\" Put together section number
\&.if !\\\\$1 .if \\\\n(.$ .nr H1 1	\\" Set first level
\&.ds SN \\\\n(H1				\\" Begin building SN
\&.ie \\\\n(NS-1 .as SN .\\\\n(H2	\\" == 1.1 2nd level
\&.el .as SN .				\\" or == 1.
\&.if \\\\n(NS-2 .as SN .\\\\n(H3	\\" == 1.1.1     3rd
\&.if \\\\n(NS-3 .as SN .\\\\n(H4	\\" == 1.1.1.1   4th
\&.if \\\\n(NS-4 .as SN .\\\\n(H5	\\" == 1.1.1.1.1 5th
\&'ti \\\\n(.iu
\&\\\\*(SN					\\" Output SN string
\&..
.Pe
This macro repays study, because it shows several clever
ways to use number registers.
First, the argument to the macro is placed into a number
register.
This register is then used to select which of a series
of further registers will be incremented:
.Ps
\&.nr NS \\\\$1
\&	.
\&	.
\&	.
\&.nr H\\\\n(NS +1
.Pe
If the macro is called as
.CW "\&.NH 1" ,
register
.CW H1
will be incremented; if the call is
.CW "\&.NH 2" ,
register
.CW H2
will be incremented, and so on.
Then, depending on the value of that same
.CW NS
register, the appropriate register value will be appended
to the section number string
.CW SN .
.page 521
.ix %begin extended [ms] macros, section headings %key extended ms macros, section headings
.Bh "Subsection Headings"
.ix section headings
In our package, we allow four levels of subsection headings,
created by macros called
.CW \&.Ah
.I "A head" ) (
through
.CW \&.Dh
.I "D head" ). (
The macros for all four levels have the same essential
structure; they differ only in the appearance of the
printed text.
Again, we have different styles for different clients.
.PP
The distinction between levels of headings in one of
those styles is as follows:
.RS
.Ls B
.Li
The A head prints the heading in 14-point bold type,
all uppercase, with 26 points of space above the heading
and 18 points below.
.Li
The B head prints the heading in 14-point bold type, mixed
case, with 23 points of space above the heading and
15.5 points below.
.Li
The C head prints the heading in 12-point bold type,
mixed case, with 18 points of space above the heading
and 12 points below.
.Li
The D head prints the heading in 10-point bold type,
mixed case, with 18 points of space above the heading
and none below.
The heading actually runs into the text and is
separated from it only by a period.
.Le
.RE
All levels of headings can be either numbered or unnumbered,
depending on the state of a number register called
.CW nH .
If
.CW nH
is 0, heading are unnumbered; if it is 1, they are numbered.
.PP
Here is one version of the
.CW \&.Ah
macro.
From this example, you should be able to build the
lower-level headings as well
.Ps
\&.de Ah				\\" A-heading; $1 = title
\&.sp 26p
\&.RT
\&.ne 8				\\" Need room on page
\&.ps 14				\\" 14 pt. on 16 pt. heading
\&.vs 16
\&.lg 0
\&.tr aAbBcCdDeEfFgGhHjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ
\&.bd I 4			\\" Embolden italic font (optional)
\&\\f3\\c				\\" Bold font; concatenate next input
\&.if \\\\n(nH \\{.		\\" if producing numbered heads
\&.	ie \\\\n(sE .NH 2	\\" If chapter (Se macro) is
\&.				\\" numbered, then 2nd level
\&.	el .NH 1\\}		\\" If not, 1st level head
\\&\\\\$1\\f1			\\" Output title
\&.LP 0				\\" Paragraph reset; (0 = no space)
\&.				\\" RT resets default point size
\&.bd I				\\" Turn off emboldening
\&.tr aabbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyyzz
\&.lg
\&.sp 18p
\&.ns
.page 522
\&.tC \\\\*(SN \\\\$1 Ah		\\" Output TOC info
\&..
.Pe
.ix ligatures
Some pointers: First, whenever you force capitalization with
.CW \&.tr ,
be sure to turn off ligatures, because they do not capitalize.
Second, when you boldface a user-supplied string, it is
wise to artificially embolden italics as well, in case the
user embeds an italic font switch in the heading.
Third, don't forget to enter no-space mode to ensure
consistent spacing following the heading.
.PP
As you can see, the
.CW \&.NH
macro is called to generate a section heading only if the
.CW nH
register has been set.
In addition, the macro checks to make sure that a major section
number has been specified by the
.CW \&.Se
macro.
As you may recall,
.CW \&.Se
sets the first number in the numbered heading string
.CW H1  ). (
If
.CW \&.Se
has been called, the subsection headings start at level 2,
otherwise they start from the top.
.PP
To make it very easy for even novice users to specify
whether they want numbered or unnumbered headings,
the package includes a macro called
.CW \&.Nh
.I "numbered headings" ) (
that turns numbering on or off:
.Ps
\&.de Nh    \\" Numbered headings; $1 = turn on (1) or off (0)
\&.         \\" $1 = 2 will cause only A heads to be numbered
\&.nr nH \\\\$1
\&..
.Pe
.ix macros, style
This is a matter of macro package style, as mentioned earlier.
Steve Talbott's style, when he initially developed this package
was to code everything as macros, even where the macro simply
sets a number register or defines a string.
This makes the package very easy to learn, because you can
give a new user a concise, unambiguous list of macros
to enter into a file.
.PP
.ix extended [ms] macros, headers~and~footers %key extended ms macros, headers and~footers
Other examples of this style include the
.CW \&.Ti
and
.CW \&.St
(\c
.I title
and
.I subtitle )
macros, described in Appendix F, which simply define the
.CW "ms RF"
and
.CW LF
string for running footers.
Because of the mnemonically named macros, new users don't have
to remember whether the title goes in the right footer or
the left, and so on.
They simply enter the title of the book and chapter as
arguments to the respective macros.
The disadvantage is that users are insulated from an
understanding of what is really going on, which
may be an obstacle to learning more advanced skills.
.Bh "An Alternate Definition"
.ix headings, in~wide~margin
To give you an idea of how easy it is to change the look
of a document by redefining a few macros, let's look at
how we could redefine the heading for this section.
One popular layout style in technical manuals uses a very
wide left margin in which only the headings are printed,
as follows.
.	\" Note: see below for why this is coded as so.
.	\" --Michael Hobgood
.ch17@start
.TOPHAT 60
.sp 2v
.ad l
.po 1.5i
.ps 12
.vs 14
.ll 2i
\f[B]An Alternate Definition\fP
.br
.po 4.5i
.ps 9
.vs 10
.ll 1.25i
.sp -1v
.nf
To give you an idea of how
easy it is to change the
look of a document...
.sp 1v
.ch17@end
.PP
.ix %end extended [ms] macros, section headings %key extended ms macros, section headings
.ix %end headings, in~extended~[ms] %key headings, in extended~ms
.page 523
Here's the modified macro to produce this heading:
.Ps
.ig
	Try this. It doesn't work. I've noticed several
	places in this O'Reilly book, where the example code
	doesn't produce the claimed output.
	--Michael Hobgood
..
.ix [troff] formatter, page offset %key troff formatter, page offset
.ix page offset
\&.de Ah			\\" A-heading; alternate version
\&.			\\" Requires resetting default page
\&.			\\" (PO) to allow for extra offset.
\&.			\\" .nr PO 2.5i for 1.5 extra offset
\&.nr Po 1.5i		\\" Set amount of extra offset
\&.nr Gw .2i		\\" Set width of gutter
\&.mk			\\" Mark vertical position
\&.po -1.5i		\\" Set new page offset
.	\" note: was  -\\nGwu, should be -\\n(Gwu
\&.ll \\\\n(Pou-\\\\n(Gwu
\&.ps 12			\\" Set 12 pt. on 14 pt.
\&.vs 14
\\&\\f3\\\\$1\\f1		\\" Output header in bold
\&.rt			\\" Return to vertical position
\&.po \\\\n(POu		\\" Reset default page offset
\&.LP 0			\\" Reset point size and line length
\&.ns
\&.tC \\\\*(SN \\\\$1 Ah	\\" Output TOC info
\&..
.Pe
.Ah "Figure and Table Headings"
.ix extended [ms] macros, figure numbering %key extended ms macros, figure numbering
.ix extended [ms] macros, table numbering %key extended ms macros, table numbering
In technical manuals, it is common to number and title
all figures and tables, both for easy reference from
within the text, and for collection into lists of
figures and tables that will appear in the table
of contents.
.PP
These macros are easy to construct and, apart from
whatever appearance you decide to give them, nearly
identical in content.
There is a \(lqstart\(rq macro and an \(lqend\(rq macro:
.Ps
\&.de Fs				\\" Start figure; $1 = reserved space;
\&.				\\" $2 = F, floating figure
\&.RT
\&.if "\\\\$2"F" \\{.		\\" Figure can float
\&.	nr kF 1
\&.	KF\\}
\&.if \\\\$1 \\{.			\\" Specify amount of space
\&.	ne \\\\$1		\\" required for paste-up
\&.	fl
\&.	rs
\&.	sp \\\\$1\\}
\&..
\&.de Fe				\\" Figure end; $1 = title
\&.sp
\&.bd I 3
\&.nr fG +1			\\" Increment Figure counter
.page 524
\&.				\\" then determine format
\&.ie \\\\n(Se .ds fG \\\\*(H1-\\\\n(fG
\&.el .ds fG \\\\n(fG
\&.ce				\\" Output centered figure
\\f3Figure \\\\*(fG. \\\\$1\\f1
\&.tC "\\\\*(fG" "\\\\$1" "Figure"
\&.bd I
\&.sp
\&.if \\\\n(kF=1 .KE		\\" End keep if in effect
\&.tC "\\\\*(fG" "\\\\$1" "Figure"	\\" Output TOC info
\&..
.Pe
As you can see, the
.CW \&.Fs
.I "figure start" ) (
macro allows the user to reserve space for a figured to
be pasted in, and for it to float to a new page, using
the
.CW ms
\(lqfloating keep\(rq mechanism.
.PP
Neither of the options are necessary.
The macro can simply bracket a figure created with
.CW pic ,
for example, in which case all that the macro provides is
a consistent amount of space before the figure starts.
.PP
The
.CW .Fe
.I "figure end" ) (
macro does most of the work.
If a keep is in effect,
.CW \&.Fe
terminates it.
In addition, it prints the figure caption below the figure
and adds a consistent amount of space below the caption.
The figure is automatically numbered with the section
number, and a figure number that is incremented each
time the macro is called.
As you may remember, this figure number register,
.CW fG ,
was initialized to 0 in
.CW \&.Se .
.PP
To give the user some options with figure numbering, a
second argument allows the user to turn it off entirely.
In addition, if the section is unnumbered, the section
number and hyphen will be omitted.
To accomplish this involves a little juggling of strings
and number registers (which is something you should plan
to get used to when you write macros).
Notice that we use the string
.CW H1
for the section number rather than the section number
register itself
.CW sE  ), (
because we went to some trouble in the
.CW \&.Se
macro to handle lettered appendices as well as numbered
chapters.
.PP
You could easily add optional appearance features to this
macro.
For example, in one implementation, we draw a horizontal line
above and below the figure, and print the caption left
justified and in italics below the bottom line.
.PP
The figure end macro also calls the table of contents
macro, which will be described later.
.PP
The macros for labeling tables are very simple, because
the standard
.CW \&.TS
and
.CW \&.TE
macros do everything necessary except providing consistent
pre- and post-spacing and printing the caption.
In this case, the caption is at the top:
.Ps
\&.de Ts					\\" Table start; $1 = title
\&.nr tB +1				\\" Increment Table counter
\&.					\\" Determine format
\&.ie \\\\n(Se .ds tB \\\\*(H1-\\\\n(tB	\\" Section Table
\&.el .ds tB \\\\n(tB
\&.sp
\&.ce 2					\\" Output label and
.page 525
\\f3Table \\\\*(tB.			\\" title on 2 lines
\\&\\\\$1\\f1
\&.tC "\\\\*(tB" "\\\\$1" "Table"	\\" Output TOC info
\&.bd I
\&.LP					\\" Paragraph reset
\&..
\&.de Te					\\" Table end -- no arguments
\&.RT					\\" Reset
\&.sp
\&..
.Pe
.Ah "Lists, Lists, and More Lists"
.ix %begin extended [ms] macros, lists %key extended ms macros, lists
.ix %begin lists, alphabetic~([mS]) %key lists, alphabetic (mS)
.ix %begin lists, bulleted~([mS]) %key lists, bulleted (mS)
.ix %begin lists, nested~([mS]) %key lists, nested (mS)
.ix %begin lists, numbered~([mS]) %key lists, numbered (mS)
.ix %begin numbered lists, [mS] macros %key numbered lists, mS macros
One of the significant features lacking in the
.CW ms
macros is the ability to generate automatically numbered or
lettered lists.
You can use the
.CW \&.IP
macro and number or letter a list yourself\(embut
what good is a computer if it can't handle a task
like this?
.PP
.ix lists, extended~in [mS] %key lists, extended in mS
One of the nicest features of Steve Talbott's extended
.CW ms
package is its set of comprehensive, general-purpose list
generation macros.
There are three macros:
.CW \&.Ls
.I "list start" ), (
.CW \&.Li
.I "list item" ), (
and
.CW \&.Le
.I "list end" ). (
Unlike
.CW mm ,
in which different types of lists must be specified using
different macros, here you request a different type of list
by giving an argument to the
.CW \&.Ls
macro.
You can request any of the types of lists in Table 17-1.
.Ts "List Types"
.TS
center, box, tab(@);
l c
cf(CW) l.
\fRArgument\fP@List Type
_
A@Alphabetic with uppercase letters
a@Alphabetic with lowercase letters
B@Bulleted with \(bu by default
N@Numbered with arabic numerals
R@Numbered with uppercase roman numerals
r@Numbered with lowercase roman numerals
.TE
.Te
.PP
The bulleted list uses the bullet character (\(bu))
by default.
However, as you will see, the macro allows you to specify
an alternate bullet using an optional third argument.
This \(lqbullet\(rq could be a dash, a box
.CW \e(sq ), (
a checkmark
.CW \e(sr ), (
or any other character.
.PP
Lists can be nested, and there is a default list type for
each level of nesting, so the type argument does not really
need to be specified.
.PP
Here's the list start macro:
.page 526
.Ps
\&.nr l0 0 1		\\" Initialize nested list level counter
\&.de Ls
\&.\\" list start; $1 =A(lpha), a(alpha), B(ullet), N(umeric),
\&.\\"			R(oman), r(oman); $2 = indent
\&.\\"			$3 = alternate bullet character
\&.br
\&.if !"\\\\$1"A" .if !"\\\\$1"B" .if !"\\\\$1"N" .if !"\\\\$1"R" \\
\&.	if !"\\\\$1"r" .if !"\\\\$1"a" .if !"\\\\$1"" \\
\&.	tm Ls: Need A a B N R r or null as list type
\&.nr l\\\\n+(l0 0 1
\&.ie "\\\\$1"" \\{\\					\\" Set defaults
\&.	if "\\\\n(l0"1" .af l\\\\n(l0 1		\\" Numeric at 1st level
\&.	if "\\\\n(l0"2" .af l\\\\n(l0 a		\\" lc alpha at 2nd level
\&.	if "\\\\n(l0"3" .af l\\\\n(l0 i		\\" lc roman at 3rd level
\&.	if "\\\\n(l0"4" .ds l\\\\n(l0 \\(bu		\\" Bullet at 4th level
\&.	if "\\\\n(l0"5" .ds l\\\\n(l0 \\f3\\-\\f1	\\" Dash at 5th level
\&.	if \\\\n(l0-5 .ds l\\\\n(l0\\(bu		\\" Bullet above 5th level
\&.	if \\\\n(l0-3 .nr l\\\\n(l0 0-1 \\}
\&.el \\{\\
\&.	if "\\\\$1"A" .af l\\\\n(l0 A
\&.	if "\\\\$1"a" .af l\\\\n(l0 a
\&.	if "\\\\$1"B"\\{\\
\&.		if "\\\\$3"" .ds l\\\\n(l0 \\(bu
\&.		if !"\\\\$3"" .ds l\\\\n(l0 \\\\$3
\&.		nr l\\\\n(l0 0-1\\}
\&.	if "\\\\$1"R" .af l\\\\n(l0 I
\&.	if "\\\\$1"r" .af l\\\\n(l0 i \\}
\&.ie !"\\\\$2"" .nr i\\\\n(l0 \\\\$2			\\" List indent
\&.el .nr i\\\\n(l0 5					\\" Default indent
\&.RS
\&..
.Pe
When you first look at this macro, you may be a little
overwhelmed by the complex number register names.
In fact, there is not much to it.
.PP
.ix [troff] formatter, number~registers %key troff formatter, number registers
.ix number~registers
.ix number~registers, as~nested~list~counter
.ix number~registers, autoincrementing
.ix number~registers, naming~by interpolation
One number register,
.CW l0 ,
is used as a counter for nested lists.
As you can see, this register is initialized to 0
outside of the list macro definition itself.
Then, when the
.CW \&.Ls
macro is called, this register is autoincremented
at the same time as it is used to define the
name of another number register:
.Ps
\&.nr l\\n+(l0 0 1
.Pe
It is this second number register interpolation\(em
.CW l\en+(l0 \(emthat
is actually used to number the list.
This is a technique we promised to show you back when we
were first describing number registers.
We create a series of related number register names by
interpolating the value of another register as one character
in the name.
.ix %end lists, alphabetic~([mS]) %key lists, alphabetic (mS)
.ix %end lists, bulleted~([mS]) %key lists, bulleted (mS)
.ix %end lists, nested~([mS]) %key lists, nested (mS)
.ix %end lists, numbered~([mS]) %key lists, numbered (mS)
.PP
Think this through for a moment.
The first time
.CW \&.Ls
is called, the request:
.page 527
.Ps
\&.nr l\\\\n(l0 0 1
.Pe
defines a number register that is actually called
.CW l1
(the letter
.I l
followed by the value of number register
.CW l0 \(emwhich
is 1).
A second call to
.CW \&.Ls
without closing the first list (which, as we shall see, bumps
the counter back one) will define number register
.CW l2 ,
and so on.
.PP
In a similar way, another series of number registers
.CW i\e\en(l0 ) (
allows a different indent to be specified for each nested
level, if the user so desires.
.PP
With the exception of the bulleted list, all of the different
list types are numbered using the same number register
(\c
.CW l \c
.I n ,
where
.I n
is the nesting depth).
The different types of lists are created simply by changing the
output format of this register using the
.CW \&.af
request.
.PP
Here's the
.CW \&.Li
macro:
.Ps
\&.de Li	\\" List item; $1 = 0 no blank line before item
\&.br
\&.if "\\\\$1"0" .ns
\&.ie "\\\\n(l\\\\n(l0"-1" .IP "\\\\*(l\\\\n(l0" "\\\\n(i\\\\n(l0"
\&.el \\{\\
\&.nr l\\\\n(l0 +1
\&.IP "\\\\n(l\\\\n(l0." "\\\\n(i\\\\n(l0" \\}
\&..
.Pe
The actual list counter itself (as opposed to the nesting
counter) is incremented, and the appropriate value printed.
.PP
.ix [ms] macros, [.IP] macro %key ms macros, [.IP] macro
.ix [.IP] macro %key IP macro
The number and the associated text is positioned with the
standard
.CW ms
.CW \&.IP
macro.
If you don't have access to the
.CW ms
macros, you could simulate the action of the
.CW \&.IP
macro as follows:
.Ps
\&.de IP
\&.nr Ip 1
\&.sp \\\\n(PDu
\&.in \\\\$2u
\&.ti -\\\\$2u
\&.ta \\\\$2u
\&\\\\$1\\t\\c
\&..
.Pe
However, there is one drawback to using an
.CW \&.IP
-style macro as the basis of the list.
.	\" Note:
.	\" code to simulate the original showing the
.	\" differences between O'Reilly .Lx and the .IP macro
.	\" notice that the .IP is actually simulated, while
.	\" the UTP .Li item is actually used.
.TOPHAT 76
.ch17@start
.sp 1v
.ll 5i
\h'26p'\(bu\h'20p'The
.CW .IP
macro puts its argument at the left margin, as was done
with this
\h'49p'sentence.
.sp
\h'32p'\(bu\h'14p'Instead, we'd like something that puts
the mark in the middle of the indent,
.br
\h'49p'as was done with this sentence.
.sp 1v
.ch17@end
.PP
Here's the macro that produced the second example:
.page 528
.Ps
\&.de IP
\&.nr Ip 1
\&.sp \\\\n(PDu
\&.in \\\\$2u
\&.nr i1 \\\\$2/2u+\\w'\\\\$1'	\\" Amount to move left
\&.nr i2 \\\\$2-\\w'\\\\$1'	\\" Amount to move back
\&.ta \\\\n(i2u
\&.ti -\\\\n(i1u
\&\\\\$1\\t\\c
\&..
.Pe
.ix lists, extended~in [mS] %key lists, extended in mS
This version of the macro places the mark not just at a
position half the depth of the indent, but exactly in the
middle of the indent by adjusting the indent by the width
of the mark argument.
Number registers are used for clarity, to avoid nesting
the various constructs too deeply.
.PP
(Note that this simplified
.CW \&.IP
macro lacks some of the functionality of the
.CW ms
.CW \&.IP
macro, which saves the current indent and therefore allows
you to nest indents by using the
.CW \&.RS
and
.CW \&.RE
macros).
.PP
If you are using
.CW ms ,
and you want to create a macro that puts the mark in the
center of the indent, be sure to name this macro
something other than
.CW \&.IP ,
so that you don't conflict with the existing macro
of that name.
.PP
Here's the list end:
.Ps
\&.de Le	\\" List end; $1 = no blank line following last item
\&.br
\&.rr l\\\\n(l0
\&.rr i\\\\n(l0
\&.rm l\\\\n(l0
\&.nr l0 -1
\&.RE
\&.ie !\\\\n(l0 \\{\\
\&.	ie "\\\\$1"0" .LP 0
\&.	el .LP\\}
\&.el .if !"\\\\$1"0" .sp \\\\n(PDu
\&..
.Pe
This macro removes the list numbering registers and strings,
decrements the nested list counter, and calls the
.CW ms
.CW \&.RE
macro to \(lqretreat\(rq back to the left (if necessary
because of a nested loop).
Finally, it leaves a blank line following the end of the
list.
(As you might remember,
.CW PD
is the
.CW ms
register containing the
.I "paragraph distance" \(em0.3v
by default).
.ix %end extended [ms] macros, lists %key extended ms macros, lists
.ix %end numbered lists, [mS] macros %key numbered lists, mS macros
.Ah "Source Code and Other Examples"
In a technical manual, there are often further issues
brought out by the need to show program source code
or other material that loses essential formatting if
it is set with proportional rather than monospaced type.
.page 529
.PP
.ix fonts, constant width
As previously discussed, the basic trick in
.CW ditroff
is to use the
.CW CW
font.
If you are using
.CW otroff ,
you will need to use the
.CW cw
preprocessor (see your UNIX manual for details) or some
other type of workaround.
(When we were using
.CW otroff ,
our print driver allowed font substitutions based on
size.
We told the driver to use the printer's constant-width
font whenever
.CW troff
used a point size of 11.
Then, we wrote a macro that changed the point size to 11,
but used
.ix constant spacing
.CW \&.cs
to set the character spacing to the actual size for the
printer's constant-width font.
This was not a very elegant solution, but it
worked\(emso if you are stuck with
.CW otroff
don't despair.
Put your ingenuity to work and you should come up with
something).
.PP
Besides the change to the
.CW CW
font, though, there are several other things we'd like
to see in a macro to handle printouts of examples.
We'd like examples to be consistently indented, set off
by a consistent amount or pre- and post-line spacing,
and set in no-fill mode.
.PP
Here's an example of a pair of macros to handle this
situation:
.Ps
\&.de Ps	\\" Printout start; $1 = indent (default is 5 spaces)
\&.br
\&.sp \\\\n(PDu
\&.ns
\&.nr pS \\\\n(.s		\\" Save current point size
\&.nr vS \\\\n(.v		\\" Save current vertical spacing
\&.nr pF \\\\n(.f		\\" Save current font
\&.nr pI \\\\n(.i		\\" Save current indent
\&.ps 8
\&.vs 10
\&.ft CW
\&.ie !"\\\\$1"" .in +\\\\$1n
\&.el .in +5n
\&.nf
\&..
\&.de Pe	\\" Printout end; $1 non-null, no concluding
\&.br
\&.if "\\\\$1"" .sp \\\\n(PDu
\&.ps \\\\n(pSu
\&.vs \\\\n(vSu
\&.ft \\\\n(pF
\&.in \\\\n(pIu
\&.rr pS
\&.rr vS
\&.rr pF
\&.rr pI
\&.fi
\&..
.Pe
.ix [troff] formatter, number~registers %key troff formatter, number registers
.ix environments
.ix number~registers
.ix number~registers, substituting~for environment~switch
The trick of saving the current environment in temporary
registers is a useful one.
The alternative is to use a separate environment for
the printouts, but this assumes that the
available environments are not already in use for
some other purpose.
You could also
.page 530
call a reset macro to restore the default state\(embut
this may not actually be the state that was in
effect at the time.
.PP
In addition, you shouldn't rely on
.CW troff 's
ability to return to the previous setting by making
a request like
.CW \&.ll
without any argument.
If you do so, an error might result if the user has
himself made an
.CW \&.ll
request in the interim.
.PP
In short, you should either save registers or use a
different environment whenever you change formatting
parameters in the opening macro of a macro pair.
Then restore them in the closing macro of the pair.
.Ah "Notes, Cautions, and Warnings"
.ix %begin extended [ms] macros, notes %key extended ms macros, notes
.ix %begin notes, cautions~and~warnings
Another important macro for technical manuals is one
that gives a consistent way of handling notes,
cautions, and warnings.
(Traditionally, a note gives users important
information that they should not miss, but will not
cause harm if they do.
A caution is used for
information that, if missed or disregarded, could lead
to loss of data or damage to equipment.
A warning is
used for information that is critical to the user's
life or limb).
.PP
Obviously, this is a simple macro\(emall
that is required is some way of making the note,
caution, or warning stand out from the body of the text.
You could redefine the macro shown here in any number
of ways depending on the style of your publications.
.Ps
\&.de Ns			\\" note/caution/warning $1 = type "N", "C", "W"
\&.sp 2
\&.ne 5
\&.ce
\&.if !"\\\\$1"N" .if !"\\\\$1"C" .if !"\\\\$1"W" \\{\\
\&. tm "Need N, C, or W as argument for Ns macro-using N"
\&\\f3NOTE\\f1\\}
\&.if "\\\\$1"N" \\f3NOTE\\f1
\&.if "\\\\$1"C" \\f3CAUTION\\f1
\&.if "\\\\$1"W" \\f3WARNING\\f1
\&.sp
\&.ns
\&.nr nI \\\\n(.iu		\\" Save current indent, if any
\&.nr nL \\\\n(.lu		\\" Save current line length
\&.ie \\\\nS>0 .nr IN 5n	\\" Make indent less if in small format
\&.el .nr IN 10n		\\" Larger indent for full-size page
\&.in +\\\\n(INu			\\" Indent specified amount
\&.ll -\\\\n(INu			\\" Decrement line length same amount
\&..
\&.de Ne			\\" "note end"; no args
\&.in \\\\n(nIu			\\" Restore previous indent
\&.ll \\\\n(nLu			\\" Restore previous line length
\&.rr nI				\\" Remove temporary registers
\&.rr nL
\&.sp 2
\&..
.Pe
.page 531
.PP
A warning looks like this:
.br
.ne 8
.TOPHAT 75
.sp 1v
.ch17@start
.ce 1
\f[B]WARNING\fP
.sp
.ll 5i
.in 5n
You should be careful when reading books on \f[C]troff\fP,
because they can be damaging to your health.
\|Although\| escape\| sequences\| are\| allowed,\| they
are not exactly high adventure.
.sp 2v
.ch17@end
.PP
A different version of a caution macro is shown below.
It uses a graphic symbol to mark a caution statement.
.	\" Note
.	\" Graphic Caution Macro below, used to get the example
.	\" then removed. Also, units have been multiplied by
.	\" 1000 for groff.
.br
.TOPHAT 100
.sp
.de UTPGc
.nr pI \\n(.i
.in 5n
.ne 10
.mk a
.br
\v'72000u'\D'l000u -72000u'
.sp -1
\D'l72000u 0u'
.sp -1
\h'72000u'\D'l000u 72000u'
.sp -1
\h'72000u'\v'72000u'\D'l-72000u 0u'
.sp -1
\h'36000u'\D'l36000u 36000u'
.sp -1
\h'72000u'\v'36000u'\D'l-36000u 36000u'
.sp -1
\h'36000u'\v'72000u'\D'l-36000u -36000u'
.sp -1
\v'36000u'\D'l36000u -36000u'
.sp -1
.sp 1+72000u
.sp
.mk q
.sp |\\nau
.in \\n(pIu
.in +2.0i
.ll -1.5i
.sp .5v
.ce
\f3CAUTION\f1
.sp .3v
..
.de UTPGE
.br
.sp
.in
.ll
.if \\nqu>\\n(nlu+\\n(.vu .sp |\\nqu
.sp .3v
..
.UTPGc
One client had a convention of marking a caution
statement with a large diamond in a square.
These diamonds will appear in a second color
in the printed book.
.UTPGE
.rm UTPGc
.rm UTPGE
.ix [pic] preprocessor %key pic preprocessor
To produce the escape sequences to draw the symbol,
we used
.CW pic ,
processing the description and capturing it in
a file.
Then we read it into our macro definition.
(We could also have produced the escape sequences
to draw the symbol without
.CW pic 's
help; this would result in much more compact code).
The drawing of the symbol does take up most of
the
.CW \&.Gc
macro definition.
Before we actually output the symbol, the current
vertical position is marked.
After it is output, we mark its bottom position.
Then we return to the top before placing the warning
label and processing the text.
After the caution statement is output, the closing
macro,
.CW .GE ,
checks the current vertical position against
the bottom position of the symbol.
.ix %end extended [ms] macros, notes %key extended ms macros, notes
.ix %end notes, cautions~and~warnings
.Ps
\&.de Gc			\\" Graphic Caution Macro
\&.ne 10
\&.mk a			\\" Mark current top position
\&.br			\\" pic output belongs here
\&\\v'720u'\\D'l0u -720u'
\&.sp -1
\&\\D'l720u 0u'
\&.sp -1
\&\\h'720u'\\D'l0u 720u'
\&.sp -1
\&\\h'720u'\\v'720u'\\D'l-720u 0u'
\&.sp -1
\&\\h'360u'\\D'l360u 360u'
\&.sp -1
.page 532
\&\\h'720u'\\v'360u'\\D'l-360u 360u'
\&.sp -1
\&\\h'360u'\\v'720u'\\D'l-360u -360u'
\&.sp -1
\&\\v'360u'\\D'l360u -360u'
\&.sp -1
\&.sp 1+720u		\\" End of pic output
\&.sp
\&.mk q			\\" Mark bottom of symbol
\&.sp |\\\\nau		\\" Move back to top (.mk a)
\&.in +1.5i		\\" Indent to right of symbol
\&.ll -.5i		\\" Reduce line length
\&.sp .5v
\&.ce
\&\\f3CAUTION\\f1		\\" Output Caution label
\&.sp .3v
\&..
.	\" Note:
.	\" line above has only one dot in original,
.	\" which messes up things, so fixed the typo
\&.de GE			\\" Graphic Caution end
\&.br
\&.sp
\&.in			\\" Reset previous settings
\&.ll
\&.			\\" If bottom of symbol (.mk q)
\&.			\\" is below current vertical position
\&.			\\" then move to that position
\&.if \\\\nqu>\\\\n(nlu+\\\\n(.vu .sp |\\\\nqu
\&.sp .3v
\&..
.Pe
.Ah "Table of Contents, Index, and Other End Lists"
.ix extended [ms] macros, table~of contents %key extended ms macros, table of contents
.ix table~of contents
Here's the part you've all been waiting for.
One of the nicest things a formatter can do for a
writer is automatically generate lists such as a
table of contents and an index.
These are very time consuming to produce manually,
and subject to error.
There are basically two ways to do the trick, and
both apply to an index as well as a table of
contents, endnotes, and other collected lists.
.PP
.ix diversions, table~of contents
.ix table~of contents, created~by~diversion
The technique used by
.CW mm ,
which generates an automatic table of contents at
the end of each formatting run, is to collect
headings into a diversion using the
.CW \&.da
request.
This diversion is then output from within a special
macro called the \(lqend macro,\(rq which we have yet
to discuss.
.PP
.ix [.tm] request %key tm request
.ix [troff] formatter, [.tm] request %key troff formatter, [.tm] request
.ix table~of contents, written~to standard~error
The second technique is to use the
.CW \&.tm
request to write the desired information to
standard error output.
Then that output is redirected to capture the messages
in a file, where they can be edited manually or
automatically processed by other programs.
.page 533
.PP
The advantage of the first approach is that it is clean
and simple, and entirely internal to the formatter.
However, it is really suitable only for short documents.
A long document such as a book is not normally
formatted in a single pass, but chapter by chapter.
It is not desirable to format it all at once just
to get the table of contents at the end.
.ix diversions
In addition, a large document generally will end
up creating a large diversion\(emoften
one that is too large for
.CW troff
to handle.
.PP
The second approach, on the other hand, opens up
all kinds of possibilities for integration with
other tools in the UNIX environment.
The output can be saved, edited, and processed in
a variety of ways.
As you can imagine from our philosophy of letting
the computer do the dirty work, this is the
approach we prefer.
.PP
However, there is still a place for diversions, so
we'll take a close look at both approaches in the
sections that follow.
.Bh "Diverting to the End"
Although we prefer to create our major end
lists\(emthe table of contents and index\(emby writing to
.CW stderr ,
we find it very useful to use diversions for
another type of list.
.PP
We've added a couple of special macros that allow
a writer to insert remarks intended specifically for
the reviewers of a draft document or for personal
use.
Because technical reviewers frequently miss questions
embedded in the text, we designed the
.CW \&.Rn
macro to highlight notes.
This macro makes these remarks stand out in the
text and then collects them for output again
at the end of the document.
.Ps
\&.de Rn		\\" Note to reviewers : $1 = Note
\&.		\\" Print note in text and at end
\&. 	    	\\" Output note first
\&.sp
\&\\f3Note to reviewers:\\fP \\\\$1
\&.sp
\&.ev 2
\&.da rN		\\" Then append into diversion
\&.sp 0.2v
\&.in 0
\&.ie "\\\\*(NN"" \\(sq Page \\\\n(PN: \\\\$1
\&.el \\(sq Page \\\\*(NN: \\\\$1
\&.br
\&.da
\&.nr RN 1	\\" Flag it for EM
\&.ev
\&..
.Pe
Another macro,
.CW \&.Pn ,
is used to collect a list of personal notes or
reminders and output them on a page at the end.
These notes do not appear in the body of the text.
.Ps
\&.de Pn				\\" Personal Note; $1 = note
\&.				\\" Note listed at end, but not in text
\&.ev 2
\&.if \\\\n(Pn<1 .nr Pn 0 1	\\" Set up autoincrement counter
.page 534
\&.da pN
\&.br
\&.IP "\\\\n+(Pn." 5n
\&\\\\$1
\&.ie "\\\\*(NN"" (Page \\\\n(PN)
\&.el (Page \\\\*(NN)
\&.br
\&.da
\&.nr pN 1			\\" Flag it for EM
\&.ev
\&..
.Pe
.ix %begin end macro
Only the
.CW \&.Rn
macro produces output in the body of the document, but
both macros append the notes into a diversion that we
can process at the end of the document.
.ix [.da] request %key da request
.ix [troff] formatter, [.da] request %key troff formatter, [.da] request
The
.I "divert and append"
.CW .da ) (
macro creates a list of notes that can be output by
invoking the macro created by the diversion.
.PP
For each macro, we format the lists slightly differently.
In the
.CW \&.Rn
macro, we print a box character (\(sq) (to
give the feeling of a checklist), then the page
number on which the review note occurred.
This allows the reviewer or the writer to easily go
back and find the note in context.
In the
.CW \&.Pn
macro, we use an autoincrementing counter to number
personal notes; this number is output through
.CW \&.IP .
It is followed by the note and the page reference
in parentheses.
.PP
The formatting of text inside a diversion can be
tricky.
The text could be formatted twice: when it is read into
the diversion, and when the diversion is output.
The one thing to keep in mind is that you don't want line
filling to be in effect both times.
If line filling is in effect when the text is read into
the diversion, you should turn it off when the diversion
is output.
.ix transparent output
You can also use transparent output
.CW \e! ) (
to hide macros or requests so that they will be executed
only at the time the diversion is output.
We have also taken the precaution of processing the
diversion in a separate environment.
.PP
Now what about printing the list at the end?
Well, as it turns out,
.CW nroff
and
.CW troff
include a special request called
.CW \&.em
that allows you to supply the name of a macro that will
be executed at the very end of the processing run, after
everything else is finished.
.ix [.em] request %key em request
.ix [troff] formatter, [.em] request %key troff formatter, [.em] request
.PP
The
.CW \&.em
request allows you to define the name of a macro that
will be executed when all other input has been processed.
For example, the line:
.Ps
\&.em EM
.Pe
placed anywhere in a file or macro package, will request
that the macro
.CW \&.EM
be executed after everything else has been done.
The definition of
.CW \&.EM
is up to you.
.PP
The
.CW ms
macros already have specified the name of this macro
as
.CW \&.EM ,
the
.I "end macro" .
In its usual obscure way,
.CW mm
calls its end macro
.CW \&.)q .
If you are writing your own package, you can call it
anything you like.
.ix [.am] request %key am request
You can either edit the existing end macro, or simply
add to it using the
.CW \&.am
.I "append to macro" ) (
request.
.PP
All that
.CW ms
does with this macro is to process and output any
diversions that have not been properly closed.
(This might happen, for example, if you requested a
floating keep, but its contents had not yet been
printed out).
.page 535
.PP
The end macro is a good place to output our own special
diversions that we've saved for the end.
What we need to do now is to add some code for
processing our list of review notes:
.Ps
\&.de EM
\&.br
\&.if \\\\n(RN=1 \\{\\
\\&\\c
\&'bp
\&.
\&.
\&.ce
\\f3NOTES TO REVIEWERS\\f1
\&.sp 2
Reviewers, please address the following questions:
\&.sp
\&.ev 2
\&.nf
\&.rN
\&.ev
\&.\\}
\&.if \\\\n(pN=1 \\{\\
\&.br
\\&\\c
\&'bp
\&.
\&.ce
\\f3Notes To Myself:\\f1
\&.sp 2
\&.ev 2
\&.nf
\&.pN
\&.ev
\&.\\}
\&..
.Pe
(Note: we have found that to print anything from the
.CW \&.EM
macro in the standard
.CW ms
package, it is necessary to invoke
.CW \&.NP
explicitly following a page break.
However, when using our simplified version of this
package as shown in the last chapter, our
.CW \&.EM
does not need a
.CW \&.NP ).
The list collected by the
.CW \&.Rn
macro is printed on a new page, looking something
like this:
.page 536
.TOPHAT 100
.ch17@start
.KF
.in 5n
.ps 10
.vs 12
.sp 1v
.ce 1
NOTES TO REVIEWERS
.sp 1v
.ps 9
.vs 11
.nf
Reviewers, please address the following questions:
.sp
\(sq Page 3-1:  Why can't I activate the bit pad before opening a font file?
.sp
\(sq Page 3-7:  Is there a size restriction on illuminated letters?
.sp
.fi
.KE
.ch17@end
.ix %end end macro
.Bh "A Diverted Table of Contents"
.ix %begin diversions
.ix table~of contents, created~by~diversion
Given the preceding discussion, it should be easy
for you to design a diverted table of contents.
The magic
.CW \&.tC
macro we kept invoking from our heading might look
something like this:
.Ps
\&.de tC		\\" table of contents; $1=sec number;
\&.					 \0$2=title; $3=type
\&.if "\\\\$3"\\\\*(cH"\\{\\
\&.da sL		\\" Divert and append to section list
\&.sp 3
\&\\\\*(cH \\\\$1:   \\\\$2
\&.sp 1.5
\&.da
\&.\\}
\&.if "\\\\$3"Ah"\\{\\
\&.da sL		\\" Divert and append to section list
\&.br
\&\\\\$1		\\\\$2\\\\a\\\\t\\\\*(NN
\&.br
\&.da
\&.\\}
\&.if "\\\\$3"Bh"\\{\\
\&.da sL		\\" Divert and append to section list
\&.br
\&\\\\$1		\\\\$2\\\\a\\\\t\\\\*(NN
\&.br
\&.da
\&.\\}
\&.if "\\\\$3"Figure" \\{\\
\&.da fL		\\" Divert and append to figure list
\&\\\\$1		\\\\$2\\\\a\\\\t\\\\*(NN
\&.da
\&.\\}
\&.if "\\\\$3"Table" \\{\\
\&.da tL		\\" Divert and append to table list
\&\\\\$1		\\\\$2\\\\a\\\\t\\\\*(NN
.page 537
\&.da
\&.\\}
\&..
.Pe
The diversion
.CW sL
is set up to handle the main heading (chapter, appendix,
unit, or section) and two levels of subheadings
(A-heads or B-heads).
The diversions
.CW fL
and
.CW tL
are set up to compile lists of figures and
tables, respectively.
.PP
In the end macro, to print the table of contents,
you have to cause a break to a new page, print:
introductory captions, and so on, and then follow by
outputting the collected diversion of each type.
The following example shows the code to print:
.Ps
\&.br		\\" Automatically invoke diverted toc
\\&\\c		\\" by including these lines in EM macro
\&'bp		\\" Or place in own macro
\&.ta  \\\\n(LLu-5n \\\\n(LLuR
\&.ce
\\f3Table of Contents\\fR
\&.sp 2
\&.nf		\\" Process in no-fill mode
\\\\t\\f3Page\\fP
\&.sL
\&.rm sL		\\" Clear diversion
\&.		\\" Add code here to output figure
\&.		\\" and table list diversions
.Pe
We set two tab stops based on the default line
length
.CW \en(LLu ).  (
The second tab stop is used to set a right-adjusted
page number in the right margin.
The first tab stop is used to run a leader from
the entry to the page number.
The escape sequences that output the leader and
tab (\c
.CW \ea
and
.CW \et )
were specified in the
.CW \&.tC
macros.
(And to protect the escape sequence inside a
diversion an extra backslash was required).
.PP
Now we can obtain a table of contents each
time we format the document.
The format of the table of contents shows the
hierarchical structure of the document:
.br
.ne 14
.TOPHAT 140
.ch17@start
.ll 5.3i
.in 10n
.sp 1v
.ce
\fBTable of Contents\fP
.ad r
\f[B]Page\fP
.sp 1v
.ad b
.nf
.ta 4.4i
.tc .
Chapter Two: Getting Started with Alcuin
.sp 1.5v
2.1\h'10p'Objectives of this Session	\|\|\|\|2-1
2.2\h'10p'Starting Up the System	\|\|\|\|2-2
2.2.1\h'15p'Power-up Procedure	\|\|\|\|2-2
2.2.2\h'15p'Software Initialization	\|\|\|\|2-3
2.3\h'10p'Creating Simple Glyphs	\|\|\|\|2-4
.fi
.tc
.ch17@end
.page 538
.Bh "When Diversions Get Too Big"
One of the major problems with collecting a table
of contents in a diversion is that, with a large
document, the diversions quickly grow too large
for the formatter to handle.
It will abort with a message like \(lqOut of temp
file space.\(rq
.PP
.ix diversions, naming~by number~register interpolation
.ix diversions, splitting
The solution is to break up your diversions based
on the number of entries they contain.
One way to do this is to base the name of the
diversion on a number register, and do some
arithmetic to increment the name when the
diversion has been added to a certain number of
times.
.PP
For example, instead of just diverting to a macro
called
.CW \&.sL ,
we would divert to one called
.CW x\fIn ,
where
.I n
is a number register interpolation generated
as follows:
.Ps
\&.de tC
	.
	.
	.
\&.nr xX +1
\&.nr x0 \\\\n(xX/100+1
\&.da x\\\\n(x0
	.
	.
	.
.Pe
Each time
.CW \&.tC
is called, register
.CW xX
is incremented by 1, and its value, divided by
100, is placed into another register,
.CW x0 .
Until the value of register
.CW xX
exceeds 100\(emthat is, until
.CW \&.tC
has been called 99 times\(em\c
.CW x0
will be equal to 1.
From 100 to 199,
.CW x0
will be equal to 2, and so on.
.PP
Accordingly, the actual macro into which output
is diverted\(emrepresented as
.CW x\e\en(x0 \(em
will first be
.CW x1 ,
then
.CW x2 ,
and so on.
.PP
When it comes time to output the collected entries,
instead of calling a single diversion, we call
the entire series:
.Ps
\&.x1
\&.x2
\&.x3
\&.x4
.Pe
Here, we are assuming that we will have no more
than 400 entries.
If there are fewer entries, one or more of these
diverted macros may be empty, but there's no
harm in that.
If there are more than 400, the contents of
.CW \&.x5
.I "et al" ) (
would still have been collected, but we would have
failed to print them out.
We have the option of adding another in the series
of calls in the end macro, or rebuking the user
for having such a large table of contents!
.Bh "Writing to Standard Error"
.ix standard error
.ix table~of contents, written~to standard~error
Although we've answered one of the objections to
a diverted table of contents by the register
arithmetic just shown, there is another, more
compelling reason for not using this approach
for large documents: there is no way to save
or edit the table of contents.
.ix %end diversions
.page 539
It is produced on the fly as part of the processing
run and must be recreated each time you print
the document.
.PP
For a very large document, such as a book, this
means you must format the entire book, just to
get the table of contents.
It would be far preferable to produce the table
of contents in some form that could be saved,
so the tables from each chapter could be assembled
into a single large table of contents for the
entire book.
.PP
(Incidentally, producing a table of contents for a
large document introduces some other issues as well.
For example, you may want to have an overall table
of contents that shows only top-level headings,
and individual chapter table of contents that give
more detail.
Working out the macros for this approach is left
as an exercise for the reader).
.PP
The best way to produce a table of contents for a
large book is simply to write the entries to
standard error using
.CW .tm ,
.ix [.tm] request %key tm request
and rely on an external program to capture and
process the entries.
.PP
In
.CW ditroff ,
you can instead use the
.ix [.sy] request %key sy request
.CW \&.sy
request to execute the
.CW echo
command and redirect the entries to a file.
An example of this method might be:
.Ps
\&.sy echo \\\\$1 \\\\$2\\a\\t\\\\*(NN >> toc$$
.Pe
However, this approach causes additional system
overhead because it spawns
.CW echo
subprocesses.
Also, because it does not work with
.CW otroff ,
we have used the more general approach provided by
.CW \&.tm .
.PP
Our
.CW \&.tC
macro might look like this:
.Ps
\&.de tC		\\" Standard error; table of contents;
\&.		\\" $1=sect number; $2=title; $3=type
\&.if "\\\\$3"\\\\*(cH"\\{\\
\&.tm ><CONTENTS:.sp 3
\&.tm ><CONTENTS:\\\\*(cH \\\\$1\\\\$2
\&.tm ><CONTENTS:.sp 1.5
\&.\\}
\&.if "\\\\$3"Ah" .tm ><CONTENTS:\\\\$1		\\\\$2\\a\\t\\\\*(NN
\&.if "\\\\$3"Bh" .tm ><CONTENTS:\\\\$1		\\\\$2\\a\\t\\\\*(NN
\&.if "\\\\$3"Figure" .tm ><FIGURE:\\\\$1	\\\\$2\\a\\t\\\\*(NN
\&.if "\\\\$3"Table" .tm ><Table:\\\\$1		\\\\$2\\a\\t\\\\*(NN
\&..
.Pe
Instead of diverting the section lists to separate
macros from the lists of figures and tables, we
send all entries out to standard error.
.PP
To capture this output in a file, we simply need to
redirect the error output:
.Ps
$ \f[CB]ditroff -Tps ... 2> toc\fP
.Pe
.ix [format] shell~script %key format shell script
To do this, we will use our
.CW format
shell script, which was introduced in Chapter 12,
and will be revisited in the next (and final) chapter.
.PP
Because actual error messages might be present in
the output, we prefix a label indicating the type
of entry, for example:
.page 540
.Ps
.ft CB
><CONTENTS:
><FIGURE:
><TABLE:
.ft P
.Pe
It will be up to some outside program to separate the
different groups of entries and subject them to
further processing.
We'll use a
.CW sed
script to separate the entries in the table of contents
from the figure lists, table lists, and index entries.
(In the next chapter, we'll look at the post-processing
of these entries).
Now, let's look at a macro to generate index entries
that will also be written to standard error.
.Bh "Indexes"
.ix indexing
A simple index can be handled in much the same way
as a table of contents.
A macro for a simple index might look like this:
.Ps
\&.de XX
\&.				\\" Section-page number set up
\&.				\\" by Se macro in string NN
\&.tm INDEX:\\\\$1\\t\\\\*(NN
\&..
.Pe
.PP
You might also want to have a macro that doesn't
print the page number, but is just used for a
cross-reference:
.Ps
\&.XN	\\" Cross-reference Index entry, no page number
\&.tm INDEX:\\\\$1
\&..
.Pe
You might also want a macro pair that will index over
several different pages:
.Ps
\&.de IS			\\" Index macro
\&.			\\" Interpolate % for page number
\&.ie \\\\n(.$=1 .tm INDEX:\\\\$1, \\\\n%
\&.el \\{\\
\&.nr X\\\\$2 \\\\n%
\&.ds Y\\\\$2 \\\\$1 \\}
\&.if \\\\n(.t<=1P .tm *\\\\$1* near end of page
\&.if \\\\(nl<1.2i .tm *\\\\$1* near top of page
\&..
\&.de IE			\\" Index end macro
\&.ie !\\\\n(.$=1 .tm IE needs an argument!
\&.el .tm INDEX:\\\\*(Y\\\\$1, \\\\n(X\\\\$1-\\\\n%
\&.if \\\\n(.t<=1P .tm *\\\\*(Y\\\\$1* near end of page
\&.if \\\\n(nl<1.2i .tm *\\\\*(Y\\\\$1* near top of page
\&..
.Pe
The
.CW \&.IS
macro prints out an entry, just like
.CW \&.XX .
However, in addition, it saves the argument into a
string, and takes a letter or digit as an optional
second argument.
This second argument is used to define a number
register and string that will be saved, and
.page 541
not printed until the index and macro is called
with the same argument.
The index and macro print the starting number,
followed by a hyphen and the current page number.
.PP
All of this discussion still avoids one major issue.
The real trick of indexing is what you do with the
raw output after you have it, because a great deal
of sorting, concatenation, and reorganization is
required to rearrange the entries into a
meaningful order.
Fortunately or unfortunately, this topic will have
to wait until the next chapter.
.ix %end extended [ms] macros %key extended ms macros
