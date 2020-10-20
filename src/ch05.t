.ig
	ch05.t
	Typed by: Larry Kollar
	Marked up by: Larry Kollar
	Proofed on 8 Oct 2002
..
.so utp.mac
.utp
.chapter 5 "The \f(CBms\fP Macros" "Chapter" 1
.ix %begin [ms] macros %key ms macros
.LP
.page 104
The
UNIX
shell is a user interface for the kernel,
the actual heart of the operating system.
You can choose the C shell or Korn shell instead of the
Bourne shell, without worrying about its effects on the
low-level operations of the kernel.
Likewise, a macro package is a user interface for accessing the
capabilities of the
.CW nroff /\c
.CW troff
formatter.
Users can select either the
.CW ms
or
.CW mm
macro packages (as well as other packages that are available on some
systems) to use with
.CW nroff /\c
.CW troff .
.PP
The
.CW ms
package was the original Bell labs macro package,
and is available on many
UNIX
systems, but it is no longer officially supported by
AT&T.
Our main reason for giving
.CW ms
equal time is that many Berkeley
UNIX
systems ship
.CW ms
instead of
.CW mm .
In addition, it is a less complex package,
so it is much easier to learn
the principles of macro design by studying
.CW ms
than by studying
.CW mm .
.PP
A third general-purpose package, called
.CW me ,
.ix me macros
is also distributed with Berkeley
UNIX
systems.
It was written by Eric Allman and is comparable to
.CW ms
and
.CW mm .
(Mark Horton writes us:
I think of
.CW ms
as the
FORTRAN
of
.CW nroff ,
.CW mm
as the
.CW PL/I ,
and
.CW me
as the Pascal).
The
.CW me
package is not described in this book.
.PP
In addition, there are specialized packages\(em\c
.CW mv ,
for formatting viewgraphs,
.CW mptx ,
for formatting the permuted index found in the
.I "UNIX Reference Manual" ,
and
.CW man ,
for formatting the reference pages in that same manual.
These packages are simple and are covered in the standard
UNIX
documentation.
.PP
Regardless of which macro package you choose,
the formatter knows only to
replace each call of a macro with its definition.
The macro definition contains the set of requests that the
formatter executes.
Whether a definition is supplied with
the text in the input file or found
in a macro package is irrelevant to
.CW nroff /\c
.CW troff .
The formatter can be said to be oblivious
to the idea of a macro package.
.PP
You might not expect this rather freely structured
arrangement between a macro package and
.CW nroff /\c
.CW troff .
Macros are application programs of sorts.
They organize the types of functions that you need to be able to do.
However, the actual work is accomplished by
.CW nroff /\c
.CW troff
requests.
.PP
In other words, the basic formatting capabilities are inherent in
.CW nroff
and
.CW troff ;
the user implementation of these capabilities to achieve particular
formats is accomplished with a macro package.
.page 105
If a macro doesn't work the way you expect,
its definition may have been modified.
It doesn't mean that
.CW nroff /\c
.CW troff
works differently on your system.
It is one thing to say\(lq
.CW nroff/troff
won't let me do it,\(rq and another to say
\(lqI don't have the macro to do it
(but I could do it, perhaps).\(rq
.PP
A general-purpose macro package like
.CW ms
provides a way of describing the format of various kinds of documents.
Each document presents its own specific problems, and macros help to
provide a simple and flexible solution.
The
.CW ms
macro package is designed to help you format letters, proposals, memos,
technical papers, and reports.
.PP
For simple documents such as letters,
.CW ms
offers few advantages to the basic format requests
described in Chapter 4.
But as you begin to format more complex documents,
you will quickly see the advantage of working with a macro package,
which provides specialized
tools for so many of the formatting tasks you will encounter.
.PP
A text file that contains
.CW ms
macros can be processed by either
.CW nroff
or
.CW troff ,
and the output can be displayed on a terminal screen or printed on a line
printer, a laser printer, or a typesetter.
.Ah "Formatting a Text File with \f(CBms\fP
.ix [ms] macros, invoking %key ms macros, invoking
.LP
If you want to format an
.CW ms
document for a line printer or for a terminal screen,
enter this command line:
.Ps
$ \f(CBnroff -ms\fP \fIfile(s)\fP
.Pe
.LP
To format for a laser printer or typesetter, enter this command line:
.ix [troff] formatter, using~with [ms] %key troff formatter, using with [ms]
.Ps
$ \f(CBtroff -ms\fP \fIfile(s)\fP \f(CB|\fP \fIdevice postprocessor\fP
.Pe
.LP
Be sure to redirect the output to a file or pipe it to the printer;
if you do not, the output will be sent to your terminal screen.
.Bh "Problems in Getting Formatted Output
.LP
There are two ways for a program to handle errors.
One is to have the program terminate and issue an error message.
The other way is to have it keep going in hopes that the problems won't
affect the rest of the output.
The
.CW ms
macros take this second approach.
.ix [ms] macros, error~handling %key ms macros, error handling
.ix errors, in~[ms] %key errors, in ms
.PP
In general,
.CW ms
does its best to carry on no matter how scrambled the output looks.
Sometimes the problems do get corrected within a page or two;
other times the problem continues, making the remaining pages worthless.
Usually, this is because the formatter had a problem
executing the codes as they were entered in the input file.
Most of the time input errors are caused by not including one of the
macros that must be used in pairs.
.PP
Because
.CW ms
allows formatting to continue unless the error is a \(lqfatal\(rq one,
error correction is characteristic of the
.CW ms
macro definitions.
Apart from the main function of the macro, some of them, such as the
paragraph macro, also invoke another macro called
.CW \&.RT
to restore certain default values.
.page 106
.PP
Thus, if you forget to reset the point size or indentation, you might
notice that the problem continues for a while and then stops.
.Ah "Page Layout
.ix page~layout, in~[ms] %key page layout, in~ms
.ix [ms] macros, page~layout %key ms macros, page layout
.ix formatting defaults, [ms] %key formatting defaults, ms
.LP
As suggested in the last chapter,
one of the most important functions of a
macro package is that it provides basic page layout defaults.
This feature makes it worthwhile to use a macro package
even if you don't
enter a single macro into your source file.
.PP
At the beginning of Chapter 4, we showed how
.CW nroff
alone formatted a sample letter.
If we format the same letter with
.CW ms ,
the text will be adjusted on a page that has a default top and bottom
margin of 1 inch, a default left margin, or page offset,
of about 1 inch, and a default line length of 6 inches.
.ix [ms] macros, page~layout defaults %key ms macros, page layout defaults
.PP
All of these default values are stored in
number registers so that you can
easily change them:
.RS
.TS
tab (#);
lf(CW) l l .
LL##Line Length
HM##Header (top) Margin
FM##Footer (bottom) Margin
PO##Page offset (left margin)
.TE
.RE
.PP
For example, if you like larger top and bottom margins,
all you need to do
is insert the following requests at the top of your file:
.Ps
\&.nr HM 1.5i
\&.nr FM 1.5i
.Pe
.PP
Registers such as these are used internally by a number of
.CW ms
macros to reset the formatter to its default state.
They will not take effect until one of those \(lqreset\(rq macros is
.ix reset macro
.ix [ms] macros, reset macro %key ms macros, reset macro
encountered.
In the case of
.CW HM
and
.CW FM ,
they will not take effect until the
next page unless they are specified at
the very beginning of the file.*
.FS
*These \(lqreset\(rq macros (those that call the internal macro
.CW .RT )
.ix [.RT] macro ([ms]) %key RT macro (ms)
.ix [ms] macros, [.RT] macro %key ms macros, RT macro
include
.CW .LP ,
.CW .PP ,
.CW .IP ,
.CW .QP ,
.CW .SH ,
.CW .NH ,
.CW .RS ,
.CW .RE ,
.CW .TS ,
and
.CW .TE .
The very first reset macro calls a special initialization macro called
.CW \&.BG
.ix [.BG] macro ([ms]) %key BG macro (ms)
.ix [ms] macros, [.BG] macro %key ms macros, BG macro
that is used only once, on the first page.
This macro prints the cover sheet, if any
(see \(lqCover Sheet Macros\(rq later
in this chapter), as well as performing some special first-page
initialization.
.FE
.Ah Paragraphs
.ix paragraphs, [ms] macros %key paragraphs, ms macros
.ix %begin [ms] macros, paragraphs %key ms macros, paragraphs
.LP
As we saw in the last chapter, paragraph transitions are natural
candidates for macros because each paragraph generally will require
.ig
	The original printed book had (spacing, indentation,)
	which is incorrect.  Fixed.
	-- Michael Hobgood
..
several requests (spacing, indentation) for proper formatting.
.PP
There are four paragraph macros in
.CW ms :
.page 107
.RS
.TS
tab (#);
lf(CW) l l .
\&.LP##Block paragraph
\&.PP##First line of paragraph indented
\&.QP##Paragraph indented from both margins
\&.IP##Paragraph with hanging indent (list item)
.TE
.RE
.PP
The
.CW .LP
.ix %begin [.LP] macro ([ms]) %key LP macro ms
.ix %begin [ms] macros, [.LP] macro %key ms macros, LP macro
macro produces a justified, block paragraph.
This is the type of paragraph used for most technical documentation.
The
.CW .PP
.ix %begin [.PP] macro ([ms]) %key PP macro ms
.ix %begin [ms] macros, [.PP] macro %key ms macros, PP macro
macro produces a paragraph with a temporary indent for the first line.
This paragraph type is commonly used in
published books and magazines, as
well as in typewritten correspondence.
.PP
Let's use the same letter to illustrate the use of these macros.
In the original example (in Chapter 4), we left blank lines between
paragraphs, producing an effect similar to that produced by the
.CW .LP
macro.
.PP
In contrast,
.CW .PP
produces a standard indented paragraph.
Let's code the letter using
.CW .PP
macros.
Because this is a letter, let's also disable justification with an
.ix justification, [ms] macros %key justification, ms macros
.CW .na
request.
And of course, we want to print the address block in no-fill mode, as
shown in Chapter 4.
Figure 5-1 shows the coded letter and Figure 5-2 shows the formatted
output.
.ix %end [.LP] macro ([ms]) %key LP macro ms
.ix %end [.PP] macro ([ms]) %key PP macro ms
.ix %end [ms] macros, [.LP] macro %key ms macros, LP macro
.ix %end [ms] macros, [.PP] macro %key ms macros, PP macro
.Bh "Spacing between Paragraphs
.ix [ms] macros, spacing~between paragraphs %key ms macros, spacing between paragraphs
.ix paragraphs, spacing between ([ms]) %key paragraphs, spacing between ms
.LP
With
.CW nroff ,
all of the paragraph macros produce a full space between paragraphs.
However, with
.CW troff ,
the paragraph macros output a blank space of 0.3v.
Basically, this means that a blank line will output
one full space and the
paragraph macros will output about a third of that space.
.ix [ms] macros, vertical spacing %key ms macros, vertical spacing
.ix vertical spacing
.PP
The amount of spacing between paragraphs is contained in the number
register
.CW PD
.I "paragraph distance" ). (
If you want to change the amount of space generated by any of the
paragraph macros, simply change the contents of this register.
.PP
For example, if you don't want to leave any space between paragraphs in
the letter, you could put the following line at the start of your file:
.Ps
\&.nr PD 0
.Pe
.LP
This flexibility afforded by macro packages is a major advantage.
It is often possible to completely change the appearance of a coded
document by resetting only a few
number registers at the start of a file.
(As we'll see, this statement is even more true of
.CW mm
than of
.CW ms ).
.page 108
.KF
.Fs
.Ps
\&.ad r
April 1, 1987
\&.sp 2
\&.ad
\&.nf
Mr. John Fust
Vice President, Research and Development
Gutenberg Galaxy Software
Waltham, Massachusetts 02159
\&.fi
\&.sp
\&.na
Dear Mr. Fust:
\&.PP
In our conversation last Thursday, we discussed a documentation
project that would produce a user's manual on the Alcuin
product.  Yesterday, I received the product demo and other
materials that you sent me.
\&.PP
Going through a demo session gave me a much better understanding
of the product.  I confess to being amazed by Alcuin.
Some people around here, looking over my shoulder, were also
astounded by the illustrated manuscript I produced with Alcuin.
One person, a student of calligraphy, was really impressed.
\&.PP
In the next couple of days, I'll be putting together a written
plan that presents different strategies for documenting the
Alcuin product. After I submit this plan, and you have had time
to review it, let's arrange a meeting at your company to discuss
these strategies.
\&.PP
Thanks again for giving us the opportunity to bid on this
documentation project.  I hope we can decide upon a strategy
and get started as soon as possible in order to have the manual
ready in time for the first customer shipment. I look forward to
meeting with you towards the end of next week.
\&.sp
Sincerely,
\&.sp 3
Fred Caslon
.Pe
.Fe "Letter Coded with \f(CBms\fP Macros
.KE
.page 109
.KS
.Fs
.SS
.RS
.ft CW
.nf
                                       April 1, 1987
.sp 2
Mr. John Fust
Vice President, Research and Development
Gutenberg Galaxy Software
Waltham, Massachusetts 02159
.sp .3v
Dear Mr. Fust:
.sp .3v
     In our conversation last Thursday, we discussed
a documentation project that would produce a user's
manual on the Alcuin product. Yesterday, I received
the product demo and other materials that you sent
me.
.sp .3v
     Going through a demo session gave me a much
better understanding of the product.  I confess to
being amazed by Alcuin.  Some people around here,
looking over my shoulder, were also astounded by the
illustrated manuscript I produced with Alcuin.  One
person, a student of calligraphy, was really
impressed.
.sp .3v
     In the next couple of days, I'll be putting
together a written plan that presents different
strategies for documenting the Alcuin product.  After
I submit this plan, and you have had time to review
it, let's arrange a meeting at your company to dis-
cuss these strategies.
.sp .3v
     Thanks again for giving us the opportunity to
bid on this documentation project.  I hope we can
decide upon a strategy and get started as soon as
possible in order to have the manual ready in time
for the first customer shipment. I look forward to
meeting with you towards the end of next week.
.sp .3v
                                       Sincerely,
.sp 2
                                       Fred Caslon
.RE
.ft P
.fi
.sp
.SE
.Fe "Formatted Output
.KE
.LP 0
.Bh "Quoted Paragraphs
.ix [ms] macros, quoted paragraphs %key ms macros, quoted paragraphs
.ix paragraphs, quoted ([ms]) %key paragraphs, quoted ms
.LP
A paragraph that is indented equally from the left and right margins is
typically used to display quoted material.
It is produced by
.CW .QP .
.ix [.QP] macro ([ms]) %key QP macro ms
.ix [ms] macros, [.QP] macro %key ms macros, QP macro
For example:
.Ps
\&.QP
In the next couple of days, I'll be putting together a ...
.Pe
.page 110
The
.CW .QP
macro produces a paragraph indented on both sides.
The pair of macros
.CW .QS
.ix [.QS] macro ([ms]) %key QS macro ms
.ix [ms] macros, [.QS] macro %key ms macros, QS macro
and
.CW .QE
.ix [.QE] macro ([ms]) %key QE macro ms
.ix [ms] macros, [.QE] macro %key ms macros, QE macro
can be used to mark a section longer than one paragraph
that is indented.
This is useful in reports and proposals that quote at length
from another source.
.Ps
\&.LP
I was particularly interested in the following comment
found in the product specification:
\&.QS
Users first need a brief introduction to what
the product does.  Sometimes this is more for the
benefit of people who haven't yet bought the
product, and are just looking at the manual.
However, it also serves to put the rest of the
manual, and the product itself, in
the proper context.
\&.QE
.Pe
.LP
The result of formatting is:
.sp .7v
.ig
	The original example did not have indents on both
	sides of the output.  Fixed.  To get the original
	display, just change .ll below from 4.75 to 5.2i
	--Michael Hobgood
..
.SS
.RS
.ft CW
.nf
I was particularly interested in the following comment
found in the product specification:
.RS
.ft CW
.fi
.ll 4.75i
Users first need a brief introduction to what the
product does. Sometimes this is more for the benefit
of people who haven't yet bought the product,
and are just looking at the manual.  However, it
also serves to put the rest of the manual, and the
product itself, in the proper context.
.RE
.RE
.sp
.SE
.sp .8v
.LP
Use the
.CW .QP
macro inside a
.CW .QS /\c
.CW .QE
block to break up paragraphs.
.Bh "Indented Paragraphs
.ix [ms] macros, indented paragraphs %key ms macros, indented paragraphs
.ix paragraphs, indented ([ms]) %key paragraphs, indented ms
.ix hanging indents
.LP
The
.CW .IP
.ix [.IP] macro ([ms]) %key IP macro ms
.ix [ms] macros, [.IP] macro %key ms macros, IP macro
.ix %begin [.IP] macro ([ms]) %key IP macro ms
.ix %begin [ms] macros, [.IP] macro %key ms macros, IP macro
macro produces an entire paragraph indented from the left margin.
This is especially useful for constructing lists, in which
.ix lists, in [ms] %key lists, in ms
a mark of some kind
(e.g., a letter or number)
extends into the left margin.
We call these
.I "labeled item lists" .
.ix [ms] macros, labeled~item lists %key ms macros, labeled item lists
.PP
The
.CW .IP
macro takes three arguments.
The first argument is a text label; if the label contains
spaces, it should be enclosed within quotation marks.
The second argument is optional and specifies the amount of
indentation; a default of 5 is used if the second argument
is not specified.
A third argument of 0 inhibits spacing before the indented
paragraph.
.PP
Item lists are useful in preparing command reference pages
that describe various syntax items, and in glossaries that
present a term in one column and its definition in the
other.
The following example shows a portion of the input file for
a reference page:
.page 111
.Ps
\&.IP figure 10
is the name of a cataloged figure.  If
a figure has not been cataloged, you need to use
the LOCATE command.
\&.IP f:p 10
is the scale of the
figure in relation to the page.
\&.IP font 10
is the two-character abbreviation or
full name of one of the available fonts
from the Alcuin library.
.Pe
.LP
The following item list is produced:
.sp .7v
.SS
.Ps
figure     is the name of a cataloged figure.  If a figure
           has not been  cataloged,  you  need  to use the
           LOCATE command.
.sp
f:p        is the scale of the figure in relation  to  the
           page.
.sp
font       is the two-character abbreviation or full  name
           of one of the available fonts from  the  Alcuin
           library.
.Pe
.sp
.SE
.sp .8v
.LP
An
.CW .LP
or
.CW .PP
should be specified after the last item so that the text
following the list is not also indented.
.PP
If you want to indent the label as well as the paragraph,
you can use the
.CW .in
request around the list.
The following example:
.Ps
\&.in 10
\&.IP figure 10
is the name of a cataloged figure.  If
a figure has not been cataloged, you need to use
the LOCATE command.
\&.in 0
.Pe
.LP
will produce:
.sp .7v
.SS
.Ps
          figure     is the name of a  cataloged  figure.   If a
                     figure has not been cataloged,  you need to
                     use the LOCATE command.
.Pe
.sp
.SE
.sp .8v
.LP
You can specify an absolute or relative indent.
To achieve the effect of a nested list, you can use the
.CW .RS
(you can think of this as either
.I "relative start"
.ix [.RS] macro ([ms]) %key RS macro ms
.ix [ms] macros, [.RS] macro %key ms macros, RS macro
or
.I "right shift" )
and
.CW .RE
.I "relative end" "" (
.ix [.RE] macro ([ms]) %key RE macro ms
.ix [ms] macros, [.RE] macro %key ms macros, RE macro
or
.I retreat )
macros:
.page 112
.Ps
\&.IP font 10
is the two-character abbreviation or
full name of one of the available fonts
from the Alcuin library.
\&.RS
\&.IP CU
Cursive
\&.IP RS
Slanted
\&.RS
\&.IP LH 5 0
Left handed
\&.IP RH 5 0
Right handed
\&.RE
\&.IP BL
Block
\&.RE
.Pe
.LP
The labels on the second level are aligned with the
indented left margin of paragraphs on the first level.
.sp .7v
.SS
.Ps
font     is the two-character abbreviation or full name  of
         one   of  the  available  fonts  from  the  Alcuin
         library.
.sp
         CU   Cursive
.sp
         RS   Slanted
.sp
              LH   Left handed
              RH   Right handed
.sp
         BL   Block
.Pe
.sp
.SE
.sp .8v
.LP
One thing you need to watch out for in using the
.CW .IP
macro is not to include space in the label argument.
Because of the way the macro is coded, the space may be
expanded when the finished line is adjusted.
The first line will not be aligned with the rest.
For example:
.Ps
\&.IP "font name" 10
is the two-character abbreviation or full name . . .
.Pe
.LP
might produce the following:
.sp .7v
.SS
.Ps
font name     is the two-character  abbreviation  or full
             name of one of the available  fonts from the
             Alcuin library.
.Pe
.sp
.SE
.sp .8v
.page 113
.LP
To avoid this problem, always use an unpaddable space
.ix unpaddable space
(a backslash followed by a space) to separate words in the
label argument to
.CW .IP .
This caution applies to many other formatting situations as
well.
.PP
Automatically numbered and alphabetized lists are not
.ix [ms] macros, numbered lists %key ms macros, numbered lists
provided for in
.CW ms .
(Chapter 16 shows how to write your own macros for this).
However, by specifying the number or letter as a label, you
can make do with the
.CW .IP
macro.
For example:
.Ps
User-oriented documentation recognizes three things:
\&.in +3n
\&.IP 1) 5n
that a new user needs
to learn the system in stages, getting a sense of the
system as a whole while becoming proficient in performing
particular tasks;
\&.IP 2) 5n
that there are different levels of users, and not
every user needs to learn all the capabilities
of the system in order to be productive;
\&.IP 3) 5n
that an experienced user must be able to rely on
the documentation for accurate and thorough reference
information.
\&.in -3n
.Pe
.LP
This produces:
.sp .7v
.SS
.Ps
User-oriented documentation recognizes three things:
.sp
   1)   that a new  user  needs to  learn the  system in
        stages, getting  a  sense  of  the  system  as a
        whole  while  becoming  proficient in performing
        particular tasks;
.sp
   2)   that there are different levels  of  users,  and
        not every user needs to  learn  all the capabil-
        ities of the system in  order  to be productive;
.sp
   3)   that an experienced user must be able to rely on
        the  documentation  for  accurate  and  thorough
        reference information.
.Pe
.sp
.SE
.sp .8v
.LP
The number is indented three ens and the text is indented
five more ens.
(Note: If you are using
.CW nroff ,
you don't need to specify units on the indents.
However, if you are using
.CW troff ,
the default scaling for both the
.CW .IP
macro and the
.CW .in
requests shown in the previous example is ems.
Remember that you can append a scaling indicator to the
numeric arguments of most macros and
.CW troff
requests).
.ix %end [.IP] macro ([ms]) %key IP macro ms
.ix %end [ms] macros, [.IP] macro %key ms macros, IP macro
.ix %end [ms] macros, paragraphs %key ms macros, paragraphs
.Ah "Changing Font and Point Size
.ix %begin [ms] macros, fonts %key ms macros, fonts
.LP
.page 114
When you format with
.CW nroff
and print on a line printer, you can put emphasis on
individual words or phrases by underlining or overstriking.
.ig
	The next line in the printed book is wrong.  It reads:
	"When you are use".  Fixed
	--Michael Hobgood
..
When you are using
.CW troff
and send your output to a laser printer or typesetter, you
can specify variations of type, font, and point size based
on the capabilities of the output devices.
.Bh "Roman, Italic, and Bold Fonts
.LP
Most typefaces have at least three fonts available:
roman,
.B bold ,
and
.I italic .
Normal body copy is printed in the roman font.
You can change temporarily to a bold or italic font for
.ix %begin fonts, changing ([ms]) %key fonts, changing (ms)
emphasis.
In Chapter 4, you learned how to specify font changes using
the
.CW \&.ft
request and inline
.CW \ef
requests.
The
.CW ms
package provides a set of mnemonic macros for changing fonts:
.ix %begin [.B] macro ([ms]) %key B macro ([ms])
.ix %begin [ms] macros, [.B] macro %key ms macros, [.B] macro
.ix %begin [.I] macro ([ms]) %key I macro ([ms])
.ix %begin [ms] macros, [.I] macro %key ms macros, [.I] macro
.ix %begin [.R] macro ([ms]) %key R macro ([ms])
.ix %begin [ms] macros, [.R] macro %key ms macros, [.R] macro
.RS
.TS
tab(#);
lf(CW) l l .
\&.B##bold
\&.I##italic
\&.R##roman
.TE
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
The printed sentence has one word in bold and one in italic.
.sp .7v
.ne 4
.SS
.Ps
.ft R
\fBAlcuin\fP revitalizes an \fIage-old\fP tradition.
.ft CW
.Pe
.sp
.SE
.sp .8v
.LP
If no argument is specified, the selected font is current
until it is explicitly changed:
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
The example produces:
.sp .7v
.SS
.Ps
.ft R
The art of \fBcalligraphy\fP is, quite simply, \fIbeautiful\fP handwriting;\fP
.ft CW
.Pe
.sp
.SE
.sp .8v
.PP
.page 115
You've already seen that the first argument is changed
to the selected font.
If you supply a second argument, it is printed in the previous font.
(You are limited to two arguments, set off by a space;
a phrase must be enclosed within quotation marks to be
taken as a single argument).
A good use for the alternate argument is to supply punctuation,
especially because of the restriction that you cannot
begin a line with a period.
.Ps
its opposite is
\&.B cacography .
.Pe
.LP
This example produces:
.sp .7v
.SS
.Ps
.ft R
its opposite is \fBcacography\fP.
.ft CW
.Pe
.sp
.SE
.sp .8v
.LP
If the second argument is a word or phrase, you must
supply the spacing:
.Ps
The ink pen has been replaced by a
\&.I light " pen."
.Pe
.LP
This produces:
.sp .7v
.SS
.Ps
.ft R
The ink pen has been replaced by a \fIlight\fP pen.
.ft CW
.Pe
.sp
.SE
.sp .8v
.LP
If you are using
.CW nroff ,
specifying a bold font results in character overstrike;
specifying an italic font results in an underline
for each character (not a continuous rule).
Overstriking and underlining can cause problems on
some printers and terminals.
.PP
The chief advantage of these macros over the corresponding
.CW troff
constructs is the ease of entry.
It is easier to type:
.Ps
\&.B calligraphy
.Pe
.LP
than:
.Ps
\\fBcalligraphy\\fP
.Pe
.LP
However, you'll notice that using these macros
changes the style of your input considerably.
As shown in the examples on the preceding pages,
these macros require you to code your input file
using short lines that do not resemble the resulting
filled output text.
.PP
This style, which clearly divorces the form of the input
from the form of the output, is recommended by many
.CW nroff
and
.CW troff
users.
They recommend that you use macros like these rather
than inline codes, and that you begin each sentence
or clause on a new line.
There are advantages in speed of editing.
However, there are others (one of the authors included)
who find this style of input unreadable on the screen,
and prefer to use inline codes, and to keep the input
file as readable as possible.
(There is no difference in the output file).
.ix %end [.B] macro ([ms]) %key B macro ([ms])
.ix %end [ms] macros, [.B] macro %key ms macros, [.B] macro
.ix %end [.I] macro ([ms]) %key I macro ([ms])
.ix %end [ms] macros, [.I] macro %key ms macros, [.I] macro
.ix %end [.R] macro ([ms]) %key R macro ([ms])
.ix %end [ms] macros, [.R] macro %key ms macros, [.R] macro
.ix %end [ms] macros, fonts %key ms macros, fonts
.ix %end fonts, changing ([ms]) %key fonts, changing (ms)
.Bh Underlining
.ix underlining
.ix [ms] macros, underlining %key ms macros, underlining
.ix underlining, [ms] macros %key underlining, ms macros
.LP
.page 116
If you want to underline a single word,
regardless of whether you are using
.CW nroff
or
.CW troff ,
use the
.CW .UL
.ix [.UL] macro ([ms]) %key UL macro ms
.ix [ms] macros, [.UL] macro %key ms macros, UL macro
macro:
.Ps
the
\&.UL art
of calligraphy.
.Pe
.LP
It will print a continuous rule beneath the word.
You cannot specify more than a single word with this macro.
.Bh "Changing Point Size
.ix %begin point~size
.ix %begin point~size, changing ([ms]) %key point size, changing ms
.LP
As discussed in Chapter 4,
you can change the point size and vertical spacing with the
.CW .ps
and
.CW .vs
requests.
However, if you do this in
.CW ms ,
you will find that the point size and vertical
spacing revert to 10 and 12 points,
respectively, after the next paragraph macro.
This is because the paragraph macro,
in addition to other tasks,
resets the point size and vertical spacing
(along with various other values) to
default values stored in number registers.
.PP
The default point size and vertical spacing
for a document are kept in the registers
.CW PS
and
.CW VS ,
respectively.
If you want to change the overall point size or vertical spacing,
change the value in these registers.
(The default values are 10 and 12, respectively).
For example, to change the body type to
8 points and the spacing to 10 points,
enter the following requests at the top of your document:
.Ps
\&.nr PS 8
.ig
	The next line in the printed book reads:
	\&.nr VS 12 which is wrong. It should be .nr VS 10
	to match the paragraph above.  Fixed.
	--Michael Hobgood
..
\&.nr VS 10
.Pe
.LP
At the top of a document,
these settings will take effect immediately.
Otherwise, you must wait for the
next paragraph macro for the new values
to be recognized.
If you need both immediate and long-lasting effects,
you may need a construct like:
.Ps
\&.ps 8
\&.nr PS 8
.ig
	These next two lines are wrong.  They are supposed to be
	a continuation of the above material, which also had an
	error. The read: .vs 12 and .nr BS 12, but the number should
	be 10 in each case.  Fixed.
	--Michael Hobgood
..
\&.vs 10
\&.nr VS 10
.Pe
.LP
There are also several macros for making local point size changes.
.ix %begin [.LG] macro ([ms]) %key LG macro ms
.ix %begin [ms] macros, [.LG] macro %key ms macros, LG macro
.ix %begin [.NL] macro ([ms]) %key NL macro ms
.ix %begin [ms] macros, [.NL] macro %key ms macros, NL macro
.ix %begin [.SM] macro ([ms]) %key SM macro ms
.ix %begin [ms] macros, [.SM] macro %key ms macros, SM macro
.ix %begin [ms] macros, point~size %key ms macros, point size
The
.CW .LG
macro increases the current point size by 2 points; the
.CW .SM
macro decreases the point size by 2 points.
The new point size remains in effect until you change it.
The
.CW .NL
macro changes the point size back to its default or normal setting.
For example:
.Ps
\&.LG
Alcuin
\&.NL
is a graphic arts product for
\&.SM
UNIX
\&.NL
systems.
.Pe
.page 117
.LP
The following line is produced:
.sp .7v
.SS
.Ps
.ft R
.ps 10
\s+2Alcuin\s0 is a graphic arts product for \s-2UNIX\s0 systems.
.ft CW
.ps 9
.Pe
.sp
.SE
.sp .8v
.PP
The
.CW .LG
and
.CW .SM
macros simply increment or decrement the current point size by 2
points.
Because you change the point size relative to the current setting,
repeating a macro adds or subtracts 2 more points.
If you are going to change the point size by more than 2,
it makes more sense to use the
.CW .ps
request.
The
.CW .NL
macro uses the value of the number register
.CW PS
to reset the normal point size.
Its default value is 10.
.PP
In the following example, the
.CW .ps
request changes the point size to 12.
The
.CW .LG
and
.CW .SM
macros increase and decrease the point size relative to 12 points.
The
.CW .NL
macro is not used until the end
because it changes the point size back to 10.
.Ps
\&.ps 12
\&.LG
Alcuin
\&.SM
is a graphic arts product for
\&.SM
UNIX
\&.LG
systems.
\&.NL
.Pe
.LP
It produces the following line:
.sp .7v
.SS
.Ps
.ft R
.\" remember, the Ps default is 9p
\s+5Alcuin\s0 \s+3is a graphic arts product for\s0 \s+1UNIX\s0 \s+3systems.\s0
.ft CW
.Pe
.sp
.SE
.sp .8v
.LP
A change in the point size affects how much
vertical space is needed for the larger or smaller characters.
Vertical spacing is usually 2 points larger than the point size
(10 on 12).
Use the vertical spacing request to temporarily change the vertical
spacing, if necessary.
.ix %end [.LG] macro ([ms]) %key LG macro ms
.ix %end [ms] macros, [.LG] macro %key ms macros, LG macro
.ix %end [.NL] macro ([ms]) %key NL macro ms
.ix %end [ms] macros, [.NL] macro %key ms macros, NL macro
.ix %end [.SM] macro ([ms]) %key SM macro ms
.ix %end [ms] macros, [.SM] macro %key ms macros, SM macro
.ix %end [ms] macros, point~size %key ms macros, point size
.ix %end point~size
.ix %end point~size, changing ([ms]) %key point size, changing ms
.Ah Displays
.ix %begin [ms] macros, displays %key ms macros, displays
.ix %begin displays, in [ms] macros %key displays, in ms macros
.LP
A document often includes material\(emsuch as tables, figures, or
equations\(emthat are not part of the running text,
and must be kept together on the page.
In
.CW ms
and
.CW mm ,
such document elements are referred to generically as
.I displays .
.PP
The macros
.CW .DS ,
.ix %begin [ms] macros, [.DS] macro %key ms macros, DS macro
.ix %begin [.DS] macro ([ms]) %key DS macro ms
.CW .DE ,
.ix %begin [ms] macros, [.DE] macro %key ms macros, DE macro
.ix %begin [.DE] macro ([ms]) %key DE macro ms
.CW .ID ,
.ix [.ID] macro ([ms]) %key ID macro ms
.ix [ms] macros, [.ID] macro %key ms macros, ID macro
.CW .CD ,
.ix [.CD] macro ([ms]) %key CD macro ms
.ix [ms] macros, [.CD] macro %key ms macros, CD macro
.CW .BD,
.ix [.BD] macro ([ms]) %key BD macro ([ms])
.ix [ms] macros, [.BD] macro %key ms macros, [.BD] macro
and
.CW .LD
.ix [.LD] macro ([ms]) %key LD macro ms
.ix [ms] macros, [.LD] macro %key ms macros, LD macro
are used to handle displays in
.CW ms .
The display macros can be relied upon to provide
.RS
.Ls B
.Li
adequate spacing before and after the display;
.Li
horizontal positioning of the display as a left-justified, indented, or
centered block;
.Li
proper page breaks, keeping the entire display together.
.Le
.RE
.page 118
.LP
The default action of the
.CW .DS
macro is to indent the block of text without filling lines:
.Ps
Some of the typefaces that are currently available are:
\&.DS
Roman
Caslon
Baskerville
Helvetica
\&.DE
.Pe
.LP
This produces:
.sp .7v
.SS
.Ps
Some of the typefaces that are currently available are:
.sp
     Roman
     Caslon
     Baskerville
     Helvetica
.Pe
.sp
.SE
.sp .8v
.PP
You can select a different format for a display by specifying a
left-justified or centered display with one of
the following arguments:
.RS
.TS
tab(#);
lf(CW) l l .
I##Indented (default)
L##Left-justified
C##Center each line
B##Block (center entire display)
.TE
.RE
.PP
The
.CW L
argument can be used for formatting an address block in a letter:
.Ps
\&.DS L
Mr. John Fust
Vice President, Research and Development
Gutenberg Galaxy Software
Waltham, Massachusetts 02154
\&.DE
.Pe
.LP
The display macro prevents these lines from being filled;
it \(lqprotects\(rq
the carriage returns as they were entered in the file.
.PP
A display can be centered in two ways:
either each individual line in the display is centered
.CW C ), (
or the entire display is centered as a block
.CW B ) (
based on the longest line of the display.
.PP
The use of tabs often presents a problem outside of displays.
Material that has been entered with tabs in the input file should be
formatted in no-fill mode, the default setting of the display macros.
The following table was designed using tabs to provide the spacing.
.page 119
.Ps
\&.DS L
Dates           Description of Task
.sp
June 30         Submit audience analysis
July 2          Meeting to review audience analysis
July 15         Submit detailed outline
August 1        Submit first draft
August 5        Return of first draft
August 8        Meeting to review comments
                and establish revisions
\&.DE
.Pe
.LP
This table appears in the output just as it looks in the file.
If this material had not been processed inside a display,
the columns would be improperly aligned.
.Bh "Static and Floating Displays
.LP
One of the basic functions of a display
is to make sure the displayed
material stays together on one page.
If the display is longer than the
distance to the bottom of the page,
there is a page break.
.PP
If the display is large,
causing a page break can leave a large block of
white space at the bottom of the page.
To avoid this problem,
.CW ms
provides a set of macros for
.I "floating displays" ,
.ix displays, floating ([ms]) %key displays, floating ms
as well as macros for the
.I "static displays"
.ix displays, static ([ms]) %key displays, static ms
we've already discussed.
If a floating display doesn't fit on the page,
the formatter doesn't force a page break.
Instead, it simply holds the displayed text in reserve
while it fills up
the remainder of the page with the text following the display.
It prints the display at the top of the next page,
then continues where it left off.
.PP
We have already used
.CW .DS
and
.CW .DE
to mark the beginning and end of a static display.
To specify a floating display, the closing mark is the same but the
beginning is marked by a different macro:
.RS
.TS
tab(#);
lf(CW) l l .
\&.ID##Same as \f(CW.DS I\fP (indented) but floating
\&.LD##Same as \f(CW.DS L\fP (left justified) but floating
\&.CD##Same as \f(CW.DS C\fP (center each line) but floating
\&.BD##Same as \f(CW.DS B\fP (center display) but floating
.TE
.RE
.PP
In the following example of an input file,
numbers are used instead of actual lines of text
to make the placement of the display more obvious:
.Ps
1
2
3
4
5
\&.LD
.I "Long Display"
\&.DE
6
.page 120
7
8
9
10
.Pe
.LP
The following two formatted pages might be produced,
assuming that there
are a sufficient number of lines to cause a page break:
.LP
.ne 15
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
.LP
If there had been room on page 1 to fit the display,
it would have been placed there,
and lines 6 and 7 would have followed the display,
as they did in the input file.
.PP
If a static display had been specified in the previous example,
the display would be placed in the same position
on the second page, and lines 6 and 7 would have followed it,
leaving extra space at the bottom of page 1.
A floating display attempts to make the
best use of the available space on a page.
.PP
The formatter maintains a queue to hold
floating displays that it has not yet output.
When the top of a page is encountered,
the next display in the queue is output.
The queue is emptied in the order
in which it was filled (first in, first out).
.PP
The macros called by the display macros to
control output of a block of text are available for other uses.
They are known as \(lqkeep and release\(rq macros.
.ix keep~and~release
The pair
.CW .KS /\c
.CW .KE
.ix [ms] macros, [.KS] macro %key ms macros, KS macro
.ix [.KS] macro ([ms]) %key KS macro ms
.ix [ms] macros, [.KE] macro %key ms macros, KE macro
.ix [.KE] macro ([ms]) %key KE macro ms
keep a block together and output it on the next available page.
The pair
.CW .KF /\c
.CW .KE
specify a floating keep;
the block saved by the keep can float and lines
of text following the block may appear before it in the text.
.ix %end [ms] macros, displays %key ms macros, displays
.ix %end [.DE] macro ([ms]) %key DE macro ms
.ix %end [.DS] macro ([ms]) %key DS macro ms
.ix %end [ms] macros, [.DE] macro %key ms macros, DE macro
.ix %end [ms] macros, [.DS] macro %key ms macros, DS macro
.ix %end displays, in [ms] macros %key displays, in ms macros
.Ah Headings
.ix %begin [ms] macros, headings %key ms macros, headings
.ix %begin headings, in [ms] %key headings, in ms
.LP
In
.CW ms ,
you can have numbered and unnumbered headings.
There are two heading macros:
.CW .NH
.ix %begin [.NH] macro ([ms]) %key NH macro ms
.ix %begin [ms] macros, [.NH] macro %key ms macros, NH macro
for numbered headings and
.CW .SH
.ix %begin [.SH] macro ([ms]) %key SH macro ms
.ix %begin [ms] macros, [.SH] macro %key ms macros, SH macro
for unnumbered section headings.
.PP
Let's first look at how to produce numbered headings.
The syntax for the
.CW .NH
macro is:
.Ps
\&.NH [\fIlevel\fP]
[\fIheading text\fP]
\&.LP
.Pe
.page 121
.LP
(The brackets indicate optional arguments).
You can supply a numerical value indicating the
.I level
of the heading.
If no value is provided for
.I level ,
then a top-level heading is assumed.
The
.I "heading text"
begins on the line following the macro
and can extend over several lines.
You have to use one of the paragraph macros, either
.CW .LP
.ix [.LP] macro ([ms]) %key LP macro ms
.ix [ms] macros, [.LP] macro %key ms macros, [.LP] macro
or
.CW .PP ,
.ix [.PP] macro ([ms]) %key PP macro ms
.ix [ms] macros, [.PP] macro %key ms macros, [.PP] macro
after the last line of the heading.
For example:
.Ps
\&.NH
Quick Tour of Alcuin
\&.LP
.Pe
.LP
The result is a heading preceded by a first-level heading number:
.sp .7v
.SS
.Ps
1.  Quick Tour of Alcuin
.Pe
.sp
.SE
.sp .8v
.LP
The next time you use this macro
the heading number will be incremented to 2,
and after that, to 3.
.PP
You can add levels by specifying a numeric argument.
A second-level heading is indicated by 2:
.Ps
\&.NH 2
Introduction to Calligraphy
\&.LP
.Pe
.LP
The first second-level heading number is printed:
.Ps
1.1  Introduction to Calligraphy
.Pe
.LP
When another heading is specified at the same level,
the heading number is automatically incremented.
If the next heading is at the second level:
.Ps
\&.NH 2
Digest of Alcuin Commands
\&.LP
.Pe
.LP
.CW ms
produces:
.sp .7v
.SS
.Ps
1.2  Digest of Alcuin Commands
.Pe
.sp
.SE
.sp .8v
Each time you go to a new level, .1 is
appended to the number representing the existing level.
That number is incremented for each call at the same level.
When you back out of a level
(for instance, when you go from level 5 to level 4)
the counter for the level (in this case level 5) is reset to 0.
.PP
The macro for unnumbered headings is
.CW .SH :
.Ps
\&.SH
Introduction to Calligraphy
\&.LP
.Pe
.LP
Unnumbered headings and numbered headings can be intermixed without
affecting the numbering scheme:
.page 122
.sp .7v
.SS
.Ps
1.  Quick Tour of Alcuin
.sp
Introduction to Calligraphy
.sp
1.1  Digest of Alcuin Commands
.Pe
.sp
.SE
.sp .8v
.PP
Headings are visible keys to your document's structure.
Their appearance can contribute significantly
to a reader recognizing that organization.
If you are using unnumbered headings,
it becomes even more important to make headings stand out.
A simple thing you can do is use uppercase letters for a first-level
heading.
.ix %end [.NH] macro ([ms]) %key NH macro ms
.ix %end [ms] macros, [.NH] macro %key ms macros, NH macro
.ix %end [.SH] macro ([ms]) %key SH macro ms
.ix %end [ms] macros, [.SH] macro %key ms macros, SH macro
.ix %end [ms] macros, headings %key ms macros, headings
.ix %end headings, in [ms] %key headings, in ms
.Ah "Cover Sheet Macros
.ix %begin cover sheet macros
.LP
In their original incarnation at Bell Laboratories, the
.CW ms
macros were called on to format many internal AT&T documents.
Accordingly, it is not surprising that there were
quite a few macros that
controlled the format of specific internal document types.
What is surprising is that these macros are
still present in copies of the
.CW ms
macros distributed outside of AT&T.
.PP
You have the option of specifying that your document contains
Engineer's Notes
.CW .EG ), (
an Internal Memorandum
.CW .IM ), (
a Memorandum for Record
.CW .MR ), (
a Memorandum for File
.CW .MF ), (
a Released Paper
.CW .RP ), (
a Technical Report
.CW .TR ), (
.ig
	The original has the above line reading:
	"Technical Reprint".  Larry originally had it
	typed as "Report".  I've changed this
	to match the original, but someone who
	knows for sure needs to set this straight.
	--Michael Hobgood

	I'm pretty sure it's Technical Report, as in
	"Computer Science Technical Report #128." So
	I've changed it back. -- Larry Kollar
..
or a letter
.CW .LT ). (
.PP
Many of these formats are quite useless outside of AT&T, unless you
customize them heavily for other institutions.
We prefer simply to ignore them.
.PP
In general, what these document type macros control is
the appearance of the document's cover sheet.
The content of that cover sheet is specified
using the following macros:
.RS
.TS
tab(#);
lf(CW) l l .
\&.TL##Title
\&.AU##Author
\&.AI##Author's Institution
\&.AB##Abstract Start
\&.AE##Abstract End
.TE
.ix %begin [.AB] macro ([ms]) %key AB macro ms
.ix [ms] macros, [.AB] macro %key ms macros, [.AB] macro
.ix %begin [.AE] macro ([ms]) %key AE macro ms
.ix [ms] macros, [.AE] macro %key ms macros, [.AE] macro
.ix %begin [.AI] macro ([ms]) %key AI macro ms
.ix [ms] macros, [.AI] macro %key ms macros, [.AI] macro
.ix %begin [.AU] macro ([ms]) %key AU macro ms
.ix [ms] macros, [.AU] macro %key ms macros, [.AU] macro
.ix %begin [.TL] macro ([ms]) %key TL macro ms
.ix %begin [ms] macros, [.TL] macro %key ms macros, [.TL] macro
.RE
.LP
These macros are general enough that
you can still use them even if you
aren't from Bell Laboratories.
.PP
Each macro takes its data from the following line(s)
rather than from an argument.
They are typically used together.
For example:
.Ps
\&.TL
UNIX Text Processing
\&.AU
Dale Dougherty
\&.AU
Tim O'Reilly
.page 123
\&.AI
O'Reilly & Associates, Inc.
\&.AB
This book provides a comprehensive introduction to the major
UNIX text-processing tools.  It includes a discussion of
vi, ex, nroff, and troff, as
well as many other text-processing programs.
\&.AE
\&.LP
.Pe
.LP
Exactly how the output will look
depends on which document type you have selected.
If you don't specify any of the formats,
you will get something like this:
.sp 2v
.ce 99
.LG
.B "UNIX Text Processing"
.NL
.sp 1.5v
.I
Dale Dougherty
.sp 0.5v
Tim O'Reilly
.R
.sp 0.5v
O'Reilly & Associates, Inc.
.sp 2
.I ABSTRACT
.ce 0
.sp 0.5v
.nr UTPPO \n(PO
.nr UTPLL \n(LL
.po 180p
.ll 3i
This book provides a comprehensive introduction to
the major UNIX text-processing tools. It includes a
discussion of
.CW "\|\|vi" ,
.CW "\|\|ex" ,
.CW "\|\|nroff" ,
and
.CW "\|\|troff" ,
as well as many other text-processing programs.
.br
.po \n[UTPPO]u
.ll \n[UTPLL]u
.sp 2v
.LP
You can specify as many title lines as you want following
.CW .TL .
The macro will be terminated by
any of the other cover sheet macros,
or by any paragraph macro.
For multiple authors,
.CW .AU
and
.CW .AI
can be repeated up to nine times.
.ix %end [.AB] macro ([ms]) %key AB macro ms
.ix %end [.AE] macro ([ms]) %key AE macro ms
.ix %end [.AI] macro ([ms]) %key AI macro ms
.ix %end [.AU] macro ([ms]) %key AU macro ms
.ix %end [.TL] macro ([ms]) %key TL macro ms
.ix %end [ms] macros, [.TL] macro %key ms macros, [.TL] macro
.PP
The cover sheet isn't actually printed until a reset
(such as that caused by any of the paragraph macros)
is encountered, so if you want to print only a cover page,
you should conclude it with a paragraph macro even if
there is no following text.
.PP
In addition, if you use these macros
without one of the overall document
type macros like
.CW .RP ,
the cover sheet will not be printed separately.
Instead, the text will immediately follow.
Insert a
.CW .bp
if you want a separate cover sheet.
.ix %end cover sheet macros
.Ah "Miscellaneous Features
.Bh "Putting Information in a Box
.ix [ms] macros, drawing~a box %key ms macros, drawing a box
.ix drawing, boxes
.LP
Another way of handling special information is to place it in a box.
Individual words can be boxed for emphasis using the
.CW .BX
.ix [.BX] macro ([ms]) %key BX macro ms
.ix [ms] macros, [.BX] macro %key ms macros, BX macro
command:
.page 124
.Ps
To move to the next menu, press the
\&.BX RETURN
key.
.Pe
.LP
This draws a box around the word RETURN.
.Ps
To move to the next menu, press the
.BX RETURN
key.
.Pe
As you can see,
it might be a good idea to reduce the point size of the
boxed word.
.PP
You can enclose a block of material within a box
by using the pair of macros
.CW .B1
.ix [.B1] macro ([ms]) %key B1 macro ms
.ix [ms] macros, [.B1] macro %key ms macros, B1 macro
and
.CW .B2 :
.ix [.B2] macro ([ms]) %key B2 macro ms
.ix [ms] macros, [.B2] macro %key ms macros, B2 macro
.Ps
\&.B1
\&.B
\&.ce
Note to Reviewers
\&.R
\&.LP
Can you get a copy of a manuscript without annotations?
It seems to me that you should be
able to mark up a page with comments or
other scribbles while in Annotation Mode and
still obtain a printed copy without these marks.
Any ideas?
\&.sp
\&.B2
.Pe
.LP
This example produces the following boxed section in
.CW troff :
.sp 18p
.B1
.B
.ce
Note to Reviewers
.R
.LP
Can you get a copy of a manuscript without annotations?
It seems to me that you should be able to mark up a
page with comments or
other scribbles while in Annotation Mode and still
obtain a printed copy without these marks.
Any ideas?
.B2
.sp 15p
.LP 0
You may want to place boxed information
inside a pair of keep or display macros.
This will prevent the box macro from breaking
if it crosses a page boundary.
If you use these macros with
.CW nroff ,
you must also pipe your output through the
.CW col
postprocessor as described in Chapter 4.
.Bh Footnotes
.ix %begin [ms] macros, footnotes %key ms macros, footnotes
.ix %begin footnotes, [ms] macros %key footnotes, ms macros
Footnotes present special problems\(emthe
main is printing the text at
the bottom of the page.
The
.CW .FS
.ix %begin [ms] macros, [.FS] macro %key ms macros, [.FS] macro
.ix %begin [.FS] macro ([ms]) %key FS macro ms
macro indicates the start of the text for the footnote, and
.CW .FE
.ix %begin [ms] macros, [.FE] macro %key ms macros, [.FE] macro
.ix %begin [.FE] macro ([ms]) %key FE macro ms
indicates the end of the text for the footnote.
These macros surround the footnote text that
will appear at the bottom of the page.
The
.CW .FS
macro is put on the line immediately following some kind of marker,
such as an asterisk, that you supply in the text and in the footnote.
.page 125
.Ps
\&... in an article on desktop publishing.*
\&.FS
* "Publish or Perish: Start-up grabs early page language
lead," Computerworld, April 21, 1986, p. 1.
\&.FE
.Pe
.LP
All the footnotes are collected and output
at the bottom of each page underneath a short rule.
The footnote text is printed in smaller type,
.ig
	The following line in part reads: " line length then"
	in the original printed book.  It should read:
	"line length than".  Fixed.
	--Michael Hobgood
..
with a slightly shorter line length than the body text.
However, you can change these if you want.
.PP
Footnotes in
.CW ms
use an
.CW nroff /\c
.CW troff
feature called
.I environments
.pdfhref L -D Chapter14 -P "(see " -A ), -- Chapter 14
so that parameters like line length or font that are set
inside a footnote are saved independently of the body text.
So, for example, if you issued the requests:
.Ps
\&.FS
\&.ft B
\&.ll -5n
\&.in +5n
\fISome text\fP
\(ap
\(ap
\(ap
\&.FE
.Pe
.LP
the text within the footnote would be printed in boldface,
with a 5-en indent, and the line length would be shortened by 5 ens.
The text following the footnote would be
unaffected by those formatting requests.
However, the next time a footnote was called,
that special formatting would again be in effect.
.sp .7v
.SS
.Ps
\l'2.42i'
.br
\fB* "Publish or Perish: Start-up grabs early page language
lead,"\fP\|\fIComputerworld\fP,\|\fBApril 21, 1986, p. 1.\fP
.Pe
.sp
.SE
.sp .8v
.LP
If a footnote is too long to fit on one page,
it will be continued at the bottom of the next page.
.ix %end [.FE] macro ([ms]) %key FE macro ms
.ix %end [.FS] macro ([ms]) %key FS macro ms
.ix %end [ms] macros, [.FE] macro %key ms macros, [.FE] macro
.ix %end [ms] macros, [.FS] macro %key ms macros, [.FS] macro
.ix %end [ms] macros, footnotes %key ms macros, footnotes
.ix %end footnotes, [ms] macros %key footnotes, ms macros
.Bh "Two-Column Processing
.ix %begin two-column processing, [ms] macros %key two-column processing, ms macros
.ix %begin [ms] macros, two-column processing %key ms macros, two-column processing
.LP
One of the nice features of the
.CW ms
macros is the ease with which you can create
multiple columns and format documents,
such as newsletters or data sheets, that are best suited to a
multicolumn format.
.PP
To switch to two-column mode, simply insert the
.CW .2C
.ix %begin [.2C] macro ([ms]) %key 2C macro ms
macro.
To return to single-column mode, use
.CW .1C .
.ix [ms] macros, [.1C] macro %key ms macros, [.1C] macro
.ix %begin [.1C] macro ([ms]) %key 1C macro ms
Because of the way two-column processing works in
.CW ms ,
you can switch to two-column mode in the middle of a page,
but switching back to a single column forces a page break.
(You'll understand the reason for this when we return to two-column
processing in Chapter 16).
.PP
The default column width for two-column processing is
7/15th of the line length.
It is stored in the register
.CW CW
.I "column width" ). (
The gutter between the columns is
.page 126
1/15th of the line length, and is stored in the register
.CW GW
.I "gutter width" ). (
By changing the values in these registers,
you can change the column and gutter width.
.PP
For more than two columns, you can use the
.CW .MC
.ix %begin [.MC] macro ([ms]) %key MC macro ms
.ix %begin [ms] macros, [.MC] macro %key ms macros, [.MC] macro
.ix %begin [ms] macros, multi-column processing %key ms macros, multi-column processing
.ix %begin multi-column processing
macro.
This macro takes two arguments,
the column width and the gutter width, and
creates as many columns as will fit in the line length.
For example, if the line lengths are 7 inches, the request:
.Ps
\&.MC 2i .3i
.Pe
.LP
would create three columns 2 inches wide, with a gutter of .3 inches
between the columns.
.PP
Again,
.CW .1C
can be used to return to single-column mode.
In some versions of
.CW ms ,
the
.CW .RC
macro can be used to break columns.
If you are in the left column,
following text will go to the top of the next column.
If you are in the right column,
.CW .RC
will start a new page.
.ix %end [.1C] macro ([ms]) %key 1C macro ms
.ix %end [.2C] macro ([ms]) %key 2C macro ms
.ix %end [.MC] macro ([ms]) %key MC macro ms
.ix %end [ms] macros, [.MC] macro %key ms macros, [.MC] macro
.ix %end [ms] macros, multi-column processing %key ms macros, multi-column processing
.ix %end [ms] macros, two-column processing %key ms macros, two-column processing
.ix %end multi-column processing
.ix %end two-column processing, [ms] macros %key two-column processing, ms macros
.Ah "Page Headers and Footers
.ix footers
.ix headers
.ix [ms] macros, footers %key ms macros, footers
.ix [ms] macros, headers %key ms macros, headers
.LP
When you format a page with
.CW ms ,
the formatter is instructed to provide several lines
at the top and the bottom of the page for a header and a footer.
Beginning with the second page,
a page number appears on a single line in
the header and only blank lines are printed for the footer.
.PP
The
.CW ms
package allows you to define strings that appear
in the header or footer.
You can place text in three locations in the header or footer:
left justified,
centered,
and right justified.
For example, we could place the name of the client,
the title of the document, and the date in the page header
and we could place the page number in the footer.
.sp .7v
.SS
.Ps
\&.ds LH GGS
\&.ds CH Alcuin Project Proposal
\&.ds RH \\*(DY
\&.ds CF Page %
.Pe
.sp
.SE
.sp .8v
You may notice that we use the string
.CW DY
.ix [ms] macros, date string %key ms macros, date string
to supply today's date in the header.
In the footer, we use a special symbol
.CW % ) (
.ix page~number
to access the current page number.
Here are the resulting header and footer:
.sp .7v
.SS
.nf
.ft CW
.ta 0.5i \n[.ll]u/2uC \n[.ll]u-0.5iR
	GGS	Alcuin Project Proposal	April 26, 1987
		\&.
		\&.
		\&.
		Page  2
.TA
.fi
.ft P
.sp
.SE
.sp .8v
.LP
Normally, you would define the
header and footer strings at the start of
the document, so they would take effect throughout.
However, note that there is nothing to prevent you
from changing one or more of them from page to page.
(Changes to a footer string
.page 127
will take effect on the same page;
changes to a header string will take
effect at the top of the next page).
.Ah "Problems on the First Page
.ix problems~on first page ([ms]) %key problems on first page (ms)
.ix [ms] macros, problems~on first page %key ms macros, problems on first page
.LP
Because
.CW ms
was originally designed to work with the cover sheet macros
.ix cover~sheet macros
and one of the standard Bell document types,
there are a number of problems that can
occur on the first page of a document that
doesn't use these macros.*
.FS
*This problem actually can occur on any page, but is most frequently
encountered on the first page.
.FE
.PP
First, headers are not printed on the first page,
nor is it apparent how to get
them printed there if you want them.
The trick is to invoke the internal
.CW .NP
.ix [.NP] macro ([ms]) %key NP macro ms
.ix [ms] macros, [.NP] macro %key ms macros, [.NP] macro
.I "new page" ) (
macro at the top of your text.
This will not actually start a new page,
but will execute the various
internal goings-on that normally take place at the top of a page.
.PP
Second, it is not evident how to space down
from the top if you want to
start your text at some distance down the page.
For example, if you want to create your own title page, the sequence:
.Ps
\&.sp 3i
\&.ce
\es16The Invention of Movable Type\es0
.Pe
.LP
will not work.
.PP
The page top macro includes an
.CW .ns
.ix [.ns] request %key ns request
.ix [troff] formatter, [.ns] request %key troff formatter, [.ns] request
request, designed to ensure that all
leftover space from the bottom of one
page doesn't carry over to the next, so that all pages start evenly.
To circumvent this on all pages after the first one,
precede your spacing request with an
.CW .rs
.ix [.rs] request %key rs request
.ix [troff] formatter, [.rs] request %key troff formatter, [.rs] request
.I "restore spacing" ) (
request.
On the first page, a
.CW .fl
.ix [.fl] request %key fl request
.ix [troff] formatter, [.fl] request %key troff formatter, [.fl] request
request must precede a
.CW .rs
request.
.Ah "Extensions to ms
.LP
In many ways,
.CW ms
can be used to give you a head start on defining your own macro
package.
Many of the features that are missing in
.CW ms
can be supplied by user-defined macros.
.ix macros, defining
Many of these features are covered in Chapters 14 through 18,
where, for example, we show macros for formatting numbered lists.
.ix %end [ms] macros %key ms macros
.\" end of chapter 5

