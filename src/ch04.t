.ig
	ch04.t
	Typed by: Colin Watson.
	Marked up by: Michael Hobgood.
	Proofed on: 6 Oct 2002
..
.so utp.mac
.utp
.chapter 4 "\f[CB]nroff\fP and \f[CB]troff\fP" "Chapter" 1
.LP 0
.page 58
.ix %begin [troff] formatter %key troff formatter
The
.CW vi
editor lets you edit text, but it is not much good at formatting.
A text file such as program source code might be formatted with a simple
program like
.CW pr ,
which inserts a header at the top of every page and handles pagination,
but otherwise prints the document exactly as it appears in the file.
But for any application requiring the preparation of neatly formatted
text, you will use the
.CW nroff
(\(lqen-roff\(rq) or
.CW troff
(\(lqtee-roff\(rq)
formatting program.
.PP
These programs are used to process an input text file, usually coded or
\(lqmarked up\(rq
with formatting instructions.
When you use a
.I wysiwyg
program like most word processors, you use commands to lay out the text
on the screen as it will be laid out on the page.
With a markup language like that used by
.CW nroff
and
.CW troff ,
you enter commands into the text that tell the formatting program what
to do.
.PP
Our purpose in this chapter is twofold.
We want to introduce the basic formatting codes that you will find
useful.
But at the same time, we want to present them in the context of what the
formatter is doing and how it works.
If you find this chapter rough-going\c
\(em\c
especially if this is your
first exposure to
.CW nroff /
.CW troff \c
\(em
skip ahead to either Chapter 5 or Chapter 6 and become familiar with
one of the macro packages,
.CW ms
or
.CW mm ;
then come back and resume this chapter.
We assume that you are reading this book because you would like more
than the basics, that you intend to master the complexities of
.CW nroff /
.CW troff .
As a result, this chapter is somewhat longer and more complex than it
would be if the book were an introductory user's guide.
.PP
.Bh "Conventions"
.PP
To distinguish input text and requests shown in examples from formatter
output, we have adopted the convention of showing \(lqpage corners\(rq
around output from
.CW nroff
or
.CW troff .
Output from
.CW nroff
is shown in the same constant-width typeface as other examples:
.sp .7v
.SS
.Ps
Here is an example of nroff output.
.Pe
.sp
.SE
.sp .8v
.LP
.page 59
Output from
.CW troff
is shown in the same typeface as the text, but with the size of the type
reduced by one point, unless the example calls for an explicit type size:
.Ps
\f[R]Here is an example of troff output.\fP
.Pe
In representing output, compromises sometimes had to be made.
For example, when showing
.CW nroff
output, we have processed the example separately with
.CW nroff ,
and read the results back into the source file.
However, from there, they have been typeset in a constant-width font by
.CW troff .
As a result, there might be slight differences from true
.CW nroff
output, particularly in line length or page size.
However, the context should always make clear just what is being
demonstrated.
.Ah "What the Formatter Does"
.LP 0
Take a moment to think about the things you do when you format a page on
a
.I wysiwyg
device such as a typewriter:
.LP
.RS
.Ls B
.Li
You set aside part of the page as the text area.
This requires setting top, bottom, left, and right margins.
.Li
You adjust the lines that you type so they are all approximately the
same length and fit into the designated text area.
.Li
You break the text into syntactic units such as paragraphs.
.Li
You switch to a new page when you reach the bottom of the text area.
.Le
.RE
.LP
Left to themselves,
.CW nroff
or
.CW troff
will do only one of these tasks: they will adjust the length of the
lines in the input file so that they come out even in the output file.
To do so, they make two assumptions:
.ix [troff] formatter, basic assumptions %key troff formatter, basic assumptions
.LP
.RS
.Ls B
.Li
They assume that the line length is 6.5 inches.
.Li
They assume that a blank line in the input signals the start of a
new paragraph.
The last line of the preceding text is not adjusted, and a blank
line is placed in the output.
.Le
.RE
.LP
The process of filling and adjusting is intuitively obvious\c
\(em\c
we've all
done much the same thing manually when using a typewriter or had it done
for us by a
.I wysiwyg
word processor.
However, especially when it comes to a typesetting program like
.CW troff ,
there are ramifications to the process of line adjustment that are not
obvious.
Having a clear idea of what is going on will be very useful later.
For this reason, we'll examine the process in detail.
.Bh "Line Adjustment"
.LP
.page 60
There are three parts to line adjustment:
.I filling ,
.I justification ,
and
.I hyphenation .
Filling is the process of making all lines of text approximately equal
in length.
.ix filling (definition~of)
When working on a typewriter, you do this automatically, simply by
typing a carriage return when the line is full.
Most word-processing programs automatically insert a carriage return at
the end of a line, and we have seen how to set up
.CW vi
to do so as well.
.PP
However,
.CW nroff
and
.CW troff
ignore carriage returns in the input except in a special \(lqno fill\(rq
mode.
.ix no-fill mode
They reformat the input text, collecting all input lines into
even-length output lines, stopping only when they reach a blank line or
(as we shall see shortly) a formatting instruction that tells them to
stop.
Lines that begin with one or more blank spaces are not filled, but
trailing blank spaces are trimmed.
Extra blank spaces between words on the input line are preserved, and
the formatter adds an extra blank space after each period, question
mark, or exclamation point.
.PP
.ix justification
.ix justification, definition~of
Justification is a closely related feature that should not be confused
with filling.
Filling simply tries to keep lines approximately the same length;
justification adjusts the space between words so that the ends of the
lines match exactly.
.PP
By default,
.CW nroff
and
.CW troff
both fill and justify text.
Justification implies filling, but it is possible to have filling
without justification.
Let's look at some examples.
First, we'll look at a paragraph entered in
.CW vi .
Here's a paragraph from the letter you entered in the last chapter,
modified so that it offers to prepare not just a user's guide for the
Alcuin illuminated lettering software, but a reference manual as well.
In the course of making the changes, we've left a short line in the
middle of the paragraph.
.Ps
In our conversation last Thursday, we discussed a
documentation project that would produce a user's guide
and reference manual
for the Alcuin product. Yesterday, I received the product
demo and other materials that you sent me.
.Pe
Now, let's look at the paragraph after processing by
.CW nroff :
.sp .7v
.SS
.Ps
In our  conversation  last Thursday, we discussed  a
documentation project  that  would  produce a user's
guide and reference manual  for the Alcuin  product.
Yesterday, I  received  the  product  demo and other
materials that you sent me.
.Pe
.sp
.SE
.sp .8v
.LP
The paragraph has been both filled and justified.
If the formatter were told to fill, but not to justify, the paragraph
would look like this:
.sp .7v
.SS
.Ps
In our conversation last Thursday, we discussed a
documentation project that would produce a user's guide
and reference manual for the Alcuin product. Yesterday,
I received the product demo and other materials that
you sent me.
.Pe
.sp
.SE
.sp .8v
.LP
.page 61
As you can see,
.CW nroff
justified the text in the first example by adding extra space between
words.
.PP
Most typewritten material is filled but not justified.
In printer's terms, it is typed
.I "ragged right" .
Books, magazines, and other typeset materials, by contrast, are usually
.I "right justified" .
Occasionally, you will see printed material (such as ad copy) in which
the right end of each line is justified, but the left end is ragged.
It is for this reason that we usually say that text is
.I right
or
.I "left justified" ,
rather than simply
.I "justified" .
.PP
When it is difficult to perform filling or justification or both because
a long word falls at the end of a line, the formatter has another trick
to fall back on (one we are all familiar with)\c
\(em\c
hyphenation.
.ix hyphenation
.PP
The
.CW nroff
and
.CW troff
programs perform filling, justification, and hyphenation in much the
same way as a human typesetter used to set cold lead type.
Human typesetters used to assemble a line of type by placing individual
letters in a tray until each line was filled.
There were several options for filling as the typesetter reached the end
of the line:
.LP
.RS
.Ls B
.Li
The next word might fit exactly.
.Li
The next word might fit if the typesetter squeezed the words a
little closer together.
.Li
The next word could be hyphenated, with part put on the current 1ine
and part on the next line.
.Le
.RE
.LP
If, in addition to being filled, the text was to be justified, there was
one additional issue: after the line was approximately the right length,
space needed to be added between each word so that the line length came
out even.
.PP
Just like the human typesetter they replace,
.CW nroff
and
.CW troff
assemble one line of text at a time, measuring the length of the line
and making adjustments to the spacing to make the line come out even
(assuming that the line is to be justified).
Input lines are collected into a temporary storage area, or
.I buffer ,
until enough text has been collected for a single output line.
Then that line is output, and the next line collected.
.PP
It is in the process of justification that you see the first significant
difference between the two programs.
The
.CW nroff
program was designed for use with typewriter-like printers;
.CW troff
was designed for use with phototypesetters.
.ix justification, [nroff]~vs.~[troff] %key justification, nroff vs.~[troff]
.PP
A typewriter-style printer has characters all of the same size\c
\(em\c
an
.I i
takes up the same amount of space as an
.I m .
(Typical widths are 1/10 or 1/12 inch per character).
And although some printers (such as daisywheel printers) allow you to
change the style of type by changing the daisywheel or thimble, you can
usually have only one typeface at a time.
.PP
A typesetter, by contrast, uses typefaces in which each letter takes up
an amount of space proportional to its outline.
The space allotted for an
.I i
is quite definitely narrower than the space allotted for an
.I m .
The use of variable-width characters makes the job of filling and
justification much more difficult for
.CW troff
than for
.CW nroff .
Where
.CW nroff
only needs to count characters,
.CW troff
has to add up the width of each character as it assembles the line.
(Character widths are defined by a \(lqbox\(rq around the character,
rather than by its natural, somewhat irregular shape).
.page 62
.PP
The
.CW troff
program also justifies by adding space between words, but because the
variable-width fonts it uses are much more compact, it fits more on a
line and generally does a much better job of justification.*
.FS
*The very best typesetting programs have the capability to adjust the
space between individual characters as well.
This process is called
.I kerning .
.ix kerning
SoftQuad Publishing Software in Toronto sells an enhanced version of
.CW troff
called
.CW SQroff
that does support kerning.
.FE
.PP
.ix [nroff] formatter, interword spacing %key nroff formatter, interword spacing
There's another difference as well.
Left to itself,
.CW nroff
will insert only full spaces between words\c
\(em\c
that is, it might put two
spaces between one pair of words, and three between another, to fill the
line.
If you call
.CW nroff
with the
.CW -e
option, it will attempt to make all interword spaces the same size
(using fractional spaces if possible).
But even then,
.CW nroff
will only succeed if the output device allows fractional spacing.
.ix [troff] formatter, interword spacing %key troff formatter, interword spacing
The
.CW troff
program always uses even interword spacing.
.PP
Here's the same paragraph filled and justified by
.CW troff :
.sp .7v
.SS
.Ps
.fi
.nr UTPLL \n(LL
.ll 4.5i
\f[R]In our conversation last Thursday, we discussed a documentation project
that would produce a user's guide and reference manual for the Alcuin
product.
Yesterday, I received the product demo and other materials that you sent
me.\fP
.ll \n[UTPLL]u
.nf
.Pe
.sp
.SE
.sp .8v
.PP
To make matters still more difficult, typeset characters come in a
variety of different designs, or
.I fonts .
.ix fonts
A font is a set of alphabetic, numeric, and punctuation characters that
share certain design elements.
Typically, fonts come in families of several related typefaces.
For example, this book is typeset for the most part in the Times Roman
family of typefaces.
There are three separate fonts:
.Ps
\f[R]roman\fP
\f[B]bold\fP
\f[I]italic\fP
.Pe
Typesetting allows for the use of multiple fonts on the same page, as
you can see from the mixture of fonts throughout this book.
Sometimes the fonts are from the same family, as with the Times Roman,
Times Bold, and Times Italic just shown.
However, you can see other fonts, such as Helvetica, in the running
headers on each page.
Bold and italic fonts are generally used for emphasis; in computer books
such as this, a constant-width typewriter font is used for examples and
other \(lqcomputer voice\(rq statements.
.PP
Even within the same font family, the width of the same character varies
from font to font.
For example, a bold
\(lq\c
.B m \c
\(rq
is slightly wider than a Roman
\(lqm.\(rq
.PP
To make things still more complicated, the same font comes in different
sizes.
If you look at this book, you will notice that the section headings
within each chapter are slightly larger for emphasis.
Type sizes are measured in units called
.I points .
.ix point~size
We'll talk more about this later, but to get a rough idea of what type
sizes mean, simply look at the current page.
The body type of the book is 10-point Times Roman; the next heading is
12-point Times Bold.
The spacing between lines is generally proportional to the point size,
instead of fixed, as it is with
.CW nroff .
.page 63
.PP
The
.CW troff
program gets information about the widths of the various characters in
each font from tables stored on the system in the directory
.CW /usr/lib/font .
.ix [/usr/lib/font] %key /usr/lib/font
These tables tell
.CW troff
how far to move over after it has output each character on the line.
.PP
We'll talk more about
.CW troff
later.
For the moment, you should be aware that the job of the formatting
program is much more complicated when typesetting than it is when
preparing text for typewriter-style printers.
.Ah "Using \f[CB]nroff\fP"
.LP
As mentioned previously, left to themselves,
.CW nroff
and
.CW troff
perform only rudimentary formatting.
They will fill and justify the text, using a default line length of 6.5
inches, but they leave no margins, other than the implicit right margin
caused by the line length.
To make this clearer, let's look at the sample letter from the last
chapter (including the edit we made in this chapter) as it appears after
formatting with
.CW nroff .
.PP
First, let's look at how to invoke the formatter.
The
.CW nroff
program takes as an argument the name of a file to be formatted:
.ix [nroff] formatter, invoking %key nroff formatter, invoking
.Ps
$ \f[CB]nroff letter\fP
.Pe
Alternatively, it can take standard input, allowing you to preprocess
the text with some other program before formatting it:
.Ps
$ \f[CB]tbl report | nroff\fP
.Pe
There are numerous options to
.CW nroff .
They are described at various points in this book (as appropriate to the
topic) and summarized in Appendix B.
.ix [nroff] formatter, command~line options %key nroff formatter, command line options
.PP
One basic option is
.CW -T ,
which specifies the terminal (printer) type for which output should be
prepared.
Although
.CW nroff
output is fairly straightforward, some differences between printers can
significantly affect the output.
(For example, one printer may perform underlining by backspacing and
printing an underscore under each underlined letter, and another may do
it by suppressing a newline and printing the underscores in a second
pass over the line).
The default device is the Teletype Model 37 terminal\c
\(em\c
a fairly
obsolete device.
Other devices are listed in Appendix B.
If you don't recognize any of the printers or terminals, the safest type
is probably
.CW lp:
.Ps
$ \f[CB]nroff -Tlp\fP \f[BI]file\fP
.Pe
In examples in this book, we will leave off the
.CW -T
option, but you may want to experiment, and use whichever type gives the
best results with your equipment.
.PP
Like most UNIX programs,
.CW nroff
prints its results on standard output.
So, assuming that the text is stored in a file called
.CW letter ,
all you need to do is type:
.Ps
$ \f[CB]nroff letter\fP
.Pe
A few moments later, you should see the results on the screen.
Because the letter will scroll by quickly, you should pipe the output of
.CW nroff
to a paging program such as
.CW pg
or
.CW more :
.page 64
.Ps
$ \f[CB]nroff letter | pg\fP
.Pe
or out to a printer using
.CW lp
or
.CW lpr :
.Ps
$ \f[CB]nroff letter | lp\fP
.Pe
.Ah "Using \f[CB]troff\fP"
.LP 0
The chief advantage of
.CW troff
over
.CW nroff
is that it allows different types of character sets, or fonts, and so
lets you take full advantage of the higher-quality printing available
with typesetters and laser printers.
There are a number of requests, useful only in
.CW troff ,
for specifying fonts, type sizes, and the vertical spacing between
lines.
Before we describe the actual requests though, we need to look at a bit
of history.
.PP
The
.CW troff
program was originally designed for a specific typesetter, the Wang
C/A/T.
.ix C/A/T typesetter
Later, it was modified to work with a wide range of output devices.
We'll discuss the original version of
.CW troff
(which is still in use at many sites) first, before discussing the newer
versions.
The C/A/T typesetter was designed in such a way that it could use only
four fonts at one time.
.PP
(Early phototypesetters worked by projecting light through a film
containing the outline of the various characters.
The film was often mounted on a wheel that rotated to position the
desired character in front of the light source as it flashed, thus
photographing the character onto photographic paper or negative film.
Lenses enlarged and reduced the characters to produce various type
sizes.
The C/A/T typesetter had a wheel divided into four quadrants, onto which
one could mount four different typefaces).
.PP
Typically, the four fonts were the standard (roman), bold, and italic
fonts of the same family, plus a \(lqspecial\(rq font that contained
additional punctuation characters, Greek characters (for equations),
bullets, rules, and other nonstandard characters.
.ix fonts, four standard
.ix fonts, special
Figure 4-1 shows the characters available in these standard fonts.
.Bh "The Coming of \f[CB]ditroff\fP"
.LP 0
Later,
.CW troff
was modified to support other typesetters and, more importantly (at
least from the perspective of many readers of this book), laser
printers.
The later version of
.CW troff
is often called
.CW ditroff
(for device-independent
.CW troff ),
but many UNIX systems have changed the name of the original
.CW troff
to
.CW otroff
and simply call
.CW ditroff
by the original name,
.CW troff .
.PP
The
.CW ditroff
program has not been universally available because, when it was
developed, it was \(lqunbundled\(rq from the basic UNIX distribution and
made part of a separate product called
.I "Documenter's Workbench"
or
.I DWB .
.ix Documenter's~Workbench
UNIX system manufacturers have the option not to include this package,
although increasingly, they have been doing so.
Versions of DWB are also available separately from third party vendors.
.PP
The newer version of
.CW troff
allows you to specify any number of different fonts.
(You can mount fonts at up to ten imaginary \(lqpositions\(rq with
.CW \.fp
and can request additional fonts by name).
.page 65
.Fs 0 F
.nf
.nr UTPIN \n(.i
.in 1.7i
.\" I'd appreciate somebody checking this transcription. I've done the
.\" best I can from groff_char(7). -- Colin
.\" Excellent work.  I found the missing characters and
.\" added them in. -- Michael
Times Roman
.sp
abcdefghijklmnopqrstuvwxyz
ABCDEFGHIJKLMNOPQRSTUVWXYZ
1234567890
! $ % & ( ) ` ' * + - . , / : ; = ? [ ] |
\(bu \(sq \(em \(en _ \(14 \(12 \(34 \(fi \(fl \(de \(dg \(aa \(ct \(rg \(co
.sp
.I
Times Italic
.sp
abcdefghijklmnopqrstuvwxyz
ABCDEFGHIJKLMNOPQRSTUVWXYZ
1234567890
! $ % & ( ) ` ' * + - . , / : ; = ? [ ] |
\(bu \(sq \(em \(en _ \(14 \(12 \(34 \(fi \(fl \(de \(dg \(aa \(ct \(rg \(co
.sp
.B
Times Bold
.sp
abcdefghijklmnopqrstuvwxyz
ABCDEFGHIJKLMNOPQRSTUVWXYZ
1234567890
! $ % & ( ) ` ' * + - . , / : ; = ? [ ] |
\(bu \(sq \(em \(en _ \(14 \(12 \(34 \(fi \(fl \(de \(dg \(aa \(ct \(rg \(co
.sp
.R
Special Mathematical Font
.sp
\(dq \(aa \(rs \(ha \(ru \(ga \(ti \(sl \(la \(ra \(lC \(rC \(sh \(at \(pl \- \(eq \(**
\(*a \(*b \(*g \(*d \(*e \(*z \(*y \(*h \(*i \(*k \(*l \(*m \(*n \(*c \(*o \(*p \(*r \(*s \(ts \(*t \(*u \(*f \(*x \(*q \(*w
\(*G \(*D \(*H \(*L \(*C \(*P \(*S \(*U \(*F \(*Q \(*W
\(sr \(rn \(>= \(<= \(== \(ap \(!= \(-> \(<- \(ua \(da \(mu \(di \(+- \(cu \(ca \(sb \(sp \(ib \(ip \(if \(pd
\(sc \(gr \(no \(is \(pt \(es \(mo \(dd \(rh \0 \(lh \(or \(ci \(lt \(lb \(rt \(rb \(lk \(rk \(bv \(lf \(rf \(lc \(rc\(bv
.\" There follow some characters I can't find in groff_char(7). Again,
.\" help is appreciated. -- Colin
.\" You are correct, they are not in groff_char(7).
.\" I found them in an old AT&T troff tutorial.
.\" They have now been added, along with a hard space
.\" to separate the lefthand/righthand. -- Michael
.fi
.in \n[UTPIN]u
.Fe "The Four Standard Fonts"
.ix [troff] formatter, fonts %key troff formatter, fonts
There may also be different font sizes available, and there are some
additional commands for line drawing (\c
.CW ditroff
can draw curves as well as straight lines).
For the most part, though,
.CW ditroff
is very similar to the original program, except in the greater
flexibility it offers to use different output devices.
.PP
.ix [troff] formatter, versions~of %key troff formatter, versions of
One way to find out which version of
.CW troff
you have on your system (unless you have a program explicitly called
.CW ditroff )
is to list the contents of the directory
.CW /usr/lib/font :
.ix [/usr/lib/font] %key /usr/lib/font
.page 66
.KS
.Ps
$\f[CB]ls -F /usr/lib/font\fP
devlj/
devps/
ftB
ftI
ftR
ftS
.Pe
.KE
If there are one or more subdirectories whose name begins with the
letters
.CW dev ,
your system is using
.CW ditroff .
Our system supports both
.CW ditroff
and
.CW otroff ,
so we have both a device subdirectory (for
.CW ditroff )
and font files (for
.CW otroff )
directly in
.CW /usr/lib/font .
.PP
We'll talk more about font files later.
For the moment, all you need to know is that they contain information
about the widths of the characters in various fonts for a specific
output device.
.ix fonts
.ix fonts, contents~of font~files
.PP
Contrary to what a novice might expect, font files do not contain
outlines of the characters themselves.
For a proper typesetter, character outlines reside in the typesetter
itself.
All
.CW troff
sends out to the typesetter are character codes and size and position
information.
.PP
However,
.CW troff
has increasingly come to be used with laser printers, many of which use
.I "downloadable fonts" .
.ix [troff] formatter, downloadable fonts %key troff formatter, downloadable fonts
.ix fonts, downloadable
An electronic image of each character is loaded from the computer into
the printer's memory, typically at the start of each printing job.
There may be additional \(lqfont files\(rq containing character outlines
in this case, but these files are used by the software that controls the
printer, and have nothing to do with
.CW troff
itself.
In other cases, font images are stored in ROM (read-only memory) in the
printer.
.PP
If you are using a laser printer, it is important to remember that
.CW troff
itself has nothing to do with the actual drawing of characters or images
on the printed page.
In a case like this,
.CW troff
simply formats the page, using tables describing the widths of the
characters used by the printer, and generates instructions about page
layout, spacing, and so on.
The actual job of driving the printer is handled by another program,
generally referred to as a
.I "printer driver"
or
.CW troff
.I postprocessor .
.ix %begin [troff] formatter, postprocessors %key troff formatter, postprocessors
.PP
To use
.CW troff
with such a postprocessor, you will generally need to pipe the output of
.CW troff
to the postprocessor and from there to the print spooler:
.Ps
$ \f[CB]troff\fP \f[I]file\fP \f[CB]|\fP \f[I]postprocessor\fP \f[CB]| lp\fP
.Pe
If you are using the old version of
.CW troff ,
which expects to send its output directly to the C/A/T typesetter, you
.ix C/A/T typesetter
need to specify the
.CW -t
option, which tells
.CW troff
to use standard output.
If you don't, you will get the message:
.Ps
Typesetter busy.
.Pe
(Of course, if by any chance you
.I are
connected to a C/A/T typesetter,
you don't need this option.
There are several other options listed in Appendix B that you may find
useful).
When you use
.CW ditroff ,
on the other hand, you will need to specify the
.CW -T
command-line option that tells it what device you are using.
.ix [troff] formatter, invoking %key troff formatter, invoking
The postprocessor will then translate the device-independent
.CW troff
output into instructions for that particular type of laser printer or
typesetter.
For example, at our site, we use
.CW troff
with an Apple LaserWriter and Pipeline Associates'
.page 67
.CW devps
.ix %begin [devps] postprocessor %key devps postprocessor
postprocessor, which translates
.CW troff
output for the LaserWriter.
Our command line looks something like this:
.Ps
$ \f[CB]ditroff -Tps\fP \f[I]files\fP \f[CB]| devps | lp\fP
.Pe
You can print the same file on different devices, simply by changing the
.CW -T
option and the postprocessor.
For example, you can print drafts on a laser printer, then switch to a
typesetter for final output without making extensive changes to your
files.
(To actually direct output to different printers, you will also have to
specify a printer name as an option to the
.CW lp
command.
In our generic example, we simply use
.CW lp
without any options, assuming that the appropriate printer is connected
as the
.I default
printer).
.PP
Like all things in life, this is not always as easy as it sounds.
Because the fonts used by different output devices have different widths
even when the nominal font names and sizes are the same, pagination and
line breaks may be different when you switch from one device to another.
.PP
The job of interfacing
.CW ditroff
to a wide variety of output devices is becoming easier because of the
recent development of industry-wide
.I "page description languages"
.ix page~description languages
.ix DDL
.ix Interpress
.ix PostScript
like Adobe Systems' PostScript, Xerox's Interpress, and Imagen's DDL.
These page description languages reside in the printer, not the host
computer, and provide a device-independent way of describing placement
of characters and graphics on the page.
.PP
Rather than using a separate postprocessor for each output device, you
can now simply use a postprocessor to convert
.CW troff
output to the desired page description language.
For example, you can use Adobe Systems' TranScript postprocessor (or an
equivalent postprocessor like
.CW devps
from Pipeline Associates) to convert
.CW troff
output to PostScript, and can then send the PostScript output to any one
of a number of typesetters or laser printers.
.PP
From this point, whenever we say
.CW troff ,
we are generally referring to
.CW ditroff .
In addition, although we will continue to discuss
.CW nroff
as it differs from
.CW troff ,
our emphasis is on the more capable program.
It is our opinion that the growing availability of laser printers will
make
.CW troff
the program of choice for almost all users in the not too distant
future.
.PP
However, you can submit a document coded for
.CW troff
to
.CW nroff
with entirely reasonable results.
For the most part, formatting requests that cannot be handled by
.CW nroff
are simply ignored.
And you can submit documents coded for
.CW nroff
to
.CW troff ,
though you will then be failing to use many of the characteristics that
make
.CW troff
desirable.
.ix %end [devps] postprocessor %key devps postprocessor
.ix %end [troff] formatter, postprocessors %key troff formatter, postprocessors
.Ah "The Markup Language"
.LP
The
.CW nroff
and
.CW troff
markup commands (often called
.I requests )
typically consist of one or two lowercase letters and stand on their own
line, following a period or apostrophe in column one.
.ix [troff] formatter, syntax~of requests %key troff formatter, syntax of requests
Most requests are reasonably mnemonic.
For example, the request to leave space is:
.Ps
\&.sp
.Pe
There are also requests that can be embedded anywhere in the text.
These requests are commonly called
.I "escape sequences" .
.ix [troff] formatter, escape~sequences %key troff formatter, escape sequences
Escape sequences usually begin with a backslash
.page 68
(\c
.CW \e ).
For example, the escape sequence
.CW \el
will draw a horizontal line.
Especially in
.CW troff ,
escape sequences are used for line drawing or for printing various
special characters that do not appear in the standard ASCII character
set.
For instance, you enter
.CW \e(bu
to get \(bu, a bullet.
.PP
There are three classes of formatting instructions:
.LP
.RS
.Ls B
.Li
Instructions that have an immediate one-time effect, such as a
request to space down an inch before outputting the next line of
text.
.Li
Instructions that have a persistent effect, such as requests to set
the line length or to enable or disable justification.
.Li
Instructions that are useful for writing
.I macros .
There is a \(lqprogramming language\(rq
built into the formatter that allows you to build up complex
requests from sequences of simpler ones.
As part of this language there are requests for storing values into
variables called
.I strings
and
.I "number registers" ,
for testing conditions and acting on the result, and so on.
.Le
.RE
.PP
For the most part, we will discuss the requests used to define macros,
strings, and number registers later in this book.
.PP
At this point, we want to focus on understanding the basic requests that
control the basic actions of the formatter.
We will also learn many of the most useful requests with immediate,
one-time effects.
Table 4-1 summarizes the requests that you will use most often.
.Ts "Basic \f[CB]nroff/troff\fP Requests"
.TS
center box tab (#);
l l l l.
Request#Meaning#Request#Meaning
_
.T&
lfCW lfR | lfCW lfR.
\&.ad#Enable line adjustment#\&.na#No justification of lines
\&.br#Line break#\&.ne#Need lines to end of page
\&.bp#Page break#\&.nf#No filling of lines
\&.ce#Center next line#\&.nr#Define and set number register
\&.de#Define macro#\&.po#Set page offset
\&.ds#Define string#\&.ps#Set point size
\&.fi#Fill output lines#\&.so#Switch to source file and return
\&.ft#Set current font#\&.sp#Space
\&.in#Set indent#\&.ta#Set tab stop positions
\&.ls#Set double or triple spacing#\&.ti#Set temporary indent
\&.ll#Specify line length#\&.vs#Set vertical line spacing
.TE
.Te
.Bh "Looking at \f[CB]nroff\fP Output"
.LP 0
When we discussed the basic operations of the text formatter, we saw
that
.CW nroff
and
.CW troff
perform rudimentary formatting.
They will fill and justify the text, using a default line length of 6.5
.page 69
inches, but they leave no margins, other than the implicit right margin
caused by the line length.
.PP
To make this clearer, let's look at the sample letter from the last
chapter as it appears after formatting with
.CW nroff ,
without any embedded requests, and without using any macro package.
From Figure 4-2, you can see immediately that the formatter has adjusted
all of the lines, so that they are all the same length\c
\(em\c
even in the
address block of the letter, where we would have preferred them to be
left as they were.
Blank lines in the input produce blank lines in the output, and the
partial lines at the ends of paragraphs are not adjusted.
.PP
The most noticeable aspect of the raw formatting is a little difficult
to reproduce here, though we've tried.
No top or left margin is automatically allocated by
.CW nroff .
.Ah "Turning Filling On and Off"
.LP 0
Even though filling of uneven text lines resulting from editing is
probably the most basic action we want from the formatter, it is not
always desirable.
.ix no-fill mode
For example, in our letter, we don't want the address block to be
filled.
There are two requests we could use to correct the problem:
.CW \&.br
(\c
.I break )
.ix [.br] request %key br request
.ix [troff] formatter, [.br] request %key troff formatter, [.br] request
and
.CW \&.nf
(\c
.I "no fill" ).
.ix [.nf] request %key nf request
.ix [troff] formatter, [.nf] request %key troff formatter, [.nf] request
.PP
A
.CW \&.br
request following a line outputs the current contents of the line buffer
and starts the next line, even though the buffer is not yet full.
To produce a properly formatted address block, we could enter the
following requests in the file:
.Ps
Mr. John Fust
\&.br
Vice President, Research and Development
\&.br
Gutenberg Galaxy Software
\&.br
Waltham, Massachusetts 02159
.Pe
Each individual input line will be output without filling or
justification.
We could also use the
.CW \&.nf
request, which tells
.CW nroff
to stop filling altogether.
Text following this request will be printed by the formatter exactly as
it appears in the input file.
Use this request when you want text to be laid out as it was typed in.
.PP
Because we do want the body of the letter to be filled, we must turn
filling back on with the
.CW \&.fi
(\c
.I fill )
request:
.ix [.fi] request %key fi request
.ix [troff] formatter, [.fi] request %key troff formatter, [.fi] request
.Ps
                                           April 1, 1987
\&.nf
Mr. John Fust
Vice President, Research and Development
Gutenberg Galaxy Software
Waltham, Massachusetts 02159
\&.fi
Dear Mr. Fust:
.Pe
.page 70
.sp .7v
.Fs 0 F
.SS
.Ps -5n
.sp -2v
                                April 1, 1987

Mr.  John  Fust  Vice  President,   Research   and
Development  Gutenberg  Galaxy  Software  Waltham,
Massachusetts 02159

Dear Mr. Fust:

In our conversation last Thursday, we discussed  a
documentation  project that would produce a user's
guide and reference manual for the Alcuin product.
Yesterday,  I  received the product demo and other
materials that you sent me.  After studying  them,
I want to clarify a couple of points:

Going through a demo session gave me a much better
understanding  of the product.  I confess to being
amazed  by  Alcuin.   Some  people  around   here,
looking  over  my shoulder, were also astounded by
the illustrated manuscript I produced with Alcuin.
One  person,  a student of calligraphy, was really
impressed.

Tomorrow, I'll start putting  together  a  written
plan   that   presents  different  strategies  for
documenting the Alcuin  product.  After  I  submit
this  plan,  and  you  have had time to review it,
let's arrange a meeting at your company to discuss
these strategies.

Thanks again for giving us the opportunity to  bid
on  this  documentation  project.   I  hope we can
decide upon a strategy and get started as soon  as
possible in order to have the manual ready in time
for first customer ship. I look forward to meeting
with you towards the end of next week.

                                   Sincerely,



                                   Fred Caslon
.sp 4v
.Pe
.SE
.Fe "A Raw \f[CB]nroff\fP-formatted File"
.sp .8v
.page 71
.LP
If you look carefully at the previous example, you will probably notice
that we entered the two formatting requests on blank lines in the
letter.
If we were to format the letter now, here is what we'd get:
.sp .7v
.SS
.Ps
                                           April 1, 1987
Mr. John Fust
Vice President, Research and Development
Gutenberg Galaxy Software
Waltham, Massachusetts 02159
Dear Mr. Fust:
.Pe
.sp
.SE
.sp .8v
.LP
As you may notice, we've lost the blank lines that used to separate the
date from the address block, and the address block from the salutation.
Lines containing formatting requests do not result in any space being
output (unless they are spacing requests), so you should be sure not to
inadvertently replace blank lines when entering formatting codes.
.Ah "Controlling Justification"
.ix %begin [.ad] request %key ad request
.ix %begin [troff] formatter, [.ad] request %key troff formatter, [.ad] request
.ix %begin justification, types~of
.LP
Justification can be controlled separately from filling by the
.CW \&.ad
(\c
.I adjust )
request.
(However, filling must be on for justification to work at all).
You can adjust text at either margin or at both margins.
.PP
Unlike the
.CW \&.br
and
.CW \&.nf
requests introduced,
.CW \&.ad
takes an
.I argument ,
which specifies the type of justification you want:
.RS
.TS
tab (#);
cfCW l l.
l##adjust left margin only
r##adjust right margin only
b##adjust both margins
c##center filled line between margins
.TE
.RE
.PP
There is another related request,
.CW \&.na
(\c
.I "no adjust" ).
.ix [.na] request %key na request
.ix [troff] formatter, [.na] request %key troff formatter, [.na] request
Because the text entered in a file is usually left justified to begin
with, turning justification off entirely with
.CW \&.na
produces similar results to
.CW "\&.ad l"
in most cases.
.PP
However, there is an important difference.
Normally, if no argument is given to the
.CW \.ad
request, both margins will be adjusted.
That is,
.CW \.ad
is the same as
.CW "\.ad b" .
However, following an
.CW \.na
request,
.CW \.ad
reverts to the value last specified.
That is, the sequence:
.Ps
\&.ad r
.I "Some text"
\&.ad l
.I "Some text"
\&.ad
.I "Some text"
.Pe
will adjust both margins in the third block of text.
However, the sequence:
.page 72
.Ps
\&.ad r
.I "Some text"
\&.na
.I "Some text"
\&.ad
.I "Some text"
.Pe
will adjust only the right margin in the third block of text.
.PP
It's easy to see where you would use
.CW "\.ad b"
or
.CW "\.ad l" .
Let's suppose that you would like a ragged margin for the body of your
letter, to make it look more like it was prepared on a typewriter.
Simply follow the
.CW \.fi
request we entered previously with
.CW "\.ad l" .
.PP
Right-only justification may seem a little harder to find a use for.
Occasionally, you've probably seen ragged-left copy in advertising, but
that's about it.
However, if you think for a moment, you'll realize that it is also a
good way to get a single line over to the right margin.
.PP
For example, in our sample letter, instead of typing all those leading
spaces before the date (and having it fail to come out flush with the
margin anyway), we could enter the lines:
.Ps
\&.ad r
April 1, 1987
\&.ad b
.Pe
As it turns out, this construct won't
.I quite
work.
If you remember, when filling is enabled,
.CW nroff
and
.CW troff
collect input in a one-line buffer and only output the saved text when
the line has been filled.
There are some non-obvious consequences of this that will ripple all
through your use of
.CW nroff
and
.CW troff .
If you issue a request that temporarily sets a formatting condition,
then reset it before the line is output, your original setting may have
no effect.
.ft I
The result will be controlled by the request that is in effect at the
time the line is output, not at the time that it is first collected in
the line buffer.
.ft R
.PP
.ix breaks, importance~of
Certain requests cause implicit line breaks (the equivalent of carriage
returns on a typewriter) in the output, but others do not.
The
.CW \.ad
request does not cause a break.
Therefore, a construction like:
.Ps
\&.ad r
April 1, 1987
\&.ad b
Mr. John Fust
.Pe
will result in the following output:
.sp .7v
.SS
.Ps
April 1, 1987 Mr. John Fust
.Pe
.sp
.SE
.sp .8v
.LP
and not:
.sp .7v
.SS
.Ps
                                        April 1, 1987
Mr. John Fust
.Pe
.sp
.SE
.sp .8v
.LP
.page 73
To make sure that you get the desired result from a temporary setting
like this, be sure to follow the line to be affected with a condition
that will cause a break.*
.ix breaks, [troff]~requests~which~cause %key breaks, troff requests~which~cause
.FS
*The following requests cause a break:
.br
.ti 3n
\&.bp\0.br\0.ce\0.fi\0.nf\0.sp\0.in\0.ti
.br
All other requests can be interspersed with text without causing a
break.
In addition, as discussed later, even these requests can be introduced
with a specìal \(lqno break\(rq control character (\c
.CW '
.ix breaks, no-break control~character
.ix no-break control~character
instead of
.CW \&. )
so
that they too will not cause a break.
.FE
For instance, in the previous example, you would probably follow the
date with a blank line or an
.CW \.sp
request, either of which will normally cause a break.
.ix [.sp] request %key sp request
.ix [troff] formatter, [.sp] request %key troff formatter, [.sp] request
If you don't, you should put in an explicit break, as follows:
.Ps
\&.ad r
April 1, 1987
\&.br
\&.ad b
Mr. John Fust
.Pe
A final point about justification: the formatter adjusts a line by
widening the blank space between words.
If you do not want the space between two words adjusted or split across
output lines, precede the space with a backslash.
This is called an
.I "unpaddable space" .
.ix unpaddable space
.PP
There are many obscure applications for unpaddable spaces; we will
mention them as appropriate.
Here's a simple one that may come in handy:
.CW nroff
and
.CW troff
normally add two blank spaces after a period, question mark, or
exclamation point.
The formatter can't distinguish between the end of a sentence and an
abbreviation, so if you find the extra spacing unaesthetic, you might
follow an abbreviation like Mr. with an unpaddable space:\0
.CW "Mr.\e John Fust" .
.ix %end [.ad] request %key ad request
.ix %end [troff] formatter, [.ad] request %key troff formatter, [.ad] request
.ix %end justification, types~of
.Ah "Hyphenation"
.ix %begin [troff] formatter, hyphenation %key troff formatter, hyphenation
.LP
As pointed out previously, hyphenation is closely related to filling and
justification, in that it gives
.CW nroff
and
.CW troff
some additional power to produce filled and justified lines without
large gaps.
.ix justification
.PP
The
.CW nroff
and
.CW troff
programs perform hyphenation according to a general set of rules.
.ix hyphenation, rules~for
Occasionally, you need to control the hyphenation of particular words.
You can specify either that a word not be hyphenated or that it be
hyphenated in a certain way.
You can also turn hyphenation off entirely.
.Bh "Specifying Hyphenation for Individual Words"
.ix %begin [.hw] request %key hw request
.ix %begin [troff] formatter, [.hw] request %key troff formatter, [.hw] request
.LP
There are two ways to specify that a word be hyphenated a specific way:
with the
.CW \.hw
request and with the special hyphenation indicator
.CW \e% .
.PP
The
.CW \.hw
(\c
.I "hyphenate word" )
request allows you to specify a small list of words that should be
hyphenated a specific way.
The space available for the word list is small (about 128 characters),
so you should use this request only for words you use frequently, and
that
.CW nroff
and
.CW troff
hyphenate badly.
.page 74
.PP
To use
.CW \.hw ,
simply specify the word or words that constitute the exception list,
typing a hyphen at the point or points in the word where you would like
it to be hyphenated.
.Ps
\&.hw hy-phen-a-tion
.Pe
You can specify multiple words with one
.CW \.hw
request, or you can issue multiple
.CW \.hw
requests as you need them.
.PP
However, if it is just a matter of making sure that a particular
instance of a word is hyphenated the way you want, you can use the
hyphenation indication character sequence
.CW \e% .
As you type the word in your text, simply type the two characters
.CW \e%
at
each acceptable hyphenation point, or at the front of the word if you
don't want the word to be hyphenated at all:
.Ps
\e%acknowledge     \fRthe word\fP \f[I]acknowledge\fP \fRwill not be hyphenated\fP
ac\e%know\e%ledge   \fRthe word\fP \f[I]acknowledge\fP \fRcan be hyphenated only\fP
                  \fRat the specified points\fP
.Pe
This character sequence is the first instance we have seen of a
formatting request that does not consist of a request name following a
period in column one.
We will see many more of these later.
This sequence is embedded right in the text but does not print out.
.PP
In general,
.CW nroff
and
.CW troff
do a reasonable job with hyphenation.
You will need to set specific hyphenation points only in rare instances.
In general, you shouldn't even worry about hyphenation points, unless
you notice a bad break.
Then use either
.CW \.hw
or
.CW \e%
to correct it.
.ix %end [.hw] request %key hw request
.ix %end [troff] formatter, [.hw] request %key troff formatter, [.hw] request
.PP
.ix [hyphen] command %key hyphen command
.ix hyphenation, checking~for correctness
The UNIX
.CW hyphen
command can be used to print out all of the hyphenation points in a file
formatted with
.CW nroff
or
.CW "troff -a" .
.Ps
$ \f[CB]nroff\fP \f[I]options files\fP \f[CB]| hyphen\fP
.Pe
or:
.Ps
$ \f[CB]troff\fP \f[I]options\fP \f[CB]-a\fP \f[I]files\fP \f[CB]| hyphen\fP
.Pe
If your system doesn't have the
.CW hyphen
command, you can use
.CW grep
instead:
.Ps
$ \f[CB]nroff\fP \f[I]options files\fP \f[CB]| grep '-$'\fP
.Pe
(The single quotation marks are important because they keep
.CW grep
from interpreting the
.CW -
as the beginning of an option).
.\" This is incorrect - they do no such thing, as the shell expands the
.\" single quotation marks before passing the -$ argument to grep.
.\" grep -e '-$' should be used instead; the single quotation marks are
.\" still valuable to protect the $ metacharacter. -- Colin
.Bh "Turning Hyphenation Off and On"
.LP
If you don't want any hyphenation, use the
.CW \.nh
(\c
.I "no hyphenation" )
request.
Even if you do this, though, you should be aware that words already
containing embedded hyphens, em dashes (\(em), or hyphen indication
characters (\c
.CW \e% )
will still be subject to hyphenation.
.PP
After you've turned hyphenation off, you can turn it back on with the
.CW \.hy
(\c
.I hyphenate )
request.
.ix hyphenation, enabling~in [troff] %key hyphenation, enabling in troff
.ix %begin [.hy] request %key hy request
.ix %begin [troff] formatter, [.hy] request %key troff formatter, [.hy] request
This request has a few twists.
Not only does it allow you to turn hyphenation on, it also allows you to
adjust the hyphenation rules that
.CW nroff
and
.CW troff
use.
It takes the following numeric arguments:
.page 75
.RS
.TS
tab (#);
l l l l.
0###turn hyphenation off
1###turn hyphenation on
2###do not hyphenate the last line on a page
4###do not hyphenate after the first two characters of a word
8###do not hyphenate before the last two characters of a word
.TE
.RE
.PP
Specifying
.CW \.hy
with no argument is the same as specifying
.CW "\.hy 1" .
The other numeric values are additive.
For example,
.CW "\.hy 12"
(\c
.CW "\.hy 4"
plus
.CW "\.hy 8" )
will keep
.CW nroff
and
.CW troff
from breaking short syllables at the beginning or end of words, and
.CW "\.hy 14"
will put all three hyphenation restrictions into effect.
.ix %end [.hy] request %key hy request
.ix %end [troff] formatter, [.hy] request %key troff formatter, [.hy] request
.ix %end [troff] formatter, hyphenation %key troff formatter, hyphenation
.Ah "Page Layout"
.ix [troff] formatter, page~layout %key troff formatter, page layout
.LP
Apart from the adjusted address block, the biggest formatting drawback
that you probably noticed when we formatted the sample letter is that
there was no left or top margin.
Furthermore, though it is not apparent from our one-page example, there
is no bottom margin either.
If there were enough text in the input file to run onto a second page,
you would see that the text ran continuously across the page boundary.
.PP
In normal use, these layout problems would be handled automatically by
either the
.CW ms
or
.CW mm
macro packages (described later).
Here, though, we want to understand how the formatter itself works.
.PP
Let's continue our investigation of the
.CW nroff
and
.CW troff
markup language with some basic page layout commands.
These commands allow you to affect the placement of text on the page.
Some of them (those whose descriptions begin with the word
.I set )
specify conditions that will remain in effect until they are explicitly
changed by another instance of the same request.
Others have a one-time effect.
.PP
As shown in Table 4-2, there are two groups of page layout commands,
those that affect horizontal placement of text on the page and those
that affect vertical placement.
A moment's glance at these requests will tell you that, before anything
else, we need to talk about units.
.KS
.Ts "Layout Commands"
.TS
center box tab (#);
c | l l.
Horizontal Layout#\f[CW]\&.ll\fP \f[I]n\fP#Set the line length to \f[I]n\fP
\^#\f[CW]\&.po\fP \f[I]n\fP#Set the left margin (page offset) to \f[I]n\fP
\^#\f[CW]\&.in\fP \f[I]n\fP#Indent the left margin to \f[I]n\fP
\^#\f[CW]\&.ti\fP \f[I]n\fP#Temporarily indent the left margin to \f[I]n\fP
\^#\f[CW]\&.ce\fP \f[I]n\fP#Center the following \f[I]n\fP lines
_
Vertical Layout#\f[CW].pl\fP \f[I]n\fP#Set the page length to \f[I]n\fP
\^#\f[CW]\&.sp\fP \f[I]n\fP#Insert \f[I]n\fP spaces
\^#\f[CW]\&.bp\fP \f[I]n\fP#Start a new page
\^#\f[CW]\&.wh\fP \f[I]n\fP#Specify \f[I]wh\fPen (at what vertical position
\^##on the page) to execute a command
.TE
.Te
.KE
.Bh "Units of Measure"
.ix %begin [troff] formatter, units~of measure %key troff formatter, units of measure
.ix [nroff] formatter, units~of measure %key nroff formatter, units of measure
.LP
.page 76
By default, most
.CW nroff
and
.CW troff
commands that measure vertical distance (such as
.CW \.sp )
do so in terms of a number of \(lqlines\(rq (also referred to as
vertical spaces, or
.CW vs ).
.ix [troff] formatter, vertical spacing %key troff formatter, vertical spacing
.ix vertical spacing
The
.CW nroff
program has constant, device-dependent line spacing;
.CW troff
has variable line spacing, which is generally proportional to the point
size.
However, both programs do allow you to use a variety of other units as
well.
You can specify spacing in terms of inches and centimeters, as well as
the standard
printer's measures
.I picas
and
.I points .
.ix pica (defined)
.ix point~size
(A pica is 1/6 of an inch; a point is about 1/72 of an inch.
These units were originally developed to measure the size of type, and
the relationship between these two units is not as arbitrary as it might
seem.
A standard 12-point type is 1 pica high).
.PP
Horizontal measures, such as the depth of an indent, can also be
specified using any of these measures, as well as the printer's measures
.I ems
.ix em (defined)
.ix [troff] formatter, horizontal spacing %key troff formatter, horizontal spacing
and
.I ens .
.ix en (defined)
These are relative measures, originally based on the size of the letters
.I m
and
.I n
in the current type size and typeface.
By default, horizontal measures are always taken to be in ems.
.PP
There is also a relationship between these units and points and picas.
An em is always equivalent in width to the height of the character
specified by the point size.
In other words, an em in a 12-point type is 12 points wide.
An en is always half the size of an em, or half of the current point
size.
The advantage of using these units is that they are relative to the size
of the type being used.
This is unimportant in
.CW nroff ,
but using these units in
.CW troff
gives increased flexibility to change the appearance of the document
without recoding.
.PP
The
.CW nroff
and
.CW troff
programs measure not in any of these units, but in device-dependent
basic units.
Any measures you specify are converted to basic units before they are
used.
Typically,
.CW nroff
.ix [nroff] formatter, device units %key nroff formatter, device units
measures in horizontal units of 1/240 of an inch and
.CW otroff
.ix [troff] formatter, device units %key troff formatter, device units
uses a unit of 1/432 inch.
These units too are not as arbitrary as they may seem.
According to Joseph Osanna's
.I "Nroff/Troff User's Manual" \c
\(em\c
the original, dense, and authoritative documentation on
.CW troff
published by AT&T as part of the
.I "UNIX Programmer's Manual" \c
\(em\c
the
.CW nroff
units were chosen as \(lqthe least common multiple of the horizontal and
vertical resolutions of various typewriter-like output devices.\(rq
The units for
.CW otroff
were based on the C/A/T typesetter (the device for which
.ix C/A/T typesetter
.CW troff
was originally designed), which could move in horizontal increments of
1/432 of an inch and in vertical increments of exactly one-third that,
or 1/144 inch.
Units for
.CW ditroff
depend on the resolution of the output device.
For example, units for a 300 dot-per-inch (dpi) laser printer will be
1/300 of an inch in either a vertical or a horizontal direction.
See Appendix D for more information on
.CW ditroff
device units.
.PP
You don't need to remember the details of all these measures now.
You can generally use the units that are most familiar to you, and we'll
come back to the others when we need them.
.PP
To specify units, you simply need to add the appropriate scale indicator
from Table 4-3 to the numeric value you supply to a formatting request.
For example, to space down 3 inches rather than 3 lines, enter the
request:
.Ps
\&.sp 3i
.Pe
The numeric part of any scale indicator can include decimal fractions.
Before the specified value is used,
.CW nroff
and
.CW troff
will round the value to the nearest number of device units.
.page 77
.LP
.Ts "Units of Measure"
.TS
center box tab (#);
cfCW l.
\f[R]Indicator\fP#Units
_
c#Centimeters
i#Inches
m#Ems
n#Ens
p#Points
P#Picas
u#Device Units
v#Vertical spaces (lines)
none#Default
.TE
.Te
.PP
.ix [troff] formatter, numeric expressions %key troff formatter, numeric expressions
In fact, you can use any reasonable numeric expression with any request
that expects a numeric argument.
However, when using arithmetic expressions, you have to be careful about
what units you specify.
.ix [troff] formatter, default units %key troff formatter, default units
All of the horizontally oriented requests\c
\(em\c
.CW \.ll ,
.CW \.in ,
.CW \.ti ,
.CW \.ta ,
.CW \.po ,
.CW \.lt ,
and
.CW \.mc \c
\(em\c
assume you mean ems unless you specify otherwise.
.PP
Vertically oriented requests like
.CW \.sp
assume
.CW v 's
unless otherwise specified.
The only exceptions to this rule are
.CW \.ps
and
.CW \.vs ,
which assume points by default\c
\(em\c
but these are not really motion
requests anyway.
.PP
As a result, if you make a request like:
.Ps
\&.ll 7i/2
.Pe
what you are really requesting is:
.Ps
\&.ll 7i/2m
.Pe
The request:
.Ps
\&.ll 7i/2i
.Pe
is not what you want either.
In performing arithmetic, as with fractions, the formatter converts
scaled values to device units.
In
.CW otroff ,
this means the previous expression is really evaluated as:
.Ps
\&.ll (7*432u)/(2*432u)
.Pe
If you really want half of 7 inches, you should specify the expression
like this:
.Ps
\&.ll 7i/2u
.Pe
You could easily divide 7 by 2 yourself and simply specify 3.5i.
The point of this example is that when you are doing arithmetic\c
\(em\c
usually with values stored in variables called number registers (more on
these later)\c
\(em\c
you will need to pay attention to the interaction
between units.
Furthermore, because fractional device units are always rounded down,
you should avoid expressions like
.CW 7i/2.5u
because this is equivalent to
.CW 7i/2u .
.page 78
.PP
In addition to absolute values, many
.CW nroff
and
.CW troff
requests allow you to specify relative values, by adding a
.CW +
or a
.CW -
before the value.
For example:
.Ps
\&.ll -.5i
.Pe
will subtract \(12 inch from the current line length, whatever it is.
.ix %end [troff] formatter, units~of measure %key troff formatter, units of measure
.Bh "Setting Margins"
.LP
In
.CW nroff
and
.CW troff ,
margins are set by the combination of the
.CW \.po
(\c
.I "page offset" )
and
.CW \.ll
(\c
.I "line length" )
requests.
.ix page offset
.ix [.po] request %key po request
.ix [troff] formatter, [.po] request %key troff formatter, [.po] request
The
.CW \.po
request defines the left margin.
The
.CW \.ll
request defines how long each line will be after filling, and so
implicitly defines the right margin:
.LP
.ix [.ll] request %key ll request
.ix [troff] formatter, [.ll] request %key troff formatter, [.ll] request
.TS
center box tab (#);
cfCWw (1i) | cfCWw (2.5i) | cw (1i)fI.
po#ll#right
\^#\^#margin
.TE
.LP
The
.CW nroff
program's default line length of 6.5 inches is fairly standard for an
8\(12-by-11 page\c
\(em\c
it allows for 1-inch margins on either side.
.ix [nroff] formatter, default line~length %key nroff formatter, default line length
.PP
Assuming that we'd like 1\(14-inch margins on either side of the page,
we would issue the following requests:
.Ps
\&.ll 6i
\&.po 1.25i
.Pe
This will give us 1\(14 inches for both the right and left margins.
The
.CW \.po
request specifies a left margin, or page offset, of 1\(14 inches.
When the 6-inch line length is added to this, it will leave a similar
margin on the rlght side of the page.
.PP
Let's take a look at how our sample letter will format now.
One paragraph of the output should give you the idea.
.sp .7v
.SS
.Ps
.ti 11n
In   our   conversation   last    Thursday,    we
.ti 11n
discussed   a  documentation  project  that would
.ti 11n
produce a user's guide and reference  manual  for
.ti 11n
the  Alcuin  product.  Yesterday,  I received the
.ti 11n
product demo and other materials that you sent me.
.Pe
.sp
.SE
.sp .8v
.LP
As we saw earlier,
.CW nroff
assumes a default page offset of 0.
Either you or the macro package you are using must set the page offset.
In
.CW troff ,
though, there is a default page offset of 26/27 inch, so you can get
away without setting this value.
.PP
(Keep in mind that all
.CW nroff
output examples are actually simulated with
.CW troff ,
and are reduced to fit on our own 5-inch wide printed page.
As a result, the widths shown in our example output are not exact,
but are suggestive of what the actual result would be on an 8\(12-by-11
inch page).
.Bh "Setting Indents"
.LP
.ix %begin hanging indents
.ix %begin indents
.page 79
In addition to the basic page offset, or left margin, you may want to
set an indent, either for a single line or an entire block of text.
You may also want to center one or more lines of text.
.PP
To do a single-line indent, as is commonly used to introduce a
paragraph, use the
.CW \.ti
(\c
.I "temporary indent" )
request.
.ix [.ti] request %key ti request
.ix [troff] formatter, [.ti] request %key troff formatter, [.ti] request
For example, if you followed the blank lines between paragraphs in the
sample letter with the request
.CW "\.ti 5" ,
you'd get a result like this from
.CW nroff :
.sp .7v
.SS
.Ps
.ti 11n
\&...Yesterday, I received the product demo and other
.ti 11n
materials that you sent me.
.sp 1v
.ti 17n
Going  through  a  demo  session  gave  me  a
.ti 11n
much  better  understanding  of  the  product.   I
.ti 11n
confess  to being  amazed by  Alcuin...
.Pe
.sp
.SE
.sp .8v
.LP
The
.CW \.in
request, by contrast, sets an indent that remains in effect until it is
changed.
.ix [.in] request %key in request
.ix [troff] formatter, [.in] request %key troff formatter, [.in] request
For example, if you had entered the line
.CW "\.in 5"
between the paragraphs, (instead of
.CW "\.ti 5" ),
the result would have looked like this:
.sp .7v
.SS
.Ps
.ti 11n
\&...Yesterday, I received the product demo and other
.ti 11n
materials that you sent me.
.sp
.ti 11n
     Going  through  a  demo  session  gave  me  a
.ti 11n
     much better  understanding  of  the  product.
.ti 11n
     I confess  to being  amazed by  Alcuin...
.Pe
.sp
.SE
.sp .8v
.LP
All succeeding paragraphs will continue to be indented, until the indent
is reset.
The default indent (the value at the left margin) is 0.
.PP
These two indent requests can be combined to give a \(lqhanging
indent.\(rq
Remember that you can specify negative values to many requests that take
numeric arguments.
Here is the first case where this makes sense.
Let's say we would like to modify the letter so that it numbers the
points and indents the body of the numbered paragraph:
.Ps
\&...Yesterday, I received the product demo and other materials
that you sent me.  After studying them, I want to clarify
a couple of points:
.sp
\&.in 4
\&.ti -4
1.  Going through a demo session gave me a much better
understanding of the product.  I confess to being amazed by
Alcuin...
.Pe
.page 80
The first line will start at the margin, and subsequent lines will be
indented:
.sp .7v
.SS
.Ps
.ti 11n
\&...Yesterday, I received the product demo and other
.ti 11n
materials that you sent me.    After studying them,
.ti 11n
I want to clarify a couple of points.
.sp
.ti 11n
1.  Going through  a demo session  gave  me  a much
.ti 11n
    better understanding of the product.  I confess
.ti 11n
    to  being  amazed  by  Alcuin...
.Pe
.sp
.SE
.sp .8v
.LP
To line up an indented paragraph like this in
.CW nroff ,
just count the number of characters you want to space over, then use
that number as the size of the indent.
But this trick is not so simple in
.CW troff .
Because characters, and even spaces, are not of constant width, it is
more difficult to create a hanging indent.
Ens are a good unit to use for indents.
Like ems, they are relative to the point size, but they are much closer
to the average character width than an em.
As a result, they are relatively intuitive to work with.
An indent of
.CW 5n
is about where you expect a 5-character indent to be from familiarity
with a typewriter.
.ix %end hanging indents
.ix %end indents
.Bh "Centering Output Lines"
.LP
Centering is another useful layout tool.
To center the next line, use the
.CW \.ce
request:
.ix %begin [.ce] request %key ce request
.ix %begin [troff] formatter, [.ce] request %key troff formatter, [.ce] request
.Ps
\&.ce
This line will be centered.
.Pe
Here's the result:
.sp .7v
.SS
.Ps
.fi
.ce
This line will be centered.
.nf
.Pe
.sp
.SE
.sp .8v
.LP
Centering takes into account any indents that are in effect.
That is, if you have used
.CW \.in
to specify an indent of 1 inch, and the line length is 5 inches,
text will be centered within the 4-inch span following the indent.
.PP
To center multiple lines, specify a number as an argument to the
request:
.Ps
\&.ce 3
Documentation for the Alcuin Product
.sp
A Proposal Prepared by
Fred Caslon
.Pe
Here's the result:
.page 81
.sp .7v
.SS
.Ps
.fi
.ce 3
Documentation for the Alcuin Product
.sp
A Proposal Prepared by
Fred Caslon
.nf
.Pe
.sp
.SE
.sp .8v
.LP
Notice that
.CW \.ce
centered all three
.I text
lines, ignoring the blank line between.
.PP
To center an indeterminately large number of lines, specify a very large
number with the
.CW \.ce
request, then turn it off by entering
.CW "\.ce 0" :
.Ps
\&.ce 1000
\f[I]Many lines of text here.\fP
\&.ce 0
.Pe
.PP
In looking at the examples, you probably noticed that centering
automatically disables filling and justification.
Each line is centered individually.
However, there is also the case in which you would like to center an
entire filled and justified paragraph.
(This paragraph style is often used to set off quoted material in a book
or paper).
You can do this by using both the
.CW \.in
and
.CW \.ll
requests:
.Ps
I was particularly interested by one comment that I
read in your company literature:
.sp
\&.in +5n
\&.ll -5n
The development of Alcuin can be traced back to our
founder's early interest in medieval manuscripts.
He spent several years in the seminary before
becoming interested in computers.  After he became
an expert on typesetting software, he resolved to
put his two interests together.
\&.in -5n
\&.ll +5n
.Pe
Here's the result:
.	\" Note: this one doesn't match the original as well as some
.	\" of the others.  But, as Oreilly himself said, the nroff
.	\" examples are simulations.  This one comes close.
.	\" -- Michael Hobgood
.sp .7v
.SS
.Ps
I was  particularly interested  by  one  comment  that  I
read in your company literature:
.sp
    The development of Alcuin can be  traced  back to
    our   founder's  early  interest    in   medieval
    manuscripts.   He  spent  several  years  in  the
    seminary before becoming  interested  in  comput-
    ers.  After he  became an expert  on  typesetting
    software,  he resolved to put his  two  interests
    together.
.Pe
.sp
.SE
.sp .8v
.LP
.page 82
Remember that a line centered with
.CW \.ce
takes into account any indents in effect at the time.
You can visualize the relationship between page offset, line length,
indents, and centering as follows:
.LP
.TS
center box tab (#);
cw (.75i) | cw (.75i) | cw (3.5i).
\f[CW]po\fP#\f[CW]in\fP#\f[CW]ce\fP
\^#_#_
.T&
c c s.
\^#\f[CW]ll\fP
.TE
.ix %end [.ce] request %key ce request
.ix %end [troff] formatter, [.ce] request %key troff formatter, [.ce] request
.Bh "Setting Tabs"
.ix %begin tabs (in [troff]) %key tabs (in troff)
.LP
No discussion of how to align text would be complete without a
discussion of tabs.
A tab, as anyone who has used a typewriter well knows, is a horizontal
motion to a predefined position on the line.
.PP
The problem with using tabs in
.CW nroff
and
.CW troff
is that what you see on the screen is very different from what you get
on the page.
Unlike a typewriter or a
.I wysiwyg
word processor, the editor/formatter combination presents you with two
different tab settings.
You can set tabs in
.CW vi ,
and you can set them in
.CW nroff
and
.CW troff ,
but the settings are likely to be different, and the results on the
screen definitely unaesthetic.
.PP
However, after you get used to the fact that tabs will not line up on
the screen in the same way as they will on the printed page, you can use
tabs quite effectively.
.PP
By default, tab stops are set every .8 inches in
.CW nroff
and every .5 inches in
.CW troff .
To set your own tab stops in
.CW nroff
or
.CW troff ,
use the
.CW \.ta
request.
.ix %begin [.ta] request %key ta request
.ix %begin [troff] formatter, [.ta] request %key troff formatter, [.ta] request
For example:
.Ps
\&.ta 1i 2.5i 3i
.Pe
will set three tab stops, at 1 inch, 2\(12 inches, and 3 inches,
respectively.
Any previous or default settings are now no longer in effect.
.PP
You can also set incremental tab stops.
The request:
.Ps
\&.ta 1i +1.5i +.5i
.Pe
will set tabs at the same positions as the previous example.
Values preceded with a plus sign are added to the value of the last tab
stop.
.PP
You can also specify the alignment of text at a tab stop.
Settings made with a numeric value alone are left adjusted, just as they
are on a typewriter.
However, by adding either the letter
.CW R
or
.CW C
to the definition of a tab stop, you can make text right adjusted or
centered on the stop.
.PP
For example, the following input lines (where a tab character is shown
by the symbol
.CW |\(em\(em| ):
.Ps
\&.nf
\&.ta 1i 2.5i 3.5i
|\(em\(em|First|\(em\(em|Second|\(em\(em|Third
\&.fi
.Pe
will produce the following output:
.page 83
.sp .7v
.SS
.Ps
.ti 21n
First              Second        Third
.Pe
.sp
.SE
.sp .8v
.LP
But:
.Ps
\&.nf
\&.ta 1i 2.5iR 3.5iC
|\(em\(em|First|\(em\(em|Second|\(em\(em|Third
\&.fi
.Pe
will produce:
.sp .7v
.SS
.Ps
.ti 21n
First         Second           Third
.Pe
.sp
.SE
.sp .8v
.PP
.ix [troff] formatter, aligning numeric~data %key troff formatter, aligning numeric data
Right-adjusted tabs can be useful for aligning numeric data.
This is especially true in
.CW troff ,
where all characters (including blank spaces) have different sizes, and,
as a result, you can't just line things up by eye.
If the numbers you want to align have an uneven number of decimal
positions, you can manually force right adjustment of numeric data using
the special escape sequence
.CW \e0 ,
which will produce a blank space exactly the same width as a digit.
For example:
.Ps
\&.ta 1iR
|\(em\(em|500.2\e0
|\(em\(em|125.35
|\(em\(em|50.\e0\e0
.Pe
will produce:
.sp .7v
.SS
.Ps
.ti 14n
500.2
.ti 14n
125.35
.ti 14n
\050.
.Pe
.sp
.SE
.sp .8v
.PP
As on a typewriter, if you have already spaced past a tab position
(either by printing characters, or with an indent or other horizontal
motion), a tab in the input will push text over to the next available
tab stop.
If you have passed the last tab stop, any tabs present in the input will
be ignored.
.PP
.ix no-fill mode
You must be in no-fill mode for tabs to work correctly.
This is not just because filling will override the effect of the tabs.
Using
.CW \.nf
when specifying tabs is an important rule of thumb; we'll look at the
reasoning behind it in Chapter 15.
.ix %end [.ta] request %key ta request
.ix %end [troff] formatter, [.ta] request %key troff formatter, [.ta] request
.ix %end tabs (in [troff]) %key tabs (in troff)
.Bh "Underlining"
.LP
We haven't yet described how to underline text, a primary type of
emphasis in
.CW nroff ,
which lacks the
.CW troff
ability to switch fonts for emphasis.
.PP
There are two underlining requests:
.CW \.ul
(\c
.I underline )
.ix %begin [troff] formatter, [.ul] request %key troff formatter, [.ul] request
.ix %begin [.ul] request %key ul request
and
.CW \.cu
(\c
.I "continuous underline" ).
.ix %begin [.cu] request %key cu request
.ix %begin [troff] formatter, [.cu] request %key troff formatter, [.cu] request
The
.CW \.ul
request underlines only printable characters (the words, but not the
spaces), and
.CW \.cu
underlines the entire text string.
.page 84
.PP
These requests are used just like
.CW \.ce .
Without an argument, they underline the text on the following input
line.
You can use a numeric argument to specify that more than one line should
be underlined.
.PP
Both of these requests produce italics instead of underlines in
.CW troff.
Although there is a request,
.CW \.uf ,
that allows you to reset the underline font to some other font than
italics,*
.FS
* This request is generally used when the document is being typeset in a
font family other than Times Roman.
It might be used to set the \(lqunderline font\(rq to Helvetica Italic,
rather than the standard Italic.
.FE
there is no way to have these requests produce underlining
even in
.CW troff .
(The
.CW ms
and
.CW mm
macro packages both include a
.I macro
to do underlining in
.CW troff ,
but this uses an entirely different mechanism, which is not explained
until Chapter 15).
.ix %end [.cu] request %key cu request
.ix %end [troff] formatter, [.cu] request %key troff formatter, [.cu] request
.ix %end [.ul] request %key ul request
.ix %end [troff] formatter, [.ul] request %key troff formatter, [.ul] request
.Bh "Inserting Vertical Space"
.ix [troff] formatter, vertical spacing %key troff formatter, vertical spacing
.ix vertical spacing
.LP
As you have seen, a blank line in the input text results in a blank line
in the output.
You can leave blank space on the page (for example, between the closing
of a letter and the signature) by inserting a number of blank lines in
the input text.
.PP
However, particularly when you are entering formatting codes as you
write, rather than going back to code an existing file like our sample
letter, it is often more convenient to specify the spacing with the
.CW \.sp
request.
.ix %begin [.sp] request %key sp request
.ix %begin [troff] formatter, [.sp] request %key troff formatter, [.sp] request
.PP
For example, you could type:
.Ps
Sincerely,
\&.sp 3
Fred Caslon
.Pe
In
.CW troff ,
the
.CW \.sp
request is even more important, because
.CW troff
can space in much finer increments.
.PP
For example, if we were formatting the letter with
.CW troff ,
a full space between paragraphs would look like this:
.sp .7v
.SS
.Ps
.\" .nr UTPLL \n(LL
.ll 4.5i
.fi
.ft R
In our conversation last Thursday, we discussed a
documentation project
that would produce a user's guide and reference manual
for the Alcuin
product.
Yesterday, I received the product demo and other materials that you sent
me.
.sp
Going through a demo session gave me a better understanding of the
product.
I confess to being amazed by Alcuin.
Some people around here, looking over my shoulder, were also astounded
by the illuminated manuscript I produced with Alcuin.
One person, a student of calligraphy, was really impressed.
.ll \n(LLu
.\" .ll \n[UTPLL]u
.nf
.ft P
.Pe
.sp
.SE
.sp .8v
.LP
The output would probably look better if there was a smaller amount of
space between the lines.
If we replace the line between the paragraphs with the request
.CW "\.sp .5" ,
here is what we will get:
.page 85
.sp .7v
.SS
.Ps
.ll 4.5i
.fi
.ft R
In our conversation last Thursday, we discussed a documentation project
that would produce a user's guide and reference manual for the Alcuin
product.
Yesterday, I received the product demo and other materials that you sent
me.
.sp .5
Going through a demo session gave me a much better understanding of the
product.
I confess to being amazed by Alcuin.
Some people around here, looking over my shoulder, were also astounded
by the illuminated manuscript I produced with Alcuin.
One person, a student of calligraphy, was really impressed.
.ll \n[UTPLL]u
.nf
.ft P
.Pe
.sp
.SE
.sp .8v
.LP
Although it may not yet be apparent how this will be useful, you can
also space to an absolute position on the page, by inserting a vertical
bar before the distance.
.ix [troff] formatter, spacing~to~an absolute position %key troff formatter, spacing to~an absolute position
The following:
.Ps
\&.sp |3i
.Pe
will space down to a position 3 inches from the top of the page, rather
than 3 inches from the current position.
.PP
You can also use negative values with ordinary relative spacing
requests.
.ix [troff] formatter, negative vertical~motions %key troff formatter, negative vertical motions
For example:
.Ps
\&.sp -3
.Pe
will move back up the page three lines.
Of course, when you use any of these requests, you have to know what you
are doing.
If you tell
.CW nroff
or
.CW troff
to put one line on top of another, that's exactly what you'll get.
For example:
.Ps
This is the first line.
\&.sp -2
This is the second line.
\&.br
This is the third line.
.Pe
will result in:
.sp .7v
.SS
.Ps
.sp
This is the first line.
.sp -2
This is the second line.
.br
This is the third line.
.Pe
.sp
.SE
.sp .8v
.LP
Sure enough, the second line is printed above the first, but because we
haven't restored the original position, the third line is then printed
on top of the first.
.PP
When you make negative vertical motions, you should always make
compensatory positive motions, so that you end up at the correct
position for future output.
The previous example would have avoided disaster if it had been coded:
.Ps
This is the first line.
\&.sp -2
This is the second line.
\&.sp
This is the third line.
.Pe
.page 86
(Notice that you need to space down one less line than you have spaced
up because, in this case, printing the second line \(lquses up\(rq one
of the spaces you went back on).
.PP
These kind of vertical motions are generally used for line drawing
(e.g., for drawing boxes around tables), in which all of the text is
output, and the formatter then goes back up the page to draw in the
lines.
At this stage, it is unlikely that you will find an immediate use for
this capability.
Nonetheless, we are sure that a creative person, knowing that it is
there, will find it just the right tool for a job.
(We'll show a few creative uses of our own later).
.PP
You probably aren't surprised that a typesetter can go back up the page.
But you may wonder how a typewriter-like printer can go back up the page
like this.
The answer is that it can't.
If you do any reverse line motions (and you do when you use certain
macros in the standard packages, or the
.CW tbl
and
.CW eqn
preprocessors), you must pass the
.CW nroff
output through a special filter program called
.CW col
to get all of the motions sorted out beforehand, so that the page will
be printed in the desired order:
.Ps
$ \f[CB]nroff\fP \f[I]files\fP \f[CB]| col | lp\fP
.Pe
.ix [col] command %key col command
.ix [eqn] preprocessor %key eqn preprocessor
.ix %end [.sp] request %key sp request
.ix %end [troff] formatter, [.sp] request %key troff formatter, [.sp] request
.Bh "Double or Triple Spacing"
.ix [troff] formatter, double~or~triple spacing %key troff formatter, double or~triple spacing
.ix [.ls] request %key ls request
.ix [troff] formatter, [.ls] request %key troff formatter, [.ls] request
.LP
Both
.CW nroff
and
.CW troff
provide a request to produce double- or triple-spaced output without
individually adjusting the space between each line.
For example:
.Ps
\&.ls 2
.Pe
Putting this at the top of the file produces double-spaced lines.
An argument of 3 specifies triple-spaced lines.
.Ah "Page Transitions"
.ix %begin [troff] formatter, page~transition %key troff formatter, page transition
.LP
If we want space at the top of our one-page letter, it is easy enough to
insert the command:
.Ps
\&.sp 1i
.Pe
before the first line of the text.
However,
.CW nroff
and
.CW troff
do not provide an easy way of handling page transitions in multipage
documents.
.PP
By default,
.CW nroff
and
.CW troff
assume that the page length is 11 inches.
.ix [troff] formatter, page~length %key troff formatter, page length
However, neither program makes immediate use of this information.
There is no default top and bottom margin, so text output begins on the
first line, and goes to the end of the page.
.PP
The
.CW \.bp
(\c
.I "break page" )
.ix [.bp] request %key bp request
.ix [troff] formatter, [.bp] request %key troff formatter, [.bp] request
request allows you to force a page break.
If you do this, the remainder of the current page will be filled with
blank lines, and output will start again at the top of the second page.
If you care to test this, insert a
.CW \.bp
anywhere in the text of our sample letter, then process the letter with
.CW nroff .
If you save the resulting output in a file:
.Ps
$ \f[CB]nroff letter > letter.out\fP
.Pe
.page 87
you will find that the text following the
.CW \.bp
begins on line 67 (11 inches at 6 lines per inch equals 66 lines per
page).
.PP
To automatically leave space at the top and bottom of each page, you
need to use the
.CW \.wh
(\c
.I when )
request.
.ix [.wh] request %key wh request
.ix [troff] formatter, [.wh] request %key troff formatter, [.wh] request
In
.CW nroff
and
.CW troff
parlance, this request sets a
.I trap \c
\(em\c
a position on the page at which a given macro will be executed.
.ix [troff] formatter, traps %key troff formatter, traps
.PP
You'll notice that we said
.I macro ,
not
.I request .
There's the rub.
To use
.CW \.wh ,
you need to know how to define a macro.
.ix [troff] formatter, defining macros %key troff formatter, defining macros
It doesn't work with single requests.
.PP
There's not all that much to defining macros, though.
A macro is simply a sequence of stored requests that can be executed all
at once with a single command.
We'll come back to this later, after we've looked at the process of
macro definition.
.PP
For the moment, let's assume that we've defined two macros, one
containing the commands that will handle the top margin, and another for
the bottom margin.
The first macro will be called
.CW \.TM ,
and the second
.CW \.BM .
(By convention, macros are often given names consisting of uppercase
letters, to distinguish them from the basic
.CW nroff
and
.CW troff
requests.
However, this is a convention only, and one that is not always
followed).
.PP
To set traps that will execute these macros, we would use the
.CW \.wh
request as follows:
.Ps
\&.wh 0 TM
\&.wh -1i BM
.Pe
The first argument to
.CW \&.wh
specifies the vertical position on the page at which to execute the
macro.
An argument of 0 always stands for the top of the page, and a negative
value is always counted from the bottom of the page, as defined by the
page length.
.PP
In its simplest form, the
.CW \.TM
macro need only contain the single request to space down 1 inch, and
.CW \.BM
need only contain the single request to break to a new page.
If
.CW \.wh
allowed you to specify a single request rather than a macro, this would
be equivalent to:
.Ps
\&.wh 0 .sp 1i
\&.wh -1i .bp
.Pe
With an 11-inch page length, this would result in an effective 9-inch
text area, because on every page, the formatter's first act would be to
space down 1 inch, and it would break to a new page when it reached 1
inch from the bottom.
.PP
You might wonder why
.CW nroff
and
.CW troff
have made the business of page transition more complicated than any of
the other essential page layout tasks.
There are two reasons:
.LP
.RS
.Ls B
.Li
The
.CW nroff
and
.CW troff
programs were designed with the typesetting heritage in mind.
Until fairly recently, most typesetters produced continuous output
on rolls of photographic paper or film.
This output was manually cut and pasted up onto pages.
.Li
Especially in
.CW troff ,
page transition is inherently more complex than the other tasks
we've described.
For example, books often contain headers and footers that are set in
different type sizes or styles.
At every page transition, the software must automatically save
information about the current type style,
.page 88
switch to the style used
by the header or footer, and then revert to the original style when
it returns to the main text.
Or consider the matter of footnotes\c
\(em\c
the position at which the
page ends is different when a footnote is on the page.
The page transition trap must make some allowance for this.
.Le
.RE
.LP
In short, what you might like the formatter to do during page
transitions can vary.
For this reason, the developers of
.CW nroff
and
.CW troff
have allowed users to define their own macros for handling this area.
.PP
When you start out with
.CW nroff
or
.CW troff ,
we advise you to use one of the ready-made macro packages,
.CW ms
.ix [ms] macros %key ms macros
or
.CW mm .
.ix [mm] macros %key mm macros
The standard macro package for UNIX systems based on System V is
.CW mm ;
the standard on Berkeley UNIX systems is
.CW ms .
Berkeley UNIX systems also support a third macro package called
.CW me .
.ix [me] macros %key me macros
In addition, there are specialized macro packages for formatting
viewgraphs, standard UNIX reference manual pages (\c
.CW man ),
.ix [man] macros %key man macros
and UNIX permuted indexes (\c
.CW mptx ).
.ix [mptx] macros %key mptx macros
Only the
.CW ms
and
.CW mm
packages are described in this book.
The macro packages have already taken into account many of the
complexities in page transition (and other advanced formatting
problems), and provide many capabilities that would take considerable
time and effort to design yourself.
.PP
Of course, it is quite possible to design your own macro package, and we
will go into all of the details later.
(In fact, this book is coded with neither of the standard macro
packages, but with one developed by Steve Kochan and Pat Wood of
Pipeline Associates, the consulting editors of this series, for use
specifically with the Hayden UNIX library).
.ix %end [troff] formatter, page~transition %key troff formatter, page transition
.Bh "Page Length Revisited"
.ix [troff] formatter, page~length %key troff formatter, page length
.LP
Before we take a closer look at macros, let's take a moment to make a
few more points about page length, page breaks, and the like.
.PP
Assuming that some provision has been made for handling page
transitions, there are several wrinkles to the requests we have already
introduced, plus several new requests that you will probably find
useful.
.PP
First, let's talk about page length.
It's important to remember that the printing area is defined by the
interaction of the page length and the location of the traps you define.
For example, you could define a text area 7.5 inches high (as we did in
preparing copy for this book) either by
.LP
.RS
.Ls B
.Li
changing the page length to 9.5 inches, and setting 1-inch margins
at the top and bottom;
.Li
leaving the page length at 11 inches, and setting 1.75-inch margins
at the top and bottom.
.Le
.RE
.LP
In general, we prefer to think of
.CW \.pl
as setting the
.I "paper length" ,
and use the page transition traps to set larger or smaller margins.
.ix [.pl] request %key pl request
.ix [troff] formatter, [.pl] request %key troff formatter, [.pl] request
.PP
However, there are cases where you really are working with a different
paper size.
A good example of this is printing addresses on envelopes: the physical
paper height is about 4 inches (24 lines on a typewriter-like printer
printing 6 lines per inch), and we
.page 89
want to print in a narrow window
consisting of four or five lines.
A good set of definitions for this case would be:
.Ps
\&.pl 4i
\&.wh 0 TM
\&.wh -9v BM
.Pe
with
.CW \.TM
containing the request
.CW "\.sp 9v" ,
and with
.CW \.BM ,
as before, containing
.CW \.bp .
.PP
There is more to say about traps, but it will make more sense later, so
we'll leave the subject for now.
.Bh "Page Breaks without Line Breaks"
.ix page breaks, without line~breaks
.ix [troff] formatter, page~breaks~without~line~breaks %key troff formatter, page breaks~without~line~breaks
.LP
Page breaks\c
\(em\c
we've talked about their use in page transition traps,
.ix traps
but they also have a common use on their own.
Often, you will want to break a page before it would normally end.
For example, if the page breaks right after the first line of a
paragraph, you will probably want to force the line onto the next page,
rather than leaving an \(lqorphaned\(rq line.
Or you might want to leave blank space at the bottom of a page for an
illustration.
To do this, simply enter a
.CW \.bp
at the desired point.
.ix %begin [.bp] request %key bp request
.ix %begin [troff] formatter, [.bp] request %key troff formatter, [.bp] request
A new page will be started immediately.
.PP
However, consider the case in which you need to force a break in the
middle of a paragraph to prevent a \(lqwidowed\(rq line at the top of
the next page.
If you do this:
.Ps
The medieval masters of calligraphy and illumination
are largely unknown to us.  We thankfully have examples
of their work, and even
\&.bp
marginal notes by the copyists of some manuscripts,
but the men who produced these minute masterpieces
are anonymous.
.Pe
the
.CW \.bp
request will also cause a line break, and the text will not be filled
properly:
.sp .7v
.SS
.Ps
The medieval  masters  of calligraphy  and illumination
are largely unknown to us.  We thankfully have examples
of their work, and even
.sp
\f[I]New page begins here\fP
.sp
marginal notes by the copyists of some manuscripts, but
the  men  who  produced these  minute  masterpieces are
anonymous.
.Pe
.sp
.SE
.sp .8v
.LP
Fortunately, there is a way around this problem.
If you begin a request with an apostrophe instead of a period, the
request will not cause a break.
.page 90
.Ps
The medieval masters of calligraphy and illumination
are largely unknown to us.  We thankfully have examples
of their work, and even
\&'bp
marginal notes by the copyists of some manuscripts,
but the men who produced these minute masterpieces
are anonymous.
.Pe
Now we have the desired result:
.sp .7v
.SS
.Ps
The  medieval  masters of  calligraphy and  illumination
are  largely unknown to us.  We thankfully have examples
.sp
\f[I]New page begins here\fP
.sp
of  their work,  and even marginal notes by the copyists
of  some  manuscripts,  but  the  men who produced these
minute masterpieces are anonymous.
.Pe
.sp
.SE
.sp .8v
.LP
(In fact, most page transition macros use this feature to make
paragraphs continue across page boundaries.
We'll take a closer look at this in later chapters).
.PP
Another very useful request is the conditional page break, or
.CW \.ne
(\c
.I need )
request.
.ix [.ne] request %key ne request
.ix [troff] formatter, [.ne] request %key troff formatter, [.ne] request
If you want to make sure an entire block of text appears on the same
page, you can use this request to force a page break if there isn't
enough space left.
If there is sufficient space, the request is ignored.
.PP
For example, the two requests:
.Ps
\&.ne 3.2i
\&.sp 3i
.Pe
might be used to reserve blank space to paste in an illustration that is
3 inches high.
.PP
The
.CW \.ne
request does not cause a break, so you should be sure to precede it with
.CW \.br
or another request that causes a break if you don't want the remnants of
the current line buffer carried to the next page if the
.CW \.ne
is triggered.
.PP
It is often better to use
.CW \.ne
instead of
.CW \.bp ,
unless you're absolutely sure that you will
.I always
want a page break at a particular point.
If, in the course of editing, an
.CW \.ne
request moves away from the bottom of the page, it will have no effect.
But a
.CW \.bp
will always start a new page, sometimes leaving a page nearly blank when
the text in a file has been changed significantly.
.PP
There are other special spacing requests that can be used for this
purpose.
(Depending on the macro package, these may have to be used).
For example,
.CW \.sv
(\c
.I "save space" )
.ix %begin [.sv] request %key sv request
.ix %begin [troff] formatter, [.sv] request %key troff formatter, [.sv] request
requests a block of contiguous space.
If the remainder of the page does not contain the requested amount of
space, no space is output.
Instead, the amount of space requested is remembered and is output when
an
.CW \.os
(\c
.I "output saved space" )
request is encountered.
.ix %begin [.os] request %key os request
.ix %begin [troff] formatter, [.os] request %key troff formatter, [.os] request
.PP
These are advanced requests, but you may need to know about them because
most macro packages include two other spacing requests in their page
transition macros:
.CW \.ns
(\c
.I "no space" )
.ix %begin [.ns] request %key ns request
.ix %begin [troff] formatter, [.ns] request %key troff formatter, [.ns] request
and
.CW \.rs
(\c
.I "restore space" ).
.ix [.rs] request %key rs request
.ix [troff] formatter, [.rs] request %key troff formatter, [.rs] request
An
.CW \.ns
inhibits the effect of spacing requests;
.CW \.rs
restores the effectiveness of such requests.
.page 91
.PP
.ix [mm] macros, page~transition %key mm macros, page transition
.ix [ms] macros, page~transition %key ms macros, page transition
Both the
.CW ms
and
.CW mm
macros include an
.CW \.ns
request in their page transition macros.
As a result, if you issue a request like:
.Ps
\&.sp 3i
.Pe
with 1 inch remaining before the bottom of the page, you will not get 1
inch at the bottom, plus 2 inches at the top of the next page, but only
whatever remains at the bottom.
The next page will start right at the top.
However, both macro packages also include an
.CW \.os
request in their page top macro, so if you truly want 3 inches, use
.CW "\.sv 3i" ,
and you will get the expected result.
.PP
However, if you use
.CW \.sv ,
you will also have another unexpected result: text following the spacing
request will \(lqfloat\(rq ahead of it to fill up the remainder of the
current page.
.PP
We'll talk more about this later.
We introduced it now to prevent confusion when spacing requests don't
always act the way you expect.
.ix %end [.bp] request %key bp request
.ix %end [.ns] request %key ns request
.ix %end [.os] request %key os request
.ix %end [.sv] request %key sv request
.ix %end [troff] formatter, [.bp] request %key troff formatter, [.bp] request
.ix %end [troff] formatter, [.ns] request %key troff formatter, [.ns] request
.ix %end [troff] formatter, [.os] request %key troff formatter, [.os] request
.ix %end [troff] formatter, [.sv] request %key troff formatter, [.sv] request

.Bh "Page Numbering"
.ix [troff] formatter, page numbering %key troff formatter, page numbering
.LP
The
.CW nroff
and
.CW troff
programs keep track of page numbers and make the current page number
available to be printed out (usually by a page transition macro).
.ix page~transition
You can artificially set the page number with the
.CW .pn
request:
.ix [.pn] request %key pn request
.ix [troff] formatter, [.pn] request %key troff formatter, [.pn] request
.RS
.TS
tab (#);
lfCW l l.
\&.pn 5##Set the current page number to 5
\&.pn +5##Increment the current page number by 5
\&.pn -5##Decrement the current page number by 5
.TE
.RE
You can also artificially set the number for the
.I next
page whenever you issue a
.CW \.bp
request, simply by adding a numeric argument:
.RS
.TS
tab (#);
lfCW l l.
\&.bp 5##Break the page and set the next page number to 5
\&.bp +5##Break the page and increment the next page number by 5
\&.bp -5##Break the page and decrement the next page number by 5
.TE
.RE
In addition to inhibiting
.CW \.sp ,
the
.CW \.ns
request inhibits the action of
.CW \.bp ,
.I unless
a page number is specified.
This means (at least in the existing macro packages), that the sequence:
.Ps
\&.bp
\&.bp
.Pe
will not result in a blank page being output.
You will get the same effect as if you had specified only a simple
.CW \.bp .
Instead, you should specify:
.Ps
\&.bp +1
.Pe
The starting page number (usually 1) can also be set from the command
line, using the
.CW -n
option.
.ix [troff] formatter, setting page~number~from command~line %key troff formatter, setting page number~from command~line
For example:
.page 92
.Ps
$ \f[CB]nroff -ms -n10\fP \f[I]file\fP
.Pe
will start numbering
.I file
at page number 10.
In addition, there is a command-line option to print only selected pages
of the output.
The
.CW -o
option takes a list of page numbers as its argument.
.ix [troff] formatter, selecting output pages~from command~line %key troff formatter, selecting output pages from command~line
The entire file (up to the last page number in the list) is processed,
but only the specified pages are output.
The list can include single pages separated by commas, or a range of
pages separated by a hyphen, or both.
A number followed by a trailing hyphen means to output from that page to
the end.
For example:
.Ps
$ \f[CB]nroff -ms -o1,5,7-9,13-\fP \f[I]file\fP
.Pe
will output pages 1, 5, 7 through 9, and from 13 to the end of the file.
There should be no spaces anywhere in the list.
.Ah "Changing Fonts"
.ix %begin fonts, changing
.ix %begin [troff] formatter, fonts %key troff formatter, fonts
.LP
In old
.CW troff
(\c
.CW otroff ),
you were limited to four fonts at a time, because the fonts had to be
physically mounted on the C/A/T typesetter.
With
.CW ditroff
and a laser printer or a modern typesetter, you can use a virtually
.ig
	The word modern in the above line was misspelled in
	the original book.  It was spelled "modem".
	-- Michael Hobgood
..
unlimited number of fonts in the same document.
.PP
In
.CW otroff
you needed to specify the basic fonts that are in use with the
.CW \.fp
(\c
.I "font position" )
request.
.ix [.fp] request %key fp request
.ix [troff] formatter, [.fp] request %key troff formatter, [.fp] request
.ix fonts, mounted
Normally, at the front of a file (or, more likely, in the macro
package), you would use this request to specify which fonts are mounted
in each of the four quadrants (positions) of the typesetter wheel.
By default, the roman font is mounted in position 1, the italic font in
position 2, the bold font in position 3, and the special font in
position 4.
That is,
.CW troff
acts as though you had included the lines:
.Ps
\&.fp 1 R
\&.fp 2 I
\&.fp 3 B
\&.fp 4 S
.Pe
In
.CW ditroff ,
up to ten fonts are automatically mounted, with the special font in
position 10.
Which fonts are mounted, and in which positions, depends on the output
device.
See Appendix D for details.
The font that is mounted in position 1 will be used for the body type of
the text\c
\(em\c
it is the font that will be used if no other specification
is given.
The special font is also used without any intervention on your part when
a character not in the normal character set is requested.
.PP
To request one of the other fonts, you can use either the
.CW \.ft
request, or the inline font-switch escape sequence
.CW \ef .
.ix [.ft] request %key ft request
.ix [troff] formatter, [.ft] request %key troff formatter, [.ft] request
.PP
For example:
.Ps
\&.ft B
This line will be set in bold type.
\&.br
\&.ft R
This line will again be set in roman type.
.Pe
will produce:
.page 93
.sp .7v
.SS
.Ps
.ft B
This line will be set in bold type.
.ft P
.ft R
This line will again be set in roman type.
.ft P
.Pe
.sp
.SE
.sp .8v
.LP
You can also change fonts using an inline font
.I "escape sequence" .
For example, the preceding sentence was coded like this:
.Ps
\&...an inline font \efIescape sequence\efP.
.Pe
You may wonder at the
.CW \efP
at the end, rather than
.CW \efR .
The
.CW P
command is a special code that can be used with either the
.CW \.ft
request or the
.CW \ef
escape sequence.
It means \(lqreturn to the previous font, whatever it was.\(rq
This is often preferable to an explicit font request, because it is more
general.
.PP
All of this begs the question of fonts different than Times Roman, Bold,
and Italic.
There are two issues: first, which fonts are available on the output
device, and second, which fonts does
.CW troff
have width tables for.
(As described previously,
.CW troff
uses these tables to determine how far to space over after it outputs
each character).
For
.CW otroff
these width tables are in the directory
.CW /usr/lib/font ,
in files whose names begin with
.CW ft .
.ix [/usr/lib/font] %key /usr/lib/font
If you list the contents of this directory, you might see something like
this for
.CW otroff :
.Ps
$ \f[CB]ls /usr/lib/font\fP
ftB   ftBC  ftC   ftCE  ftCI
ftCK  ftCS  ftCW  ftFD  ftG
ftGI  ftGM  ftGR  ftH   ftHB
ftHI  ftI   ftL   ftLI  ftPA
ftPB  ftPI  ftR   ftS   ftSB
ftSI  ftSM  ftUD
.Pe
You can pick out the familiar R, I, B, and S fonts, and may guess that
.CW ftH ,
.CW ftHI ,
and
.CW ftHB
refer to Helvetica, Helvetica Italic, and Helvetica Bold fonts.
However, unless you are familiar with typesetting, the other names might
as well be Greek to you.
In any event, these width tables, normally supplied with
.CW troff ,
are for fonts that are commonly used with the C/A/T typesetter.
.ft I
If you are using a different device, they may be of no use to you.
.ft P
.PP
The point is that if you are using a different typesetting device, you
will need to get information about the font names for your system from
whoever set up the equipment to work with
.CW troff .
The contents of
.CW /usr/lib/font
will vary from installation to installation, depending on what fonts are
supported.
.PP
For
.CW ditroff ,
there is a separate subdirectory in
.CW /usr/lib/font
for each supported output device.
For example:
.Ps
$ \f[CB]ls /usr/lib/font\fP
devlj    devps
$ \f[CB]ls /usr/lib/font/devps\fP
B.out    BI.out    CB.out   CI.out   CW.out   CX.out
DESC.out H.out     HB.out   HI.out   HK.out   HO.out
HX.out   I.out     LI.out   PA.out   PB.out   PI.out
PX.out   R.out     O.out    RS.out   S.out    S1.out
.Pe
.page 94
Here, the font name is followed by the string
.CW \.out .
.PP
Again, the font names themselves are probably Greek to you.
However, with
.CW ditroff ,
you can actually use any of these names, and see what results they give
you, because all fonts should be available at any time.
.PP
For the sake of argument, let's assume that your typesetter or other
.CW troff \c
-compatible
equipment supports the Helvetica font family shown in Figure 4-3, with
the names
.CW H ,
.CW HI ,
and
.CW HB .
(This is a fairly reasonable assumption, because Helvetica is probably
the most widely available font family after Times).
.Fs 0 F
.nf
.nr UTPIN \n(.i
.in 1.7i
.ft H
Helvetica
.sp
abcdefghijklmnopqrstuvwxyz
ABCDEFGHIJKLMNOPQRSTUVWXYZ
1234567890
! $ % & ( ) ` ' * + - . , / : ; = ? [ ] |
\(bu \(sq \(em \(en _ \(14 \(12 \(34 \(fi \(fl \(de \(dg \(aa \(rg \(co
.ft P
.ft HI
.sp
Helvetica Italic
.sp
abcdefghijklmnopqrstuvwxyz
ABCDEFGHIJKLMNOPQRSTUVWXYZ
1234567890
! $ % & ( ) ` ' * + - . , / : ; = ? [ ] |
\(bu \(sq \(em \(en _ \(14 \(12 \(34 \(fi \(fl \(de \(dg \(aa \(rg \(co
.ft P
.ft HB
.sp
Helvetica Bold
.sp
abcdefghijklmnopqrstuvwxyz
ABCDEFGHIJKLMNOPQRSTUVWXYZ
1234567890
! $ % & ( ) ` ' * + - . , / : ; = ? [ ] |
\(bu \(sq \(em \(en _ \(14 \(12 \(34 \(fi \(fl \(de \(dg \(aa \(rg \(co
.ft P
.ft H
.sp
Special Mathematical Font
.sp
\(dq \(aa \(rs \(ha \(ru \(ga \(ti \(sl \(la \(ra \(lC \(rC \(sh \(at \(pl \- \(eq \(**
\(*a \(*b \(*g \(*d \(*e \(*z \(*y \(*h \(*i \(*k \(*l \(*m \(*n \(*c \(*o \(*p \(*r \(*s \(ts \(*t \(*u \(*f \(*x \(*q \(*w
\(*G \(*D \(*H \(*L \(*C \(*P \(*S \(*U \(*F \(*Q \(*W
\(sr \(rn \(>= \(<= \(== \(ap \(!= \(-> \(<- \(ua \(da \(mu \(di \(+- \(cu \(ca \(sb \(sp \(ib \(ip \(if \(pd
\(sc \(gr \(no \(is \(pt \(es \(mo \(dd \(rh \0 \(lh \(or \(ci \(lt \(lb \(rt \(rb \(lk \(rk \(bv \(lf \(rf \(lc \(rc\(bv
.\" again, filled in the missing fonts -- Michael
.ft P
.fi
.in \n[UTPIN]u
.Fe "Helvetica Fonts"
.PP
When specifying two-character font names with the
.CW \ef
escape sequence, you must add the
.CW (
prefix as well.
For example, you would specify Helvetica Italic by the inline sequence
.CW \ef(HI ,
and Helvetica Bold by
.CW \ef(HB .
.page 95
.PP
There is another issue when you are using fonts other than the Times
Roman family.
Assume that you decide to typeset your document in Helvetica rather than
Roman.
You reset your initial font position settings to read:
.ix [.fp] request %key fp request
.ix [troff] formatter, [.fp] request %key troff formatter, [.fp] request
.Ps
\&.fp 1 H
\&.fp 2 HI
\&.fp 3 HB
\&.fp 4 S
.Pe
However, throughout the text, you have requests of the form:
.Ps
\&.ft B
.Pe
or:
.Ps
\efB
.Pe
.ix [.ft] request %key ft request
.ix [troff] formatter, [.ft] request %key troff formatter, [.ft] request
You will need to make a set of global replacements throughout your file.
To insulate yourself in a broader way from overall font change
decisions,
.CW troff
allows you to specify fonts by position, even within
.CW \.ft
and
.CW \ef
requests:
.Ps
\&.ft 1    \f[R]or\fP     \ef1      \f[R]Use the font mounted in position 1\fP
\&.ft 2    \f[R]or\fP     \ef2      \f[R]Use the font mounted in position 2\fP
\&.ft 3    \f[R]or\fP     \ef3      \f[R]Use the font mounted in position 3\fP
\&.ft 4    \f[R]or\fP     \ef4      \f[R]Use the font mounted in position 4\fP
.Pe
Because you don't need to use the
.CW \.fp
request to set font positions with
.CW ditroff ,
and the range of fonts is much greater, you may have a problem knowing
which fonts are mounted in which positions.
A quick way to find out which fonts are mounted is to run
.CW ditroff
on a short file, sending the output to the screen.
For example:
.Ps
$ \f[CB]ditroff -Tps junk | more\fP
x T ps
x res 720 1 1
x init
x font l R
x font 2 I
x font 3 B
x font 4 BI
x font 5 CW
x font 6 CB
x font 7 H
x font 8 HB
x font 9 HI
x font 10 S
\&...
.Pe
The font positions should appear at the top of the file.
In this example, you see the following fonts: (Times) Roman, (Times)
Bold, (Times) Italic, (Times) Bold Italic, Constant Width, Constant
Bold, Helvetica, Helvetica Bold, Helvetica Italic, and Special.
Which font is mounted in which position is controlled by the file
.CW DESC\.out
in the device subdirectory of
.CW /usr/lib/font .
See Appendix D for details.
.ix %end fonts, changing
.ix %end [troff] formatter, fonts %key troff formatter, fonts
.Bh "Special Characters"
.ix [troff] formatter, special characters %key troff formatter, special characters
.LP
.page 96
A variety of special characters that are not part of the standard ASCII
character set are supported by
.CW nroff
and
.CW troff .
These include Greek letters, mathematical symbols, and graphic
characters.
Some of these characters are part of the font referred to earlier as the
.I "special font" .
.ix fonts, special
Others are part of the standard typesetter fonts.
.PP
Regardless of the font in which they are contained, special characters
are included in a file by means of special four-character escape
sequences beginning with
.CW \e( .
.PP
Appendix B gives a complete list of special characters.
However, some of the most useful are listed in Table 4-4, because even
as a beginner you may want to include them in your text.
Although
.CW nroff
makes a valiant effort to produce some of these characters, they are
really best suited for
.CW troff .
.ig
	In table 4-4, the following errors in the original
	book were found and corrected.
	The original text has \rg rather than \(rg
	for the registered mark symbol.
	-- Colin Watson
	The original text has \(sq rather than \(sr
	for the square root symbol.
	-- Michael Hobgood
..
.Ts "Special Characters"
.TS
center box tab (#);
lw (1.5i) c c.
\f[R]Name\fP#\f[R]Escape Sequence\fP#Output Character
_
em dash#\e(em#\(em
bullet#\e(bu#\(bu
square#\e(sq#\(sq
baseline rule#\e(ru#\(ru
underrule#\e(ul#\(ul
1/4#\e(14#\(14
1/2#\e(12#\(12
3/4#\e(34#\(34
degrees#\e(de#\(de
dagger#\e(dg#\(dg
double dagger#\e(dd#\(dd
registered mark#\e(rg#\(rg
copyright symbol#\e(co#\(co
section mark#\e(sc#\(sc
square root#\e(sr#\(sr
greater than or equal#\e(>=#\(>=
less than or equal#\e(<=#\(<=
not equal#\e(!=#\(!=
multiply#\e(mu#\(mu
divide#\e(di#\(di
plus or minus#\e(+-#\(+-
right arrow#\e(->#\(->
left arrow#\e(<-#\(<-
up arrow#\e(ua#\(ua
down arrow#\e(da#\(da
.ft P
.TE
.Te
.PP
We'll talk more about some of these special characters as we use them.
Some are used internally by
.CW eqn
for producing mathematical equations.
The use of symbols such as the copyright, registered trademark, and
dagger is fairly obvious.
.page 97
.PP
However, you shouldn't limit yourself to the obvious.
Many of these special characters can be put to innovative use.
For example, the square root symbol can be used to simulate a check
mark, and the square can become an alternate type of bullet.
As we'll show in Chapter 15, you can create additional, effective
character combinations, such as a checkmark in a box, with overstriking.
.PP
The point is to add these symbols to your repertoire, where they can
wait until need and imagination provide a use for them.
.Bh "Type Size Specification"
.ix %begin [troff] formatter, point~size %key troff formatter, point size
.ix %begin point~size
.LP
Typesetting also allows for different overall sizes of characters.
Typesetting character sizes are described by units called
.I points.
A point is approximately 1/72 of an inch.
Typical type sizes range from 6 to 72 points.
A few different sizes follow:
.sp .7v
.SS
.Ps
.ft R
.vs 20
.ps 6
This line is set in 6-point type.
.ps 8
This line is set in 8-point type.
.ps 10
This line is set in 10-point type.
.ps 12
This line is set in 12-point type.
.ps 14
This line is set in 14-point type.
.ps 18
This line is set in 18-point type.
.ps 9
.vs 10
.ft P
.Pe
.sp
.SE
.sp .8v
.LP
.LP
(The exact size of a typeface does not always match its official size
designation.
.ig
	The original book had two periods at the end of the above
	sentence.  Corrected.
	--Michael Hobgood
..
For example, 12-point type is not always 1/6 inch high, nor is 72-point
type 1 inch high.
The precise size will vary with the typeface).
.PP
As with font changes, there are two ways to make size changes: with a
request and with an inline escape sequence.
The
.CW \.ps
request sets the point size.
.ix [.ps] request %key ps request
.ix [troff] formatter, [.ps] request %key troff formatter, [.ps] request
For example:
.Ps
\&.ps 10     \fRSet the point size to 10 points\fP
.Pe
A
.CW \.ps
request that does not specify any point size reverts to the previous
point size setting, whatever it was:
.Ps
\&.ps 10
.sp
\f[I]Some text here\fP
.sp
\&.ps       \fRRevert to the point size before we changed it\fP
.Pe
To switch point size in the middle of the line, use the
.CW \es
escape sequence.
For example, many books reduce the point size when they print the word
\s-2UNIX\s0
in the middle of a line.
The preceding sentence was produced by these input lines:
.page 98
.Ps
For example, many books reduce the point size when
they print the word \es8UNIX\es0 in the middle of a line.
.Pe
As you can probably guess from the example,
.CW \es0
does not mean to use a point size of 0, but to revert to the previous
size.
.PP
In addition, you can use relative values when specifying point sizes.
Knowing that the body of the book is set in 10-point type, we could have
achieved the same result by entering:
.Ps
For example, many books reduce the point size when
they print the word \es-2UNIX\es0 in the middle of a line.
.Pe
You can increment or decrement point sizes only using a single digit;
that is, you can't increment or decrement the size by more than 9
points.
.PP
Only certain sizes may be available on the typesetter.
(Legal point sizes in
.CW otroff
are 6, 7, 8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 24, 28, and 36.
Legal point sizes in
.CW ditroff
depend upon the output device, but there will generally be more sizes
available).
If you request a point size between two legal sizes,
.CW otroff
will round up to the next legal point size;
.CW ditroff
will round to the nearest available size.
.ix %end [troff] formatter, point~size %key troff formatter, point size
.ix %end point~size
.Bh "Vertical Spacing"
.ix [troff] formatter, vertical spacing %key troff formatter, vertical spacing
.ix vertical spacing
.LP
In addition to its ability to change typefaces and type sizes on the
same page, a typesetter allows you to change the amount of vertical
space between lines.
.ix %begin baseline spacing
This spacing is sometimes referred to as the
.I "baseline spacing"
because it is the distance between the base of characters on successive
lines.
(The difference between the point size and the baseline spacing is
referred to as
.I leading ,
.ix leading
from the old days when a human compositor inserted thin strips of lead
between successive lines of type).
.PP
A typewriter or typewriter-style printer usually spaces vertically in
1/6-inch increments (i.e., 6 lines per inch).
A typesetter usually adjusts the space according to the point size.
For example, the type samples shown previously were all set with 20
points of vertical space.
More typically, the vertical space will vary along with the type size,
like this:
.sp .7v
.SS
.Ps
.ft R
.ps 6
.vs 8
This line is set in 6-point type and 8-point spacing.
.ps 8
.vs 10
This line is set in 8-point type and 10-point spacing.
.ps 10
.vs 12
This line is set in 10-point type and 12-point spacing.
.ps 12
.vs 14
This line is set in 12-point type and 14-point spacing.
.ps 14
.vs 16
This line is set in 14-point type and 16-point spacing.
.ps 18
.vs 20
This line is set in 18-point type and 20-poi
.ft P
.ps 9
.vs 10
.Pe
.sp
.SE
.sp .8v
.LP
Typically, the body of a book is set with a single size of type (usually
9 or 10 point, with vertical spacing set to 11 or 12 points,
respectively).
Larger sizes are used occasionally for emphasis, for example, in chapter
or section headings.
When the type size is changed, the vertical spacing needs to be changed
too, or the type will overrun the previous line, as follows, where
14-point type is shown with only 10-point spacing.
.sp
.SS
.Ps
.ps 14
.vs 10
\fRHere is type larger than\fP
\fRthe space allotted for it.\fP
.ps 9
.vs 10
.Pe
.sp
.SE
.sp .8v
.page 99
.PP
Vertical spacing is changed with the
.CW \.vs
request.
.ix %begin [.vs] request %key vs request
.ix %begin [troff] formatter, [.vs] request %key troff formatter, [.vs] request
A vertical space request will typically be paired with a point size
request:
.ix [troff] formatter, [.ps] request %key troff formatter, [.ps] request
.ix [.ps] request %key ps request
.Ps
\&.ps 10
\&.vs 12
.Pe
After you set the vertical spacing with
.CW \.vs ,
this becomes the basis of the
.CW v
unit for
.CW troff .
For example, if you enter
.CW "\.vs 12" ,
the request
.CW \.sp
will space down 12 points; the request:
.Ps
\&.sp 0.5v
.Pe
will space down 6 points, or half the current vertical line spacing.
However, if you change the baseline vertical spacing to 16, the
.CW \.sp
request will space down 16 points.
Spacing specified in any other units will be unaffected.
What all this adds up to is the commonsense observation that a blank
line takes up the same amount of space as one containing text.
.PP
When you use double and triple spacing, it applies a multiplication
factor to the baseline spacing.
The request
.CW "\.ls 2"
will double the baseline spacing.
.ix [.ls] request %key ls request
.ix [troff] formatter, [.ls] request %key troff formatter, [.ls] request
You can specify any multiplication factor you like, though 2 and 3 are
the most reasonable values.
.PP
The
.CW \.ls
request will only affect the spacing between output lines of text.
It does not change the definition of
.CW v
or affect vertical spacing requests.
.ix %end [.vs] request %key vs request
.ix %end [troff] formatter, [.vs] request %key troff formatter, [.vs] request
.ix %end baseline spacing
.Ah "A First Look at Macros"
.ix [troff] formatter, defining macros %key troff formatter, defining macros
.LP
Although we won't go into all the details of macro design until we have
discussed the existing macro packages in the next two chapters, we'll
cover some of the basic concepts here.
This will help you understand what the macro packages are doing and how
they work.
.PP
To define a macro, you use the
.CW \.de
request, followed by the sequence of requests that you want to execute
when the macro is invoked.
.ix [.de] request %key de request
.ix [troff] formatter, [.de] request %key troff formatter, [.de] request
The macro definition is terminated by the request
.CW \.\.
(two dots).
The name to be assigned to the macro is given as an argument to the
.CW \.de
request.
.PP
You should consider defining a macro whenever you find yourself issuing
a repetitive sequence of requests.
If you are not using one of the existing macro packages (which have
already taken care of this kind of thing), paragraphing is a good
example of the kind of formatting that lends itself to macros.
.PP
Although it is certainly adequate to separate paragraphs simply by a
blank line, you might instead want to separate them with a blank line
and a temporary indent.
What's more, to prevent \(lqorphaned\(rq lines, you would like to be
sure that at least two lines of each paragraph appear at the bottom of
the page.
So you might define the following macro:
.page 100
.Ps
\&.de P
\&.sp
\&.ne 2
\&.ti 5n
\&..
.Pe
This is the simplest kind of macro\c
\(em\c
a straightforward sequence of
stored commands.
However, macros can take arguments, take different actions depending on
the presence or absence of various conditions, and do many other
interesting and wonderful things.
.PP
We'll talk more about the enormous range of potential in macros in later
chapters.
For the moment, let's just consider one or two points that you will need
to understand in order to use the existing macro packages.
.Bh "Macro Arguments"
.ix [troff] formatter, macro~arguments %key troff formatter, macro arguments
.LP
Most basic
.CW troff
requests take simple arguments\c
\(em\c
single characters or letters.
Many macros take more complex arguments, such as character strings.
There are a few simple pointers you need to keep in mind through the
discussion of macro packages in the next two chapters.
.PP
First, a space is taken by default as the separator between arguments.
If a single macro argument is a string that contains spaces, you need to
quote the entire string to keep it from being treated as a series of
separate arguments.
.PP
For example, imagine a macro to print the title of a chapter in this
book.
The macro call looks like this:
.Ps
\&.CH 4 "Nroff and Troff"
.Pe
A second point: to skip an argument that you want to ignore, supply a
null string (\c
.CW \(dq\(dq ).
For example:
.Ps
\&.CH ""  "Preface"
.Pe
As you can see, it does no harm to quote a string argument that doesn't
contain spaces (\c
.CW \(dqPreface\(dq ),
and it is probably a good habit to quote all strings.
.Bh "Number Registers"
.ix %begin [troff] formatter, number~registers %key troff formatter, number registers
.ix %begin number~registers
.LP
When you use a specific value in a macro definition, you are limited to
that value when you use the macro. For example, in the paragraph macro
definition shown previously, the space will always be 1, and the indent
always
.CW 5n .
.PP
However,
.CW nroff
and
.CW troff
allow you to save numeric values in special variables known as
.I "number registers" .
If you use the value of a register in a macro definition, the action of
the macro can be changed just by placing a new value in the register.
For example, in
.CW ms ,
the size of the top and bottom margins is not specified with an absolute
value, but with a number register.
.ix number~registers, in~[ms] %key number registers, in~ms
As a result, you don't need to change the macro definition to change
these margins; you simply reset the value of the appropriate number
register.
Just as importantly, the contents of number registers can be used as
.I flags
(a kind of message between macros).
There are conditional statements in the markup language of
.CW nroff
and
.CW troff ,
so that a macro can say: \(lqIf number register
.page 101
.I Y
has the value
.I x ,
then do thus-and-so.
Otherwise, do this.\(rq
For example, in the
.CW mm
macros, hyphenation is turned off by default.
To turn it on, you set the value of a certain number register to 1.
Various macros test the value of this register, and use it as a signal
to re-enable hyphenation.
.ix hyphenation, in [mm] %key hyphenation, in mm
.ix [mm] macros, hyphenation %key mm macros, hyphenation
.PP
To store a value into a number register, use the
.CW \.nr
request.
.ix [.nr] request %key nr request
.ix [troff] formatter, [.nr] request %key troff formatter, [.nr] request
This request takes two arguments: the name of a number register,*
.FS
*Number register names can consist of either one or two characters, just
like macro names.
However, they are distinct\c
\(em\c
that is, a number register and a macro can
be given the same name without conflict.
.FE
and the value to be placed into it.
.PP
For example, in the
.CW ms
macros, the size of the top and bottom margins is stored in the
registers
.CW HM
(\c
.I "header margin" )
and
.CW FM
(\c
.I "footer margin" ).
To reset these margins from their default value of 1 inch to 1.75 inches
(thus producing a shorter page like the one used in this book), all you
would need to do is to issue the requests:
.Ps
\&.nr HM 1.75i
\&.nr FM 1.75i
.Pe
.ix number~registers, setting~from command~line
You can also set number registers with single-character names from the
command line by using the
.CW -r
option.
(The
.CW mm
macros make heavy use of this capability).
For example:
.Ps
$ \f[CB]nroff -mm -rN1\fP \f[I]file\fP
.Pe
will format
.I file
using the
.CW mm
macros, with number register
.CW N
set to the value
.CW 1 .
We will talk more about using number registers later, when we describe
how to write your own macros.
For the moment, all you need to know is how to put new values into
existing registers.
The next two chapters will describe the particular number registers that
you may find useful with the
.CW mm
and
.CW ms
macro packages.
.ix %end [troff] formatter, number~registers %key troff formatter, number registers
.ix %end number~registers
.Bh "Predefined Strings"
.ix strings, in [troff] %key strings, in troff
.LP
The
.CW mm
and
.CW ms
macro packages also make use of some predefined text strings.
The
.CW nroff
and
.CW troff
programs allow you to associate a text string with a one- or
two-character string name.
When the formatter encounters a special escape sequence including the
string name, the complete string is substituted in the output.
.PP
To define a string, use the
.CW \.ds
request.
.ix [.ds] request %key ds request
.ix [troff] formatter, [.ds] request %key troff formatter, [.ds] request
This request takes two arguments, the string name and the string itself.
For example:
.Ps
\&.ds nt Nroff and Troff
.Pe
The string should
.I not
be quoted.
It can optionally begin with a quotation mark, but it should not end
with one, or the concluding quotation mark will appear in the output.
If you want to
.I start
a string with one or more blank spaces, though, you
should begin the definition with a quotation mark.
Even in this case, there is no concluding quotation mark.
As always, the string is terminated by a newline.
.page 102
.PP
You can define a multiline string by hiding the newlines with a
backslash.
.ix strings, multiline
For example:
.Ps
\&.ds LS This is a very long string that goes over \e
more than one line.
.Pe
When the string is interpolated, it will be subject to filling (unless
no-fill mode is in effect) and may not be broken into lines at the same
points as you've specified in the definition.
To interpolate the string in the output, you use one of the following
escape sequences:
.ix strings, interpolating
.Ps
\e*a
\e*(ab
.Pe
where
.I a
is a one-character string name, and
.I ab
is a two-character string name.
.PP
To use the
.I nt
string we defined earlier, you would type:
.Ps
\e*(nt
.Pe
It would be replaced in the output by the words
.I "Nroff and Troff" .
.PP
Strings use the same pool of names as macros.
Defining a string with the same name as an existing macro will make the
macro inoperable, so it is not advisable to go around wildly defining
shorthand strings.
The
.CW vi
editor's abbreviation facility (described in Chapter 7) is a more
effective way to save yourself work typing.
.PP
Strings are useful in macro design in much the same way number registers
are\c
\(em\c
they allow a macro to be defined in a more general way.
For example, consider this book, which prints the title of the chapter
in the header on each odd-numbered page.
The chapter title is not coded into the page top macro.
Instead, a predefined string is interpolated there.
The same macro that describes the format of the chapter title on the
first page of the chapter also defines the string that will appear in
the header.
.PP
In using each of the existing macro packages, you may be asked to define
or interpolate the contents of an existing string.
For the most part, though, string definitions are hidden inside macro
definitions, so you may not run across them.
However, there are a couple of handy predefined strings you may find
yourself using, such as:
.Ps
\e*(DY
.Pe
which always contains the current date in the
.CW ms
macro package.
(The equivalent string in
.CW mm
is
.CW \e*(DT ).
For example, if you wanted a form letter to contain the date that it was
formatted and printed rather than the date it was written, you could
interpolate this string.
.Bh "Just What Is a Macro Package?"
.LP
Before leaving the topic of macros, we ought to take a moment to treat a
subject we have skirted up to this point: just what is a macro package?
.PP
As the name suggests, a macro package is simply a collection of macro
definitions.
The fact that there are command-line options for using the existing
packages may seem to give them a special status, but they are text files
that you can read and modify (assuming that your system has the UNIX
file permissions set up so you can do so).
.page 103
.PP
There is no magic to the options
.CW -ms
and
.CW -mm .
The actual option to
.CW nroff
and
.CW troff
is
.CW -m \c
.I x ,
which tells the program to look in the directory
.CW /usr/lib/tmac
.ix [/usr/lib/tmac] %key /usr/lib/tmac
for a file with a name of the form
.CW tmac\. \c
.I x .
As you might expect, this means that there is a file in that directory
called
.CW tmac\.s
or
.CW tmac\.m
(depending on which package you have on your system).
It also means that you can invoke a macro package of your own from the
command line simply by storing the macro definitions in a file with the
appropriate pathname.
This file will be added to any other files in the formatting run.
This means that if you are using the
.CW ms
macros you could achieve the same result by including the line:
.Ps
\&.so /usr/lib/tmac/tmac.s
.Pe
at the start of each source file, and omitting the command-line switch
.CW -ms .
(The
.CW \.so
request reads another file into the input stream, and when its contents
have been exhausted, returns to the current file.
.ix [.so] request %key so request
.ix [troff] formatter, [.so] request %key troff formatter, [.so] request
Multiple
.CW \.so
requests can be nested, not just to read in macro definitions, but also
to read in additional text files).
.PP
The macros in the standard macro packages are no different (other than
in complexity) than the macros you might write yourself.
In fact, you can print out and study the contents of the existing macro
packages to learn how they work.
We'll be looking in detail at the actions of the existing macro
packages, but for copyright reasons we can't actually show their
internal design.
We'll come back to all this later.
For now, all you need to know is that macros aren't magic\c
\(em\c
just an
assemblage of simple commands working together.
.ix %end [troff] formatter %key troff formatter
