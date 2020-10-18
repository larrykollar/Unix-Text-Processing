.ig
	Typed by: Michael Hobgood
	Marked up by: Michael Hobgood
	Proofed on: 21 Oct 2002
..
.so utp.mac
.utp
.Se 16 "What's in a Macro Package?" "Chapter" 1
.page 481
.LP
In Chapters 4, 14, and 15, you've seen almost all of the
individual formatting requests that
.CW nroff
and
.CW troff
provide, and many examples of groups of requests working
together in macros.
However, writing individual macros is still a far cry from
putting together a complete package.
.PP
In Chapters 5 and 6, you've seen the features built into the
.CW ms
and
.CW mm
macro packages, so you can imagine the amount and complexity
of macro definitions.
Perhaps you have even looked at a macro package and
determined that it was impossible to decipher.
Nonetheless, it is possible even as a beginner to write
your own macro package or to make extensions to one of
the existing packages.
.ix macros, developing~a package
.ix macros, structure~of package
.PP
In this chapter, we'll look at the structure of a macro
package\c
\(em\c
the essentials that allow you to handle basic page formatting.
Then, in the next chapter, we'll look at a macro package
with extensions for formatting large technical manuals or
books.
Even if you have no plans to write a new macro package,
this chapter will help you understand and work with
existing packages.
.Ah "Just What Is a Macro Package, Revisited"
.LP
When considering what a macro package is, you might think
only of the visible features provided by macros in existing
macro packages.
But a macro package is more than a collection of user macros
that implement various features.
Failing to understand this fact might cause someone to import
an
.CW mm
macro into an
.CW ms\(em \c
based macro package, and never understand why this macro
fails to work.
.PP
Individual macros are dependent upon other elements of the
macro package, which sometimes makes it hard to isolate a
particular macro, even for purposes of understanding what
it does.
These interdependencies also make it difficult to understand
what a macro package is doing.
That is why we want to look at the underlying structure of
a macro package, and not just the obvious features it provides.
We want to look first at what a macro package
.I must
do before we look at what it
.I can
do.
.page 482
.PP
A macro package is a structure for producing
.I paged
documents.
The
.CW nroff
and
.CW troff
formatters do the actual collecting and formatting of lines
of text, as steadily as a bricklayer placing bricks in a row.
But they do not define the structure that is so obvious by
the end result.
Fundamentally, it is the macro package that defines the
placement of lines on a page.
At a minimum, a macro package must set traps and create
macros to handle page transitions.
It usually also defines the layout of the physical page.
.PP
A macro package may also provide a way to arrange the parts
of
.	\" NOTE: small typo fixed here.  can't have " a documents"
.	\" so I changed it to "documents"
documents and affect their appearance.
Remember the distinction we made earlier between
.I formatting
and
.I formats .
A format reflects the type of document being produced, just
as a floor plan reflects the functions of rooms in a building.
For instance, a technical manual might consist of chapters
and sections that require headings.
Other elements might be bulleted lists and numbered lists,
a table of contents, and an index.
These elements help readers to identify and to locate
important parts of the document.
But these features\c
\(em\c
so obviously important to users\c
\(em\c
are really not the essential elements in a macro package.
.PP
Page formatting is the foundation of a macro package, and
this foundation must be solid before you can build a variety
of custom document formats.
.Bh "New or Extended?"
.ix macros, new~or~extended?
.LP
The first question to ask when you contemplate writing a
whole new package is whether you need to do it all yourself
or can simply build on an existing package.
.PP
There are benefits to either approach.
The existing macro packages are quite complex (especially
.CW mm ).
It can be easier to start over, writing only the macros you
need, than to learn the intricate internals of
.CW ms
or
.CW mm .
A custom macro package can be quite small, including only
macros for page transition (which can be minimal, as we
shall see) and whatever other macros you want.
This is the best approach if you have something specific
in mind.
.PP
As with all programming projects, though, you may find your
package growing larger than intended, as your needs and
understanding grow and you start to add features.
A macro package begun haphazardly can also end that way,
without any consistent structure.
.PP
If you do find yourself wanting to create an entire macro
package, rather than just a few macros, you should think
about modular programming techniques.
Modular programming suggests that you break the tasks to be
performed by a program into the smallest possible
functional units, then build up larger tasks with each of
these smaller units.
This not only helps with debugging and testing of new macros,
but also makes it much easier to write macros, because you
end up with a library of low-level general-purpose macros
that perform important functions.
You don't have to reinvent the wheel for each new macro.
.PP
There are numerous advantages to building on the existing
packages, especially if you want to have a general-purpose package:
.page 483
.ix %begin [ms] macros, page~transition %key ms macros, page transition
.ix %begin [troff] formatter, page~transition %key troff formatter, page transition
.ix %begin page~transition
.ix macros, structure~of package
.RS
.Ls B
.Li
They already contain a wide range of useful macros that you
not only can use directly, but can call on within new macros.
.Li
They are tested and proven.
Unless you are very experienced at text processing, it is
difficult to foresee all of the kinds of problems that can
arise.
When you write your own package, you may be surprised by the
kinds of errors that are filtered out by the design of
.CW ms
or
.CW mm .
.Li
If you are familiar with
.CW ms
or
.CW mm ,
adding a few extended macros to your repertoire is easier
than learning an entire new package.
.Li
It can be easier than you expect to modify or add
to them.
.Le
.RE
.LP
In our own work, we have chosen to extend the
.CW ms
macro package rather than to build an entirely new package.
In this chapter, though, we're going to take a hybrid
approach.
We'll build a minimal
.CW ms -like
package that illustrates the essentials of a macro
package and allows users who don't have access to the full
.CW ms
package to make use of some of the extensions described
in this and later chapters.
.PP
In this
\(lqmini-\c
.CW ms \(rq
package, we have sometimes pared down complex macros so
it is easier to understand what they are doing.
We try to uncover the basic mechanism of a macro
(what it
.I must
do).
As a caveat to this approach, we realize that simplifying
a macro package can reduce its functionality.
However, we see it as part of the learning process, to
recognize that a macro in a certain situation fails to work
and understand the additional code needed to make it work.
.Bh "Implementing a Macro Package"
.LP
.ix macros, [/usr/lib/tmac] %key macros, /usr/lib/tmac
As discussed in Chapter 4, the actual option to
.CW nroff
and
.CW troff
to invoke a macro package is
.CW -m \c
.I x ,
which tells the program to look in the directory
.CW /usr/lib/tmac
for a file with a name of the form
.CW tmac. \c
.I x .
This means you can invoke your own macro package from the
command line simply by storing the macro definitions in a
file with the appropriate pathname.
This file will be added to any other files in the
formatting run.
.PP
If you don't have write privileges for
.CW /usr/lib/tmac ,
you can't create the
.CW tmac .\c
.I x
file (although your system administrator might be willing
to do it for you).
But you can still create a macro package.
You will simply have to read it into the formatter some
other way.
You can either
.KS
.RS
.Ls B
.Li
include it at the start of each file with the
.CW \.so
request:
.Ps
.ti 16n
\&.so /usr/fred/newmacros
.Pe
.Li
or list it on the command line as the first file to be
formatted:
.Ps
.ti 16n
$ \f[CB]nroff /usr/fred/newmacros myfile\fP
.Pe
.Le
.RE
.KE
Nor do the macros need to be stored in a single file.
Especially if you are using a package as you develop it,
you may want to build it as a series of small files that
are called
.page 484
in by a single master file.
You may also want to have different versions of some macros
for
.CW nroff
and
.CW troff .
So, for example, the
.CW mh
(Hayden) macros used to format this book are contained in
many different files, which are all read in by
.CW \.so
requests in
.CW /usr/lib/tmac/tmac.h :
.ix [.so] request %key so request
.ix [troff] formatter, [.so] request %key troff formatter, [.so] request
.Ps
\&.so /work/macros/hayden/startup
\&.so /work/macros/hayden/hidden
\&.so /work/macros/hayden/ch.heads.par
\&.so /work/macros/hayden/display
\&.so /work/macros/hayden/ex.figs
\&.so /work/macros/hayden/vimacs
\&.so /work/macros/hayden/lists
\&.so /work/macros/hayden/stuff
\&.so /work/macros/hayden/index
\&.so /work/macros/hayden/cols
.Pe
Or, like
.CW mm ,
you might have two large files, one for
.CW nroff
and one for
.CW troff .
In
.CW /usr/lib/tmac/tmac.m ,
you find:
.Ps
\&.if n .so /usr/lib/macros/mmn
\&.if t .so /usr/lib/macros/mmt
.Pe
In extending an existing macro package, you are not restricted
to creating a few local macro definitions that must be read
into each file.
You can make a complete copy of one of the existing packages,
which you can then edit and add to.
Or even better, you can read the existing package into your
own package with
.CW \.so ,
and then make additions, deletions, and changes.
For example, you might create a superset of
.CW ms
as follows:
.Ps
\&.\\" /usr/lib/tmac/tmac.S - superset of ms - invoke as -mS
\&.so /usr/lib/tmac/tmac.s	\\" Read in existing package
\&.so /usr/macros/S.headings
\&.so /usr/macros/S.examples
\&.so /usr/macros/S.toc
\&		.
\&		.
\&		.
.Pe
.Ah "Building a Consistent Framework"
.LP
One of the chief factors that distinguishes a macro package
from a random collection of macros is that the package builds
a consistent framework in which the user can work.
.PP
This consistent framework includes:
.RS
.Ls B
.Li
Setting traps to define the top and bottom of each page.
This is the one essential element of a macro package, because
it is the one thing
.CW nroff
and
.CW troff
do not do.
.page 485
.ix [troff] formatter, traps %key troff formatter, traps
.ix traps
.ix macros, setting default values
.ix page offset
.Li
Setting default values for other aspects of page layout,
such as the page offset (left margin) and line length.
(The default page offset in
.CW nroff
is 0, which is not likely to be a useful value, and
.CW troff 's
default line length of 6.5 inches is really too long
for a typeset line).
.Li
Setting default values for typographical elements in
.CW troff
such as which fonts are mounted, the point size and vertical
spacing of body copy and footnotes, adjustment type,
.ix [troff] formatter, hyphenation %key troff formatter, hyphenation
and hyphenation.
.Li
Giving the user a method to globally modify the default
values set in the macro package, or temporarily modify
them and then return to the defaults.
.Le
.RE
In a very simple macro package, we might set up default
values for
.CW troff
like this:
.ix [troff] formatter, [.ad] request %key troff formatter, [.ad] request
.ix [troff] formatter, [.hy] request %key troff formatter, [.hy] request
.ix [troff] formatter, [.ll] request %key troff formatter, [.ll] request
.ix [troff] formatter, [.po] request %key troff formatter, [.po] request
.ix [troff] formatter, [.wh] request %key troff formatter, [.wh] request
.ix [.ad] request %key ad request
.ix [.hy] request %key hy request
.ix [.ll] request %key ll request
.ix [.po] request %key po request
.ix [.wh] request %key wh request
.Ps
\&.po 1i			\\" Set page offset to one inch
\&.ll 6i			\\" Set line length to six inches
\&.ad l			\\" Adjust left margin only
\&.hy 14			\\" Hyphenate, using all hyphenation rules
\&.wh 0 NP		\\" Set new page trap at the top of the page
\&.			\\" (see below for details)
\&.wh -1i FO		\\" Set footer trap
.Pe
(We are assuming here that
.CW troff 's
default values for point size and vertical spacing are
acceptable.
In
.CW otroff ,
we also need to mount the default fonts with
.CW \.fp ,
as described in Chapter 4; in
.CW ditroff ,
a default set of fonts is already mounted).
.PP
Simply setting up explicit default values like this will do
the trick, but for a more effective and flexible macro package,
you should take the further step of storing default values
into number registers.
This has numerous advantages, as we'll see in a moment.
.Bh "Using Number Registers to Increase Flexibility"
.ix [ms] macros, number~register default~values %key ms macros, number register default~values
.ix [troff] formatter, number~registers %key troff formatter, number registers
.ix number~registers
.ix number~registers, [ms] default~values %key number registers, ms default~values
.ix number~registers, setting~default~values~with
.LP
Writing
.CW troff
macros is essentially a kind of programming.
If you pay heed to the principles learned by programmers, you
will find that your macros are more effective, if at first
somewhat more complex to write and read.
.PP
One important lesson from programming is not to use explicit
(so called
\(lq\c
hard-coded\c
\(rq )
values.
For example, if you supply the indent in a paragraph macro
with an explicit value, such as:
.Ps
\&.in 5n
.Pe
you make it difficult for users to change this value at a
later time.
But if you write:
.Ps
\&.in \\\\n(INu
.Pe
the user can change the indent of all paragraphs simply by
changing the value stored in number register
.CW IN .
Of course, for this to work, you must give a default value
to the
.CW IN
register.
.PP
In programming, the process of setting variables to a
predefined starting value is called
.I initialization .
To give you an idea of the kinds of variables you might want
to initialize, Table 16-1 lists the values stored into
number registers by the
.CW ms
macros.
.page 486
.ix macros, initializing
.Ts "Number Registers Used in \f[CB]ms\fP"
.TS
center box tab (#);
cw (1i) c c c c.
Description#Name##Value#
.T&
lw (1i) c c c cw (1i).
##\f[CW]troff\fP##\f[CW]nroff\fP
_
.T&
lw (1i) c c c cw (1i).
Top (header) margin#\f[CW]HM#1i##1i\fP
Bottom (footer) margin#\f[CW]FM#1i##1i\fP
Point size#\f[CW]PS#10p##1P\fP
Vertical spacing#\f[CW]VS#12p##1P\fP
Page offset#\f[CW]PO#26/27i##0\fP
Line length#\f[CW]LL#6i##6i\fP
Title length#\f[CW]LT#6i##6i\fP
Footnote line length#\f[CW]FL#\\\\n(LLu*11/12##\\\\n(LLu*11/12\fP
Paragraph indent#\f[CW]PI#5n##5n\fP
Quoted paragraph indent#\f[CW]QI#5n##5n\fP
Interparagraph spacing#\f[CW]PD#0.3v##1v\fP
.TE
.Te
.PP
The
.CW mm
package uses
.I many
more number registers\c
\(em\c
in particular, it uses number registers as flags to globally
control the operation of macros.
For example, in addition to registers similar to those shown
for
.CW ms
in Table 16-1, there are registers for paragraph type,
numbering style in headings, hyphenation, spacing between
footnotes, as well as counters for automatic numbering of
figures, examples, equations, tables, and
section headings.
(See Appendix B for a complete listing).
However, the registers used in
.CW ms
should give you a sufficient idea of the kinds of values
that can and should be stored in registers.
.Bh "An Initialization Sequence"
.ix [ms] macros, initialization sequence %key ms macros, initialization sequence
.ix [.IZ] macro %key IZ macro
.LP
In the
.CW ms
macro package, a major part of the initialization sequence
is performed by the
.CW \.IZ
macro.*
.FS
*There's no real reason why this sequence needs to be put
in a macro at all, other than the consistency of putting
two backslashes before number registers when they are
read in.
.FE
This macro is executed at the start of a formatting run; then
it is removed.
Let's take a look at a
.I much
simplified version of the initialization sequence for an
.CW ms \c
-like package:
.Ps
\&.de IZ					\\" Initialization macro
\&.					\\" Initialize Number Registers
\&.nr HM 1i				\\" Heading Margin
\&.nr FM 1i				\\" Footing Margin
\&.nr PS 10				\\" Point Size
\&.nr VS 12				\\" Vertical Spacing
\&.nr PO	1i				\\" Page Offset
\&.nr LL 6i				\\" Line Length
.page 487
\&.nr LT 6i				\\" Length of Titles for .tl
\&.nr FL \\\\n(LLu*11/12		\\" Footnote Length
\&.nr PI 5n				\\" Paragraph Indent
\&.nr QI 5n				\\" Quoted Paragraph Indent
\&.nr PD 0.3v				\\" Interparagraph Spacing
\&.					\\" Set Page Dimensions through requests
\&.ps \\\\n(PS
\&.vs \\\\n(VS
\&.po \\\\n(POu
\&.ll \\\\n(LLu
\&.lt \\\\n(LTu
\&.hy 14					\\" Specify hyphenation rules
\&.					\\" Set Page Transition Traps
\&.wh 0 NP
\&.wh -\\\\n(FMu FO
\&.wh -\\\\n(FMu/2u BT
\&..
\&.IZ					\\" Execute IZ
\&.rm IZ					\\" Remove IZ
.Pe
As you can see, the initialization sequence stores default
values into registers, then actually puts them into effect
with individual formatting requests.
.PP
A number of the points shown in this initialization sequence
will be a bit obscure, particularly those relating to trap
positions for top and bottom margins.
We'll return to the topic of page transitions shortly.
.Bh "A Reset Macro"
.ix macros, reset
.ix reset macro
.ix %begin [ms] macros, reset macro %key ms macros, reset macro
.LP
After you have initialized number registers, the next
question is how to make use of the default values in coding.
Some registers, like a paragraph indent, will be used in a
paragraph macro.
But where, for example, might you use the
.CW LL
register?
.PP
First of all, as suggested, putting default values into
number registers allows users to change values without
modifying the macro package itself.
For instance, a user can globally change the interparagraph
spacing just by putting a new value into the
.CW PD
register.
.PP
However, the package itself can use these registers to
periodically
.I reset
the default state of various formatting characteristics.
.PP
.ix %begin [ms] macros, [.RT] macro %key ms macros, [.RT] macro
.ix [.RT] macro ([ms]) %key RT macro ([ms])
The
.CW ms
package defines a macro called
.CW \.RT
(\c
.I reset ),
which is invoked from within every paragraph macro.
The
.CW \.RT
macro
.RS
.Ls B
.Li
turns off centering\(em\f[CW]\&.ce 0\fP;
.Li
turns off underlining\(em\f[CW]\&.ul 0\fP;
.Li
restores the original line length\(em\f[CW]\&.ll \\\\n(LLu\fP;
.page 488
.Li
restores the original point size and vertical spacing\(em\c
\f[CW]\&.ps \\\\n(PS\fP
and
\f[CW]\&.vs \\\\n(VS\fP;
.Li
restores the indent that was in effect before any
\f[CW]\&.IP,.RS,\fP
or
\f[CW]\&.RE\fP
macros were called (too complex to show here);
.Li
changes back to the font in position 1\(em\f[CW]\&.ft 1\fP;
.Li
turns off emboldening for font 1\(em\f[CW]\&.bd 1\fP;
.Li
sets tab stops every \f[CW]5n\fP\(em\f[CW]\&.ta 5n 10n 15n 20n ...\fP;
.Li
turns on fill mode\(em\f[CW]\&.fi\fP.
.Le
.RE
This is part of the
.CW ms
error recovery scheme.
Rather than aborting when it encounters an error,
.CW ms
frequently invokes the
.CW \.RT
macro to restore reasonable values for many common
parameters.
.PP
If you have used
.CW ms
for a while, and then switch to another package, you may
find all kinds of errors cropping up, because you've come
to rely on this mechanism to keep unwanted changes from
propagating throughout a document.
For example, suppose you create a macro that decrements the
line length:
.Ps
\&.ll -5n
.Pe
but you forget to increment it again.
You may never notice the fact, because
.CW ms
will restore the line length at the next paragraph macro.
Other packages are far less forgiving.
.PP
Unless you plan to explicitly test for and terminate on
error conditions, it is wise to implement a reset facility
like that used by
.CW ms .
.PP
A simple
.CW ms -like
reset macro follows:
.Ps
\&.de RT				\\" Reset
\&.ce 0				\\" Turn off centering, if in effect
\&.ul 0				\\" Turn off underlining, if in effect
\&.ll \\\\n(LLu			\\" Restore default line length
\&.ps \\\\n(PS			\\" Restore default point size
\&.vs \\\\n(VS			\\" Restore default vertical spacing
\&.ft 1				\\" Return to font in position 1
\&.ta 5n 10n 15n 20n 25n 30n 35n 40n 45n 50n 55n 60n 65n 70n
\&.fi				\\" Restore fill mode
\&..
.Pe
The
.CW ms
version of
.CW \.RT
also ends any diversion invoked outside of the standard
.CW ms
macros that create diversions.
Thus, a reset may occur within a keep (\c
.CW \.KS ,
.CW \.KE ),
footnotes (\c
.CW \.FS ,
.CW \.FE ),
boxed material (\c
.CW \.B1 ,
.CW \.B2 ),
and tables (\c
.CW \.TS ,
.CW \.TE )
without ending the diversion.
.PP
If you look at the actual
.CW ms
reset macro, you will see that it calls another macro, named
.ix [.BG] macro ([ms]) %key BG macro ([ms])
.ix [ms] macros, [.BG] macro %key ms macros, [.BG] macro
.CW \.BG ,
the very first time it is itself called.
.ix %end [ms] macros, [.RT] macro %key ms macros, [.RT] macro
.ix %end [ms] macros, reset macro %key ms macros, reset macro
The
.CW \.BG
macro removes the macros associated with the
unused Bell Labs technical memorandum formats (because the
format has already been determined at that point).
Like
.CW \.IZ ,
the
.CW \.BG
macro is only called once during a formatting run.
In our emulation, we don't make use of the
.page 489
Technical Memorandum macros so we have not implemented the
.CW \.BG
macro.
However, one could easily apply the idea behind the
.CW \.BG
macro: to execute a macro before we begin processing the
body of a document.
This can be useful if a format requires a number of
preliminary or header macros that supply information
about the document.
.Ah "Page Transitions"
.ix macros, page~transition
.LP
A single page transition macro is the only macro that
.I must
be implemented for
.CW nroff
and
.CW troff
to produce paged output.
An example of this simplest of all possible macro packages
follows.*
.FS
*This
\(lq\c
package\c
\(rq
was contributed by Will Hopkins of VenturCom, Inc.
.FE
.Ps
\&.de NP		\\" New Page
\&'bp
\&'sp 1i
\&'ns
\&..
\&.wh -1.25i NP
\&.br
\&.rs
\&.sp |1i
.Pe
.ix traps
.ix [troff] formatter, traps %key troff formatter, traps
The page transition is triggered by a
.I trap
set 1.25 inches from the bottom of the page.
When output text reaches the trap, the
.CW \.NP
macro is executed, which breaks the page (but not the line),
spaces down 1 inch, and enters no-space mode.
The three lines following the macro and trap definition take
care of the special case of the first page, for which the
.CW \.NP
macro is not invoked.
.PP
.ix [.wh] request %key wh request
.ix [troff] formatter, [.wh] request %key troff formatter, [.wh] request
The
.CW \.wh
request, which sets the location of the traps used for page
transition, interprets the value 0 as the top of the page.
Negative values are interpreted relative to the bottom of
the page.
So, for example, assuming that the page length is 11 inches,
the requests:
.Ps
\&.wh 10i BT	\\" Bottom Title Macro
.Pe
and:
.Ps
\&.wh -1i BT	\\" Bottom Title Macro
.Pe
are equivalent.
The second form is the most common.
.PP
This simple
\(lq\c
package\c
\(rq
provides only one macro for page transition.
The bottom margin of the text portion of the page is
determined by the trap location; the top margin by a
spacing request in the macro executed at the trap.
However, it is far more common to work with at least two
page transition macros: one for the page top and one for
the bottom.
.page 490
.PP
An example of a two-trap, two-macro macro package
is given below:
.ix [troff] formatter, [.ns] request %key troff formatter, [.ns] request
.ix [.ns] request %key ns request
.Ps
\&.wh 0 NP
\&.wh -1i FO
\&.de NP					\\" New Page
\&'sp 1i
\&.tl 'Top of Page \\\\n%'''		\\".tl does not cause break
\&'sp |2i
\&'ns
\&..
\&.de FO					\\" Page Footer
\&'sp .25i
\&.tl ''Page Bottom''
\&'bp
\&..
.Pe
.ix [.NP] macro ([ms]) %key NP macro ([ms])
.ix [ms] macros, [.NP] macro %key ms macros, [.NP] macro
A trap is set at the top of the page (\c
.CW "\.wh 0" )
to execute the
.CW \.NP
macro.
This macro provides a top margin and outputs a title in that
space.
The formatter begins processing lines of text until the
bottom of the page trap is encountered.
.ix [.FO] macro %key FO macro
.ix [ms] macros, [.FO] macro %key ms macros, [.FO] macro
It invokes the
.CW \.FO
macro, which supplies a footer margin and outputs a
centered title.
The
.CW \.FO
macro then causes a page break, which in turn invokes
.CW \.NP
at the top of the new page.
It is important that both of these macros avoid causing
a break, so that text in fill mode will continue
smoothly onto the next page.
.PP
By setting traps for both the top and bottom of a page you
have more control over the size of the bottom and top
margins, the placement of headers and footers, and
advanced features like footnotes and multiple-column processing.
.PP
Take some time to experiment with this bare bones macro
package.
If you place it in a file, such as
.CW pagemacs ,
you can use it to format text files, as in the following
example:
.Ps
$ \f[CB]nroff pagemacs text\fP
.Pe
.Bh "No-Space Mode in Page Transitions"
.ix no-space mode
No-space mode is often used in a page transition macro to keep
space from being output at the top of a page.
It is standard page makeup for the top line of each page
to begin at the same point.
Without no-space mode, a spacing request
(such as prespacing in a
paragraph macro) that falls just before the page transition
would result in space being output at the top of the page,
causing uneven positioning of the top line of the page.
.PP
.ix [.rs] request %key rs request
.ix [troff] formatter, [.rs] request %key troff formatter, [.rs] request
Any output text lines restore space mode, so you don't have
to explicitly turn it back on.
.ix [troff] formatter, space~at top~of page %key troff formatter, space at top~of page
.ix space~at top~of page
However, if you explicitly want to put space at the top of
the page (to paste in a figure, for example), use
.CW \.rs
.I "restore spacing" ) (
before the spacing request.
The following sequence can be used to start a new page and
space down 2 inches below the top margin:
.page 491
.Ps
\&'bp
\&.rs
\&'sp 2i
.Pe
.PP
This works in all cases, except on the first page.
You must force a break on the first page before you can
restore spacing.
.ix [.fl] request %key fl request
.ix [troff] formatter, [.fl] request %key troff formatter, [.fl] request
An
.CW \.fl
request will do the trick:
.Ps
\&.fl
\&.rs
\&.sp 3i
\&.ce
A Title on a Title Page
\&.bp
.Pe
The
.CW \.fl
request is useful when you want to flush the line buffer
and cause a break.
.Bh "The First Page"
.ix [troff] formatter, pseudo-page~transition %key troff formatter, pseudo-page transition
.ix pseudo-page~transition
.LP
As you might expect from the previous example, the first
page is unlike others that follow it.
That is because there is no automatic transition to the
first page.
To get around this, the formatter causes a
\(lq\c
pseudo-page transition\c
\(rq when it first encounters a break or begins
processing text outside a diversion.
.PP
.ix %begin [troff] formatter, traps %key troff formatter, traps
.ix %begin traps
For the top of page trap to be executed on the first page,
you must set the trap and define the top of page macro before
specifying any request that causes a break or initiates
processing.
You can test this with the sample macros by putting an
explicit
.CW \.br
request before the
.CW \.NP
macro definition.
After that test, try replacing
.CW \.br
with a
.CW \.tl
request.
Even though this request does not cause a break, it does
initiate processing of text, and so the
.CW \.NP
macro is not executed.
.Ah "Page Transitions in \f[CB]ms\fP"
.LP
Let's take a closer look now at the trap positions we set
in the initialization sequence for our
.CW ms -like
package, together with the definitions of the macros
placed at those positions:
.Ps
\&.de IZ
\&\0\0\0\0\0.
\&\0\0\0\0\0.
\&\0\0\0\0\0.
\&.			\\" Set Page Transition Traps
\&.wh 0 NP
\&.wh -\\\\n(FMu FO
\&.wh -\\\\n(FMu/2u BT
\&.			\\" Define Page Transition Macros
\&..
\&.de NP			\\" \0\0\0\0New Page Macro
\&'sp \\\\n(HMu/2u
\&.PT
.page 492
\&'sp |\\\\n(HMu
\&'ns
\&..
\&.de FO			\\" \0\0\0\0Footer Macro
\&'bp
\&..
\&.de PT			\\" \0\0\0\0Page Top Title Macro
\&.tl '\\\\*(LH'\\\\*(CH'\\\\*(RH'
\&..
\&.de BT			\\" \0\0\0\0Bottom Title Macro
\&.tl '\\\\*(LF'\\\\*(CF'\\\\*(RF'
\&'sp .5i
\&..
.Pe
.ix [troff] formatter, page~layout %key troff formatter, page layout
.ix page~layout
You'll notice a couple of differences from our earlier example.
Instead of specifying
\(lq\c
hard-coded\c
\(rq
values for trap locations, we have set up a top margin
value in the register
.CW HM
.I "header margin" ) (
and a bottom margin value in
.CW FM
.I "footer margin" ). (
.PP
Now we have three trap locations and four page transition
macros.
In the simplified form shown here, you may wonder why so
many macros are used for this simple task.
We'll look at that later, as we show some of the additional
things that are done in these macros.
But for the moment, let's focus on what these macros are.
Their trap locations are shown in Figure 16-1.
.ix [.BT] macro ([ms]) %key BT macro ([ms])
.ix [.FO] macro %key FO macro
.ix [.NP] macro ([ms]) %key NP macro ([ms])
.ix [.PT] macro ([ms]) %key PT macro ([ms])
.ix [ms] macros, [.BT] macro %key ms macros, [.BT] macro
.ix [ms] macros, [.FO] macro %key ms macros, [.FO] macro
.ix [ms] macros, [.NP] macro %key ms macros, [.NP] macro
.ix [ms] macros, [.PT] macro %key ms macros, [.PT] macro
.RS
.Ls B
.Li
.CW \.NP
.I "new page" ) (
is invoked by a trap at the top of each page (\c
.CW "\.wh 0 NP" ).
It spaces down
\(12
the distance specified in the
.CW HM
register, calls the
.CW PT
macro, and then spaces down the full distance specified
by the header margin.
.Li
.CW \.PT
.I "page title" ) (
prints out a three-part title consisting of user-definable
strings
.CW LH ,
.CW CH ,
and
.CW RH
.I "left header" , (
.I "center header" ,
and
.I "right header" ).
.Li
.CW \.FO
(\c
.I footer )
is invoked by a trap at the distance from the bottom of the
page specified by the
.CW FM
register (\c
.CW \.wh\0
.CW -\e\en(FMu\0
.CW FO ).
This macro causes a break to a new page.
Note the use of
.CW 'bp
rather than
.CW \.bp
so that any partially filled line is not output, but is
held till the next page.
.Li
.CW \.BT
.I "bottom title" ) (
is invoked by a trap at
\(12
the distance from the bottom of the page specified by the
.CW FM
register
(\c
.CW \.wh\0
.CW -\e\en(FMu/2u\0
.CW BT ).
.Le
.RE
Although this sequence is different than our earlier example,
it is about as easy to understand.
The main difference, however, is that there are two traps
at the bottom of the page.
The first (\c
.CW FO )
causes a page break, and the second (\c
.CW BT )
places the footer.
Even though the first trap caused a page break,
.I "the formatter keeps going till it reaches the true"
.I "bottom of the page specified by the page length" .
On its way, it passes the second trap that invokes
.CW \&.BT .
.PP
The use of the four page transition macros is slightly
inconsistent in
.CW ms ;
.CW \.PT
is invoked from
.CW \.NP ,
but
.CW \.BT ,
which could just as well be invoked by
.CW \.FO ,
is instead invoked by a trap.
.ix %end [troff] formatter, traps %key troff formatter, traps
.ix %end traps
.page 493
.Fs 0 F
.ig
Two different ways of expressing this
picture, one via pic & the other hard-coded.
Set the Mypic register to 1 to see the pic
version, 0 to see the other. The pic version
adds some extra space at the top of the page,
which may not be to everyone's liking.
..
.nr Mypic 1
.ie \n[Mypic] \{\
.PS
line right 3.5
line down 4.5
line left 3.5
line up 4.5
move right 1.5
box invis wid 0.5 ht 0.25 fill 0 "NP"
move down 0.5 right 1.5
line dashed left 3.5
move right 1.5
box invis wid 0.5 fill 0 "PT"
move down 0.5 right 1.5
line dashed left 3.5
move right 1.25
box invis wid 1 fill 0 "\fItext starts\fP"
move down 2.5 right 1.25
line dashed left 3.5
move right 1.5
box invis wid 0.5 fill 0 "FO"
move down 0.5 right 1.5
line dashed left 3.5
move right 1.5
box invis wid 0.5 fill 0 "BT"
.PE
.\}
.el \{\
.br
.nr UTPIN \n(IN
.in 1.25i
.mk UTPa
\D'l 0 4i'\c
\D'l 3.5i 0'\c
\D'l 0 -4i'\c
\D'l -1.5i 0'
.br
.sp |\n[UTPa]u
\D'l 1.5i 0'
.br
.sp |(.5i +\n[UTPa]u)
.mk UTPb
\D'l 1.5i 0'
.br
.sp |(1i +\n[UTPa]u)
.mk UTPc
\D'l 1.25i 0'
.br
.sp |(3i +\n[UTPa]u)
.mk UTPd
\D'l 1.5i 0'
.br
.sp |(3.5i +\n[UTPa]u)
.mk UTPe
\D'l 1.5i 0'
.br
.sp |\n[UTPb]u
\h'|2i'
\D'l 1.45i 0'
.br
.sp |\n[UTPc]u
\h'|2.25i'
\D'l 1.2i 0'
.br
.sp |\n[UTPd]u
\h'|2i'
\D'l 1.45i 0'
.br
.sp |\n[UTPe]u
\h'|2i'
\D'l 1.45i 0'
.sp |\n[UTPa]u
.ft CW
.nr UTPW (.25i - \w'NP')
\h'|1.5i+\n[UTPW]u'
\v'3p'NP\v'-3p'
.br
.sp |\n[UTPb]u
.nr UTPW (.25i - \w'PT')
\h'|1.5i+\n[UTPW]u'
\v'3p'PT\v'-3p'
.br
.sp |\n[UTPc]u
.ft I
.nr UTPW (.5i - \w'text' -\w' ' -\w'starts')
\h'|1.5i+\n[UTPW]u'
\v'3p'text starts\v'-3p'
.br
.sp |\n[UTPd]u
.ft CW
.nr UTPW (.25i - \w'FO')
\h'|1.5i+\n[UTPW]u'
\v'3p'FO\v'-3p'
.br
.sp |\n[UTPe]u
.nr UTPW (.25i - \w'BT')
\h'|1.5i+\n[UTPW]u'
\v'3p'BT\v'-3p'
.br
.sp |(4i + \n[UTPa]u +1v)
.ft R
.in \n[UTPIN]u
.\}
.Fe "Top and Bottom Margins"
.Bh "Headers and Footers"
.LP
.ix [troff] formatter, headers~and~footers %key troff formatter, headers and~footers
.ix footers
.ix headers
Most books, and many shorter documents, include headers and
footers.
In books, headers often include the title of the book on the
left-hand page, and the title of the chapter on the right.
The footer typically includes the page number, either
centered or in the lower outside corner, alternating from
left to right. (Although all three elements are usually
present, they can be in different positions depending on
the book design).
.PP
.ix [troff] formatter, [.tl] request %key troff formatter, [.tl] request
.ix [.tl] request %key tl request
As previously mentioned, the
.CW \.tl
request was designed specifically for producing the
three-part titles used in headers and footers.
.ix [ms] macros, footers %key ms macros, footers
.ix [ms] macros, headers %key ms macros, headers
The
.CW ms
package uses this request in both the
.CW PT
and
.CW BT
macros, filling the three fields with symmetrically named
string invocations.
If the string is undefined, the field is blank.
.PP
The macro package itself may define one or more of the
fields.
The
.CW \.IZ
macro from
.CW ms
contains this piece of code:
.Ps
\&.if "\\\\*(CH"" .ds CH "- \\\\\\\\n(PN -
\&.if n .ds CF "\\\\*(DY
.Pe
The
.CW ms
macros define the center header as the page number set
off by hyphens.
For
.CW nroff
only, the center footer is set to the current date. (An
.CW nroff -formatted
document is assumed to be a draft, but a
.CW troff -formatted
document is assumed to be final camera-ready copy).
.page 494
.PP
.ix [troff] formatter, page~numbers %key troff formatter, page numbers
The
.CW ms
macros transfer the page number from the
.CW %
register to one called
.CW PN .
Note the number of backslashes required to get the page
number output at the proper time\c
\(em\c
not in the string definition, nor in the macro definition,
but at the time the title is output.
.PP
If you don't like this arrangement, you can simply redefine
the strings (including redefining them to nothing if you
want nothing to be printed).
As a developer of macros built on top of
.CW ms ,
you could, for example, have a chapter heading macro
automatically set the chapter title into one of these strings.
(More on this later).
.PP
.ix [ms] macros, redefining header~or footer %key ms macros, redefining header or footer
Headers and footers are often set in a different type and
size than the body of the book.
If you are using a standard macro package, font and size
changes can simply be embedded in the header or footer
strings:
.Ps
\&.ds LH "\\fIAn Introduction to Text Processing\\fP
.Pe
Or, if you are writing your own macros or redefining an
underlying package like
.CW ms ,
you can embed the changes directly into the
.CW \.tl
request:
.Ps
\&.tl '\\s-2\\\\*(LF'\\\\*(CF'\\\\*(RF\\s0'
.Pe
Another point: it is often desirable to alternate headers
and footers on odd and even pages.
For example, if you want to put a book title at the outside
upper corner of a left-hand (even) page, and the chapter
title at the outside upper corner of a right-hand (odd)
page, you can't really work within the structure
.CW ms
provides.
.PP
To do this properly, you could use a construct like the
following within your
.CW \.PT
macro:
.Ps
\&.if e .tl '\\\\*(TI'''
\&.if o .if \\\\n%-1 .tl '''\\\\*(CH'
.Pe
where the string
.CW TI
holds the title of the book, and
.CW CH
holds the title of the chapter.
If it's an odd page, we also test that it's not the first
page.
By invoking specific strings, you do lose the generality
of the mechanism provided by
.CW ms .
.Bh "Page Numbers in Three-Part Titles"
.ix [troff] formatter, three-part~titles %key troff formatter, three-part titles
.ix page number, in three-part~titles
.LP
Inasmuch as the chief application of three-part titles is in
producing header and footer lines from within page transition
macros, there is a special syntax for including page numbers.
A
.CW %
character anywhere in a title will be replaced with the
current page number.
This saves the trouble of having to do a proper number
register interpolation and makes it easier for unsophisticated
users of
.CW ms
or
.CW mm
to include page numbers in header and footer strings.
.PP
Whenever
.CW nroff
or
.CW troff
makes use of a character in a special way, you can be sure
there is a back door that allows you to change that character.
.ix [.pc] request %key pc request
.ix [troff] formatter, [.pc] request %key troff formatter, [.pc] request
The
.CW \.pc
.I "page character" ) (
request allows you to specify that some other character
than
.CW %
should perform this function:
.Ps
\&.pc ^		\\" Use ^ instead of % to print page # in .tl
.Pe
This does not change the name of the
.CW %
number register, which also contains the page number.
.page 495
.Bh "Title Length"
.ix title length
.ix [troff] formatter, adjusting title~length %key troff formatter, adjusting title length
.LP
The other thing you can adjust is the length of the
three-part title produced by
.CW \.tl .
Usually it is set to the same length as a text line, but
this need not be so.
Title length is specified independently of line length with
.ix [troff] formatter, [.lt] request %key troff formatter, [.lt] request
.ix [.lt] request %key lt request
the
.CW \.lt
(\c
.I "length [of] title" )
request.
For example:
.Ps
\&.lt 6.5i
.Pe
The title length is
.I not
independent of the page offset, so if you want a title that
is longer than the line length, yet centered on the page,
you will need to muck with the page offset as well.
(Note that this is most likely to occur within a page
transition macro).
.Ps
\&.po 1i					\\" Page Layout Defaults
\&.ll 6.5i
\&\0\0\0\0.
\&\0\0\0\0.
\&\0\0\0\0.
\&.lt 7i
\&.tl 'Alcuin User's Guide''%'	\\" Title will extend 1/2 inch
\&\0\0\0\0.					\\" past right margin
\&\0\0\0\0.
\&\0\0\0\0.
\&.po -.25i
\&.lt 7i
\&.tl 'Alcuin User's Guide''%'	\\" Title will extend 1/4 inch
\&.po +.25i				\\" on either side
.Pe
An
.CW \.lt
request without an argument will restore the previous
title length.
.Ah "Some Extensions to the Basic Package"
.LP
Thus far, we've looked at what it will take to implement a
small
.CW ms -like
macro package.
Now let's look at some extensions to the basic structure of
the package that will make it more flexible.
These extensions could be added to the minimal package shown
earlier in this chapter, or they could be added to a full
.CW ms
package, as we have done at our own site.
.Bh "Changing Page Size"
.ix page size
.ix [troff] formatter, changing page size %key troff formatter, changing page size
.LP
.ix [ms] macros, page size %key ms macros, page size
.ix [troff] formatter, traps %key troff formatter, traps
.ix traps
As mentioned earlier, the initialization sequence usually sets
up default values for line length, page offset, and the
placement of the top and bottom traps.
In the standard
.CW ms
package, all of these values are set up to produce an
8\(12-by-11 inch page.
.PP
This is fine for
.CW nroff ,
but with
.CW troff ,
one might well want to produce a different page size.
For example, many books are typeset for a
5\(12-by-8\(12 inch page.
.PP
The most obvious move is to change the page length:
.page 496
.ix [.pl] request %key pl request
.ix [troff] formatter, [.pl] request %key troff formatter, [.pl] request
.Ps
\&.pl 8.5i
.Pe
and then reset the line length, title length, and page
offset using the standard registers
.CW ms
provides.
.PP
.	\" Note: I think he really means "may work" if your ....
.	\" It would make more sense, since he goes on to say
.	\" why it might not work for sheet fed devices.
This may not work if your output device uses continuous-roll
paper, such as a typesetter.
However, in
.CW nroff ,
or when using
.CW troff
with a sheet-fed laser printer, this may split your formatted
output pages across physical sheets of paper.
(Some devices translate a
.CW \.bp
into a page eject code or
.I formfeed ;
others simply add blank lines to push text onto the next
physical page.
For this reason, it is perhaps preferable to think of
.CW \.pl
as the
.I "paper length"
rather than the
.I "page length" ).
.PP
In addition, when you are printing a small page, it is nice
to print cut marks to show the location of the page
boundaries.
If you change the page length, any cut marks you place will
be off the page that
.CW troff
knows about, and will not be printed.
.PP
For both of these reasons, we took a different approach.
We modified the
.CW ms
.CW \.IZ
macro so that changing the header and footer margins would
effectively change the page size, instead of just the margins.
(In standard
.CW ms ,
you can change the size of the top and bottom margins, but
this doesn't change the page size, because the placement
of the footers is fixed after the initialization macro
has been called.
The trap position for
.CW FO
is reset at the top of every page, thus taking into account
changes in the value of the
.CW FM
register.
But the trap position for
.CW BT
is never touched after
.CW \.IZ
has been executed).
.PP
In our package, we decided to set up some standard page
sizes as part of
.CW \.IZ .
In our business, writing and producing technical manuals,
we often print books in both sizes.
Early drafts are printed on the laser printer in
8\(12 by 11 format; later drafts and final camera-ready
copy are produced in 5\(12 by 8\(12 format.
We also produce quick-reference documents in a narrow
6-panel card or pamphlet.
The user selects the size by specifying a command-line
switch.
This approach has the advantage of letting the user change
all of the parameters associated with a given size
with one easy command.
.PP
The
.CW \.IZ
macro in our mini-\c
.CW ms
package now looks like this:
.Ps
\&.de IZ					\\" Initialization macro
\&.					\\" Initialize Number Registers
\&.					\\" Quick Reference Card size
\&.if \\\\nS=2 \\{\\
\&.	nr pW 3.5i			\\" Page Width
\&.	nr tH 1.25i			\\" Trim Height adjustment
\&.	nr LL 2.8i			\\" Line Length
\&.	nr LT 2.8i\\}			\\" Title Length
\&.					\\" 5 1/2 by 8 1/2 size
\&.ie \\\\nS=1 \\{\\
\&.	nr pW 5.5i			\\" Page Width
\&.	nr tH 1.25i			\\" Trim Height adjustment
\&.	nr LL 4.25i			\\" Line Length
\&.	nr LT 4.25i\\}			\\" Title Length
\&.					\\" 8 1/2 by 11 size
\&.el \\{\\
\&.	nr pW 0			\\" Page Width
.page 497
\&.	nr tH 0			\\" Trim Height adjustment
\&.	nr LL 6i			\\" Line Length
\&.	nr LT 6i\\}			\\" Title Length
\&.				\\" Values independent of page size
\&.nr FM 1i				\\" Footer Margin
\&.nr HM 1i				\\" Header Margin
\&.nr PO 1i				\\" Page Offset
\&.nr PS 10				\\" Point Size
\&.nr VS 12				\\" Vertical Spacing
\&.nr FL \\\\n(LLu*11/12			\\" Footnote Length
\&.nr PI 5n				\\" Paragraph Indent
\&.nr QI 5n				\\" Quoted Paragraph Indent
\&.nr PD 0.3v				\\" Interparagraph Spacing
\&.				\\" Set Page Dimensions through requests
\&.ps \\\\n(PS
\&.vs \\\\n(VS
\&.po \\\\n(POu
\&.ll \\\\n(LLu
\&.lt \\\\n(LTu
\&.ft 1
\&.hy 14					\\" Specify hyphenation rules
\&.					\\" Set Page Transition Traps
\&.wh 0 NP				\\" Top of page
\&.wh -(\\\\n(FMu+\\\\n(tHu) FO		\\" Footer
\&.wh -((\\\\n(FMu/2u)+\\\\n(tHu) BT	\\" Bottom titles
\&.if \\\\nS .wh -\\\\n(tHu CM		\\" Position of bottom mark
\&..
.Pe
The
.CW \.NP
macro has been modified as follows:
.Ps
\&.de NP					\\" New Page Macro
\&'sp \\\\n(tHu 				\\" Space down by trim height
\&.ie \\\\nS \\{\\
\&.	CM				\\" If small format, print cut mark
\&'	sp \\\\n(HMu/2u-1v\\}		\\" Correct baseline spacing
\&.el 'sp \\\\n(HMu/2u			\\" Space down by half HM
\&.PT
\&'sp |\\\\n(HMu+\\\\n(tHu		\\" Space to HM plus adjustment
\&'ns
\&..
.Pe
By simply setting the
.CW S
.I size ) (
register from the command line, the user can choose from
one of three different sizes. For example:
.Ps
$ \f[CB]ditroff -Tps -rS1\fP \f[I]textfile\fP \f[CB]| devps | lp\fP
.Pe
will choose the 5\(12-by-8\(12 page size.
.page 498
.ix %begin [troff] formatter, cut~marks %key troff formatter, cut marks
.ix %begin cut~marks
.PP
What we've done here is to assume that the paper size is
still 8\(12 by 11.
We've defined a fudge factor, which we've called the
.I "trim height adjustment" ,
and stored it in a register called
.CW tH .
If the user has set the size register from the command line,
we use this adjustment factor to:
.RS
.Ls B
.Li
shift the location of the footer trap:
.Ps
.ti 16n
\&.wh -(\\\\n(FMu+\\\\n(tHu) FO
.Pe
.Li
shift the location of the bottom title trap:
.Ps
.ti 16n
\&.wh -((\\\\n(FMu/2u)+\\\\n(tHu) BT
.Pe
.Li
place a new trap to print cut marks at the true bottom
of the page:
.Ps
.ti 16n
\&.if \\\\nS .wh -\\\\n(tHu CM
.Pe
.Li
space down at the start of the
.CW \.NP
macro:
.Ps
.ti 16n
\&'sp \\\\n(tHu
.ti 16n
\&.ie \\\\nS \\{\\
.ti 16n
\&.	CM
.ti 16n
\&'	sp \\\\n(HMu/2u-1v\\}
.ti 16n
\&.el 'sp \\\\n(HMu/2u
.ti 16n
\&.PT
.ti 16n
\&'sp |\\\\n(HMu+\\\\n(tHu
.Pe
.Le
.RE
Note that in
.CW \.NP
we need to adjust for the extra line spacing that occurs
as a result of printing the cut marks.
Otherwise, the
.CW \.PT
macro would be invoked one line lower on a page with cut
marks than on one without.
.Bh "Cut Marks"
.LP
We've mentioned that if you are producing typeset or
laser-printed copy on less than an 8\(12 by 11 page,
it is usually desirable to place marks showing the actual
page boundary.
The paper is then cut on these marks in preparation for
pasteup on camera-ready boards.
.PP
As you've seen in the preceding discussion, we print the
cut mark at the top of the page from the
.CW \.NP
macro, after spacing down by the desired trim height.
The cut marks at the bottom of the page are printed by
calling the cut mark macro with a trap placed at the
trim height from the bottom of the page.
.PP
As you'll notice, the execution of the cut mark macro is
conditioned on the presence of the
.CW S
register, which indicates that the user has requested a
small page.
.PP
Here's a simple version of the actual cut mark macro:
.Ps
\&.de CM				\\" Cut Mark macro
\&'po -(\\\\n(pWu-\\\\n(LLu/2u)	\\" Center cut mark around text
\&.lt \\\\n(pWu			\\" Set title length for cut mark
\&'tl '+''+'			\\" Print cut mark
.page 499
\&.lt \\\\n(LTu			\\" Reset title length
\&'po +(\\\\n(pWu-\\\\n(LLu/2u)	\\" Reset page offset
\&..
.Pe
.ix %end [troff] formatter, cut~marks %key troff formatter, cut marks
.ix %end cut~marks
.PP
As with all activity that takes place during the page
transition, it is very important that nothing in the cut
mark macro causes a break.
For this reason, all break causing requests are started with
the no-break control character
(\c
.CW ' ),
and the cut marks themselves are printed with
.CW \.tl ,
which doesn't cause a break.
(The other way to avoid breaks is to do all of your page
transition work in a different environment, but doing
this uses up one of the environments, which might be
better used for another purpose).
.PP
We've specified the width of the page in the
.CW pW
register.
To center the cut marks around the text, we adjust the page
offset by the difference between the page width and half
the line length.
Then we set the title length to the page width, and actually
print the cut marks with
.CW \.tl .
Then, of course, we reset the original page offset and
title length.
.PP
In the implementation shown, we use simple plus signs to
create the cut marks.
This creates a slight inaccuracy, because the page width will
be from end to end of the plus signs, and the height from
baseline to baseline, rather from the center of the plus
as we'd like.
.PP
There are two ways that we could deal with this.
One is to fudge the height and the width to account for
the character widths.
The other is to use a specially drawn mark that will
put the actual cut lines at the edge rather than the
center of the figure.
.PP
A very simple way to do this is to use the box rule, the
root-en, and the underrule.
Because the cut marks are no longer symmetrical, though,
we'll need to give the cut mark macro an argument
to specify whether we're at the top or the bottom of
the page:
.Ps
\&.de CM				\\" Cut Mark macro
\&'po -(\\\\n(pWu-\\\\n(LLu/2u)	\\" Center cut mark around text
\&'lt \\\\n(pWu			\\" Set title length for cut mark
\&.ie "\\\\$1"T" 'tl '\\(br\\(rn''\\(rn\\(br'	\\" Print cut mark
\&.el 'tl '\\(br\\(ul''\\(ul\\(br'
\&'lt \\\\n(LTu			\\" Reset title length
\&'po +(\\\\n(pWu-\\\\n(LLu/2u)	\\" Reset page offset
\&..
.Pe
When we invoke
.CW \.CM
from within
.CW \.NP ,
we'll just have to add the argument
.CW T
to specify we're at the top.
.PP
The cut marks will look like this:
.	\" Note: code to simulate the CM macro
.sp
.nr UTPPO \n(PO
.nr UTPLT \n(LL
.po 1.75i
.lt 4i
.tl '\(br\(rn''\(rn\(br'
.sp
.tl '\(br\(ul''\(ul\(br'
.sp
.po \n[UTPPO]u
.lt \n[UTPLT]u
.	\" end of code to simulate the CM macro
.page 500
.ix %begin [troff] formatter, footnotes %key troff formatter, footnotes
.ix %begin footnotes
.Ah "Other Exercises in Page Transition"
.LP
We've looked at the basic mechanism for page transition,
and shown one way to extend that mechanism to allow the user
to select different page sizes.
We have not exhausted the topic of page transition,
however.
Before we begin to discuss the development of macros that
prescribe document formats, rather than basic page
formatting, we will briefly consider these topics:
.RS
.Ls B
.Li
Footnotes
.Li
Multicolumn processing
.Li
Page top resets
.Li
Handling widows and orphans
.Le
.RE
.Bh "Footnotes"
.ix [ms] macros, footnotes %key ms macros, footnotes
.LP
Footnotes make page transition an even more complex exercise.
Anyone who has typed footnotes on a typewriter knows the
problem.
Because the presence of a footnote shortens the space
available on the page for regular text, you need to know
the size of the footnote before you know if its reference
will fit on the bottom of the current page, or will be
pushed to the top of the next.
There is always the possibility of a classic Catch-22:
a footnote whose reference falls at the bottom of the
page only if the footnote itself isn't printed there.
.PP
Let's look first at a very simple footnote mechanism\c
\(em\c
one that has a reasonable chance of failure in the face
of heavy demand, but nonetheless illustrates the basic
mechanism at work.
.PP
The first thing we need to know is the position of the
page bottom trap for a normal page\c
\(em\c
one without any footnotes.
For example, in
.CW ms ,
we know that its location is
.CW "-\e\en(FMu" .
(Now
.CW ms
has a perfectly good footnote mechanism, but for purposes
of argument, we're going to pretend we need to add one).
.PP
All we really need to do, on the simplest level, is to save
footnotes in a diversion, measure them, then move the footer
trap back up the page by a distance equal to the size of
the diversion.
.PP
In the new page macro, we initialize (reset to 0) a counter
(\c
.CW fC )
that will tell us if there are any footnotes on the page
and how many.
(We want to handle the first footnote differently than
others on that page).
We also initialize a bottom position for printing footnotes
(\c
.CW Fb )
and initialize it with the value of the standard footer
margin.
(This will be the starting point that will be decremented
as footnotes are encountered).
Last, we provide a reset that restores the page footer trap
at the standard footer margin if it has been changed
because of footnotes on a previous page.
.Ps
\&.				\\" Add to .NP
\&.nr fC 0 1			\\" Initialize footnote counter
\&.nr Fb 0-\\\\n(FMu		\\" Initialize footnote position
\&.ch FO -\\\\n(FMu		\\" Reset normal footer location
.Pe
.page 501
.ix %end [troff] formatter, footnotes %key troff formatter, footnotes
.ix %end footnotes
Now, a pair of footnote macros are required to open
and close a diversion:
.Ps
\&.de FS				\\" Footnote Start
\&.nr fC 1			\\" Set flag that there are footnotes
\&.ev 1				\\" Use environment 1
\&.da FN				\\" Divert text of footnote
\&.if \\\\n(fC=1 \\{\\		\\" If first footnote
.\" Always 1 at this point (see above). --LK
\\l'1i'				\\" Print 1 inch line before it
\&.br\\}
\&..
\&.de FE				\\" Footnote End
\&.br
\&.di				\\" End diversion
\&.ev				\\" Restore environment
\&.nr Fb -\\\\n(dn		\\" Decrement footnote position by
\&.				\\" size of diversion;
\&.				\\" note that Fb is already negative.
\&.				\\" Reset footer trap
\&.ie (\\\\n(nl+1v)>(\\\\n(.p+\\\\n(Fb) .ch FO \\\\n(nlu+1vu
\&.el .ch FO -\\\\n(Fb
\&..
.Pe
The footnotes are processed in a separate environment.
This environment needs to be initialized, perhaps as part
of the
.CW \.IZ
macro, or as part of the
.CW \.FS
macro the very first time it is called.
The latter method makes it easier for users to change
settings for this environment.
It is recommended that you preserve a separate environment
(either 1 or 2) for footnote processing.
Here is a sample initialization sequence:
.Ps
\&.ev 1			\\" Initialize first environment for footnotes
\&.ps 8
\&.vs 10
\&.ll \\\\n(FLu		\\" FL was initialized to 11/12 of LL
\&.ev
.Pe
The
.CW \.FS
macro opens a diversion
.CW "\&.da FN" ) (
into which we append the text of the footnote.
Before the first footnote on a page, the
.CW \.FS
macro adds a one-inch reference line to mark the beginning
of footnotes.
After we have closed the diversion in the
.CW \.FE
macro, we obtain the size of it from the read-write register
.CW \.dn .
This amount is used to increase
.CW Fb
.	\" Note: fixed typo on negative below
(two negative amounts are added together) and change the
location of the footer trap further up the page.
.PP
Before changing that trap, the footnote end macro has to
find out if the new footer trap will be placed above or
below the current location.
If the new trap location is below where we are, all is well;
the page trap is moved up to that location.
However, if the current footnote places the location above
the current position, there's going to be
trouble.
In this case, we need to execute the footer macro immediately.
.PP
The
.CW troff
formatter keeps the current page position in the
.CW nl
register, and the page length in the register
.CW \.p .
As a result, we can set the trap position based on a
conditional:
.page 502
.Ps
\&.ie (\\\\n(nl+1v)>(\\\\n(.p+\\\\n(Fb) .ch FO \\\\n(nlu+1vu
\&.el .ch FO -\\\\n(Fb
.Pe
If the footnote won't fit, this code puts the trap one line
below the current position; otherwise, the footer trap
location is moved up the page.
.PP
Now we'll have to redefine the footer macro to print
the diverted footnotes, if there are any:
.Ps
\&.de FO				\\" Redefine FO
\&.if \\\\n(fC\\{\\
\&.ev1				\\" Invoke first environment
\&.nf				\\" Good practice when outputting diversions
\&.FN				\\" Print diversion
\&.rm FN				\\" Remove printed diversion
\&.ev\\}
\&'bp				\\" Now break page
\&..
.Pe
.PP
Because the footnote macros are complicated, it might be a
useful aside to look at the process of debugging these macros.
.ix [.tm] request %key tm request
.ix [troff] formatter, [.tm] request %key troff formatter, [.tm] request
We used several
.CW \.tm
requests to report (to standard error) on the sequence of
events during a formatting run of a file that included
footnotes.
What we wanted to know was the location of the footer trap
and when it was sprung.
Inside the
.CW \.FE
macro, we inserted
.CW \.tm
requests to show which of the conditional
.CW \.ch
requests were executed.
.Ps
\&.ie (\\\\n(nl+1v)>(\\\\n(.p+\\\\n(Fb) \\{\\
\&.tm !!!!!! FE: Change trap to current location (\\\\n(nl+1v)
\&.ch FO \\\\n(nlu+1vu \\}
\&.el \\{\\
\&.tm !!!!!! FE: Move trap up the page (\\\\n(Fbu)
.	\" Note: shouldn't this next line have a 'u' in it?
\&.ch FO -\\\\n(Fb \\}
.Pe
Then, inside the
.CW \.FO
macro, we inserted messages to locate two positions on
the page: where the footer macro is invoked by the trap
and where the footnotes have been output.
.Ps
\&.de FO
\&.tm !!!! FO: position is \\\\n(nl (\\\\n(.p+\\\\n(Fb) BEFORE
\&.
\&.
\&.
\&.tm !!!! FO: position is \\\\n(nl AFTER footnotes
\'bp
\&..
.Pe
.PP
To see these terminal messages without the formatted text,
we invoke
.CW nroff
and redirect output to
.CW /dev/null .
(\c
.CW tmacpack
is a small macro package used for testing these macros).
.page 503
.Ps
$ \f[CB]nroff tmacpack textfile > /dev/null\fP
!!!!!! FE: Move trap up the page (-360u)
!!!!!! FE: Move trap up the page (-440u)
!!!!!! FE: Move trap up the page (-520u)
!!!!!! FE: Move trap up the page (-680u)
!!!! FO: position is 1980 (2640+-680) BEFORE
!!!! FO: position is 2420 AFTER footnotes
!!!!!! FE: Move trap up the page (-360u)
!!!!!! FE: Move trap up the page (-440u)
!!!!!! FE: Move trap up the page (-520u)
!!!!!! FE: Change trap to current location (2100+1v)
!!!! FO: position is 2140 (2640+-640) BEFORE
!!!! FO: position is 2580 AFTER footnotes
!!!!!! FE: Move trap up the page (-320u)
!!!! FO: position is 2320 (2640+-320) BEFORE
!!!! FO: position is 2400 AFTER footnotes
.Pe
Part of the reason for making this aside is the difficulty
of writing effective footnote macros.
It requires a fair amount of testing to make sure they work
in all cases.
.ix traps
.ix [troff] formatter, traps %key troff formatter, traps
When we spring the footer trap for the second time, the
messages alert us to a problem\c
\(em\c
the Catch-22 we mentioned earlier.
The formatter encountered a footnote on the last input
line.
The only way to fit both the footnote reference and the
footnote on the same page was to ignore the footer margin
and let the footnote run into it.
.PP
Standard
.CW ms
provides a better way of handling this overflow.
In addition, the
.I "Nroff/Troff User's Manual"
describes a similar mechanism.
Our simplified version,
adequate only for demonstration of this mechanism, will
borrow from both of these sources.
(It might be said that a
\(lq\c
working\c
\(rq
version requires several empirically discovered fudge
factors or, as Joseph Ossanna called them,
\(lq\c
uncertainty corrections\c
\(rq).
.PP
The problem is how to split the footnote overflow if it
extends beyond where we want the bottom of the page to be.
The solution is to put
.I two
trap-invoked macros at the original (standard) page
bottom location.
The trap mechanism in
.CW troff
allows only one macro to be executed by a trap at a given
location.
If you write:
.Ps
\&.wh -\\\\n(FMu M1	\\" Place first macro
\&.wh -\\\\n(FMu M2	\\" Overwrite first macro at this location
.Pe
all you will succeed in doing is wiping out the first
placement with the second.
.PP
However, you can
.I move
a trap location to an occupied position.
The second trap
\(lq\c
hides\c
\(rq
the first and renders it ineffective, but the first is still
in place and is restored if the second subsequently moves
off the spot.
.PP
So here's what we do in our trap initialization:
.ix [.ch] request %key ch request
.ix [.wh] request %key wh request
.ix [troff] formatter, [.ch] request %key troff formatter, [.ch] request
.ix [troff] formatter, [.wh] request %key troff formatter, [.wh] request
.Ps
\&.wh 16i FO		\\" Put regular footer out of the way
\&.			\\" (way off the page)
\&.wh -\\\\n(FMu FX	\\" Place footnote overflow macro
\&.ch FO -\\\\n(FMu	\\" Hide footnote overflow macro
.Pe
The
.CW \.FX
(\c
.I "footnote overflow" )
macro will be invoked only if the
.CW FO
trap is moved (as it will be whenever there are footnotes
on the page).
In
.CW \.FX ,
all we do is start another
.page 504
.ix diversions, used~for footnotes
diversion, so that excess footnote text that would overflow
at the bottom of the page is saved for the next:
.Ps
\&.de FX			\\" Footnote overflow
\&.if \\\\n(fC .di eF	\\" Divert extra footnote
\&..
.Pe
(We'll explain the reason for the test in a moment).
.PP
Odd as it may seem, this diversion can be terminated from
the footer macro
.CW \.FO ,
even though that macro is invoked before the footnote
overflow macro!
Because the
.CW \.FN
diversion inside the
.CW \.FO
macros springs the footnote overflow trap and starts the
overflow diversion, we can close that diversion by a request
in
.CW .FO
following the diversion.
.PP
The code in
.CW \.FO
now looks like this:
.Ps
\&.nr dn 0		\\" Reset diversion size register
\&.if \\\\n(fC \\{\\	\\" If there are footnotes
\&.ev 1
\&.nf
\&.FN
\&.rm FN
\&.if'\\\\n(.z'eF'.di	\\" End diversion opened by FX
\&.ev
\&.nr fC 0 \\}		\\" Done with footnotes
\&'bp
.Pe
There are several things here that need further explanation.
The number register
.CW \.z
always contains the name of the last completed diversion.
(Don't ask us how they manage to put a string into a
number register!)
If our overflow diversion was this last completed diversion,
we terminate it:
.Ps
\&.if '\\\\n(.z'eF' .di
.Pe
.PP
Then, we must take care of another eventuality.
If we get this far
.I without
triggering the overflow trap\c
\(em\c
that is, if
.CW \.FN
did fit on the page\c
\(em\c
we want to disable the overflow macro, which we can do by
zeroing our count register
.CW fC .
.PP
Now on the next page we have to handle any footnote overflow.
We write a new macro that invokes
.CW \.FS
and
.CW \.FE
to output the overflow diversion
(\c
.CW \.eF )
into the normal footnote diversion
(\c
.CW \.FN ).
.Ps
\&.de Fx			\\" Process extra footnote
\&.FS
\&.nf			\\" No-fill mode
\&.eF			\\" Overflow diversion
\&.fi
\&.FE
\&.rm eF
\&..
.Pe
In the new page macro, we add a test to check if the last
diversion amounted to anything, and if it did, we invoke
the
.CW \.Fx
macro.
.page 505
.Ps
\&.			\\" added to .NP
\&.if \\\\n(dn .Fx
\&.
.Pe
To test this new feature, we might add messages inside
.CW \.FX ,
the macro invoked by a hidden trap to open a diversion that
collects any footnote overflow, and inside
.CW \.Fx ,
the macro that redirects the overflow back into the normal
footnote diversion.
You should be able to accomplish this part on your own, as
well as to venture into areas that we did not cover (such
as automatic numbering or marking of footnotes).
Before implementing a footnote mechanism, we urge you to
study the mechanisms in one of the existing macro packages.
However, following the chain of events from when a footnote
is encountered to when it is output in the footer macro\c
\(em\c
on the current page or on the next\c
\(em\c
may seem like a
.CW troff
exercise equivalent to what Alfred Hitchcock called a
MacGuffin: a hopelessly complicated plot not meant to be
figured out but that supplies a reason for many entertaining
scenes.
.Bh "Multicolumn Processing"
.ix %begin [ms] macros, multi-column processing %key ms macros, multi-column processing
.ix %begin [troff] formatter, multi-column processing %key troff formatter, multi-column processing
.ix %begin multi-column processing
.LP
While we're still on the subject of page transition, we
should look briefly at how multicolumn processing works.
.PP
.ix [.mk] request %key mk request
.ix [.rt] request %key rt request
.ix [troff] formatter, [.mk] request %key troff formatter, [.mk] request
.ix [troff] formatter, [.rt] request %key troff formatter, [.rt] request
Multiple columns are generally produced by using the mark
and return mechanism\c
\(em\c
.CW \.mk
and
.CW \.rt \c
\(em\c
and by manipulating the line length and page offset for
each successive column.
The basic trick is to have the page bottom macro check if
multiple columns are in effect, and if so, whether or not
the current column is the last one.
.ix %begin two-column processing, simple~macro~for
.ix [ms] macros, two-column processing %key ms macros, two-column processing
.PP
A simple macro to initiate two-column processing might
look like this*:
.FS
*Despite similar macro and number register names, this is
.I not
the two-column macro used in
.CW ms .
The
.CW ms
package provides a more general multiple column macro,
.CW \.MC ,
of which
.CW \.2C
is a specialized call.
.FE
.Ps
\&.de 2C
\&.mk				\\" Mark top position
\&.nr CL 0 1			\\" Initialize column count flag
\&.ie \\\\$1 .nr CW \\\\$1	\\" Test arg 1 for Column Width
\&.el .nr CW 2.75i		\\" or set default CW
\&.ie \\\\$2 .nr GW \\\\$2	\\" Test arg 2 for Gutter Width
\&.el .nr GW .5i		\\" or set default GW
\&.				\\" Save current one-column settings
\&.nr pO \\\\n(.o			\\" Save current page offset
\&.nr lL \\\\n(LLu		\\" Save original line length
\&.nr LL \\\\n(CWu		\\" Set line length to Column Width
\&.ll \\\\n(LLu			\\" Set line length to Column Width
\&..
.Pe
.page 506
.ix %end [ms] macros, multi-column processing %key ms macros, multi-column processing
.ix %end [troff] formatter, multi-column processing %key troff formatter, multi-column processing
.ix %end multi-column processing
.ix %end two-column processing, simple~macro~for
(We must save the default line length in a new register and
redefine
.CW LL ,
or else a paragraph macro, or any other macro that calls
.CW \.RT ,
will interfere with two-column processing).
.PP
The page footer needs to include the following requests:
.Ps
\&.de FO				\\" New footer macro
\&.ie \\\\n+(CL<2\\{\\		\\" If incremental column count < 2
\&'po+(\\\\n(CWu+\\\\n(GWu)	\\" then increase page offset
\&'rt				\\" Return to mark
\&'ns \\}				\\" Enter no-space mode
\&.el \\{\\			\\" Otherwise
\&'po \\\\n(pOu			\\" Restore original page offset
\&'bp \\}				\\" Start a new page
\&..
.Pe
Because two-column processing is likely to continue beyond
a single page, we need to modify the page top macro to mark
the top of the page and initialize (set to zero) the
column count register.
The two requests at the bottom of the definition have been
added:
.Ps
\&.de NP				\\" New Page Macro
\&'sp \\\\n(HMu/2u
\&.PT
\&'sp |\\\\n(HMu
\&'ns
\&'mk				\\" Mark top of page
\&.if \\\\n(CL .nr CL 0 1	\\" Reset autoincrementing column count
\&..
.Pe
After the
.CW CL
register has been created by
.CW \.2C ,
it can also be used as a flag that two-column processing
is in effect.
The page top resets it to 0 to start the first column on
a new page.
.PP
The macro to return to single-column processing looks
like this:
.Ps
\&.de 1C
\&.rr CL			\\" Remove column count register
\&.po \\\\n(POu		\\" Reset original page offset
\&.nr LL \\\\n(lLu
\&.ll \\\\n(LLu		\\" and line length
\&.bp			\\" Start a new page
\&..
.Pe
The column count register is removed, and the original page
offset and line length are restored.
Unfortunately, using this mechanism, you cannot return to
single-column mode on the same page, without resorting to
extensive use of diversions.
If the first column has already gone to the bottom of the
page, there is no way for a prematurely terminated
second column to
\(lq\c
go back\c
\(rq
and fit the text into two even-sized columns on the
same page.
.page 507
.Bh "Page Top Resets"
.ix [troff] formatter, page~top resets %key troff formatter, page top resets
.ix page~top resets
We've already discussed the use of a reset macro from within
paragraphs to deal with common errors.
Page transitions are also a convenient place to put some
different kinds of resets.
Like paragraphs, you can rely on their regular occurrence
and can therefore trap certain conditions.
.ix change~pages
.PP
In particular, you can use them when you want an effect to
take place for only one page and then stop.
For example, in our business, we are often required to
produce not just complete manuals, but replacement pages
to be inserted into an existing manual.
Sometimes the update page will be exactly the same size as
the original, but often it is longer, and requires additional
space.
.PP
To avoid changing the numbering on subsequent pages,
additional full or partial pages are inserted with a special
numbering scheme.
For example, if a page is numbered 3-4 (section 3, page 4),
and changes to that page run on to an additional page, the
new page will be numbered 3-4a.
.PP
In this situation, we need to temporarily change the way
page numbers are handled, then change back when the page is
done.
We've defined a macro called
.CW \.UN ,
which looks like this:
.Ps
\&.de UN			\\" Update page numbering macro
\&.nr Un 1		\\" Set flag to test on page break
\&.nr % -1
\&.ie !"\\\\$1"" .as NN \\\\$1
\&.el .as NN a
\&..
.Pe
Our extended
.CW ms
macro package normally puts the section number (\c
.CW sE )
and the page number (\c
.CW PN ),
separated by a hyphen, into the string
.CW NN .
In this macro, we simply append a letter to that string.
By default we add the letter
.I a ,
but we give the user the option to specify another letter
as an argument to the macro, so pages can be numbered
3-4,3-4a,3-4b, and so on.
To use the macro, the user simply enters it anywhere on the
update page.
Voil\o"a\(aa"!
The page number now has an
.I a
on the end.
.PP
Notice that the original page number register (\c
.CW % )
was first decremented, so that this new page will have the
same number as the previous one.
More to the point of this discussion, notice that the macro
sets the
.CW Un
number register to 1 as a flag that update numbering is
in effect.
.PP
This flag is tested in the page top macro for the next page,
and if it is set, the original page numbering scheme is
restored as follows:
.Ps
\&.if \\\\n(Un=1 \\{\\
\&.	ds NN \\\\\\\\n(sE-\\\\\\\\n(PN
\&.	nr Un 0\\}
.Pe
(Note that four backslashes are required in the number
register interpolations used in defining
.CW NN
because the string definition will be interpreted twice,
once when the macro is defined, and once when it
is executed).
.page 508
.PP
Keep this trick in mind because there are many cases in which
you can use the page bottom or page top macro to reset
conditions that you don't want to carry across more than
one page.
We'll see another in just a moment.
.Bh "Handling Widows and Orphans"
.ix widows~and~orphans
.ix [troff] formatter, widows~and~orphans %key troff formatter, widows and~orphans
.ix %end [ms] macros, page~transition %key ms macros, page transition
.ix %end [troff] formatter, page~transition %key troff formatter, page transition
.ix %end page~transition
.LP
Widows and orphans are the bane of any markup language\c
\(em\c
the one real advantage of current
.I wysiwyg
systems.
A widow is a single or partial line from the end of a
paragraph left over at the start of the next page.
An orphan is a single line from the start of a
paragraph left alone at the bottom of a page.
Both of these are considered poor page layout.
.PP
As we've discussed, a macro package can take care of orphans
simply by including an
.ix [.ne] request %key ne request
.ix [troff] formatter, [.ne] request %key troff formatter, [.ne] request
.CW \.ne
request in the paragraph macro.
Widows are much harder to take care of, because you don't
know where the end of the paragraph will fall until you
reach it.
.ix [ms] macros, changing bottom margin %key ms macros, changing bottom margin
.ix [troff] formatter, page breaks %key troff formatter, page breaks
.ix page breaks
.PP
In
.CW nroff
and
.CW troff ,
the only way you can handle this problem is to process
each paragraph in a diversion, find out how long it was,
then go back and break it up if necessary.
This greatly increases processing time, and is probably
not worth the effort.
.PP
You could limit the extra work by testing the position on
the page and only diverting paragraphs that occur within
range of the page bottom.
However, even so, this is a difficult problem you may not
want to attempt.
.PP
It may be satisfactory to give users an increased capability
for dealing with widows when they do occur.
Normally, the solution is to print out the document, find
any offending widow lines, then go back and manually break
the pages a line earlier.
However, sometimes it is inconvenient to break the paragraph
earlier\c
\(em\c
it would be better to add the line to the bottom of the
current page.
.PP
In standard
.CW ms ,
the location of the footer trap is reset to
.CW "-\en(FMu"
in the
.CW \.NP
macro at the top of every page.
The user can get extra length on a page just by changing
the value of
.CW FM
on the preceding page.
.PP
We could also write a macro that would let the user make
the change on the offending page.
For example, in
.CW ms :
.Ps
\&.de EL				\\" Extra Line macro
\&.nr eL 1			\\" Set flag
\&.ch FO -(\\\\n(FMu-1v)u	\\" Put trap one line lower
\&..
.Pe
All the user has to do is to introduce this macro anywhere
on the page to be affected.
It is your job as macro developer to reset the normal page
length\c
\(em\c
and the most likely place is in the page top macro
for the next page:
.Ps
\&.if \\\\n(eL=1 \\{\\
\&.ch FO -\\\\n(FMu		\\" Reset to normal location for ms
\&.nr eL 0\\}			\\" Clear flag
.Pe
