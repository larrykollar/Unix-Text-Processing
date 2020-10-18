.ig
	preface.t
	Typed by: Stewart Russell.
	Marked up by: Stewart Russell.
	Addendum added by: Larry Kollar.
	Proofed on: 29 Sep 02
..
.so utp.mac
.utp
.Nh 0
.page xi
.chapter "" "Preface" NONE
.LP
Many people think of computers primarily as
\(lq\c
number crunchers,\c
\(rq
and think of word processors as generating form letters and
boilerplate proposals.
That computers can be used productively
by writers, not just research scientists, accountants, and
secretaries, is not so widely recognized.
Today, writers
not only work with words, they work with computers and the
software programs, printers, and terminals that are part of
a computer system.
.PP
The computer has not simply replaced a typewriter; it has
become a system for integrating many other technologies.
As these technologies are made available at a reasonable cost,
writers may begin to find themselves in new roles as computer
programmers, systems integrators, data base managers, graphic
designers, typesetters, printers, and archivists.
.PP
The writer functioning in these new roles is faced with
additional responsibilities.
Obviously, it is one thing to have
a tool available and another thing to use it skillfully.
Like a craftsman, the writer must develop a number of specialized
skills, gaining control over the method of production as well
as the product.
The writer must look for ways to improve the
process by integrating new technologies and designing new
tools in software.
.PP
In this book, we want to show how computers can be used
effectively in the preparation of written documents, especially
in the process of producing book-length documents.
Surely it is important to learn the tools of the trade, and
we will demonstrate the tools available in the
UNIX
environment.
However, it is also valuable to examine text
processing in terms of problems and solutions: the problems
faced by a writer undertaking a large writing project and
the solutions offered by using the resources and power of a
computer system.
.PP
In Chapter 1, we begin by outlining the general capabilities
of word processing systems.
We describe in brief the kinds
of things that a computer must be able to do for a writer,
regardless of whether that writer is working on a
UNIX
system or on an
IBM PC
with a word-processing package such as WordStar or MultiMate.
Then, having defined basic word-processing
capabilities, we look at how a text-processing system
includes and extends these capabilities and benefits.
Last, we introduce the set of text
.page xii
processing tools in the
UNIX
environment.
These tools, used individually or in combination,
provide the basic framework for a text-processing system, one
that can be custom-tailored to supply additional capabilities.
.PP
Chapter 2 gives a brief review of
UNIX
fundamentals.
We assume
you are already somewhat acquainted with
UNIX,
but we included
this information to make sure that you are familiar with basic
concepts that we will be relying on later in the book.
.PP
Chapter 3 introduces the
.CW vi
editor, a basic tool for entering and editing text.
Although many other editors and
word processing programs are available with
UNIX,
.CW vi
has the advantage that it works, without modification, on almost every
UNIX
system and with almost every type of terminal.
If you learn
.CW vi ,
you can be confident that your text editing skills
will be completely transferable when you sit down at someone
else's terminal or use someone else's system.
.PP
Chapter 4 introduces the
.CW nroff
and
.CW troff
formatting programs.
Because
.CW vi
is a text editor, not a word-processing program,
it does only rudimentary formatting of the text you enter.
You can enter special formatting codes to specify how you
want the document to look, then format the text using either
.CW nroff
or
.CW troff .
(The
.CW nroff
formatter is used for formatting
documents to the screen or to typewriter-like printers;
.CW troff
uses much the same formatting language, but has additional
constructs that allow it to produce more elaborate effects on
typesetters and laser printers).
.PP
In this chapter, we also describe the different types of output
devices for printing your finished documents.
With the wider
availability of laser printers, you need to become familiar
with many typesetting terms and concepts to get the most out
of
.CW troff 's
capabilities.
.PP
The formatting markup language required by
.CW nroff
and
.CW troff
is quite complex, because it allows detailed control over
the placement of every character on the page, as well as a
large number of programming constructs that you can use to
define custom formatting requests or macros.
A number of macro
packages have been developed to make the markup language easier
to use.
These macro packages define commonly used formatting
requests for different types of documents, set up default
values for page layout, and so on.
.PP
Although someone working with the macro packages does not need
to know about the underlying requests in the formatting language
used by
.CW nroff
and
.CW troff ,
we believe that the reader wants to go beyond the basics.
As a result, Chapter 4 introduces additional
basic requests that the casual user might not need.
However,
your understanding of what is going on should be considerably
enhanced.
.PP
There are two principal macro packages in use today,
.CW ms
and
.CW mm
(named for the command-line options to
.CW nroff
and
.CW troff
used to invoke them).
Both macro packages were available with
most
UNIX
systems; now, however,
.CW ms
is chiefly available on
UNIX
systems derived from Berkeley 4.\c
.I x
BSD, and
.CW mm
is chiefly
available on
UNIX
systems derived from AT&T System V.
If you
are lucky enough to have both macro packages on your system,
you can choose which one you want to learn.
Otherwise, you
should read either Chapter 5,
.I "The ms Macros" ,
or Chapter 6,
.I "The mm Macros" ,
depending on which version you have available.
.page xiii
.PP
Chapter 7 returns to
.CW vi
to consider its more advanced features.
In addition, it takes a look at how some of these
features can support easy entry of formatting codes used by
.CW nroff
and
.CW troff .
.PP
Tables and mathematical equations provide special formatting
problems.
The low-level
.CW nroff
and
.CW troff
commands for typesetting a complex table
or equation are extraordinarily complex.
However, no one needs to learn or type these commands,
because two preprocessors,
.CW tbl
and
.CW eqn ,
take a high-level specification of
the table or equation and do the dirty work for you.
They produce a
\(lq\c
script\c
\(rq
of
.CW nroff
or
.CW troff
commands that can be piped to the formatter
to lay out the table or equations.
The
.CW tbl
and
.CW eqn
preprocessors are described in
Chapters 8 and 9, respectively.
.PP
More recent versions of
UNIX
(those that include AT&T's separate
.I "Documenter's Workbench"
software) also support a preprocessor
called
.CW pic
that makes it easier to create simple line drawings
with
.CW troff
and include them in your text.
We talk about
.CW pic
in Chapter 10.
.PP
Chapter 11 introduces a range of other
UNIX
text processing
tools\c
\(em\c
programs for sorting, comparing, and in various ways
examining the contents of text files.
This chapter includes a
discussion of the standard
UNIX
.CW spell
program and the
.I "Writer's Workbench"
programs
.CW style
and
.CW diction .
.PP
This concludes the first part of the book, which covers
the tools that the writer finds at hand in the
UNIX
environment.
This material is not elementary.
In places, it grows quite complex.
However, we believe there is a fundamental
difference between learning how to use an existing tool and
developing skills that extend a tool's capabilities to achieve
your own goals.
.PP
That is the real beauty of the
UNIX
environment.
Nearly all
the tools it provides are extensible, either because they have
built-in constructs for self-extension, like
.CW nroff
and
.CW troff 's
macro capability, or because of the wonderful programming
powers of the
UNIX
command interpreter, the shell.
.PP
The second part of the book begins with Chapter 12, on editing
scripts.
There are several editors in
UNIX
that allow you
to write and save what essentially amount to programs for
manipulating text.
The
.CW ex
editor can be used from within
.CW vi
to make global changes or complex edits.
The next step is to use
.CW ex
on its own; and after you do that, it is a small step to the
even more powerful global editor
.CW sed .
After you have mastered
these tools, you can build a library of special-purpose editing
scripts that vastly extend your power over the recalcitrant
words you have put down on paper and now wish to change.
.PP
Chapter 13 discusses another program\c
\(em\c
.CW awk \c
\(em
that extends the
concept of a text editor even further than the programs
discussed in Chapter 12.
The
.CW awk
program is really a database
programming language that is appropriate for performing certain
kinds of text-processing tasks.
In particular, we use it in
this book to process output from
.CW troff
for indexing.
.PP
The next five chapters turn to the details of writing
.CW troff
macros, and show how to customize the formatting language to
simplify formatting tasks.
We start in Chapter 14 by looking
at the basic requests used to build macros, then go on in
Chapter 15 to the requests for achieving various types of
special effects.
In Chapters 16 and 17, we'll take a look at
the basic structure of a macro package and focus on how to
define the appearance of large documents such as manuals.
We'll show you how to define
.page xiv
different styles of section headings,
page headers, footers, and so on.
We'll also talk about how
to generate an automatic table of contents and index\c
\(em\c
two tasks
that take you beyond
.CW troff
into the world of shell programming
and various
UNIX
text processing utilities.
.PP
To complete these tasks, we need to return to the
UNIX
shell in
Chapter 18 and examine in more detail the ways that it allows
you to incorporate the many tools provided by
UNIX
into an
integrated text-processing environment.
.PP
Numerous appendices summarize information that is spread
throughout the text, or that couldn't be crammed into it.
.ce 1
* * *
.LP
Before we turn to the subject at hand, a few acknowledgments
are in order.
Though only two names appear on the cover of this
book, it is in fact the work of many hands.
In particular, Grace
Todino wrote the chapters on
.CW tbl
and
.CW eqn
in their entirety,
and the chapters on
.CW vi
and
.CW ex
are based on the O'Reilly & Associates' Nutshell Handbook,
.I "Learning the Vi Editor" ,
written by Linda Lamb.
Other members of the O'Reilly & Associates
staff\c
\(em\c
Linda Mui, Valerie Quercia, and Donna Woonteiler\c
\(em\c
helped
tirelessly with copyediting, proofreading, illustrations,
typesetting, and indexing.
.PP
Donna was new to our staff when she took on responsibility for
the job of copyfitting\c
\(em\c
that final stage in page layout made
especially arduous by the many figures and examples in this
book.
She and Linda especially spent many long hours getting
this book ready for the printer.
Linda had the special job of
doing the final consistency check on examples, making sure that
copyediting changes or typesetting errors had not compromised
the accuracy of the examples.
.PP
Special thanks go to Steve Talbott of Masscomp, who first
introduced us to the power of
.CW troff
and who wrote the first
version of the extended
.CW ms
macros,
.CW format
shell script,
and indexing mechanism described in the second half of this
book.
Steve's help and patience were invaluable during the
long road to mastery of the
UNIX
text-processing environment.
.PP
We'd also like to thank Teri Zak, the acquisitions editor
at Hayden Books, for her vision of the Hayden
UNIX
series, and this book's place in it.
.PP
In the course of this book's development, Hayden was acquired
by Howard Sams, where Teri's role was taken over by Jim Hill.
Thanks also to the excellent production editors at Sams,
Wendy Ford, Lou Keglovitz, and especially Susan Pink Bussiere,
whose copyediting was outstanding.
.PP
Through it all, we have had the help of Steve Kochan and Pat
Wood of Pipeline Associates, Inc., consulting editors to the
Hayden
UNIX
Series.
We are grateful for their thoughtful and
thorough review of this book for technical accuracy.
(We must,
of course, make the usual disclaimer: any errors that remain
are our own).
.PP
Steve and Pat also provided the macros to typeset the book.
Our working drafts were printed on an HP LaserJet printer, using
.CW ditroff
and TextWare International's
.CW tplus
postprocessor.
Final typeset output was prepared with Pipeline Associates'
.CW devps ,
which was used to convert
.CW ditroff
output to PostScript, which
was used in turn to drive a Linotronic L100 typesetter.
.Bh "The UTP Revival"
.LP
A lot of changes have occurred in the
UNIX
world since
.I "Unix Text Processing\/"
was first printed in 1987.
In the early 21st century,
personal computers have become dirt cheap, and
WYSIWYG
word processors are everywhere.
Traditional commercial
UNIX
systems are being rapidly replaced\c
\(em\c
not only by Microsoft
operating systems, but by the free Linux and
BSD implementations of UNIX.
The most popular commercial UNIX
has become Apple's MacOS X (ten).
Who could have predicted
.I this
in 1987?
.PP
While
personal computers became cheaper and more powerful,
.CW troff
became an expensive add-on item to an increasingly expensive
operating system.
WYSIWYG
word processors were not nearly as powerful as
.CW troff ,
and only now are beginning to approach
.CW troff 's
capabilities at the high end,
but were easy to learn and available at low cost.
Thus,
.CW troff
rapidly fell out of favor and nearly disappeared.
.PP
In the early 1990's,
James Clark single-handedly created the free
.CW groff
(GNU
.CW roff )
typesetting suite, consisting of a
.CW ditroff
replacement, clones of most of the preprocessors,
and independently recreated
.CW ms
and
.CW man
macro packages.
In addition,
.CW groff
provided some significant extensions to
.CW ditroff \(em\c
one of the most significant being the elimination
of the two-character naming barrier.
Some time after James Clark abandoned further
.CW groff
development, Werner Lemberg and Ted Harding took on
the task of maintaining and further extending the code.
.PP
When Tim O'Reilly and Dale Dougherty decided to make
.I "Unix Text Processing"
available under the Open Book Project,
they were unable to locate a copy of the original
.CW troff
source for the book.
Undaunted, they scanned a proof copy (as bitmaps) and made that
available for download.
When the news reached the
.CW groff
mailing list (\c
.CW groff@ffii.org ),
some members began discussing the possibility of
transcribing the text and recreating the source code.
People started claiming chapters,
a list member opened his mouth one time too many
and became project coordinator, and
\(lq\c
here we are.\c
\(rq
After about a year of manic activity
punctuated with long naps, we have finally
restored the book to its 1987 glory.
.PP
The following people lent a hand with transcription and markup
(in alphabetical order):
Ralph Corderoy,
Michael Hobgood (who did the bulk of the work),
Larry Kollar,
Manas Laha,
Heinz-Jürgen Oertel,
Jack Redman (who joined late, yet just in time),
Stewart Russell, and
Colin Watson.
Jon Snader (no stranger to writing books with
.CW troff )
recreated a version of the macros used for the original book.
Michael Hobgood and Andreas Kähäri have done most
of the proofreading.
While we caught and corrected a few typos, we acknowledge that
we may have introduced others\(emthus
we now lay claim to any remaining errors.
.PP
The PostScript file accompanying
this release was built on an Apple iBook
running MacOS\ X\ 10.2, using
.CW groff
1.19.1;
the PDF was then created using
.CW ps2pdf13
from AFPL GhostScript 8.00.
.PP
Another essential element in the UTP Revival was the
emergence of free OCR software.
While not quite up to the commercial offerings, programs like
.CW gocr
gave more people the opportunity to contribute.
.PP
Finally, we should recognize the efforts of the original
authors and their gracious donation of their book to the
community.
This wouldn't have happened otherwise.
.sp
.DS R
.I
Larry Kollar
UTP Revival Project Coordinator
May 2004
.DE
