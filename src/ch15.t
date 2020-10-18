.ig
	Typed by: Michael Hobgood
	Marked up by: Michael Hobgood
	Proofed on: 5 Nov 2002
..
.so utp.mac
.utp
.	\" Several of the special effects used in chapter 15
.	\" have been marked up as either macros or strings.
.	\" These are included here at the beginning for easy
.	\" reference.  The naming convention for the macros
.	\" is as follows:
.	\"
.	\"		 ch15@page#@x
.	\"
.	\" where page is the page number in the _original_ book
.	\" and x is the sequence number of example output for
.	\" that page.  Some macros are used in more than one
.	\" place, for instance the macro that draws boxes.
.	\" In this case, the page number will reflect the first
.	\" page the macro is used on, and x will be replaced
.	\" with the word "all". Additionally, a few macros are
.	\" used internally by the ch15 macros, or are general
.	\" in nature, such as the TOPHAT and FRACTION macros.
.	\"
.	\" Start of macro and string definitions for Chapter 15
.	\" Macros are listed fairly much in the order they are
.	\" used.
.	\"
.	\" STRINGS
.ds squashed>> \f[C]>\h'-2p'>\fP
.	\" the combo of groff and gs gives good approximations
.	\" of ligatures. I noticed that even with ligatures off
.	\" the equivalent characters looked the same as
.	\" the ligature approximations.  So, the following
.	\" strings spread the characters out to help see what
.	\" the differences being portrayed are.
.ds EquivChar.fi f\h'1p'i
.ds EquivChar.fl f\h'1p'l
.ds EquivChar.ff f\h'1p'f
.ds EquivChar.ffi f\h'1p'f\h'1p'i
.ds EquivChar.ffl f\h'1p'f\h'1p'l
.	\"
.	\" MACROS
.	\" ch15@start and ch15@end are used in a manner similar
.	\" to the Ps/Pe from the utp.mac set.  They just provide
.	\" an environment where things can be changed without
.	\" worrying about inadvertently messing something else
.	\" up.  Almost all of the special effects are boxed
.	\" in by these two.  The few that aren't just didn't
.	\" like being boxed in, and are therefore, just coded
.	\" in the default environment.
.de ch15@start
.br
.ev ch15
.ll 6i
.po 1i
.in 0
.ps 10
.vs 12
.ft R
.fi
..
.de ch15@end
.br
.fc
.ta T 5n
.ev
..
.de Fraction
.	\" Used in all locations using a fraction
.	\" Original used the special character for 1/2, but
.	\" this looks tacky with other fractions built just
.	\" by using x/y. It takes two arguments, the numerator
.	\" and the denominator of the fraction
\s-4\v'-3p'\\$1\v'3p'\s0/\s-4\h'.5p'\\$2\s0
..
.de TOPHAT
.	\" used to draw the "box corners" around the output.
.	\" I originally had nothing around the output, then
.	\" attempted to use .SS/.SE.  These however, are just
.	\" not conducive to many of the special effects. So
.	\" this little routine is used, and it matches fairly
.	\" close the output O'Reilly used in the original.
.	\" the routine takes one argument, which is the length
.	\" to draw the side bars.  As I've used it, each sidebar
.	\" will extend down 4 points past the last line of the
.	\" output, as measured using gv.
.br
\\L'\\$1p'\\v'-(\\$1p-2.5p)'\\l'1i'\\h'4i'\\l'1i'\\v'-2.5p'\\L'\\$1p'
..
.de ch15@445@1
\f[I]What happens with\fP \f[CW].sp\fP:
.sp 6p
\f[I]Input lines\fP:
.sp 3p
.in 5n
.ft CW
.ps 9
.vs 10
.nf
Especially in troff, it is sometimes uncanny the way that
vertical motions can occur
\&.sp 12p
independently from the output of the text.
.in 0
.ft R
.fi
.ps 10
.vs 12
.sp 3p
\f[I]Output lines\fP:
.TOPHAT 56
.ll 4.4i
.in 5n
.sp 6p
Especially in troff, it is sometimes uncanny the way that
vertical motions can occur
.sp 12p
independently from the output of the text.
.in
.sp 12p
..
.de ch15@445@2
\f[I]What happens with\fP \f[CW]'sp\fP:
.sp 6p
\f[I]Input lines\fP:
.sp 3p
.in 5n
.ft CW
.ps 9
.vs 10
.nf
Especially in troff, it is sometimes uncanny the way that
vertical motions can occur
\&'sp 12p
independently from the output of the text.
.in 0
.ft R
.fi
.ps 10
.vs 12
.sp 3p
\f[I]Output lines\fP:
.TOPHAT 44
.ll 4.4i
.in 5n
.sp 6p
Especially in troff, it is sometimes uncanny the way that
vertical motions can occur
'sp 12p
independently from the output of the text.
.in
.sp 12p
..
.de ch15@445@3
\f[I]What happens with\fP \f[CW]\ev'12p'\fP:
.sp 6p
\f[I]Input lines\fP:
.sp 3p
.in 5n
.ft CW
.ps 9
.vs 10
.nf
Especially in troff, it is sometimes uncanny the way that
vertical motions can occur \\\\v'12p'
independently from the output of the text.
.in 0
.ft R
.fi
.ps 10
.vs 12
.sp 3p
\f[I]Output lines\fP:
.TOPHAT 43
.ll 4.4i
.in 5n
.sp 6p
Especially in troff, it is sometimes uncanny the way that
vertical motions can occur\v'12p'
independently from the output of the text.
.in
.sp 21p
..
.de ch15@447@1
.TOPHAT 20
.sp .5v
.ps 9
.in 5n
Look what happens when \h'-3m'you make a mistake with \eh!
.sp
..
.de ch15@448@1
.br
.TOPHAT 26
.sp
.in 5n
.ps 9
This is a test of absolute horizontal motion\h'|1i'_
.sp
..
.de ch15@448@2
.br
.TOPHAT 26
.sp
.in 5n
.ps 9
This is a test of
absolute horizontal motion\h'|1i'_
.sp
..
.de ch15@450@all
.br
.in +5n
\\$1\l'|0\(ul'\\$2
..
.de ch15@451@allstart
.\"	This is the full macro, used for all boxed
.\"	examples on pages 451, 453, 454.
.\"	Other than adding UTP as a prefix to the number
.\"	registers, and (if memory serves correctly)
.\"	fixing one typo where bI had been written just b,
.\"	this is the same code as described in the text.
.\"	--Michael Hobgood
.sp
.di UTPbX
.nr UTPbC 0
.nr UTPbI 0
.if "\\$1"C" .nr UTPbC 1
.if !"\\$2"" .nr UTPbI \\$2n
..
.de ch15@451@allend
.br
.if !\\n[UTPbI] .nr UTPbI 1n
.di
.nr UTPbW \\n(dlu
.nr UTPbH \\n(dnu
.ne \\n[UTPbH]u+\\n(.Vu
.nr UTPfI \\n(.u
.nf
.ti 0
.nr UTPiN \\n(.iu
.if \\n[UTPbC] .in +(\\n(.lu-\\n[UTPbW]u/2u)
.in +\\n[UTPbI]u
.UTPbX
.in -\\n[UTPbI]u
.nr UTPbW +2*\\n[UTPbI]u
.sp -1
\l'\\n[UTPbW]u\(ul'\L'-\\n[UTPbH]u'\l'|0\(ul'\h'|0'\L'\\n[UTPbH]u'
.if \\n[UTPfI] .fi
.in \\n[UTPiN]u
.sp
..
.de ch15@457@1
.	\" code to produce figure 15-1
.	\" The original code had dimensions of
.	\" 1i -1i for the line. However, that causes the line
.	\" to overlap the previous circle. Dimensions have
.	\" been changed to 1i -.5i to match the original
.	\" output.
.Fs 0
.sp .5i
.in .5i
The circle starts here\D'c 1i'and ends here.
.sp 1i
The line starts here\D'l 1i -.5i'and ends here.
.sp 1i
The ellipse starts here\D'e 2i 1i'and ends here.
.sp 1i
The arc starts here\D'a .5i 0 0 .5i'and ends here.
.sp 1i
The spline starts here
\D'~ .5i -.5i .5i .5i .5i .5i .5i -.5i'and ends here.
.sp .5i
.in 0
.Fe "Some Simple Figures"
..
.de ch15@458@1
.	\" the rs is needed just in case something pushes this
.	\" call to the top of a page.  Without, your box will
.	\" be drawn off the top of the page.  Currently,
.	\" the box is at the bottom of the page, so we are fine.
.rs
.sp 2.5i
\v'-.25i'\c
\D'a .25i 0 0 .25i'\c
\D'l 3i 0'\c
\D'a 0 -.25i .25i 0'\c
\D'l 0 -2i'\c
\D'a -.25i 0 0 -.25i'\c
\D'l -3i 0'\c
\D'a 0 .25i -.25i 0'\c
\D'l 0 2i'\c
\v'.25i'
..
.de ch15@462@1
.sp .5v
.ft C
.ps 9
.vs 10
.in +5n
.ll 4.5i
Two columns are useful when you have a linear list
of information that you want to put side-by-side,
but don't want to bother rearranging with the
cut-and-paste programs.
.sp .5v
.ll 2.5i
.nf
.mk
Item 1
Item 2
Item 3
.ll 5i
.in 2.75i
.rt
Item 4
Item 5
.sp 1.5v
..
.de ch15@463@1
.ft B
.TOPHAT 25
.sp 1v
.ce
Table \\$1: \\$2
.sp 3v
..
.de ch15@464@1
.ft B
.TOPHAT 25
.sp 1v
.bd I 500	\"set to 500 for the Postscript output
.bd S B 500	\" since units are 72000, not 720
.ce
Table \\$1: \\$2
.bd I
.bd S
.sp 3v
..
.de ch15@465@1
.	\" This is needed because the sequence \0'\(sq\(sr'
.	\" actually works on groff to produce the correct
.	\" output. This makes the square root symbol be to
.	\" low in the box, to match the original.
.br
.in +5n
\\z\\(sq\\v'4p'\\(sr\\v'-4p'
.br
..
.de ch15@467@1
.br
.	\" What happens, is that Clever Trick will be printed
.	\" up into the header portion if this macro is called
.	\" at the topmost portions of a page.  Manually putting
.	\" in spacing requests solves this, but should someone
.	\" change the formatting, the manual tweaks would no
.	\" longer be correct. Now, experimentation here indicates
.	\" that this _is_ working.  If UTPSL is called when on
.	\" the first, second or third line of a page, the
.	\" spacing request is getting executed, while if it
.	\" occurs on line four or greater, it isn' (and doesn't
.	\" need to be executed). YMMV
.nr FLAG 0
.if \\n(nl<116000u \{\
.rs
.nr FLAG 1
.sp 3v \}
.mk
.ft B
.cs B 24
.po -.25i
.lt +.5i
.tr `
.	\" original will not work without this. the space put
.	\" in the "Clever Trick" will not be output, and an
.	\" error message of 'normal or special character
.	\" expected (got a space)' will be received.
.	\" with this, and a single backquote ( ` ) in the input
.	\" the error message goes away and the space is
.	\" included in the output.
.	\" Other than this fix, this is the same code as
.	\" described in the text.
.	\" Since this macro places "Clever Trick" in either the
.	\" left or right margin depending on whether if falls on
.	\" an odd or even page, if you change something prior to
.	\" calling this, it might shift sides on you.
.if e .tl '\b:\\$1:'''
.if o .tl '''\b:\\$1:'
.lt -.5i
.po +.25i
.cs B
.rt
.tr ` `
.if \\n[FLAG]=1 \{\
.sp -3v \}
..
.de ch15@468@1
.TOPHAT 49
.sp 1v
.in +5n
.nf
Getting Started\h'4.5i'1-1
\0\0\0\0\0\0\0\0Turning On the Power1-2
\0\0\0\0\0\0\0\0Inserting Diskettes\01-3
.fi
.sp 2v
..
.de ch15@468@2
.nf
.ta 1i 2.5i 3.5i
.TOPHAT 26
.sp 1v
	FirstSecondThird
.sp 1.5v
..
.de ch15@469@1
.nf
.ta 1i 3iR
.TOPHAT 37
.sp 1v
.lc _
.in 5n
Signature:	
Date:	
.sp 1.5v
..
.de ch15@470@1
.nf
.ta 1i 3i
.TOPHAT 37
.sp 1v
.fc #
	#Hi there#
	#Hi how are you#
.sp 1.5v
..
.de ch15@470@2
.ne 5
.nf
.ta 1i 3i
.TOPHAT 25
.sp 1v
.fc #^
	#Hi^how are^you#
.fc
.sp 1.5v
..
.de ch15@470@3
.nf
.ta .5i 2i 2.5i 4i
.TOPHAT 42
.sp 1v
.fc #^
.lc _
		
.sp .5
	#^Signature^#	#^Date^#
.sp 1.5v
..
.de ch15@471@1
.TOPHAT 30
.in +5n
.nf
.ft CB
.sp .5v
.cs CB 21
Space the bold font at 21/26 of an em.
.cs CB 21 12
Space the bold font at 21/36 of a 12-point em.
.cs CB
.sp .5v
.in 0
..
.de ch15@472@1
.ne 9
.rs
.sp .5i
.ft B
.in 1i
.mk
\b'Variable'
.in 3i
.rt
.cs B 24
\b'Constant'
.br
.cs B
.sp .5i
..
.de ch15@475@1
.br
.TOPHAT 25
.sp 1v
.ti 5n
TROff
.sp 1.5v
..
.page 443
.Se 15 "Figures and Special Effects" "Chapter" 1
.ix %begin escape sequences, in~[troff] %key escape sequences, in troff
.LP
This chapter discusses a variety of formatter requests that
you can use to draw figures and achieve special effects
like overstriking and vertically stacked text.
It also dissects some of the most complex macros we've seen
so far, so it should advance your knowledge of how to write
macros as well as your knowledge of its explicit subject
matter.
.Ah "Formatter Escape Sequences"
Preprocessors like
.CW tbl
and
.CW pic
draw boxes, lines, and simple figures using an underlying
library of formatter escape sequences that you can also
use directly.
The
.CW eqn
preprocessor also uses many of these escape sequences, as
well as others that are more appropriate for creating
special effects with text characters.
.PP
The escape sequences are listed in Table 15-1.
As you can see, there are quite a few!
Fortunately, many of these need not be learned by the
average user.
The various preprocessors often allow a user to achieve the
same effect more easily.
Although
.CW tbl
or
.CW eqn
might seem difficult to learn, they are far simpler than
the formatter commands they replace.
For example, an
.CW eqn
construct like
.CW "%10 sup 5%"
is easier to learn and type than an equivalent
.CW troff
construct like:
.Ps
10\\s-3\\v'-3p'5\\v'3p'\\s0
.Pe
When it comes to drawing lines and figures, things get
even more complex.
.PP
For this reason, many of the escape sequences we are about
to discuss are not often used by the average person
trying to achieve special effects.
However, they are extremely useful to a developer
of macros.
.PP
In this chapter, we'll cover the sequences for local
vertical and horizontal motions and line drawing,
because these requests are most commonly used in macros.
In addition, we will show several large macros that do
line drawing in order to demonstrate both the use of
escape sequences and techniques for writing complex
macros.
.page 444
.KF
.Ts "Formatter Escape Sequences"
.ix [troff] formatter, escape~sequences %key troff formatter, escape sequences
.TS
expand box;
c c
lf(CW) lw(3.5i).
Escape	Description
_
T{
\\v'\f[I]distance\fP'
T}	T{
Move \f[I]distance\fP vertically down the page.
Precede \f[I]distance\fP with a minus sign to
move back up the page.
T}
T{
\\h\fP'\f[I]distance\fP'
T}	T{
Move \f[I]distance\fP horizontally to the
right. Precede \f[I]distance\fP with a minus
sign to move back to the left.
T}
.sp 1v
T{
\\u
T}	T{
Move
.Fraction 1 2
em up (\^\c
.Fraction 1 2
line in \f[C]nroff\fP).
T}
T{
\\d
T}	T{
Move
.Fraction 1 2
em down (\^\c
.Fraction 1 2
line in \f[C]nroff\fP).
T}
T{
\\r
T}	T{
Move 1 em up (1 line in \f[C]nroff\fP).
T}
T{
\\c
T}	T{
Join next line to current output line,
even across a break.
T}
T{
\\p
T}	T{
Cause a break, and adjust current
partial output line.
T}
.sp 1v
T{
\\x'\f[I]distance\fP'
T}	T{
Add extra line space for oversize
characters.
T}
.sp 1v
T{
\\(\f[R]space\fP)
T}	T{
Move right one space (distance
determined by \f[C].ss\fP).
T}
T{
\\0
T}	T{
Move right the width of a digit in the
current font and size.
T}
T{
\\|
T}	T{
Move right
.Fraction 1 6
em (ignored in \f[C]nroff\fP).
T}
T{
\\^
T}	T{
Move right
.Fraction 1 12
em (ignored in \f[C]nroff\fP).
T}
.sp 1v
T{
\\w'\f[I]string\fP'
T}	T{
Interpolate width of \f[I]string\fP.
T}
T{
\\k\f[I]x\fP
T}	T{
Mark current horizontal place in
register \f[I]x\fP.
T}
.sp 1v
T{
\\o'\f[I]xy\fP'
T}	T{
Overstrike characters \f[I]x\fP and \f[I]y\fP.
T}
T{
\\z\f[I]c\fP
T}	T{
Output character \f[I]c\fP without spacing
over it.
T}
T{
\\b'\f[I]string\fP'
T}	T{
Pile up characters vertically (used
to construct large brackets, hence
its name).
T}
.sp 1v
T{
\\l'\f[I]Nc\fP'
T}	T{
Draw a horizontal line consisting of
repeated character \f[I]c\fP for distance \f[I]N\fP.
If \f[I]c\fP isn't specified, use _.
T}
T{
\\L'\f[I]Nc\fP'
T}	T{
Draw a vertical line consisting of
repeated character \f[I]c\fP for distance \f[I]N\fP.
If \f[I]c\fP isn't specified, use |.
T}
.sp 1v
T{
\\D'l \f[I]x,y\fP'
T}	T{
Draw a line from the current position
to coordinates \f[I]x,y\fP (\f[C]ditroff\fP only).
T}
T{
\\D'c \f[I]d\fP'
T}	T{
Draw a circle of diameter \f[I]d\fP with left
edge at current position (\f[C]ditroff\fP only).
T}
T{
\\D'e \f[I]d1 d2\fP'
T}	T{
Draw an ellipse with horizontal
diameter \f[I]d1\fP and vertical diameter \f[I]d2\fP,
with the left edge at the current
position (\f[C]ditroff\fP only).
T}
T{
\\D'a \f[I]x1 y1 x2 y2\fP'
T}	T{
Draw an arc counterclockwise from
current position, with center at \f[I]x1,y1\fP
and endpoint at \f[I]x1+x2,y1+y2\fP (\f[C]ditroff\fP
only).
T}
T{
\\D'\(ap \f[I]x1 y1 x2 y2\fP...'
T}	T{
Draw a spline from current position
through the specified coordinates
(\f[C]ditroff\fP only).
T}
.sp 1v
T{
\\H'\f[I]n\fP'
T}	T{
Set character height to \f[I]n\fP points,
without changing the width (\f[C]ditroff\fP
only).
T}
T{
\\S'\f[I]n\fP'
T}	T{
Slant output \f[I]n\fP degrees to the right.
Negative values slant to the left. A
value of zero turns off slanting
(\f[C]ditroff\fP only).
T}
.TE
.Te
.KE
.page 445
.PP
Many of the escape sequences in Table 15-1 take arguments
that must be delimited from any following text.
The delimiter character is most often
.CW '
or \f[CW]^\fP\f[I]G\fP
.I CTRL-G  ), (
but it can be any character.
The first character following the escape sequence will be
taken as the delimiter, and the argument list will be
terminated when that same character is encountered a
second time.
.ix %end escape sequences, in~[troff] %key escape sequences, in troff
.Ah "Local Vertical Motions"
.ix [troff] formatter, local vertical~motions %key troff formatter, local vertical motions
.ix local vertical~motions
There are a number of escape sequences for
.I local
vertical motions. They are so called because they take
place within a line, without causing a break or otherwise
interrupting the filling and justification process.
.PP
However, this is not to say that the motions they cause
are limited.
For example, you can use
.CW \ev  ,
the vertical motion escape sequence to move anywhere on
the page, just as you can with the
.CW .sp
request.
However, the remainder of the line that has
been collected in the formatter's internal buffers will
be output in the new location just as if the motion had
never taken place.
.PP
To make this point clearer, let's look at three examples
of input text that use different types of vertical motion.
.LP
.ig
	In all three of the following examples the original
	O'Reilly text had the word troff in
	CW font on the output.  However, the input did not show
	this word being set in a font different from the rest of
	the example output.  Therefore, I have left troff in
	Roman font.
	--Michael Hobgood
..
.KS
.ch15@start
.ch15@445@1
.ch15@end
.KE
.KS
.ch15@start
.ch15@445@2
.ch15@end
.KE
.KS
.ch15@start
.ch15@445@3
.ch15@end
.KE
.LP
As you can see,
.CW .sp
causes a break as well as a downward
movement on the page.
The partially collected line is output before the movement
takes place.
With
.CW \&'sp  ,
the line currently being collected is completely
filled and output before the spacing takes place.
With
.CW \ev  ,
the motion is completely independent of the
process of filling and justification.
.PP
It is also independent of traps, as we discovered once when
trying to put a pointing finger
(\(rh)
at the bottom of a
page to indicate that the subject was continued on the
overleaf.
We used a macro invoked by the page bottom trap to print
the finger.
At first, we made the mistake of using
.CW ".sp -1"
to move back
up the page to place the finger.
Unfortunately, this put
.CW troff
into an endless loop around the trap position.
The
.CW \ev
escape sequence, on the other hand, did the trick
nicely.
Since it does not change the current baseline spacing,
it will not trigger a trap.
.PP
Long-winded examples aside, that is why
.CW \ev
is considered
a local motion.
In general,
.CW \ev
escape sequences are used in pairs to go
away from, and then back to, the current vertical
position.
.PP
.ix [troff] formatter, superscripts %key troff formatter, superscripts
.ix superscripts
A superscript is a good example of vertical motion
using
.CW \ev  .
For example, you could create a simple superscript macro
like this:
.ne 3
.Ps
\&.de SU
\\\\$1\\s-2\\v'-3p'\\\\$2\\v'3p'\\s0\\\\$3
\&..
.Pe
This macro
.RS
.Ls B
.Li
prints its first argument;
.Li
reduces the point size;
.Li
makes a 3-point reverse vertical motion;
.page 447
.Li
prints the second argument;
.Li
makes a 3-point vertical motion to return to the original baseline;
.Li
restores the original size;
.Li
prints an optional third argument immediately following.
(This allows punctuation to be introduced immediately
following the superscript, rather than on the next line.
If no third argument is supplied, this argument
interpolation will be ignored).
.Le
.RE
This macro could also be implemented using the
.CW \eu
.I up ) (
and
.CW \ed
.I down ) (
escape sequences,
which use a fixed
.Fraction 1 2
\h'-3p'-em distance.
If you did this\(emor if you specified the distance for the
.CW \ev
escape sequence in a relative unit like ems, instead of a
fixed unit like points\(emit would be essential to have both
of the vertical motions either inside or outside the font
size change.
For example, assuming that the current font size was 10
points:
.Ps
\&.de SU
\\\\$1\\u\\s-2\\\\$2\\d\\s0\\\\$3
\&..
.Pe
would produce an unbalanced effect, because the upward
motion would be 5 points (\^\c
.Fraction 1 2
em at 10 points), while the
downward motion would be only 4 points (\^\c
.Fraction 1 2
em at 8
points).
This caution holds true whenever you mix font and size
changes with local motions.
.Ah "Local Horizontal Motions"
.ix [troff] formatter, local horizontal~motions %key troff formatter, local horizontal motions
.ix local horizontal~motions
Much of what has been said about local vertical motions is
true for local horizontal motions.
They take place independently of the process of filling
and justification and so, if improperly used, can result
in horrors like:
.ch15@start
.ch15@447@1
.ch15@end
which was produced by the line:
.Ps
Look what happens when \\h'-3m'you make a mistake with \\h!
.Pe
Horizontal motions are not as likely to take place in pairs
as vertical motions.
For example, there are cases where you want to close up the
space between two special characters, or open up additional
space on a line. For example,
\*[squashed>>]
produced by
.CW >\eh'-1p'>\fP
looks better than
.CW >>  .
.PP
In addition to
.CW \eh  ,
there are a number of escape sequences
that affect horizontal motion in specific ways.
.PP
For example,
.CW \e\0 \(rq \(lq
(it's quoted so you can see the blank
space following the backslash) will space over to the
right by
.I exactly
one space.
That sounds trivial, but it isn't.
When it justifies a line,
.CW troff
feels free to expand the spaces between words.
(The default space size is normally
.Fraction 12 36
of an em, but
can be reset with the
.CW \&.ss
.page 448
request using units of 36ths of an em).
The
.CW \e\0 \(rq \(lq
escape
sequence makes sure that you get exactly one space.
This is generally thought of as the unpaddable space
character and is used when you want to keep two words
together.
However, it can also be used simply as a horizontal motion
sequence.
.PP
Another useful sequence is
.CW \e0  .
It provides exactly the width
of a digit in the current font and size.
(Unlike alphabetic characters, all digits are always the
same width on the standard fonts, to allow them to line
up properly in numeric displays).
The
.CW \e0
sequence is most useful when you want to line up
spaces and digits manually.
.PP
The two escape sequences
.CW \e|
and
.CW \e^  ,
which give,
respectively, a
.Fraction 1 6
em and
.Fraction 1 12
em space, are useful when
you want to create just a little bit of fixed space
between two characters.
(The normal space size created by an actual space character
is
.Fraction 1 3
em, so these two characters give you, respectively,
one-half and one-quarter of the normal interword spacing).
You may remember that we used
.CW \e^
in Chapter 12 to create
a little bit of space before and after the em dashes we
were introducing into our files with
.CW sed .
.Ah "Absolute Motions"
.ix [troff] formatter, absolute motions %key troff formatter, absolute motions
.ix absolute motions
As you've probably gathered from the preceding discussion,
you can specify the distance for a horizontal or vertical
motion using any of the units discussed in Chapter 4.
The values can be given explicitly, or by interpolating
the value of a number register.
In addition, as discussed in Chapter 4, you can use a
vertical bar
.CW | )  (
to indicate absolute motion relative
to the top of the page or the left margin.
.PP
This is not as simple as it first appears.
For vertical motions, you pretty much get what you expect.
For example,
.CW "\&.sp |2i" ,
.CW \ev'|2i'
will move you to a position 2 inches from the top of the
page.
Depending on where you are on the page before you
issue the command, the generated motion will be either
positive or negative.
.PP
For horizontal motions, things are a little more ambiguous.
The absolute position indicator doesn't move you to an
absolute position based on the output line, but on the
.I input
line.
For example:
.Ps
This is a test of absolute horizontal motion\\h'|1i'_
.Pe
produces:
.ch15@start
.ch15@448@1
.ch15@end
But:
.Ps
This is a test of
absolute horizontal motion\\h'|1i'_
.Pe
produces:
.ch15@start
.ch15@448@2
.ch15@end
.page 449
.PP
What is really supplied as an argument to
.CW \eh
when you use
the absolute position indicator is the
.I distance
from the current position on the input line to the
specified position.
Even though it looks the same, the argument will have a
different value, depending on the length of the input
line.
And again, as with vertical motions, the actual movement
may be positive (to the right) or negative (to the left),
depending on the relationship between the current position
and the absolute position specified.
.PP
It may appear odd to have these motions relative to the input
line.
However, as we will see (especially in line drawing),
there is a method to the madness.
.Ah "Line Drawing"
.ix %begin [troff] formatter, drawing %key troff formatter, drawing
.ix [troff] formatter, line~drawing %key troff formatter, line drawing
.ix drawing, lines
Now we come to the fun part.
Moving around on the page is of little use unless you
plan to write something at the point you've moved to.
Superscripts, subscripts, and overprinting provide some
application of local motion, but local motions are most
useful with the escape sequences for drawing lines
and curves.
.PP
Applications range from underlining words in
.CW troff  ,
to boxing single words (if you are writing computer
manuals, this is very useful for showing the names of
keys to be pressed), to drawing boxes around whole blocks
of text, just like
.CW tbl
does.
.PP
The
.CW \el
sequence draws a horizontal line;
.CW \eL
draws a vertical line.
Both escape sequences take two arguments, the second of
which is optional.
Both arguments should be enclosed together in a single
pair of delimiters.
.PP
The first argument is the distance to draw the line.
A positive value means to draw a horizontal line to the
right, or a vertical line downward (depending on whether
.CW \el
or
.CW \eL
is used).
A negative value means to draw a line back to the left,
or back up the page.
.PP
When you draw a line back to the left, either by explicitly
specifying a negative value, or by specifying an
absolute value (such as
.CW |0  )
that results in a negative
movement,
.CW troff
first moves back to the specified position,
then draws the line from left to right.
It is as if the line is drawn
.I from
the specified distance
to the current position.
.PP
For example:
.RS
.TS
tab (#);
lf(CW)w (.5i) l.
\\l'3i'#draws a line 3 inches to the right
\\l'-3i'#draws a line from a position 3 inches to the left
\\L'3i'#draws a line 3 inches down
\\L'-3i'#draws a line 3 inches up
\\L'|3i'#draws a line to a position 3 inches from the top of the page
.TE
.RE
The optional second argument is the character with which
to draw the line.
By default, a horizontal line is drawn with the baseline
rule\(ema horizontal line that is aligned with
the bottom of the other characters on a line.
.ix %begin [troff] formatter, underlining %key troff formatter, underlining
.ix %begin underlining, in~[troff] %key underlining, in troff
However, if you want to underline text, be sure to use
the underscore, which is printed in the space allotted
for characters that descend below the line:
.KF
.Ps
These\(ruwords\(ruare\(ruseparated\(ruby\(rubaseline\(rurules.
These\(ulwords\(ulare\(ulseparated\(ulby\(ulunderscores.
.Pe
.KE
.LP
The underscore is usually generated by the underscore
character that appears above the hyphen on most keyboards.
However, to be on the safe side, you should refer to it by
.page 450
its special character name in
.CW troff\(em\e(ul .
(The baseline rule can be specified with the
sequence
.CW \e(ru ).
.ix %end [troff] formatter, underlining %key troff formatter, underlining
.ix %end underlining, in~[troff] %key underlining, in troff
.PP
Vertical lines are drawn by default with a character
called the box rule (which can be generated by the
.CW \e(br
escape sequence or the vertical bar character on most
keyboards).
The box rule is a zero-width character\(emthat is, when
.CW troff
draws the box rule, it does not space over as it does with
other characters.
This allows
.CW troff
to form exact corners with horizontal lines drawn with
underrules.
However, as you will see, it may therefore require you to
manually specify additional space to keep it from
crowding previous or succeeding characters.
.PP
Except in the case where you draw a line to the left, as
described previously, the current position at which text
output will continue is changed to the endpoint of the
line.
In drawing a box, you will naturally find yourself
returning to the starting point.
However, if you are drawing a single line, you may need
to use
.CW \ev
or
.CW \eh
to adjust
the position either before or after the line is drawn.
.PP
Let's look at a couple of examples.
A simple macro to underline a word in
.CW troff
might look like this:
.Ps
\&.de UL
\\\\$1\\l'|0\\(ul'\\\\$2
\&..
.Pe
This example prints its argument, backs up a distance
equal to the length of the argument
.I "on the input line"  ,
then draws a line from that point to the current position.
The optional second argument allows you to specify
punctuation without separating it with the space that is
required if it were entered on the next input line.
(This reverse motion is implicit in the negative value
generated by the absolute position request
.CW |0
\(emthat is,
the distance from the end of the word to the beginning
of the line.
Lines drawn with
.CW \el
and a negative distance generate a
negative horizontal motion for the specified distance.
The line is then drawn in a positive direction back to
the current position).
.PP
That is:
.Ps
\&.UL Hello ,
.Pe
produces:
.ch15@start
.ch15@450@all Hello ,
.ch15@end
and:
.Ps
\&.UL Hello
,
.Pe
produces:
.ch15@start
.ch15@450@all Hello
,
.ch15@end
.LP
(In
.CW nroff  ,
you can underline simply by using an italic
font switch, or the
.CW \&.ul
request, because italics
are represented in
.CW nroff
by underlines).
.page 451
.PP
A macro to enclose a word (like the name of a key) in a box
might look like this:
.Ps
\&.de BX
\\(br\\|\\\\$1\\|\\(br\\l'|0\\(rn'\\l'|0\\(ul'\\^\\\\$2
\&..
.Pe
For example, the input text:
.Ps
Press the
\&.BX RETURN
key.
.Pe
will produce the line:
.LP
.ch15@start
.in 5n
Press the
\(br\|RETURN\|\(br\l'|0\(rn'\l'|0\(ul'\^
key.
.ch15@end
.LP
This macro prints a single box rule
.CW \e(br  ), (
spaces over
.Fraction 1 6
em
.CW \e|  ), (
prints the argument, spaces over another
.Fraction 1 6
em
space, and prints a concluding box rule.
Then it draws two lines back to 0 (the beginning of the
input line\(emthat is, the width of the argument
plus the two requested
.Fraction 1 6
\h'-2p'-em spaces).
.PP
The first horizontal line is drawn not with
.CW \e(ul
but with
another special character, the
.I "root en"
.CW \ern  ). (
This character is used when drawing equations to produce the
top bar in a square root symbol, but it is just as useful
when you want to draw a line over the top of some text without
moving back up the page.
The second horizontal line is drawn, as usual, with
.CW \e(ul  .
.PP
Both lines can be drawn back to zero without compensating
horizontal motions because, as we have already noted,
horizontal lines drawn backwards actually generate a reverse
horizontal motion followed by a line drawn back to the
current position.
.PP
The macro concludes with an additional
.Fraction 1 12
\h'-4p'-em space
.CW \e^  ) (
and
an optional second argument, designed to allow you to specify
punctuation following the box.
.ch15@start
.ch15@451@allstart
.ti 5n
.ix drawing, boxes
A macro to box multiple lines of text (like this paragraph)
is more complex.
It requires the use of a diversion to capture the text to be
boxed.
.ix [troff] formatter, diversions %key troff formatter, diversions
.ix diversions
The diversion can then be measured, and the lines drawn to
fit.
And when you are using diversions, you need two macros,
one to start the diversion, and one to finish it, as in the
following macros:
.ch15@451@allend
.ch15@end
.Ps
\&.de BS			\\" Box Start
\&.br			\\" Space down one line; cause break
\&.di bX			\\" Start diverting input to macro bX
.ix [.di] request %key di request
.ix [troff] formatter, [.di] request %key troff formatter, [.di] request
\&..		
\&.de BE			\\" Box End
\&.br			\\" Ensure partial line is in bX
\&.nr bI 1n		\\" Set "box indent"--space between
\&.			\\" box and text
\&.di			\\" End diversion
\&.nr bW \\\\n(dlu	\\" Set "box width" to diversion width
\&.nr bH \\\\n(dnu	\\" Set "box height" to diversion height
\&.ne \\\\n(bHu+\\\\n(.Vu	\\" Make sure bH plus one line is
\&.			\\" left on page
.page 452
\&.nr fI \\\\n(.u		\\" Set fI to 1 if text is filled
\&.nf			\\" Specify no-fill before printing bX
\&.ti 0		
\&.in +\\\\n(bIu		\\" Add "box indent" to any other indent
\&.bX			\\" Output the text stored in macro bX
\&.in -\\\\n(bIu		\\" Subtract bI to restore prev indent
.	\"Note: fixed typo in next line, it had \\n(b
\&.nr bW +2*\\\\n(bI	\\" Add 2x "box indent" to "box width"
\&.sp -1			\\" Compensate for baseline spacing
\&\\l'\\\\n(bWu\\(ul'\\L'-\\\\n(bHu'\\l'|0\\(ul'\\h'|0'\\L'\\\\n(bHu'
\&.			\\" Draw box
.ne 2
\&.if \\\\n(fI .fi	\\" Restore fill if prev text was filled
\&.sp			\\" Space down 1 line after box is drawn
\&..
.Pe
.PP
There are a number of interesting things about these macros.
First, they provide a good illustration of the use of diversions.
Note that the macro causes a break (with either
.CW .br
or
.CW .sp  )
before the diversion is started and before it is terminated.
Note also how the predefined read-only registers
.CW dn
and
.CW dl
are used to measure the height and width of the diversion
and therefore set the dimensions of the box.
(The contents of these registers are not used directly when
the lines are drawn because the registers are read-only,
and the width needs to be adjusted to account for a small
amount of spacing between the box rule and the text
contained in the box).
.PP
Second, because these macros are complex, they use quite a few
number registers.
We want to use register names that are mnemonic, but not use
up names that might be useful for user-level macros.
We get around this problem by using names that combine
lowercase and uppercase letters.
This is entirely a matter of convention, but one that we
find preferable to
.CW mm  's
use of completely obscure internal
register names like
.CW ;p  .
.PP
Third, there is the actual line drawing\(emthe
point of this presentation.
Let's look at this aspect of these macros in detail.
.PP
As we've discussed,
.CW bH
and
.CW bW
have been set to the height
and width, respectively, of the diversion.
Because the box rule is a zero-width character, however, the
macro needs to allow a small amount of space between the
sides of the box and the text it encloses.
It does this by specifying a 1-en indent (which is added to
any existing indent, in case the box occurs in a block of
text that is already indented).
When the diversion is output, it will thus be indented 1 en.
.PP
After the diversion is output, the indent is reset to its
previous value.
However, twice the value of the indent is added to the box
width.
The box will thus be drawn 2 ens wider than the text it
encloses.
The text will start in 1 en; the right side of the box
will be drawn 1 en beyond the right margin.
.PP
The actual line to draw the box:
.ig
	The original text had number registers bW and bH
	written as BW and BH, which is wrong. Fixed.
	--Michael Hobgood
..
.Ps
\\l'\\\\n(bWu\\(ul'\\L'-\\\\n(bHu'\\l'|0\\(ul'\\h|0'\\L'\\\\n(bHu'
.Pe
draws a horizontal line using
.CW \e(ul
from the left margin to
the distance specified by
.CW bW
.I "box width"  ), (
which, as we have
seen, now includes a small extra margin.
It then draws a line back up the page to the height specified
by
.CW bH  ,
and back across the page to the left margin again.
.page 453
.PP
At this point, even though we have drawn the bottom, right,
and top sides of the box, we are still at the top right corner
of the box.
The macro needs to move horizontally back to the left margin,
because horizontal lines to the left are actually drawn
.I from
the left, and leave the current position the same as it was
before the line was drawn.
In this case we actually want to move to the left as well.
Therefore, we must do so explicitly, by following the
.CW \el'|0\e(ul'
request with a
.CW \eh'|0'  .
Finally, the box is closed by drawing a vertical line
back down the left side.
.PP
The current position is now at the start of the last line of
the contents of the box, so the macro issues an
.CW .sp
request to move down one line.
Alternatively, you could write this macro in such a way that
it leaves no additional space above and below the box,
but lets the user leave space by issuing some kind of
spacing or paragraph request.
.PP
By default, the box is drawn just long enough to surround
the text it contains.
(The number register
.CW dl  ,
which is used to set the box width,
contains the width of the text in the diversion).
For short lines in no-fill mode, the box will also be shorter:
.ch15@start
.nf
.ch15@451@allstart
Here are some short lines of text in no-fill mode.
Let's see how they come out.
.ch15@451@allend
.ch15@end
This raises the idea that it might be nice to center a box
that is shorter.
A more complete set of box macros will do this, as well as
let the user change the default box indent (the distance
between the text and the edge of the box):
.br
.ne 3
.Ps
\&.de BS				\\" Box Start
\&.sp	
\&.di bX
\&.nr bC 0			\\" Clear centering flag
\&.nr bI 0			\\" Clear box indent
\&.if "\\\\$1"C" .nr bC 1	\\" Set flag if user wants centered
\&.if !"\\\\$2"" .nr bI \\\\$2n	\\" Set box indent if specified
\&..
\&.de BE				\\" Box End
\&.br
\&.if !\\\\n(bI .nr bI 1n	\\" Set bI if not already set
\&.di
\&.nr bW \\\\n(dlu
\&.nr bH \\\\n(dnu
\&.ne \\\\n(bHu+\\\\n(.Vu
\&.nr fI \\\\n(.u
\&.nf
\&.ti 0
\&.nr iN \\\\n(.iu		\\" Save current indent
\&.if \\\\n(bC .in +(\\\\n(.lu-\\\\n(bWu)/2u
\&.				\\" If centering, adjust indent
\&.in +\\\\n(bIu
\&.bX
\&.in -\\\\n(bIu
\&.nr bW +2*\\\\n(bIu
.page 454
\&.sp -1
\&\\l'\\\\n(bWu\\(ul'\\L'-\\\\n(bHu'\\l'|0\\(ul'\\h|0'\\L'\\\\n(bHu'
\&.if \\\\n(fI .fi
\&.in \\\\n(iNu			\\" Restore original indent
\&.sp
\&..
.Pe
Using the full macro, and specifying
.CW ".BS C 5n"  ,
the box now looks like this:
.ch15@start
.ch15@451@allstart C 5n
.nf
Here are some short lines of text in no-fill mode.
Let's see how they come out with \f[C].BS C 5n\fP.
.fi
.ch15@451@allend
.ch15@end
.ig
	The next two paragraphs accurately describe how
	the above macro works, but the number register
	names are wrong.  If the following substitutions
	are made, the description below is correct.
	B1 is actually BS
	B2 is actually BE
	nr BC is actually bC
	nr BQ is actually fI
	I'm not going to go through and correct all of these.
	--Michael Hobgood

	I did. --LK
..
These macros also provide insight into how to use number
registers.
For example,
.CW BS
takes
.CW C
as a possible argument to indicate
that the box should be centered.
Because the
.CW BE
macro controls the output, there must be some
way to communicate the user request for centering between
.CW BS
and
.CW BE  .
The
.CW BS
macro sets number register
.CW bC
to 1 as a signal, or flag, to
.CW BE
to do the centering.
(Note that
.CW bC
is first zeroed, to make sure that centering
is not propagated into the current environment from a
previous invocation of the box macros).
.PP
Likewise,
.CW fI
is set as a flag to indicate whether justification
is enabled.
The box is drawn in no-fill mode, but the macro must reset
filling if it was previously enabled.
The read-only number register
.CW .u
is nonzero if filling is
in effect, so the lines:
.br
.ne 3
.Ps
\&.nr fI \\\\n(.u
\&	.
\&	.
\&	.
\&.if \\\\n(fI .fi
.Pe
will execute the
.CW .fi
request only if justification was
previously in effect.
.Bh "Changing Line Weight"
.ix [troff] formatter, line~weight %key troff formatter, line weight
.ix drawing, changing line~weight
You may occasionally want to change the weight of a line you
are drawing.
The way to do this is simple: change the point size with
either the
.CW .ps
request or the
.CW \es
escape sequence before
drawing the line.
For example:
.Ps
\\l'3i'
.Pe
will produce:
.Ps
\l'3i'
.Pe
and:
.Ps
\\s20\\l'3i'\\s0
.Pe
will produce:
.Ps
\s20\l'3i'\s0
.Pe
.page 455
(This trick only works with
.CW \el
and
.CW \eL  .
It will not change the weight of lines drawn
with any of the
.CW \eD
escape sequences).
You might also want to consider the text size
when you are drawing boxes around text.
For example, if you are using a macro like
.CW .BX
(shown previously) to draw boxes around the names of keys,
you might want to set the text 2 points smaller, either
by specifying the font-switch codes as part of the argument:
.Ps
\&.BX "\\s-2RETURN\\s0"
.Pe
or by modifying the macro so that they are built right in:
.Ps
\&.de BX
\\(br\\|\\s-2\\\\$1\\s0\\|(br\\l'|0\\(rn'\\l'|0(ul'\\^\\\\$2
\&..
.Pe
If either of these things were done, our earlier example would
look like this, which is even better:
.ch15@start
.sp 6p
Press the
\(br\|\s-2RETURN\s0\|\(br\l'|0\(rn'\l'|0\(ul'\^
key.
.sp 6p
.ch15@end
.ix %end [troff] formatter, drawing %key troff formatter, drawing
.Bh "Drawing Curves"
.ix drawing, curves
.ix drawing, sample figures
The previous line drawing escape sequences work in
.CW nroff
and
.CW otroff
as well as
.CW ditroff  .
There are also additional drawing sequences that only work
in
.CW ditroff  .
These escape sequences allow you to draw circles, arcs,
ellipses, splines (curved lines between a series of
coordinates), and straight lines.
.PP
Table 15-2 summarizes these sequences.
The syntax of the escape sequences is familiar\(eman initial
escape code is followed by a series of arguments enclosed in
single quotation marks or some other user-supplied delimiter.
In this case, though, all of the escape sequences begin with
the same code\(em
.CW \eD
\(emwith the type of item to be drawn (circle,
arc, ellipse, spline, or straight line) given by the
first argument.
.br
.ne 10
.Ts "\f[CB]ditroff\fP  Escape Sequences for Drawing"
.TS
expand box;
c c
lf(CW) lw(4i).
Escape	Description
_
T{
\\D'l \f[I]x,y\fP'
T}	T{
Draw a line from the current position
to coordinates \f[I]x,y\fP.
T}
T{
\\D'c \f[I]d\fP'
T}	T{
Draw a circle of diameter \f[I]d\fP with left
edge at current position.
T}
T{
\\D'e \f[I]d1 d2\fP'
T}	T{
Draw an ellipse with horizontal
diameter \f[I]d1\fP and vertical diameter \f[I]d2\fP,
with the left edge at the current position.
T}
T{
\\D'a \f[I]x1 y1 x2 y2\fP'
T}	T{
Draw an arc counterclockwise from
current position, with center at \f[I]x1,y1\fP
and endpoint at \f[I]x1+x2,y1+y2\fP.
T}
T{
\\D'\(ap \f[I]x1 y1 x2 y2\fP...'
T}	T{
Draw a spline from current position
through the specified coordinates.
T}
.TE
.Te
.page 456
.PP
Learning the geometry used by these escape sequences is best
accomplished by example.
Although we have shown the arguments to the line, arc, and
spline sequences as if they were
.I x,y
coordinates, they are in fact
.CW troff 's
usual vertical and horizontal distances.
Read
.I x
as
.I horizontal
distance, and
.I y
as
.I vertical
distance.
.	\" Note:
.	\" original had the word distance as italic for
.	\" vertical but roman for horizontal.  Changed both
.	\" to roman.
You can get very confused if you treat them as a true
coordinate system.
.PP
Let's start simple, with individual fixed-size figures.
The following will produce the output shown in Figure 15-1:
.Ps
\&.sp 1i
\&.in .5i
The circle starts here\\D'c 1i'and ends here.
\&.sp 1i
The line starts here\\D'l 1i -1i'and ends here.
\&.sp 1i
The ellipse starts here\\D'e 2i 1i'and ends here.
\&.sp 1i
The arc starts here\\D'a .5i 0 0 .5i'and ends here.
\&.sp 1i
The spline starts here
\\D'~ .5i -.5i .5i .5i .5i .5i .5i -.5i'and ends here.
\&.sp .5i
\&.in 0
.Pe
.PP
As you can see, arcs and splines are the most difficult
figures to construct.
Instinct cries out for the ability to draw an arc between
two endpoints with the current position as the center of
the arc.
Instead, for consistency with the other figures, drawing
begins at the current position, and the first set of values
specify the center of the arc.
This takes a little getting used to.
.PP
With splines, the problem is that distances are additive,
and relative to the previous position, rather than to the
initial position.
Our familiarity with
.I x,y
coordinate systems leads us to
think that the spline should be produced by a request like
this:
.Ps
\\D'~ .5i -.5i 1i 0 1.5i .5i 2i 0'
.Pe
(in which the
.I x
value increases relative to the origin rather
than to the previous point) instead of by the request
shown previously.
.PP
You may also have noticed something rather odd. Text
continues right after the endpoint of the figure, yet
the
.CW ".sp 1i"
requests seem to give us 1 inch of space from
the original baseline, regardless of the endpoint of
the figure.
This is most obvious with the line, which clearly moves back
up the page.
Yet the next figure is also spaced down 1 inch.
This fact becomes even more obvious if we do this:
.Ps
\&.sp 1i
The line starts here\\D'1i -.5i'and ends here.
What happens to text that wraps and continues in fill mode?
.Pe
.	\" Note: page 457 in its entirety is contained in
.	\" ch15@457@1, which is figure 15-1.
.page 457
.br
.ne 50
.ch15@457@1
.br
.page 458
.ne 8
.sp 3v
Here's the result:
.sp .5i	\" gives us the needed space
The line starts here\D'l 1i -.5i'and ends here.
What happens to text that wraps and continues
in fill mode?
.sp .5v	\" little extra space before next paragraph
.PP
The current baseline has not been changed.
This is a major contrast to lines drawn with
.CW \eL
or
.CW \el  .
As you play with lines, you'll also find that lines drawn
to the left with
.CW \eD
really do move the current position
to the left, and you don't need to add a compensating
horizontal motion if you are drawing a complex figure.
.PP
You'll have to experiment to get accustomed to
drawing figures.
One other problem is to get figures to start where you want.
For example, to get the endpoints of arcs with various
orientations in the right place, you may need to combine
arc drawing requests with vertical and horizontal motions.
.PP
You could use these requests to create a box with curved
corners similar to the one done with
.CW pic
in Chapter 10.
The box is drawn starting with the lower left corner
(so it can be drawn after the text it encloses is
output) and will look like this:
.ig
	The .ne request makes sure that you go to a new page
	if this gets to close to the bottom of the page.
	Currently, there is room, so the box will be printed
	on the same page as the above paragraph.
..
.sp .5v
.ne 15
.ch15@start
.ch15@458@1
.ch15@end
.sp .5v
.LP
The box was drawn using the following drawing commands.
These commands are shown on separate lines for ease of
reading.
To make them draw continuously, we need to add the
.CW \ec
escape sequence to the end of each line.
This escape sequence joins succeeding lines as if the line
feed were not there.
Warning: using fill mode will not achieve the same result,
because the formatter will introduce spaces between each
drawing command as if it were a separate word.
.page 459
.RS
.TS
lf(CW) lw(4.5i).
T{
\\v'-.25i'\\c
T}	T{
Go back up the page
.Fraction 1 4
inch
T}
T{
\\D'a .25i 0 0 .25i'\\c
T}	T{
Draw bottom left arc
.Fraction 1 4
inch down and to the right
T}
T{
\\D'l 3i 0'\\c
T}	T{
Draw horizontal line 3 inches to the right
T}
T{
\\D'a 0 -.25i .25i 0'\\c
T}	T{
Draw bottom right arc
.Fraction 1 4
inch up and to the right
T}
T{
\\D'l 0 -2i'\\c
T}	T{
Draw vertical line 2 inches back up the page
T}
T{
\\D'a -.25i 0 0 -.25i'\\c
T}	T{
Draw top right arc
.Fraction 1 4
inch up and to the left
T}
T{
\\D'l -3i 0'\\c
T}	T{
Draw horizontal line 3 inches to the left
T}
T{
\\D'a 0 .25i -.25i 0'\\c
T}	T{
Draw top left arc
.Fraction 1 4
inch down and to the left
T}
T{
\\D'l 0 2i'\\c
T}	T{
Draw vertical line 2 inches down the page
T}
T{
\\v'.25i'
T}	T{
Restore original baseline position
T}
.TE
.RE
.PP
To build a complete macro to enclose examples in a
simulated computer screen, we can adapt the
.CW .BS
and
.CW .BE
macros shown previously:
.	\" Note:
.	\" again a reminder that no B1 and B2 macros were given
.	\" just BS and BE.  Doesn't say much for automated
.	\" proofing tools discussed later in the chapter.
.	\"
.	\" Aw, cut 'em a break, Michael... I didn't see anything
.	\" about proofing tools in this chapter.... Besides, I
.	\" think that was mostly a spell-checker anyway. --LK
.	\"
.	\" You're correct, they aren't in this chapter, but
.	\" in an earlier one.
.	\" --Michael
.Ps
\&.de SS				\\" Start Screen with
\&.				\\" Curved Corners
\&.sp .5v
\&.ie !"\\\\$1"" .nr BW \\\\$1	\\" Get width from first arg
\&.el .nr BW 4i			\\" or set default if not specified
\&.ie !"\\\\$2"" .nr BH \\\\$2	\\" Get height from second arg
\&.el .nr BH 2.5i		\\" or set default if not specified
\&.br
\&.di BB
\&..
\&.de SE				 \\" Screen End
\&.br
\&.nr BI 1n
\&.if \\\\n(.$>0 .nr BI \\\\$1n
\&.di
\&.ne \\\\n(BHu+\\\\n(.Vu
.	\" Note:
.	\" The next line should use the .u register, rather than
.	\" the .j as in the original. It is used to test for
.	\" fill/no-fill, not the adjustment mode.
\&.nr BQ \\\\n(.u
\&.nf
\&.ti 0
\&.in +\\\\n(BIu
\&.in +(\\\\n(.lu-\\\\n(BWu)/2u
\&.sp .5
\&.BB
\&.sp +(\\\\n(BHu-\\\\n(dnu)
\&.in -\\\\n(BIu
\&.nr BH -.5i
\&.nr BW +2*\\\\n(BIu
\&.nr BW -.5i
\&\\v'-.25i'\\c
\&\\D'a .25i 0 0 .25i'\\c
\&\\D'l \\\\n(BWu 0'\\c
\&\\D'a 0 -.25i .25i 0'\\c
\&\\D'l 0 -\\\\n(BHu'\\c
.page 460
\&\\D'a -.25i 0 0 -.25i'\\c
\&\\D'l -\\\\n(BWu 0'\\c
\&\\D'a 0 .25i -.25i 0'\\c
\&\\D'l 0 \\\\n(BHu'\\c
\&\\v'.25i'
\&.sp -1.5i
\&.if \\n(BQ .fi
\&.br
\&.sp .5v
\&..
.Pe
Because a screen has a fixed aspect ratio, we don't want
the box to be proportional to the text it encloses.
Hence, we give the user of the macro the ability to set
the box width and height.
If no arguments are specified, we provide default values.
.PP
Because the box size is fixed, there are some additional
steps necessary in the closing macro.
First, we must decrement the specified box width and height
by the distance used in drawing the curves, so that the user
gets the expected size.
Second, because the box is drawn from the lower left corner
back up the page, we must make sure that the lower left
corner is correctly positioned before we start drawing.
.PP
To do this, we again need to use a diversion.
We measure the height of the diversion, then add enough
additional space
.CW "\&.sp + (\e\en(BHu-\e\en(dnu)" ) (
to bring the
starting point for drawing low enough so that the box is
not drawn back over the text that precedes the
invocation of
.CW \&.SS  .
(If you don't understand why this was done, delete this line
from the macro, and watch the results).
.PP
We've also centered the screen by default, and added a
half-line vertical spacing above and below the box.
(As an exercise, modify the
.CW .BX
macro to produce a key-cap
with curved corners).
.Ah "Talking Directly to the Printer"
Depending on the output device and postprocessor you are
.ix [troff] formatter, postprocessors %key troff formatter, postprocessors
.ix postprocessors
using, you may be able to send specialized control commands
directly to your printer.
For example, you may be able to embed raster graphics images
(such as a file created on an Apple Macintosh with MacPaint)
directly in your output.
.ix Macintosh, illustrations
.ix drawing, including Macintosh~illustrations
.ix [troff] formatter, including Macintosh~illustrations %key troff formatter, including Macintosh illustrations
.ix PostScript
Or, if you are using a PostScript-driven printer, you can
integrate figures done with MacDraw, or issue PostScript
commands to print grey screens over your text.
.PP
These capabilities are provided by the two requests
.CW \e!
and
.CW .cf  ,
.I "copy filename [to standard output]"
.ix [.cf] request %key cf request
.ix [troff] formatter, [.cf] request %key troff formatter, [.cf] request
.CW ditroff only). (
.PP
The
.CW \e!
request is the
.I "transparent output"
.ix transparent output
.ix [troff] formatter, transparent output %key troff formatter, transparent output
indicator.
Any text following this escape sequence on a line is placed
directly into the output stream, without any processing
by
.CW troff  .
This makes is possible to insert control lines that will
be interpreted by a postprocessor or an output device.
(As mentioned in the last chapter, transparent output
is also useful for embedding control lines in a diversion,
to be executed when the text in the diversion is output).
.page 461
.PP
Likewise, the contents of the file specified as an
argument to
.CW .cf
are placed directly on standard
output, without processing by
.CW  ditroff  .
.PP
Unfortunately, there is a catch!
PostScript is a page
description language that resides in the printer.
Before you can talk directly to the printer, you must
get through the postprocessor that translates
.CW ditroff
output into PostScript.
If the postprocessor mucks with the data you send out,
all bets are off.
.PP
As of this writing, TranScript, Adobe Systems' own
.CW troff
-Postscript converter, does not allow you to use
.CW \e! .
However, with Pipeline Associates'
.CW devps ,
.ix [devps] postprocessor %key devps postprocessor
any lines beginning with
.CW !
are ignored by the postprocessor, and go
directly to the printer.
This allows you to use transparent output by entering
the sequence
.CW \e!!
followed by the appropriate PostScript commands.
Or, if you are sending a PostScript file created on the
Mac, use an editor to insert an exclamation point at the
beginning of each line.
.PP
In any event, this is not a job for the novice, since you
must learn PostScript as well as
.CW troff  .
Experiment with your printer and postprocessor, or ask
around to see if other users have solutions you can
adapt to your situation.
.Ah "Marking a Vertical Position"
.ix [troff] formatter, marking~a vertical position %key troff formatter, marking a vertical position
.ix marking~a position, in~[troff] %key marking a position, in~troff
There are many cases, both in macros and in the body of
your text, where you may want to mark a spot and then return
to it to lay down additional characters or draw lines.
.PP
The
.CW \&.mk
.ix [.mk] request %key mk request
.ix [troff] formatter, [.mk] request %key troff formatter, [.mk] request
request marks the current vertical position on the
page;
.CW \&.rt
.ix [.rt] request %key rt request
.ix [troff] formatter, [.rt] request %key troff formatter, [.rt] request
.ix [troff] formatter, returning to~a vertical position %key troff formatter, returning to a vertical position
.ix returning to~a marked position, in~[troff] %key returning to a marked position, in~troff
returns to that position.
This is useful for two-column processing.
.ix [troff] formatter, two-column processing %key troff formatter, two-column processing
To give a simple example:
.Ps
Two columns are useful when you have a linear list
of information that you want to put side-by-side, but don't
want to bother rearranging with the cut-and-paste programs.
\&.sp .5
\&.ll 2.5i
\&.nf
\&.mk
Item 1
Item 2
Item 3
\&.ll 5i
\&.in 2.75i
\&.rt
Item 4
Item 5
\&.in 0
\&.sp
.Pe
This example produces the following output:
.page 462
.ch15@start
.ch15@462@1
.ch15@end
Notice that it is entirely your responsibility to make sure that the
second column doesn't overprint the first.
In this example, we did this by manually adjusting the indent
and the line length.
In addition, because the second column is shorter than the first, a
concluding
.CW \&.sp
is necessary to return to the original position
on the page.
If this had not been done, subsequent text would overprint the last
line of the first column.
.PP
.ix [troff] formatter, multi-column processing %key troff formatter, multi-column processing
Proper two-column processing for an entire document requires a much more
complex setup, which must be in part handled by the page bottom macro.
We'll look at that in detail in Chapter 16, but this example should
be enough to give you the idea.
.PP
The
.CW \&.mk
request can take as an argument the name of a number
register in which to store the vertical position.
This allows you to mark multiple positions on a page,
and return to them by name.
The
.CW \&.rt
request always returns to the last position marked,
but you can go to a position marked in a register using
the
.CW \&.sp
request:
.Ps
\&.mk Q
\&.sp |\\nQu
.Pe
or (more to the point of the current discussion) with
.CW \ev  :
.Ps
\\v'|\\nQu'
.Pe
.PP
In addition,
.CW \&.rt
can take as an argument a distance from the
top of the page.
That is:
.Ps
\&.rt 3i
.Pe
will return to a point 3 inches from the top of the page.
The
.CW \&.mk
request need not be used in this case.
.Ah "Overstriking Words or Characters"
.ix [troff] formatter, overstriking %key troff formatter, overstriking
.ix overstriking
There are a number of escape sequences that allow you to
overstrike words or characters to create special effects.
These include
.RS
.Ls B
.Li
boldfacing an entire font by overstriking;
.Li
marking and returning to a specific horizontal position;
.Li
calculating the width of a word and backing up over it;
.Li
centering two characters on top of each other;
.Li
stacking characters vertically.
.Le
.RE
.page 463
.Bh "Boldfacing a Font by Overstriking"
.ix [.bd] request %key bd request
.ix [troff] formatter, [.bd] request %key troff formatter, [.bd] request
.ix [troff] formatter, boldfacing~fonts~by overstriking %key troff formatter, boldfacing fonts~by overstriking
.ix boldfacing, by~overstriking
.ix fonts, boldfacing~by overstriking
The
.CW \&.bd
request specifies that a font should be
artificially boldfaced by overstriking.
The request has two forms, one for ordinary fonts and one
for the special font.
.PP
A request of the form:
.Ps
\&.bd \f[I]font offset\fP
.Pe
will overstrike all characters printed in
.I font
by overprinting them, with the second strike
offset from the first by
.I offset
-1 basic units.
The following:
.Ps
\&.bs S \f[I]font offset\fP
.Pe
will overstrike characters printed in the special font,
while
.I font
is in effect.
And:
.Ps
\&.bd \f[I]font\fP
\&.bd S \f[I]font\fP
.Pe
will restore the normal treatment of the font.
.PP
This request is particularly useful when you are boldfacing
headings and want to account for special characters or
italics in arguments supplied by the user.
(This assumes that you don't have an explicit bold italic
font).
Especially at sizes larger than 10 points, the stroke weights
of bold and italic fonts can be quite different.
.PP
For example, assume that you had a macro that produced
a boldface heading for a table:
.Ps
\&.de Th	\\" Table Heading
\&.ft B
\&.ce
Table \\\\$1: \\\\$2
\&.ft P
\&..
.Pe
If the user supplied italics or special characters in the
arguments to the macro, the contrast between the different
character weights might not be as pleasing as it could be.
For example:
.Ps
\&.Th "3-1" "Special Uses for \\(sr in \\fItroff\\fP "
.Pe
would produce:
.ch15@start
.ch15@463@1 "3-1" "Special Uses for \(sr in \f[I]troff\fP"
.ch15@end
If the macro had
.CW \&.bd
requests added like this:
.Ps
\&.de Th \\" Table Heading
\&.ft B
\&.bd I 3
\&.bd S B 3
\&.ce
Table \\\\$1: \\\\$2
\&.ft R
.page 464
\&.bd I
\&.bd S
\&..
.Pe
the output would look like this:
.br
.ne 4
.ch15@start
.ch15@464@1 "3-1" "Special Uses for \(sr in \f[I]troff\fP
.ch15@end
.LP
Another example is provide by the constant-width (CW) font
used in this book.
Because the font is optimized for the LaserWriter, where
the ink bleeds slightly into the
paper, the font is very light on the typesetter.
Throughout this book, we have emboldened this font slightly,
with the requests:
.Ps
\&.bd CW 4
\&.bd S CW 4
.Pe
This sentence shows how the
.CW "constant width"
font looks without these requests.
.Bh "Marking and Returning to a Horizontal Position"
.ix [troff] formatter, marking~a horizontal~position %key troff formatter, marking a horizontal~position
.ix [troff] formatter, returning to~a horizontal~position %key troff formatter, returning to a horizontal~position
.ix marking~a horizontal~position
.ix returning~to~a horizontal~position
Just as you can mark a vertical position, you can also
mark and move to a specific horizontal position.
This is chiefly useful for overstriking characters.
.PP
Just as you use a value stored into a register with the
.CW \&.mk
request to indicate a fixed vertical location
on the page, you mark a horizontal location with
.CW \ek  .
.ix [troff] formatter, absolute motions %key troff formatter, absolute motions
.ix absolute motions
Then, you can use the absolute position indicator
.CW |
to specify the distance for
.CW \eh  .
.PP
To borrow an example from Kernighan's
.I "Troff Tutorial"  :
.Ps
\\kx\f[I]word\fP\\h'|\\nxu+2u'\f[I]word\fP
.Pe
will artificially embolden
.I word
by backing up almost
to its beginning, and then overprinting it.
(At the start of
.I word  ,
.CW \ek
stores the current horizontal position in register
.CW x  .
The
.CW \eh'|\enxu+2u'
sequence returns to that absolute
position, plus 2 units\(ema very small offset.
When
.I word
is printed a second time, an overstriking
effect is created).
.PP
This sequence might be useful if you were using a font
that had no bold equivalent, and in circumstances where
the
.CW \&.bd
request could not be used because the special
effect was not desired for all instances of that font
on the same line.
And, to be really useful, the sequence should probably be
saved into a macro.
.Bh "The Width Function"
.ix width function
.ix [troff] formatter, width function %key troff formatter, width function
The
.CW \ew
escape sequence returns the length of a string
in units.
For example:
.Ps
\\w'Hi there'
.Pe
will tell you the length of the string
.I "Hi there".
.page 465
.PP
This sequence returned by
.CW \ew
can be used as an argument with
.CW \eh
or with any horizontally
oriented request (such as
.CW \&.in  ).
This has many uses, which we'll introduce as we need them.
.PP
To give you an idea of how to use
.CW \ew  ,
though, we can rewrite the example used with
.CW \ek
as follows, to produce the same effect:
.	\" Kills a widow/orphan in the current format--MH
.br
.ne 3
.Ps
\&.de BD		\\"Artificially embolden word
\\\\$1\\h'-\\w'\\\\$1'-2u'\\\\$1
\&..
.Pe
This macro prints its first argument, then backs up the
width of that argument, less two units.
Then it prints the argument a second time\(emat a
two-unit offset from the first.
Hint: to avoid awkward constructions involving nested
.CW \ew
sequences, first read the width into a number register.
For example, the previous macro could be
rewritten like this:
.Ps
\&.de BD		\\" Artificially embolden word
\&.nr WI (\\w'\\\\$1'-2u)
\\\\$1\\h'-\\\\n(WIu'\\\\$1
\&..
.Pe
In this case, the difference isn't so great; however, at
other times the sequence can become too
confusing to read easily.
.Bh "Overstriking Single Characters"
.ix [troff] formatter, overstriking %key troff formatter, overstriking
.ix overstriking
Although
.CW \ek
provides a good method for overstriking
an entire word, there are also more specialized functions
for overstriking a single character.
.PP
The
.CW \eo
sequence takes up to nine characters and prints
one on top of the other.
This is most useful for producing accents, and so forth.
For example,
.CW \eo'e^'
produces
\o'e^'.
.PP
You can also produce other interesting character
combinations, although you may need to tinker with the
output to get it to look right.
For example, we once tried to simulate a checkmark in a
box with the sequence:
.CW \eo'\e(sq\e(sr'  .
(Note that the special character escape sequences
are treated as single characters for the purpose
of overstriking).
This example produced the following output:
.ch15@start
.ch15@465@1
.ch15@end
The square root symbol is too low in the box, so we tried
to introduce some local motions to improve the effect,
like this:
.Ps
\\o'\\(sq\\v'-4p'\\(sr\\v'4p''
.Pe
Unfortunately, this didn't work.
Although you can nest most escape sequences inside each
other (as long as you use the correct number and order
of delimiting quotation marks), local motions do not
work with
.CW \eo  .
However, there was a solution.
.PP
The
.CW \ez
sequence also allows overstriking, but in a different way.
The
.CW \eo
sequence knows the width of each character,
and centers them on top of each other.
The
.CW \ez
sequence simply outputs the following character,
.I "but does not space over it".
That means the current position after printing the
character is the same as it was before
.page 466
the character was printed.
A subsequent character will have its left edge at the same
point as the character immediately following the escape
sequence.
Because
.CW \ez
does allow you to mix vertical motions
with overstriking, it solved our problem.
.PP
Because all these escape sequences can be a bit much to
type, we defined the checkmark in a box as a string:
.Ps
\&.ds CK \\z\\(sq\\\\v'-4p'\\(sr\\\\v'4p'
.Pe
After we did that, simply typing
.CW \e*(CK
will produce
\z\(sq\(sr.
.Bh "Stacking up Characters"
.ix [troff] formatter, stacking~up characters %key troff formatter, stacking up characters
The
.CW \eb
sequence also does a kind of overstriking\(emit stacks
the characters in the following string.
It was designed for use with
.CW eqn  .
There are special bracket-building characters that are
meant to stack up on top of each other.
See Table 15-3.
.KS
.Ts "Bracket-Building Characters"
.ix [troff] formatter, bracket-building characters %key troff formatter, bracket-building characters
.ix bracket-building characters
.TS
center box;
c c c
c l l.
Character	Name	Description
_
\(lt	\f[C]\\(lt\fP	Left top of big curly bracket
\(lb	\f[C]\\(lb\fP	Left bottom
\(rt	\f[C]\\(rt\fP	Right top
\(rb	\f[C]\\(rb\fP	Right bottom
\(lk	\f[C]\\(lk\fP	Left center of big curly bracket
\(rk	\f[C]\\(rk\fP	Right center of big curly bracket
\(bv	\f[C]\\(bv\fP	Bold vertical
\(lf	\f[C]\\(lf\fP	Left floor (left bottom of big square bracket)
\(rf	\f[C]\\(rf\fP	Right floor (right bottom)
\(lc	\f[C]\\(lc\fP	Left ceiling (left top)
\(rc	\f[C]\\(rc\fP	Right ceiling (right top)
.TE
.Te
.KE
.PP
A typical invocation looks like this:
.Ps
\\b'\\(lt\\(lk\\(lb'
.Pe
which produces:
.ch15@start
.in +5n
.sp 1.5v
\b'\(lt\(lk\(lb'
.sp 1.5v
.ch15@end
When you're creating a tall construct like this, you need
to allow space so that it
doesn't overprint preceding lines.
You can create space above or below the line with
.CW \&.sp
requests.
However, this will cause breaks.
Although
.CW \&'sp
might do the trick, it is sometimes
hard to predict just where the break will fall.
.PP
The
.CW troff
program has a special construct designed to
solve just this problem of a tall construct in the middle
of filled text.
The
.CW \ex
request allows you to associate extra
interline spacing with a word.
A positive value specifies space above the line; a
negative value specifies space below the line.
So, when illustrating the previous
.page 467
bracket-building function, we could have shown the results
inline, like this
\b'\(lt\(lk\(lb'\x'9p'\x'-9p',
rather than in an example broken out by blank lines.
Typing the sequence:
.Ps
\\b'\\(lt\\(lk\\(lb'\\x'9p'\\x'-9p'
.Pe
gives us the result we want.
.PP
The
.CW \ex
sequence is also useful when you want to allow
extra space for an oversized letter at the start
of a paragraph.
(You've probably seen this technique used in some
books on the first paragraph of a new chapter.
It was commonly used in illuminated manuscripts).
.PP
An application of
.CW \eb
that you might find useful is
to create vertically stacked labels.
.ix [troff] formatter, vertically~stacked labels %key troff formatter, vertically stacked labels
.ix vertically~stacked labels
For example, consider the following macro, which will
put such a label in the outside margin of a book:
.Ps
\&.de SL
\&.mk		\\" Mark current vertical position
\&.ft B		\\" Change to bold font
\&.cs B 24	\\" We'll explain this later
\&.po -.25i	\\" Shorten the page offset by 1/4 inch
\&.lt +.5i	\\" Extend the title length used by .tl
\&.		\\" This request will be explained later
\&.if e .tl '\\b:\\\\$1:'''	\\" Use .tl to put stacked label
\&.if o .tl '''\\b:\\\\$1:'	\\" in the margins
\&.lt -.5i	\\" Restore original title length
\&.po +.25i	\\" Restore original page offset
\&.cs B		\\" We'll explain this later
\&.ft		\\" Restore original font
\&.rt		\\" Return to original vertical position
\&..
.Pe
So, for example:
.Ps
\&.SL "Clever Trick!"
.Pe
will produce the effect shown in the margin.
.ig
	A few words of explanation.
	This is falling on an even page and is getting
	displayed on the left side, not the right
	side as in the original. That is just how it is
	working out when this chapter is formated. The macro
	does look at whether it is on an odd or even page to
	decide where to put "Clever Trick". I decided to just
	let the macro function as designed, rather than moving
	this to an odd page.  Of course, if changes are made
	to this chapter prior to this point, it is well
	possible that it might again show up on an odd page,
	and match the original output.
	--Michael Hobgood
..
.ch15@467@1 "Clever`Trick!"
.Ah "Tabs, Leaders, and Fields"
.ix [.ta] request %key ta request
.ix [troff] formatter, [.ta] request %key troff formatter, [.ta] request
.ix [troff] formatter, tabs~and~leaders %key troff formatter, tabs and~leaders
.ix tabs (in~[troff]) %key tabs (in troff)
We discussed tabs in Chapter 4.
However, there are a couple of additional points that need
to be covered.
When you enter a tab on a typewriter, the typing position
shifts over to a predefined
.I position  ,
or tab stop.
In
.CW nroff
and
.CW troff  ,
what is actually generated is the
.I distance
from the current position
.I "on the input line"
to the next tab stop.
.PP
What this means is best illustrated by an example that
will
.I not
work.
Suppose you want to create a table of contents in which
one entry (the page number) is all the way over to the
right margin, and the other (the heading) is indented
from the left, like this:
.page 468
.ch15@start
.ch15@468@1
.ch15@end
You might be tempted to code the example as follows
(where a tab is shown by the symbol
.CW |\(em\(em\(em| ):
.Ps
\&.ta 6.5iR
Getting Started|\(em\(em\(em|1-1
\&.in .5i
Turning On the Power|\(em\(em\(em|1-2
Inserting Diskettes|\(em\(em\(em|1-3
.Pe
This will not work.
Indents cannot be combined with tabs.
A tab character generates the distance from the current
position of the input line to the tab stop.
Therefore, the page number will be indented an additional
half-inch\(emextending out into the right
margin\(eminstead of staying where you put it.
.PP
The way to achieve this effect (in no-fill mode) is to
use either spaces or tabs to manually indent the first
text string.
.PP
When you use right or center-adjusted tabs, the text
to be aligned on the tab is the entire string
(including spaces) from one tab to the next, or from
the tab to the end of the line.
Text is aligned on a right-adjusted tab stop by
subtracting the length of the text from the distance
to the next tab stop; text is aligned on a center-adjusted
tab stop by subtracting half the length of the text from
the distance.
.Bh "Using Leaders"
.ix %begin [troff] formatter, leaders %key troff formatter, leaders
.ix %begin leaders
A leader works like a tab; however, it produces a
character string instead of horizontal motion.
A single character is repeated until a specific
horizontal position is reached.
There is actually a leader character, just as there is
a tab character.
But there is no key for it on most keyboards, so it
is not obvious how to generate it.
The magic character is
.I ^A
.I CTRL-A  ), (
and you can insert it into a file with
.CW vi
by typing
.I ^V^A
.I "CTRL-V, CTRL-A"  ). (
.PP
If you insert a
.I ^A
into your file where you would
normally insert a tab (incidentally, the tab itself is
equivalent to
.I ^I  ,
and will show up as such if
you display a line with
.CW "ex's :1"
command), you will generate a string of dots.
For example:
.Ps
\&.nf
\&.ta 1i 2.5i 3.5i
|\(em\(em\(em|First^ASecond^AThird
\&.fi
.Pe
will produce:
.br
.ne 4
.ch15@start
.ch15@468@2
.ch15@end
.LP
.page 469
You can change the leader character from a period to
any other single character with the
.CW \&.lc
request.
.ix [.lc] request %key lc request
.ix [troff] formatter, [.lc] request %key troff formatter, [.lc] request
For example, you could create a fill-in-the-blanks
form like this:
.Ps
\&.nf
\&.ta 1i 3iR
\&.lc _
Signature:|\(em\(em\(em|^A
Date:|\(em\(em\(em|^A
\&.fi
.Pe
This example would produce the following in
.CW troff  :
.LP
.ch15@start
.ch15@469@1
.ch15@end
As you can see from the example, tabs and leaders can be
combined effectively to line up both ends of the
underlines.
.PP
A second way to create leaders is to redefine the output
of the tab character with
.CW \&.tc  .
.ix [.tc] request %key tc request
.ix [troff] formatter, [.tc] request %key troff formatter, [.tc] request
This request works just like
.CW \&.lc  ,
only it redefines
what will be output in response to a tab  character.
For example, if you issue the request:
.Ps
\&.tc .
.Pe
a tab character
.I ^I  ) (
generates a string of repeated dots, just like a leader
.I ^A  ). (
However, you will then lose the ability to intermix tabs
and leaders on the same line, as in the previous example.
.PP
Issuing a
.CW \&.tc
request without an argument will restore
the default value, which generates motion only.
(Incidentally, the same is true of
.CW \&.lc
\(emthat is,
.CW \&.lc
without an argument will cause leaders to generate motion
only, just like tabs.
To reset the leader character to its default value, you
need to request \f[CW].lc\fP\|\f[CW].\fP).
.ix %end [troff] formatter, leaders %key troff formatter, leaders
.ix %end leaders
.Bh "Using Fields"
.ix [troff] formatter, fields %key troff formatter, fields
.ix fields, in [troff] %key fields, in troff
In addition to tabs and leaders,
.CW nroff
and
.CW troff
support
.I fields  ,
which are blocks of text centered
between the current position on the input line and the
next, or between two tab stops.
.PP
The
.CW \&.fc
.ix [.fc] request %key fc request
.ix [troff] formatter, [.fc] request %key troff formatter, [.fc] request
request allows you to specify a delimiter
that indicates the boundaries of the field, and a second
character (called the
.I pad
character) that divides
the contents of the field into subfields.
A blank space is the default pad character.
The
.CW \&.fc
request without any argument turns off the
field mechanism.
This request is a little difficult to explain, but easy to
illustrate.
The requests:
.Ps
\&.nf
\&.ta 1i 3i
\&.fc #
|\(em\(em\(em|#Hi there#
|\(em\(em\(em|#Hi how are you#
\&.fc
\&.fi
.Pe
.page 470
will produce the following output:
.br
.ne 5
.ch15@start
.ch15@470@1
.ch15@end
.PP
Within the field, the pad character (a space by default) is
expanded so that the text evenly fills the field.
The first line contains only a single space, so the two
words are adjusted at either end of the field.
The second line contains three spaces, so the words are
evenly spaced across the field.
.PP
By specifying a pad character other than a space, you can
achieve fine control over spacing within the field.
For example, if we modify the input like this:
.Ps
\&.fc #^
|\(em\(em\(em|#Hi^how are^you#
\&.fc
.Pe
we'll get this result:
.ch15@start
.ch15@470@2
.ch15@end
What's this good for?
To return to our
.I "fill-in-the-blanks"
example, the construction:
.Ps
\&.nf
\&.ta .5i 2i 2.5i 4i
\&.fc #^
\&.lc _
|\(em\(em\(em|^A|\(em\(em\(em|^A
\&.sp .5
|\(em\(em\(em|#^Signature^#|\(em\(em\(em|#^Date^#
\&.fc
\&.lc .
\&.fi
.Pe
would produce the following output:
.ch15@start
.ch15@470@3
.ch15@end
You should also know that
.CW .fc  ,
like many other advanced formatter requests, is used by the
.CW tbl
preprocessor to create complex tables.
It is wise to avoid using it inside a table.
.Bh "Using Tabs and Leaders in Macros"
.ix [troff] formatter, tabs~in macros %key troff formatter, tabs in macros
.ix macros, tabs~and~leaders~in
Within a macro definition, tabs and leader characters are
not interpreted.
They will take effect when the macro is used, not when
it is defined.
Within a macro definition, you can also specify tabs and
leaders with the escape sequences
.CW \et
and
.CW \ea  .
These
.page 471
sequences are also not interpreted until the macro is
used, and can be substituted for the actual tab or
leader characters whenever interpretation is to be
delayed.
.Ah "Constant Spacing"
.ix [troff] formatter, constant spacing %key troff formatter, constant spacing
.ix constant spacing
One font that you may frequently encounter, especially in
the
.CW ditroff
environment, is called
.CW CW
.I "constant width"  ). (
.ix fonts, constant~width
It is the font used in this book for examples.
It has become something of a convention in computer books
to print all \(lqcomputer voice\(rq examples\(eminput from the
keyboard, the contents of a file, or the output on the
screen\(emin a constant-width font.
(This convention is based on the fact that in many
computer languages, precise indentation is syntactically
or at least semantically significant, and the
variable-width typesetting fonts cannot preserve
the alignment of the original text).
When you use a constant-width font, you are essentially
asking
.CW troff
to act like
.CW nroff \c
\(emto work in a realm where all characters, and all
spaces, are of identical width.
.PP
To use the constant-width font in
.CW ditroff  ,
request it like any other font, using either the request
.CW \&.ft
.CW CW
or the escape sequence
.CW \ef(CW  .
In
.CW otroff  ,
depending on the output device, you could
use constant width by using a preprocessor called
.CW cw  ,
which got around the four font
.CW troff
limit by handling the constant-width font in a separate
pass.
See the description of
.CW cw
in your
.I "UNIX Reference Manual"
if you are interested in the details.
(There are other ways to do this as well, depending
on the output device and the postprocessor you are using
to drive it.
For example, we used
.CW otroff
with TextWare International's
.CW tplus
.ix [tplus] postprocessor %key tplus postprocessor
postprocessor and the HP LaserJet.
To get around the font limit, we set a convention
.I "in the postprocessor"
that 11-point type was actually
constant width, and then used the
.CW \&.cs
.ix [.cs] request %key cs request
.ix [troff] formatter, [.cs] request %key troff formatter, [.cs] request
and
.CW \&.ss
.ix %begin [.ss] request %key ss request
.ix %begin [troff] formatter, [.ss] request %key troff formatter, [.ss] request
requests to give
.CW troff
the correct spacing).
.PP
There is also a request that allows you to simulate the
effect of a constant-width font even when you are using
a variable-width font.
The
.CW \&.cs
request tells
.CW troff  :
\(lqUse the spacing I give you, even if it doesn't match
what you've got in your width tables.\(rq
The request takes up to three arguments.
The first two arguments are the most commonly used.
They are the font to be so treated and the width to
be used, in 36ths of an em.
By default, the em is relative to the current type size.
By using the optional third argument, you can use the em
width of a different type size.
So, for example:
.Ps
\&.cs B 21
Space the bold font at 21/36 of an em.
\&.cs B 21 12
Space the bold font at 21/36 of a 12-point em.
.Pe
Let's see what we get with these requests:
.ch15@start
.ch15@471@1
.ch15@end
.page 472
To return to normal spacing for the font, use the
.CW \&.cs
without a width argument.
For example:
.Ps
\&.cs B
.Pe
will return control of spacing for the bold font to
.CW troff 's
width tables.
.PP
Although the results are not always aesthetically pleasing,
it may be necessary to use this request if you have a real
need to represent constant-width text.
It is also useful for special effects.
For example, you may have noticed that in the headings of
each chapter of this book, the word
.I Chapter
is broadly and evenly spaced, and the boxes underneath
align with the letters.
This was done with the
.CW \&.cs
request.
.PP
The
.CW \&.cs
request is also useful when you are creating
vertically stacked labels, as shown earlier in this
chapter.
Normally, characters are positioned with their left edge at
the current position on the output line.
When constant spacing with
.CW \&.cs
is in effect, the left corner of the
.I "character box"
is placed at that position, and the character itself
is centered in the box.
You can see the difference between this graphically in
the following example:
.Ps
\&.sp .7i
\&.ft B
\&.in 1i
\&.mk
\\b'Variable'
\&.in 3i
\&.rt
\&.cs B 24
\\b'Constant'
\&.br
\&.cs B
\&.ft
\&.in 0
\&.sp .7i
.Pe
which produces:
.ch15@start
.ch15@472@1
.ch15@end
.PP
The
.CW \&.ss
request is a closely related request that
sets the space size.
.ix [troff] formatter, space~size %key troff formatter, space size
The default size of an interword space in
.CW troff
is 12/36 of an em; for true constant-width effects, you
should set it to the same size as the font spacing you
have set with
.CW \&.cs  .
.ix %end [.ss] request %key ss request
.ix %end [troff] formatter, [.ss] request %key troff formatter, [.ss] request
.page 473
.Ah "Pseudo-Fonts"
Using the
.CW \&.bd
request to create a bold italic in not
the only way to simulate a nonstandard font, at least in
.CW ditroff  .
In
.CW ditroff  ,
there are two new escape sequences,
.CW \eS
and
.CW \eH  .
The
.CW \eS
sequence slants characters by a specified
.ix slanting characters
number of degrees.
(Positive values slant characters to the right; negative
values slant characters back to the left).
For example:
.Ps
\\S'15'
.Pe
will slant characters 15 degrees to the right.
This can be used to create a pseudo-italic font.
The
.CW \eS
sequence without an argument turns off slanting.
.PP
The
.CW \eH
sequence sets the character height to a specified
point size without changing the width.
For example, if type is currently being set at 10 point,
the construct:
.Ps
\\H'12'
.Pe
will create characters that are 12 points high, but only
10 points wide (assuming you are at the default 10-point
size).
A height value of 0 turns off the function.
.PP
These escape sequences will only work on certain output
devices.
You'll have to experiment to find whether or not they'll
work in the setup you're using.
.Ah "Character Output Translations"
.ix [troff] formatter, character output translations %key troff formatter, character output translations
\(lqGarbage in, garbage out\(rq
is a truism of computer science.
You get out of a computer what you put in.
However, there are cases in
.CW nroff
and
.CW troff
in which what you put in is not the same as what you
get out.
.PP
The first of these cases is only true for
.CW troff  .
It involves a special class of characters called
.I ligatures  .
As we've previously discussed, typeset characters have
different widths.
Even so, when two narrow characters are printed together,
such as a pair of
.I f \/'s
.	\" above line uses new groff construct for spacing.
or an
.I f
and an
.I i ,
there is excess space between the characters.
.PP
To get around this problem, there are special characters
called ligatures,
.ix [troff] formatter, ligatures %key troff formatter, ligatures
.ix ligatures
.ix [troff] formatter, ligatures %key troff formatter, ligatures
which are really single characters
designed so that they appear the same as a pair of
narrow characters.
(These are truly single characters, defined as such in
.CW troff 's
character set).
.PP
The ligature characters and the equivalent individual
characters are:
.br
.ig
	The ligatures below are close, but not exact.
	--Michael Hobgood
..
.KS
.TS
center;
l l l
lf(CW) c c.
Input	Ligature	Equivalent Characters
\\(fi	\(fi	\*[EquivChar.fi]
\\(fl	\(fl	\*[EquivChar.fl]
\\(ff	\(ff	\*[EquivChar.ff]
\\(Fi	\(Fi	\*[EquivChar.ffi]
\\(Fl	\(Fl	\*[EquivChar.ffl]
.TE
.KE
The
.CW troff
formatter automatically converts any of
these groups of characters to the equivalent ligature,
although all ligatures are not supported by every
output device.
.page 474
(For example,
.I fi
and
.I fl
are the only ones in
the standard PostScript fonts).
.ix PostScript
You can turn this conversion off with the request:
.ix %begin [.lg] request %key lg request
.ix %begin [troff] formatter, [.lg] request %key troff formatter, [.lg] request
.Ps
\&.lg 0
.Pe
and restore it with:
.Ps
\&.lg
.Pe
Normally, you won't need to do this, but there are special
cases in which it may hang you up, and you'll need to know
what to do.
We'll get to one of them in a moment.
.ix %end [.lg] request %key lg request
.ix %end [troff] formatter, [.lg] request %key troff formatter, [.lg] request
.PP
The
.CW \&.tr
.I translate  ) (
.ix %begin [.tr] request %key tr request
.ix %begin [troff] formatter, [.tr] request %key troff formatter, [.tr] request
request provides a more
general facility for controlling output character
conversions.
It takes one or more pairs of characters as an argument.
After such a translation list has been defined,
.CW troff
will always substitute the second character in each pair
for the first, whenever it appears in the input.
.PP
Let's look at some examples.
First, consider the case encountered throughout this book,
in which we illustrate the syntax of various requests
without actually executing them.
For example, we want to show a period at the start of a
line or the backslash that starts an escape sequence,
without actually having them executed.
.PP
We could simply insulate the special characters from execution.
For example, we can put the zero-width character
.CW \e&
in front of a period that begins a request, and we
can double all backslashes (
.CW \e\e
will appear as
.CW \e
in the output) or use the
.CW \ee
escape sequence, to print
.CW \e.
.PP
However, this grows tedious and hard to read in the input
file.
Another approach is to do a character translation:
.Ps
\&.tr #.%\\\\	\\" Translate # to ., % to \\
.Pe
(As usual, we have to double the backslash).
Now, whenever
.CW #
appears in the input,
.CW \&.
appears in the output, and whenever
.CW %
appears in the input,
.CW \e
appears in the output.
So, in our examples, we can actually type:
.Ps
#sp 1i		%" Space down one inch
.Pe
But what appears on the page of this book is:
.Ps
\&.sp 1i		\\" Space down one inch
.Pe
The translations are built into the example start and end
macros.
(The end macro resets the characters to their normal
values).
.PP
If you translate characters with
.CW \&.tr  ,
be sure to
restore their original values correctly when you are done.
To reset the previous translation to the normal character
values, the request is:
.Ps
\&.tr ##%%		\\" Translate # to #, % to %
.Pe
In addition, the translation must be in effect at the time
the line is output.
If you translate characters without first causing a break,
any partially filled line will be affected by the
translation.
.PP
It is also possible (and recommended in some of the
.CW troff
documentation) to use
.CW \&.tr
to substitute
some other character (usually
.CW \(ap )
for a space.
This creates an equivalent to the unpaddable space.
.ix unpaddable space
.page 475
.Ps
\&.tr \(ap
.Pe
This will allow you to type single characters for
unpaddable spaces; your input text will be more
readable and will line up properly on the screen.
.PP
Yet another application of
.CW \&.tr  ,
and one that you will
find useful in designing macros for chapter headings and
so on, is to translate lowercase input into uppercase,
and then back again:
.Ps
\&.de UC	\\" Translate input to uppercase
\&.tr aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ
\\\\$1
\&.br
\&.tr aabbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyyzz
\&..
.Pe
(The break is important.
These character translations must be in effect at the time
the line is output, not when it is read into the buffer).
.PP
It is in this last case that you may have trouble with
ligatures.
If the
.CW .UC
macro were defined as shown in the
previous example, the line:
.Ps
\&.UC troff
.Pe
might produce the following output:
.ch15@start
.ch15@475@1
.ch15@end
To have the macro work correctly, we would need to turn
ligatures off
.CW ".lg 0" ) (
for the duration of the translation.
.ix %end [.tr] request %key tr request
.ix %end [troff] formatter, [.tr] request %key troff formatter, [.tr] request
.	\" Note:
.	\" The next two sections, Output Line Numbering and
.	\" Change bars have several items that anyone changing
.	\" this need to be aware of.
.	\" 1. The line length has been set to 4.85 inches. This
.	\"	 value was arrived at by trial and error.  It
.	\"	 causes a closer approximation to the original
.	\"	 than any other value.
.	\" 2. A lot of line length and page offset changing
.	\"	 occurs. These are needed to get the proper
.	\"	 display.  The text itself explains why the line
.	\"	 length needs shortening when numbering is on.
.	\"	 See the notes by the page offset changes for
.	\"	 why they were done.
.	\" 3. Originally I just changed the .ll register.  This
.	\"	 however, did not affect the .Ah headings.  Changing
.	\"	 nr .LL does however. I found the best combination
.	\"	 to use, was to set .LL to 4.85i, then use .ll
.	\"	 for the needed tweaks, then restore all of them
.	\"	 at the end. Groffed with 1.18 on an i86, this thing
.	\"  works and gives a very good reproduction.
.nr LL 4.85i
.Ah "Output Line Numbering"
.ix [troff] formatter, output line~numbering %key troff formatter, output line numbering
.br
Do you remember the treatment of the
.CW proof
shell
script in Chapter 12?
It was such a long example that it required line numbers
that could be referred to later in the text.
The
.CW nroff
and
.CW troff
programs provide requests
that allow you to automatically number output lines
as was done in that example.
.ti +.3i
The
.CW .nm
.I number  ) (
.ix [.nm] request %key nm request
.ix [troff] formatter, [.nm] request %key troff formatter, [.nm] request
request turns numbering
on or off.
The request:
.Ps
\&.nm [\(+-]\f[I]N\fP
.Pe
will turn numbering on, with the next line numbered
.I N  .
For example, the next paragraph is numbered with
.CW ".nm 1"  .
.sp
.nm 1
.ti +.3i
A 3-digit arabic number followed by a space is placed at the start of each line.
(Blank lines and lines containing formatter requests do not count). The line length is
not changed, so this results in a protruding right column, as in this paragraph. You may
need to decrease the line length (by \f[C]\\w'000 'u\fP ) if you are numbering filled text
rather than an example in no-fill mode. (Be sure to notice the space following the three
zeros). We'll do that from now on, so only the current paragraph will protrude.
.ti +.3i
.nr pN \w'000 'u
.ll \n(.lu-\n(pNu
.nm 1 2
There are several optional arguments as well: a step value,
the separation between the number and the beginning of the
line, and an indent that will be added to the line.
By default, the step value is 1, the separation is 1,
and the indent is 0.
For example, if you specified:
.sp .5v
\f[C]	.nm 1 2\fP
.sp .5v
every second line would be numbered, as was done at the start
of this paragraph.
.br
.nn 4
.	\" Note:
.	\" Without adjusting the page offset, when .nn is
.	\" executed, the left margin returns to the normal
.	\" point.  In the original, the left margin stayed
.	\" lined up with the text that had been numbered
.po \n(.ou+\n(pNu+4p
.ti +.3i
The \f[C].nn\fP
.ix [.nn] request %key nn request
.ix [troff] formatter, [.nn] request %key troff formatter, [.nn] request
.ix [troff] formatter, suspending line~numbering %key troff formatter, suspending line numbering
.I "not numbered" ) (
request allows you to
temporarily suspend numbering for a specified number of lines,
as was done for this paragraph using the request \f[C].nn 4\fP .
The specified number of lines is not counted. This could be
useful if you were interspersing numbered lines of code with
a textual discussion.
.br
.po \n(.ou-\n(pNu-4p
.ti +.3i
To turn numbering off entirely, use \f[C].nm\fP  without any
arguments. We'll do that now.
.br
.ll \n(.lu+\n(pNu
.nm
.ti +.3i
The last line number used by \f[C].nm\fP  is saved in the
register \f[C]ln\fP , and it is possible to restart numbering
relative to that number by preceding the initial line
number you give to \f[C].nm\fP  with a + or a -. For example,
to restart numbering at exactly the point it was turned
off, you can use this request:
.sp .5v
\f[C]	.nm +0\fP
.sp .5v
.ll \n(.lu-\n(pNu
.nm +0
Let's do that now. As you can see, numbering resumes just where it left off, with
the same step value and indent, as if no intervening lines had been present. After
this line, we'll turn numbering off entirely.
.sp .5v
.nm
.ll \n(.lu+\n(pNu
.ti +.3i
When using \f[C].nm\fP  in fill mode, you have to watch for
breaks.
Because \f[C].nm\fP  itself does not cause a break, it may
take effect on the output line above where you expect it.
You may need to force an explicit break before \f[C].nm\fP
to make sure numbering starts on the next line.
.Ah "Change Bars"
.ix change bars
.ix [troff] formatter, change~bars %key troff formatter, change bars
.mc | \" turn on for this paragraph, it is the example
The
.CW .mc
.I "margin character"  ) (
.ix [.mc] request %key mc request
.ix [troff] formatter, [.mc] request %key troff formatter, [.mc] request
request allows you to
print \(lqchange bars\(rq
or other marks in the margin, as was
done with this paragraph.
This is especially useful if you are revising a document,
and want to indicate to reviewers which sections have
changed.
.mc \" turn off for now.
.ti +.3i
You can specify any single character as the margin
character\(emso don't restrict yourself to
change bars when thinking
up uses for this request. For example, you could
use an arrow, or the left-hand character
.CW \e(lh  ) (
to
draw attention to a particular point in
.mc \(lh \" again turn on for the example
.mc      \" and turn it back off. This marks a single
.			\" output line, as the original had/
the text, like this.
(These characters are oddly named.
The right-hand character
.CW \e(rh  ) (
is a left-hand
that points to the right
(\(rh);
the left-hand character
.CW \e(lh  ) (
is a right hand that points to the left
.	\" the horizontal positioning requests were needed to keep
.	\" the glyph from overwriting the previously drawn
.	\" characters.
.	\"
.	\" You sure about that? It went walkabout on my system.
.	\" I'll comment out the original, just in case we need it later.
.	\" (\h'9p'\(lh\h'-9p').
.	\"
.	\" Yes, I'm sure. But, this apparently isn't a groff
.	\" problem.  Remember, when I first sent this to you
.	\" I said I hadn't _printed_ it, only used gv to
.	\" proof it.  After printing it, I get the same
.	\" results you do (i.e. correct) with the (\(lh).
.	\" So, I _CAN'T_TRUST_MY_DISPLAY_
(\(lh).
These characters are mapped onto arrows on some
output devices).
.ti +.3i
You can control the distance the mark character appears
from the margin with an optional second argument.
If no argument is given, the previous value is used: if
there is no previous value, the default distance is
.CW 0.2i
in
.CW nroff
and
.CW 1m
in
.CW troff  .
.page 477
.ti +.3i
Incidentally, on many UNIX systems, there is a version of
.CW diff  ,
called
.CW diffmk  ,
that will compare two
versions of a file, and produce a third file containing
.CW .mc
requests to mark the differences.
Additions and changes are marked with a bar in the margin,
as shown previously.
Deletions are marked with an asterisk.
.ti +.3i
In our business, we find this very useful for producing
interim drafts of technical manuals.
We archive the first draft of the manual, as it was turned
in to our client.
Then, after review changes have been incorporated, we use
.CW diffmk
.ix [diffmk] command %key diffmk command
to produce an annotated version for second
draft review:
.Ps
$ \f[CB]diffmk draft1 draft2 marked_draft\fP
$ \f[CB]ditroff ... marked_draft\fP
.Pe
This could also be done by manually inserting
.CW \&.mc
requests as the edits were made.
But, as stated in Chapter 12, why not let the computer
do the dirty work?
.	\" Note:
.	\" Thus ends the two special sections where the line
.	\" length was set to 4.85i to get the original effects.
.nr LL 6i
.LP 0
.Ah "Form Letters"
.ix [troff] formatter, form~letters %key troff formatter, form letters
.ix form letters
No formatter would be complete without the ability to create
form letters that merge existing text with externally supplied
data.
The
.CW nroff
and
.CW troff
programs are no exception
in providing requests to handle this type of problem.
.PP
The
.CW .rd
.ix [.rd] request %key rd request
.ix [troff] formatter, [.rd] request %key troff formatter, [.rd] request
.I read  ) (
request allows you to read from
standard input.
.ix [troff] formatter, reading standard~input %key troff formatter, reading standard input
This request prints a prompt on the standard error (the
user's terminal) and reads input up to a pair of newlines.
For example, you could have a form letter constructed
like this:
.Ps
\&.nf
\&.rd Enter_the_person's_name
\&.rd Enter_the_company
\&.rd Enter_the_street
\&.rd Enter_the_city,_state,_and_zip
\&.sp
\&.fi
Dear
\&.rd Enter_the_salutation
\&.sp
\&	.
\&	.
\&	.
.Pe
Unfortunately,
.CW \&.rd
terminates the prompt at the first
space, and does not recognize quotation marks to delimit an
entire string as the prompt.
As a result, for a wordy prompt, you must tie the string
together using an unobtrusive character like an underscore,
as was done here.
.PP
Here's what would happen when this letter is formatted:
.Ps
$ \f[CB]nroff letter | lp\fP
Enter_the_person's_name:	\f[CB]Tim O'Reilly\fP
Enter_the_company:	\f[CB]O'Reilly & Associates, Inc.\fP
.page 478
Enter_the_street:	\f[CB]981 Chestnut Street\fP
Enter_the_city,_state,_and_zip:	\f[CB]Newton, MA 02164\fP
Enter_the_salutation:	\f[CB]Tim:\fP
.Pe
Note that a colon is appended to the prompt, and that the
.I RETURN
key must be pressed twice after each response.
If no prompt is specified,
.CW \&.rd
will ring the
terminal bell when it expects input.
.PP
In addition, the input need not come from the keyboard.
It can come from a pipe or from a file.
There are two other requests that come in handy to create
a true form letter generation capability.
.PP
The
.CW \&.nx
.ix [.nx] request %key nx request
.ix [troff] formatter, [.nx] request %key troff formatter, [.nx] request
.I next  ) (
request causes the formatter to
switch to the specified file to continue processing.
Unlike the
.CW \&.so
request discussed in Chapter 4, it
doesn't return to the current file.
The
.CW \&.ex
.ix [.ex] request %key ex request
.ix [troff] formatter, [.ex] request %key troff formatter, [.ex] request
request tells the formatter to quit.
.PP
You can put the requests together with
.CW \&.rd  .
First, create a list of variable data (like names and
addresses) either in a file or as the output of a database
program.
Then pipe this file to the formatter while it is processing
a letter constructed like this:
.Ps
\&.nf
\&.rd
\&.rd
\&.rd
\&.sp
\&.fi
Dear
\&.rd
.sp 1v
	\f[I]Body of letter here\fP
.sp 1v
Sincerely,
.sp 2v
Jane Doe
\&.bp
\&.nx letter
.Pe
The
.CW \&.nx
request at the end of the form letter causes
the file to reinvoke itself when formatting is complete.
Assuming that the standard input contains a sequence of name,
street, city
.I "et al"  ), (
and salutation lines, one line
for each
.CW \&.rd
request, and address block, in the data
file, that are each separated by pairs of newlines, you can
generate an endless sequence of letters.
.PP
However, be warned that formatting will continue in an
endless loop, even when the standard input has run out
of data, unless you terminate processing.
This is where
.CW \&.ex
comes in.
By putting it at the end of the list of names coming from
standard input, you tell the formatter to quit when all
the data has been used.
.page 479
.PP
The command line to produce this marvel (assuming a form
letter in a file called
.CW letter
and a list of names
followed by an
.CW \&.ex
request in a file called
.CW names
would be:
.Ps
$ \f[CB]cat names | nroff letter | lp\fP
.Pe
or:
.Ps
$ \f[CB]nroff < names | lp\fP
.Pe
It is possible to imagine a more extensive data entry facility,
in which a variety of blank forms are constructed using
.CW troff  ,
and filled in with the help of a data entry
front end.*
.FS
*For this idea, I am indebted to a posting on
Usenet, the UNIX bulletin board network, by Mark Wallen
of the Institute for Cognitive Science at UC San Diego
(Usenet Message-ID: <203@sdics.UUCP>, dated June 13, 1986)
.FE
To generalize the facility, you could associate the various
fields on the form with number register or string names, and
then interpolate the number or string registers to actually
fill in the form.
.PP
This approach would allow you to reuse repeated data items
without having to query for them again.
Even more to the point, it would allow you to construct the
data entry facility with a program other than
.CW troff
(which would allow features such as data entry validation
and editing, as well as increased speed).
The data entry front end would simply need to create as
output a data file containing string and number register
definitions.
.Ah "Reading in Other Files or Program Output"
In addition to
.CW \&.nx
don't forget the
.CW \&.so
.ix [.so] request %key so request
.ix [troff] formatter, [.so] request %key troff formatter, [.so] request
.I source  ) (
request, which allows you to read in the
contents of another file, and then return to the current
file.
.PP
We've mentioned this request briefly in the context of
reading in macro definitions.
However, you can also use it to read in additional text.
In our business, we've found it very useful in certain
types of manuals to break the document into many separate
files read in by
.CW \&.so  .
For example, we often need to write alphabetically-ordered
reference sections in programming manuals.
Unfortunately, the developers often haven't finalized their
procedure names.
If the section consists of a list of
.CW \&.so
requests:
.Ps
\&.so BEGIN_MODULE
\&.so BUFFER
\&.so CONFIGURE
\&	.
\&	.
\&	.
.Pe
the job of reorganization is trivial\(emall you need
to do is change the filenames and realphabetize the list.
.page 480
.PP
The only caution, which was mentioned previously in
Chapter 8, is that you can't include data that must be
handled by a preprocessor, such as tables and equations.
.ix [eqn] preprocessor, problems~with [.so] request %key eqn preprocessor, problems with [.so] request
.ix [pic] preprocessor, problems~with [.so] request %key pic preprocessor, problems with [.so] request
.ix [tbl] preprocessor, problems~with [.so] request %key tbl preprocessor, problems with [.so] request
A quick look at the command line:
.Ps
$ \f[CB]tbl\fP \f[I]file\fP  \f[CB]| nroff\fP
.Pe
will show you that the preprocessor is done with the file
before the formatter ever has a chance to read in the files
called for by the
.CW \&.so
request.
Some systems have a command called
.CW soelim
that reads
in the files called for by
.CW \&.so  .
If you use
.CW soelim
.ix [soelim] command %key soelim command
to start the file into the
pipeline, there is no problem.
.PP
One useful tip: if you are using
.CW soelim  ,
but for some
reason you
.I don't
want
.CW soelim
to read in a file
because you would rather it were read in by
.CW troff  ,
use
.CW \&'so
rather than
.CW \&.so
to read in the file.
The
.CW soelim
command will ignore the
.CW \&'so
request.
.PP
Another interesting request is
.CW \&.sy .
.ix [.sy] request %key sy request
.ix [troff] formatter, [.sy] request %key troff formatter, [.sy] request
.ix [troff] formatter, executing~system~commands~from %key troff formatter, executing system~commands~from
This request executes a specified system command.
If the command has output, it is not interpolated into the
.CW troff
output stream, nor is it saved.
However, you can redirect it into a file, and read that
file into
.CW troff
with
.CW \&.cf
(or with
.CW \&.so  ,
if you want it processed by
.CW troff
instead of sent
directly to the output stream).
.ix %end [troff] formatter %key troff formatter
