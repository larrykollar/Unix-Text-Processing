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
.\" The following taken from Manas Laha's appendix B:
.nr iN 15   \" Spaces to indent .IP paragraph
.
.page 635
.chapter D "Format of \f(CWtroff\fP Width Tables" Appendix 1
.
.\" Lines appears far longer in this version than in printed copy.
.\" /Andreas 2002-10-02
.
.ix %begin [/usr/lib/font] %key /usr/lib/font
.ix %begin [/usr/lib/font], [DESC] tile %key /usr/lib/font, [DESC] tile
.ix %begin [DESC] file %key DESC file
.ix %begin fonts, contents~of font~files
.
.LP
As discussed in Chapter 4,
.CW troff
uses width tables stored in the directory
.CW /usr/lib/font
to determine how to place text on the page.
To do this, it needs to know how wide each character is.
.PP
For each type of
.CW troff
output device supported by your system, there should be a directory
called
.CW /usr/lib/font/dev\fIxx ,
where
.I xx
is the name of the device.
For example, on our system:
.Ps
$ \f(CBls -F /usr/lib/font\fP
devlj/
devps/
.Pe
Within each of these directories resides an overall device description
file, called
.CW DESC ,
and individual font files for the fonts on your system.
These files exist both in ASCII and binary form.
The binary files are created from the ASCII versions using a utility
called
.CW makedev ,
and have the suffix
.CW .out .
.PP
On our system, here's what the font directory for the HP LaserJet
contains:
.\" .Rn "Book errata: it says devl, you'd think devlj from above.
.\" I think it's actually supposed to say "devl", but I have
.\" nothing supporting this theory.  The "devlj" devices are,
.\" AFAIK, fairly recent.  I'm leaving it as it is, until
.\" someone with some more background on this confirms that it
.\" should [not] be changed.  /Andreas 2002-10-02
.
.\" Another thing, however, is the inconsistent capitalisation
.\" of the word "Laserjet"/"LaserJet".  I'm changing it to
.\" "LaserJet" on the line above.  /Andreas 2002-10-02
.
.\" .Rn "Book errata: poorly expanded columns.
.\" Yes.  Fixed (bug in paper copy).  /Andreas 2002-10-02
.Ps
$ \f(CBls /usr/lib/font/devl\fP
B	    DESC	    I		S
B.out	    DESC.out	    I.out	S.out
CW	    HB		    R		TY
CW.out	    HB.out	    R.out	TY.out
.Pe
.
.Ah "The \f(CBDESC\fP File
.LP
The
.CW DESC
file contains an overall description of the output device, including its
resolution in dots per inch, the paper size, the fonts that will be
mounted by default, the available point sizes, and a complete list of
all the
.CW troff
special character names supported on that device.
.
.page 636
.
.PP
A
.CW DESC
file might look something like the following example.
.Ps
# HP LaserJet
fonts 6 R I B HB CW S
sizes 7 8 10 12 14 17 22 27 0
res 300
hor 1
vert 1
unitwidth 12
paperwidth 2400
paperlength 3300

charset
\e|  \e^  \e-
fi fl ff Fi Fl
br vr ul ru
bu sq em hy 14 12 34 aa ga
       .
       .
       .
sc gr no is pt es mo
dd rh lh bs or ci
lt lb rt rb lk rk bv lf rf lc rc
.Pe
The following keywords are used in the
.CW DESC
file.
.\" .Rn "Markup problem: This list should be indented.
.\" Fixed using .RS ... .RE.  /Andreas 2002-10-02
.RS
.IP \f(CWfonts\fP \n(iN
.ix fonts, mounted
The number of fonts to be mounted for the device, followed by a list
of the font names (maximum is ten).
The user can request other fonts from within a document.
However, the fonts listed here will be \(lqmounted\(rq (by analogy
with the CAT typesetter), and can by referenced by position
.CW \ef1 , (
.CW \ef2 ...)
as well as by name.
.IP "\f(CWsizes\fP" \n(iN
The sizes in which the various fonts are available.
.IP "\f(CWres\fP" \n(iN
The resolution of the output device, in dots per inch.
.IP "\f(CWhor\fP" \n(iN
The minimum number of units of resolution that the device can move in a
horizontal direction.
.IP "\f(CWvert\fP" \n(iN
The minimum number of units of resolution that the device can move in a
vertical direction.
.IP "\f(CWunitwidth\fP" \n(iN
The point size at which character widths are specified in the other
files.
.\" .Rn "Suggestion: The maths parts would look better with eqn, e.g. `x'.
.\" I'm not sure eqn would work very well inline in a place like
.\" this.  I'm changing the 'x' into "times", hoping everyone's
.\" happy.  /Andreas 2002-10-02
.IP "\f(CWpaperwidth\fP" \n(iN
The width of the page in units of resolution (e.g., 8 inches times 300 =
2400, the width for the LaserJet, because it forces a \(12-inch
margin).
.
.ix %end [DESC] file %key DESC file
.page 637
.
.IP "\f(CWpaperlength\fP" \n(iN
The length of the page in units of resolution (e.g., 11 inches times 300
= 3300, the length for the LaserJet).
.IP "\f(CWbiggestfont\fP" \n(iN
The maximum number of characters in a font.
.IP "\f(CWcharset\fP" \n(iN
The list of character names that are supported on this output device.
The keyword should be on a line by itself;  the list of characters
starts on the next line.
.IP "\f(CW#\fP" \n(iN
Begins a comment.
.RE
.
.Ah "Font Description Files
.ix %begin [/usr/lib/font], font~description files %key /usr/lib/font, font description files
.LP
For each font listed on the
.CW fonts
line of the
.CW DESC
file, there should be a font file with the same name.
The font file contains a list of all the characters in the font, along
with the width and other associated information.
.PP
A font file looks like this:
.Ps
name R
internalname Roman

charset
      4    0    0
      8    0    0
vr    0    3    13
ru    25   0    17
          .
          .
          .
A     42   2    65
B     35   2    66
C     37   2    67
          .
          .
          .
w     40   0    119
x     28   0    120
y     28   1    121
z     25   0    122
          .
          .
          .
.Pe
Four columns, separated by tabs, are listed for each character.
.
.ix %end [/usr/lib/font], [DESC] tile %key /usr/lib/font, [DESC] tile
.page 638
.
.PP
The first column lists the character name\(emeither the letter, digit,
or symbol, or a two-character
.CW troff
special character name defined in the
.CW charset
section of
.CW DESC .
.PP
The second column contains the width of the character in output device
units.
The width is the width of the character at the point size specified by
the
.CW unitwidth
keyword in
.CW DESC .
For example, if
.CW unitwidth
is 12, then from the portion of the table just shown, we know that a
12-point
.CW A
in the roman font is 42 units wide.
The
.CW troff
formatter determines the width at other point sizes by scaling the
.CW unitwidth
size.
.\" .Rn "Book errata: `an descender'
.\" Yes, I saw this while reading my copy of the book the first
.\" time.  I'll delete the offending 'n'.  /Andreas 2002-10-02
.PP
The third column describes the character type\(emthat is, whether it is
a descender (1), ascender (2), both (3), or neither (0).
.PP
The fourth column contains the typeset code for the character.
This code is the value that the output device will recognize to generate
the character.
This information is obtained from the typesetter or laser printer
vendor.
The code can be in decimal or octal form.
(Octal is specified by a leading zero.)
.PP
In general, whomever supplied the driver for the output device will
provide you with appropriate width tables for the supported fonts.
However, you may have access to other public domain fonts for output
devices that support downloadable raster fonts.
In this case, you may need to build your own tables.
.PP
In addition, you may want to \(lqtune\(rq tables by adjusting the widths
slightly if you find that the character spacing is poor.
Creating a font table from scratch requires a magnifying glass, a
micrometer, a good eye, and a lot of patience.
.
.Ah "Compiling Font Files
.ix [troff] formatter, compiling font~files %key troff formatter, compiling font files
.LP
After you are satisfied with your width tables, they need to be compiled
using the
.ix [makedev] command %key makedev command
.CW makedev
utility:
.Ps
$ \f(CBmakedev DESC\fP          \fRCompile all fonts in \fPDESC
.Pe
Running
.CW makedev
on
.CW DESC
will compile all of the fonts listed on the
.CW fonts
line in that file.
You can compile a font that is not included in
.CW DESC
by specifying its name on the command line:
.Ps
$ \f(CBmakedev B\fP             \fRCompile the bold font\fP
.Pe
.
.Ah "Font Usage Limitations
.LP
The user is not restricted to using the \(lqmounted\(rq fonts that have
been listed in
.CW DESC .
Any font supported by the output device, and for which a compiled width
table exists, can be referred to from within a document.
For example, if you had a Palatino font family named
.CW PA ,
.CW PB ,
and
.CW PI ,
there should be files called:
.
.ix %end [/usr/lib/font], font~description files %key /usr/lib/font, font description files
.page 639
.
.Ps
        PA.out    PB.out    PI.out
.Pe
One problem that is sometimes encountered is that
.CW troff
has problems if a font that is used in this way is larger (in absolute
file size) than the largest of the mounted fonts specified in
.CW DESC .
The
.CW troff
formatter only allocates enough memory for the largest font in
.CW DESC .
If you encounter this problem, you can either strip unneeded characters
out of the font, pad a font in
.CW DESC ,
or add the large font that is giving you trouble to
.CW DESC .
.ix %end [/usr/lib/font] %key /usr/lib/font
.ix %end fonts, contents~of font~files
