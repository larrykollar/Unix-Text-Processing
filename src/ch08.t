.ig
	Typed by: Michael Hobgood
	Marked up by: Michael Hobgood
	Proofed on: 13 Oct 2002
..
.so utp.mac
.utp
.Se 8 "Formatting with \f[CB]tbl\fP" "Chapter" 1
.LP 0
.page 203
.ix %begin [tbl] preprocessor %key tbl preprocessor
Some information is best presented in tabular format, that is,
displayed in rows and columns.
You can structure data in columns using tabs, but that can
be difficult, especially if the table consists of long lines
of text.
The
.CW tbl
preprocessor was designed to make it easier to prepare
complicated tables, such as the following.
.sp 5p
.TS
center, box;
c s s
c s s
c c c
l r r.
Production of Audio Equipment
(units: 1000 sets)
_
Product	1984	1985
_
General radio	8,895	8,770
Clock radio	5,467	6,500
Radio/cassette	29,734	27,523
Tape deck	11,788	14,300
Car radio	9,450	10,398
Car stereo	15,670	17,456
.TE
.sp 2p
.PP
With
.CW tbl ,
you can center, left justify, and right justify columns of
data or align numeric data within a column.
You can put headings that span one or more columns or rows,
and draw horizontal and vertical lines to box individual
entries or the whole table.
An entry may contain equations or consist of several lines
of text, as is usually the case with descriptive tables.
A table can have as many as 35 columns and essentially an
unlimited number of rows.
.PP
When you use
.CW tbl ,
you should have an idea or, better still, a written design of
the table.
Then, using a few
.CW tbl
specifications, you can define how a formatted table
should look.
The data is entered row by row; each column is separated
by ordinary tabs.
.PP
For example, the
.CW tbl
description for the previous table looks like this:
.page 204
.Ps
\&.TS
center,box;
c s s
c s s
c c c
l r r.
Production of Audio Equipment
(units:1000 sets)
_
Product		1984		1985
_
General radio		8,895		8,770
Clock radio		5,467		6,500
Radio/cassette	29,734	27,523
Tape deck		11,788	14,300
Car radio		9,450		10,398
Car stereo		15,670	17,456
\&.TE
.Pe
.ix [tbl] preprocessor, table specifications %key tbl preprocessor, table specifications
When
.CW tbl
processes the specifications, it calculates all the values
needed to produce the table and passes these values to
.CW nroff
or
.CW troff ,
which formats or outputs the final table.
.PP
In this chapter, we will show you how to use
.CW tbl
to specify the general appearance of a table.
We begin with some very simple examples, then gradually work
up to more complicated ones to show all of
.CW tbl 's
capabilities.
.Ah "Using \f[CB]tbl\fP"
The
.CW tbl
description can be written in a file or as part of a larger
file that contains other tables and text.
You can format a table in a file using the
.CW tbl
command as in the following:
.ix [tbl] preprocessor, invoking %key tbl preprocessor, invoking
.Ps
$ \f[CB]tbl\fP\fI file\fP \f[CB]|\fP \f[CB]troff\fP
$ \f[CB]tbl\fP\fI file\fP \f[CB]|\fP \f[CB]nroff\fP
.Pe
The
.CW tbl
command writes its results to standard output.
Because you will probably not be interested in the generated
formatting requests, you would normally pipe the output to
.CW nroff
or
.CW troff
and then to a printer.
.PP
The
.CW tbl
command also accepts a list of filenames as input and processes
them one by one in the order in which they are named on the
command line.
If you don't give any filenames,
.CW tbl
reads from standard input.
The standard input may also be read in the middle of a list
of files by typing a minus sign at the desired place.
.PP
If you're using a line printer that doesn't have fractional
or reverse line motions, use the
.CW -T
option of
.CW nroff
and give the type of output device you're using.
This is important when you're using
.CW nroff
together with
.CW tbl
to create boxed tables.
For example, if you're using a regular line printer, the
option should read
.CW -Tlp .
You
.page 205
must also pipe the
.CW nroff
output to a program called
.CW col ,
which filters the reverse linefeeds.
The command line for a table with boxes would then read:
.Ps
$ \f[CB]tbl\fP\fI file\fP \f[CB]| nroff -Tlp | col\fP
.Pe
.Bh "\f[CB]tbl\fP with \f[CB]eqn\fP"
.ix [eqn] preprocessor, using~[tbl]~with %key eqn preprocessor, using [tbl]~with
When you have equations within your table and you use the
.CW eqn
preprocessor to format them, invoke
.CW tbl
before
.CW eqn .
The
.CW tbl
command usually executes faster because
.CW eqn
normally produces a larger amount of output.
.ix [tbl] preprocessor, using~eqn~with %key tbl preprocessor, using eqn~with
To use
.CW eqn
with
.CW tbl ,
use the following command line:
.Ps
$ \f[CB]tbl\fP\fI file\fP \f[CB]| eqn | troff\fP
.Pe
.PP
There is a possible complication that can occur with any of
the preprocessors (\c
.CW "tbl,eqn,"
or
.CW pic ).
If you read in subsidiary files with the
.CW .so
request, those files will never be passed through the
preprocessor, since the
.CW .so
request has not been encountered yet by the preprocessor.
Some UNIX systems support a program called
.CW soelim,
which works just like
.CW cat ,
except that it reads in files called by
.CW .so
requests.
If any subsidiary files contain data that must be processed,
start your command line with
.CW soelim :
.Ps
$ \f[CB]soelim\fP\fI file\fP \f[CB]| tbl | eqn ... | nroff\fP
.Pe
.Ah "Specifying Tables"
A table is always indicated by a
.CW .TS
(\c
.I "table start" )
at the beginning of the table description and a
.CW .TE
(
.I "table end )
at the end.
The general format of each table looks like this:
.ix %begin [tbl] preprocessor, data %key tbl preprocessor, data
.ix %begin [tbl] preprocessor, format options %key tbl preprocessor, format options
.ix %begin [tbl] preprocessor, global format options %key tbl preprocessor, global format options
.Ps
\&.TS
\f[I]global options line;
format section.
data\fP
\&.TE
.Pe
These delimiters serve two functions.
First, they signal to
.CW tbl
the beginning and end
of the table description.
The
.CW tbl
program processes the table, and enables formatting requests
into the text of the table.
.ix [tbl] preprocessor, table~start macro %key tbl preprocessor, table start macro
.ix [tbl] preprocessor, table~end macro %key tbl preprocessor, table end macro
The
.CW .TS
and
.CW .TE
lines remain after processing by
.CW tbl .
This allows them to be used as macro calls by
.CW nroff
and
.CW troff .
Both
.CW ms
and
.CW mm
define these macros; however, an enterprising user can
redefine them, and surround a table with consistent
formatting effects.
If the macros are undefined,
.CW tbl
will not suffer in any way because the use of
.CW .TS/.TE
as delimiters is separate from their secondary use as macros.
.PP
As you can see from the general format,
.CW tbl
sees a table in terms of three distinct parts:
.page 206
.RS
.Ls N
.Li
The overall layout of the table described in the
.I "global options line" .
For example, this line describes whether the table is to
be centered on the page or made as wide as the rest of the
document.
The global options line is optional.
.Li
The layout of each column in the table described in the
.I "format section" .
For example, in this section, you specify whether a column
is to be left or right justified.
The format section is required and may contain one or more
format lines.
.Li
The actual text or numbers,
.I data ,
to be entered in the table.
.Le
.RE
.ix %end [tbl] preprocessor, data %key tbl preprocessor, data
.Ah "A Simple Table Example"
.ix [tbl] preprocessor, simple table~example %key tbl preprocessor, simple table example
Let's start with a simple table like the following to show the
different parts of the
.CW tbl
description:
.RS
.TS
tab (@);
c l.
.ft C
1@User console
2@Monochromatic graphics terminal
3@Color graphics terminal
4@Line printer
5@Digitizer
6@Laser printer
7@Unallocated
.ft R
.TE
.RE
You can lay out this table using the following
.CW tbl
requests:
.RS
.TS
l l.
.ft C
\&.TS	\f[I]Table Start macro\fP
tab (@);	\f[I]Options line\fP
c l.	\f[I]Format line\fP
1@User console
2@Monochromatic graphics terminal
3@Color graphics terminal
4@Line printer
5@Digitizer	\f[I]Table entries\fP
6@Laser printer
7@Unallocated
\&.TE	\f[I]Table End macro\fP
.TE
.RE
Now let's see what these lines mean:
.RS
.Ls N
.Li
The
.CW .TS
at the beginning says that a table follows.
.Li
The options line applies to the layout of the table as a
whole.
The option
.CW "tab(@)"
means that you will be using the
.CW @
character as a tab character when you input data to the
table.
Normally,
.CW tbl
expects the columns in
.page 207
the table to be separated by actual tabs.
But it is much easier to figure out whether you have the
right number of columns if you use a visible character
that is not part of the data.
This is useful in debugging a table error when the formatted
data doesn't appear in the proper columns.
The options line
.I always
ends with a semicolon (\c
.CW ; ).
.Li
The format section applies to the lines of data in the
table.
Each format line contains a
.I "key letter"
for each column of the table.
The layout of the key letters resembles the layout of actual
data in the table.
.sp .5v
Each format line corresponds to a single line in the table.
However, you can have fewer format lines than lines in the
table.
In this case, the
.I last
line of the description applies to all remaining lines of data.
In our example, we have only one format line, so all lines
in the table will follow this format.
For example:
.br
.ti +5n
\f[CW]c l.\fP
.br
means that there are two columns in each line.
The first column will be centered (\c
.CW c ),
and the second left justified (\c
.CW l ).
The format section ends with a period at the end of the
last format line.
.Li
The data itself.
Each line of data corresponds to one line in the table.
If you have very long input lines, they can be broken into
smaller line segments.
A backslash (\c
.CW \e )
at the end of a line segment means that it continues to the
next line and is part of a longer input line.
Each of the columns in our table is separated by an
.CW @
sign, which we are using in place of a tab character, as we
have specified in the options line.
.Li
A
.CW .TE
signals the end of the table description.
.Le
.RE
.ix %end [tbl] preprocessor, format options %key tbl preprocessor, format options
.Ah "Laying Out a Table"
The global options line is an optional line that controls
the overall appearance of the table.
Normally, a table is positioned on the left-hand side of
the page.
Because the table is probably part of a larger document, you
may want to center the table and enclose it in a box to make
it stand out.
Let's modify the options line in our example to produce this
new layout:
.Ps
\&.TS
center,box,tab(@); \f[I]New options line\fP
c l.
1@User console
2@Monochromatic graphics terminal
3@Color graphics terminal
      \f[I]etc.\fP
.Pe
.page 208
.PP
When formatted, the table looks like this:
.sp 5p
.TS
center,box,tab (@);
c l.
1@User console
2@Monochromatic graphics terminal
3@Color graphics terminal
4@Line printer
5@Digitizer
6@Laser printer
7@Unallocated
8@Pen plotter
9@Raster plotter
10,11,12@Unallocated
.TE
.sp 2p
.PP
Now you know how to use three of the option names:
.CW "center,box,"
and
.CW tab() .
If you use one or more option names, they must be separated
by spaces, tabs, or commas.
The options line, if present, must
.I "immediately follow"
the
.CW \&.TS
line.
There are other options that you can use:
.sp 5p
.RS
.TS
lf(CW) lw (3i).
T{
expand
T}	T{
Make the table as wide as the current line length
T}
.sp 3p
T{
allbox
T}	T{
Enclose each item in the table in a box
T}
.sp 3p
T{
doublebox
T}	T{
Box the whole table with a double line
T}
.sp 3p
T{
linesize (\f[I]n\fP)
T}	T{
Set lines (for \f[CW]box\fP, \f[CW]allbox\fP, and \f[CW]doublebox\fP)
in \f[I]n\fP-point type
T}
.sp 3p
T{
delim (\f[I]xy\fP)
T}	T{
Set \f[I]x\fP and \f[I]y\fP as \f[CW]eqn\fP delimiters. See
.pdfhref L -D Chapter9 -- Chapter 9
for information on the equation preprocessor
\f[CW]eqn\fP.
T}
.TE
.RE
.sp 2p
.PP
The difference between a table that is centered or left justified
and one that is expanded is the amount of space between
columns.
If you specify
.CW center
or the default, the width between columns will be three ens.
If you specify
.CW expand ,
.CW tbl
will expand the width of the overall columns until the table
is as wide as the current margins.
.PP
If the overall width of the table calculated by
.CW tbl
is greater than the width of the text,
.CW nroff/troff
will ignore any positioning option you specify.
The table will be printed as is necessary to fit everything,
even if the table runs to the edge of the paper.
.PP
The
.CW linesize
option changes the width of the lines used in enclosing tables
to a given point size.
Normally, the lines are 10 point.
You can specify an absolute line size, such as
.CW "linesize "(\c
.CW 24 ),
to print thicker box lines, or a relative size, such as
.CW "linesize " (
.CW +14 ),
to produce the same effect.
.ix %end [tbl] preprocessor, global format options %key tbl preprocessor, global format options
.PP
Let's try one more example by enclosing all the data entries
in boxes.
The options line for the table now reads:
.Ps
center,allbox,tab(@);
.Pe
.page 209
The new table would look like this:
.sp 5p
.TS
center,allbox,tab (@);
c l.
1@User console
2@Monochromatic graphics terminal
3@Color graphics terminal
4@Line printer
5@Digitizer
6@Laser printer
7@Unallocated
8@Pen plotter
9@Raster plotter
10,11,12@Unallocated
.TE
.sp 2p
.PP
The
.CW tbl
program isn't very good at keeping boxed tables on one page.
If you have a long table,
.CW tbl
may break it up at an awkward point (for example, placing
the last line of a table on another page).
To keep a boxed table together on one page,
enclose it in a
.CW .DS/.DE
macro pair (in either
.CW ms
or
.CW mm ).
Alternatively, you can give
.CW tbl
the latitude to split a table and print each section with
its own table heading using the
.CW ".TS H"
macro, as you will see later.
.Ah  "Describing Column Formats"
.ix [tbl] preprocessor, column format options %key tbl preprocessor, column format options
Each column in the table is described by a key letter in the
format section.
Key letters are separated from each other by spaces or tabs
for readability.
The basic set of key letters includes:
.ix [tbl] preprocessor, describing column~formats %key tbl preprocessor, describing column formats
.sp 5p
.RS
.TS
l lw(.3i) lw(4.6i).
T{
\f[CW]L\fP or \f[CW]l\fP
T}	T{
T}	T{
Left justify the data within a column.
T}
.sp 3p
T{
\f[CW]R\fP or \f[CW]r\fP
T}	T{
T}	T{
Right justify the data within a column.
T}
.sp 3p
T{
\f[CW]C\fP or \f[CW]c\fP
T}	T{
T}	T{
Center the data within a column.
T}
.sp 3p
T{
\f[CW]S\fP or \f[CW]s\fP
T}	T{
T}	T{
Extend data in the previous column to this column
(horizontal span).
T}
.sp 3p
T{
\f[CW]N\fP or \f[CW]n\fP
T}	T{
T}	T{
Align numbers by their decimal points. If there
are no decimal points align them by the units
digit.
T}
.sp 3p
T{
\f[CW]A\fP or \f[CW]a\fP
T}	T{
T}	T{
Indent characters in the column from the standard
left alignment by one em.
T}
.sp 3p
T{
\f[CW]^\fP
T}	T{
T}	T{
Extend entry from previous row down through this
row (vertical span). Text will be centered between
the specified rows.
T}
.sp 3p
T{
\f[CW]T\fP or \f[CW]t\fP
T}	T{
T}	T{
Also vertical span, but text will appear at the
top of the column instead of midway within the
specified area.
T}
.TE
.RE
.sp 2p
.page 210
.PP
If all columns of the table follow the same format, you need
only one format line for the entire table.
However, not all tables contain the same number of columns
throughout.
For example, you might have a table where the upper half
consists of three columns, and the lower half contains only
two.
.PP
The rule in writing format lines is to specify key letters
for the largest number of columns in the table and carry that
number for all format lines.
That way, if you specify three columns, and you're using only
two, you can use two consecutive tab characters (with
nothing in between) to denote an empty field for the unused
column.
The longest format line defines the number of columns in
the table.
.PP
Suppose you defined four columns in the first format line,
and then defined only three columns in the succeeding lines.
The
.CW tbl
program will still format your table, but it assumes that the
undefined column is left justified.
.PP
In the following sections, we will show some typical
applications of these and other key letters to format
table headings and columns of data.
.Bh "Tables with Headers"
.ix [tbl] preprocessor, headers %key tbl preprocessor, headers
You can think of a table header as an extra row of data
that may or may not have the same format as the actual data.
If the format of the header is different, you must add another
line at the beginning of your format section to describe
the header.
.PP
For example, we'll change the first column in the previous
table to have the header
.I Port
and the second to have the header
.I Device ,
so that we get the following table.
.sp 5p
.TS
center,box,tab (@);
c c
c l.
Port@Device
.sp
1@User console
2@Monochromatic graphics terminal
3@Color graphics terminal
4@Line printer
5@Digitizer
6@Laser printer
7@Unallocated
8@Pen plotter
9@Raster plotter
10,11,12@Unallocated
.TE
.sp 2p
.LP
The relevant lines that produced this table follow:
.Ps
\&.TS
center, box, tab(@);
c c
c l.
Port@Device
\&.sp
1@User console
.page 211
2@Monochromatic graphics terminal
      \f[I]etc.\fP
.Pe
The first line of the format description (\c
.CW "c "\c
.CW c )
says that there are two columns of data, each one centered
within each column.
(Note that there is no period at the end of this line).
Because this is the first line of the format description, it
applies to the first line of our data, which happens to be
the table heading.
This means that the words
.I Port
and
.I Device
will be centered in each column.
The second (and last) format line is the same as in the
previous example and applies to the rest of the table.
Note the period at the end of this line.
.PP
.ix [tbl] preprocessor, spacing~within tables %key tbl preprocessor, spacing within tables
We used
.CW .sp
to produce a blank line after the table header.
The
.CW tbl
command assumes that any non-numeric string preceded by a dot
is a
.CW troff
or
.CW nroff
request and passes it unchanged to the formatter. Thus, you
can vary spacing between rows, or use other
.CW nroff/troff
commands within a table.
.Bh "Tables with Spanned Headers"
.ix [tbl] preprocessor, horizontally spanning headers %key tbl preprocessor, horizontally spanning headers
Our previous table now contains a header for each column.
We now want to have an overall title or header that spans the
width of the table.
As before, you can think of the spanned header as an extra
data line with its own format description.
.PP
We want the header to be only one column, centered across the
whole table like the following.
.sp 5p
.TS
center,box,tab (@);
c s
c c
c l.
Output Device Configuration
.sp .5v
Port@Device
.sp .5v
1@User console
2@Monochromatic graphics terminal
3@Color graphics terminal
4@Line printer
5@Digitizer
6@Laser printer
7@Unallocated
8@Pen plotter
9@Raster plotter
10,11,12@Unallocated
.TE
.sp 2p
.PP
Because we should keep the number of columns the same
throughout the table, we use the
.I span
format option (\c
.CW s )
to tell
.CW tbl
that the entry in a preceding column continues on to the
other columns.
The relevant portion of our table description contains the
following lines:
.Ps
\&.TS
center, box, tab (@);
c s
c c
c l.
.page 212
Output Device Configuration
\&.sp .5v
Port@Device
\&.sp .5v
1@User console
     \f[I]etc.\fP
.Pe
We now have three format lines: the first describes the main
header, the second describes each column header, and the
third applies to the rest of the data in the table.
.Bh "Numeric and Alphabetic Columns"
.ix [tbl] preprocessor, numeric data columns %key tbl preprocessor, numeric data columns
.ix [tbl] preprocessor, alphabetic data columns %key tbl preprocessor, alphabetic data columns
You can align numeric data by the decimal point or the
units digit using the key letter
.CW n
in the format line.
When you use
.CW n ,
numbers in a column will be aligned as follows:
.\" example table
.TS
center;
n.
23.6
155
98.08.6
5.26
12798
0.2365
980.
.TE
.PP
You should never enter non-numeric data in a column that is
designated as
.CW n .
On the other hand, you can enter numbers in columns that are
aligned using any of the other key letters.
The numbers will just be treated as if they were ordinary
alphabetic characters.
Thus, a column of numbers might also be centered, left
justified, or right justified.
.PP
.ix [tbl] preprocessor, equations~within tables %key tbl preprocessor, equations within tables
You should also avoid putting equations in numeric columns
because
.CW tbl
attempts to split numeric format items into two parts.
To prevent this from happening, use the
.CW delim \ (\c
.I xy )
global option.
For example, if the
.CW eqn
delimiters are
.CW $$ ,
a
.CW "delim " (\c
.CW $$ )
option causes a numeric column such as:
.Ps
79.909 $+- .157$
.Pe
to be divided after 79.909 and not after .157.
.PP
Columns designated as
.CW a
are always slightly indented relative to left-justified
columns.
If necessary,
.CW tbl
increases the column width to force this.
Data in an
.CW a
format is positioned so that the widest entry is centered
within the column.
.PP
A note about
.CW n
and
.CW a :
when you have several command lines, do not use both
.CW n
and
.CW a
to format different rows in the same column.
For example, the format lines:
.Ps
r n r
r a r
.Pe
are not allowed.
This is because
.CW n
and
.CW a
share the same number register location in
.CW nroff/troff 's
memory.
.page 213
.PP
The special nonprinting character string
.CW \e&
may be used to override the normal alignment of numeric or
alphabetic data.
For example, if you use
.CW \e&
before a digit, then the digit will line up with the decimal
point and
.CW \e&
will not appear in the output.
The effect of
.CW \e&
is as follows.
.sp 5p
.TS
center, tab (#);
rf(I) cf(I)
lf(CW) nf(CW).
Input Form#Output
_
9.65#9.65
12.4.8#12.4.8
15.\\&7.32#15.\&7.32
2\\&0.9.19#2\&0.9.19
processor#processor
half#half
half\\&#\|\|half\&
.TE
.Bh "Vertically Spanned Columns"
.ix [tbl] preprocessor, vertically spanning columns %key tbl preprocessor, vertically spanning columns
Let's see how the vertical span key (\c
.CW ^ )
is used in a table like the following.
.sp 5p
.TS
center,tab(@);
c c c
^ ^ c
l l n.
Fuel@Substance@kcal/
@@gram mol.  wt.
.sp
Gases@Hydrogen@68.4
\^@Methane@211
\^@Butane@680
\^@Ethane@368
.sp
Liquids@Benzene@782
\^@Ethyl alcohol@328
\^@Methyl alcohol@171
.TE
.sp 2p
.LP
The
.CW tbl
description for this table is:
.ig
	The line for Benzene had 82, not 782 in the
	original. The actual output table however, had 782.
	This was changed to match the table, since later on
	another table is used with the same information
	and it to has 782.
	--Michael Hobgood
..
.Ps
\&.TS
tab(@);
c c c
^ ^ c
l l n.
Fuel@Substance@kcal/
@@gram mol. wt.
\&.sp
Gases@Hydrogen@68.4
\\^@Methane@211
\\^@Butane@680
\\^@Ethane@368
\&.sp
.page 214
Liquids@Benzene@782
\\^@Ethyl alcohol@328
\\^@Methyl alcohol@171
\&.TE
.Pe
There are three lines in the format section: the first two
describe the column headings, and the last describes the
format of the data.
.PP
We can imagine the first line of the header as consisting of
the words
.I "Fuel Substance kcal/"
and the second line as
.I "Fuel Substance gram mol. wt" .
The words
.I "Fuel Substance
don't actually appear twice, but are centered relative to the
two lines that form the third column header.
We use the caret key
.CW (^)
in the second format line to tell
.CW tbl
that these two column names vertically span their respective
columns.
Note the first two data lines that correspond to the first
two format lines.
.PP
We could have also used the same approach to describe the
rest of the data, but this would mean writing seven more
format lines, one for each of the lines of data.
The table really has three columns with the same format
throughout, so you can use just one format line to describe
all of them.
Then you can enter the characters
.CW \e^
in place of a column entry to tell
.CW tbl
that the entry in the previous row for that column
vertically spans this row also.
.PP
You can use the
.CW ^
key letter in the format section and at the same time enter
.CW \e^
in the data section as we did previously.
You don't lose anything by doing this and
.CW tbl
doesn't complain.
.PP
Another way of describing a vertically spanned column is
by using the key letter
.CW t
(or
.CW T )
in the format line.
Any corresponding vertically spanned item will begin at
the top of its range.
Thus, if we specify
.CW t
instead of
.CW ^
in the format line, the words
.I "Fuel and Substance"
will be in line with
.I kcal/ .
.Bh "Drawing Lines in Tables"
.ix [tbl] preprocessor, drawing~lines~within tables %key tbl preprocessor, drawing lines~within tables
Horizontal rules are specified by underscores and by equal
signs entered between the appropriate lines of data.
An underscore on a line by itself entered between two rows
of data produces a single rule running the whole width of
the table.
An equal sign on a line by itself produces a double rule.
.PP
If you want a horizontal rule to be only as wide as the
contents of the column, enter an underscore or equal sign
in that column as part of the data.
The underscore or equal sign must be separated from the other
columns by tabs or the tab character we've specified in
the options line.
To print these characters explicitly, they should be
preceded by a
.CW \e&
or followed by a space before the usual tab or newline
character.
.PP
You can also use these two characters in place of a key
letter in the format line.
If an adjacent column contains a horizontal or vertical
line, the horizontal line is extended to meet nearby lines.
If you enter any data in this column, the data will be
ignored and you will get a warning message.
The following table has a fairly complicated heading:
.page 215
.sp 5p
.TS
center, box, tab(@);
c s s
c c _
^ ^ | c
^ ^ | c
l r n.
1984 (Jan.-July)
Items@Units
@@1984/1983
@@(%)
_
TV@3,889,543@145.7
Color@2,766,004@110.7
B/W@1,123,539@12.5
.TE
.sp 2p
.PP
The
.CW tbl
description for this table looks like this:
.Ps
\&.TS
center,box,tab(@);
c s s
c c _
^ ^ | c
^ ^ | c
l r n.
1984 (Jan.-July)
Items@Units
@@1984/1983
@@(%)
_
TV@3,889,543@145.7
Color@2,766,004@110.7
B/W@1,123,539@12.5
\&.TE
.Pe
As you can see from the preceding description, vertical lines
are drawn by specifying bars
.I "within the format lines" .
A single vertical bar between two key letters draws a single
vertical line between those two columns in the table.
You can enter the bar after the first key letter or before
the second key letter.
A vertical bar to the left of the first key letter or to the
right of the last one produces a vertical line at the edge of
the table.
Two vertical bars (\c
.CW || )
draw a double rule.
.PP
These characters are really more useful for drawing lines
inside the table rather than for manually enclosing a table
in a box because there are global options that
automatically do this.
To draw vertical and horizontal lines in our table
\(lqFuels,\(rq
we modify the relevant format and data lines as follows:
.Ps
c  | |c  |c
^  | |^  |c
l  | |l |n.
Fuel@Substance@kcal/
@@gram mol. wt.
=
Gases@Hydrogen@68.4
       \f[I]etc.\fP
.page 216
_
Liquids@Benzene@782
        \f[I]etc\fP
.Pe
This input produces the following table:
.sp 5p
.TS
box,center,tab(@);
c | |c |c
^ | |^ |c
l | |l |n.
Fuel@Substance@kcal/
@@gram mol. wt.
=
Gases@Hydrogen@68.4
\^@Methane@211
\^@Butane@680
\^@Ethane@368
_
Liquids@Benzene@782
\^@Ethyl alcohol@328
\^@Methyl alcohol@171
.TE
.Bh "Changing Fonts and Sizes"
.ix [tbl] preprocessor, fonts %key tbl preprocessor, fonts
.ix [tbl] preprocessor, point~sizes %key tbl preprocessor, point sizes
.ix fonts, changing ([tbl]) %key fonts, changing (tbl)
.ix point~size, changing ([tbl]) %key point size, changing (tbl)
The
.CW tbl
program assumes that the table is always set in roman type.
However, you can always change the typeface of all entries in
a column to italic or boldface.
You can add one of the following letters after the column
key letter:
.Ps
fb   fB   b   B    \fRBoldface\fP
fi   fI   i   I    \fRItalic\fP
fcw  fCW  cw  CW   \fRConstant width\fP
.Pe
If you want to change the font of only some of the entries, you
should use explicit
.CW nroff/troff
requests rather than specifying the font in the format line.
For example, let's change the headers in the previous table to
boldface and the words
.I Gases
and
.I Liquids
to italic.
The format lines would look like this:
.Ps
c | |cB |cB
^ | |^ |cB
l | |l |n.
.Pe
.I Gases
will be written as
.CW \efIGases\efR
and
.I Liquids
as
.CW \efILiquids\efR .
The effect would be as follows:
.page 217
.sp 5p
.TS
box,center,tab(@);
cB | |cB |cB
^ | |^ |cB
l | |l |n.
Fuel@Substance@kcal/
@@gram mol. wt.
=
\f[I]Gases\fP@Hydrogen@68.4
\^@Methane@211
\^@Butane@680
\^@Ethane@368
_
\f[I]Liquids\fP@Benzene@782
\^@Ethyl alcohol@328
\^@Methyl alcohol@171
.TE
.sp 2p
.PP
The type size in which headings and data are printed is normally
10 points.
You can also change the size of the type by using the key letter
.CW p
and an absolute or relative point size.
To specify a change in size relative to the existing point size,
use a
.CW +
or
.CW -
before the value.
For example, a column specification of
.CW cp12
or
.CW cp+2
will both result in a centered column using 12-point type.
.Bh "Changing the Column Width"
.ix [tbl] preprocessor, column~width %key tbl preprocessor, column width
When you're not using the
.CW expand
option, the normal spacing between any two columns is three ens.
You can change the spacing by specifying a numeric value between
the key letters representing those columns.
The number specifies the separation in ens.
When you're using the
.CW expand
option and you specify a column space, the number is multiplied
by a constant such that the table is as wide as the current line
length.
.PP
If you don't want any spaces between the columns, simply write
0, as in:
.Ps
r0 l
.Pe
which yields:
.sp 5p
.TS
center;
r0 l.
Hydrogen	68.4
Methane	211
Butane	680
.TE
.sp 2p
.PP
These spacings are only nominal spacings.
The data may be so irregular in length that no two columns will
actually appear to be separated by the specified distance.
However, varying the amount of separation between two columns
still leaves
.CW tbl
free to make each column as wide or as narrow as is necessary.
.PP
You can specify a minimum width for any column by entering the
letter
.CW w
(or
.CW W )
after the key letter, followed by the desired width in parentheses.
You can use any unit of measurement recognized by
.CW nroff/troff
when specifying a width dimension.
You can also enter a value without a unit of measurement, in
which case
.CW tbl
assumes the value is in ens.
Thus the format:
.page 218
.Ps
rw (15)
.Pe
specifies a column that is 15 ens wide with the text right
justified within the column, and:
.Ps
lw(2.25i)
.Pe
specifies a left-justified column that is 2.25 inches wide.
.PP
You can also force
.CW tbl
to make the width of particular columns equal by using
the letter
.CW e
(or
.CW E )
after the key letter for those columns.
This allows a group of regularly spaced columns.
.PP
To show that
.CW tbl
can be used for any text that needs to be laid out in columns
(as opposed to tables), we can print the following text:
.sp 1v
.TS
expand, tab(@);
c c c
cew(1.3i) ce ce.
Signature@@
\_@\_@\_
August 31,@J. White@K. Kimura
1987@@
.TE
.sp 1v
using this
.CW tbl
description:
.Ps
\&.TS
expand, tab(@);
c c c
cew(1.3i) ce ce.
Signature@@
\\_@\\_@\\_
August 31,@J. White@K. Kimura
1987@@
\&.TE
.Pe
In the last format line, we specified that all three columns
be 1.3i wide.
Because all columns will be of equal width, we need to specify
the width only once.
.Bh "Other Key Letters"
.ix [tbl] preprocessor, staggered columns %key tbl preprocessor, staggered columns
.ix [tbl] preprocessor, vertical~spacing~within data~blocks %key tbl preprocessor, vertical spacing~within data~blocks
We already showed you some of the more widely used key letters.
Additional features that can be used with the basic set of
key letters are:
.sp 5p
.RS
.TS
l10 lw (4.6i).
T{
\f[C]V\fP or \f[C]v\fP
T}	T{
Used with a number to indicate the vertical line
spacing used within a table entry. Used only with
text blocks (discussed in a later section).
T}
.sp 3p
T{
\f[C]U\fP or \f[C]u\fP
T}	T{
Move the corresponding entry up by one-half line to
produce staggered columns. This doesn't work with the
\f[C]allbox\fP global option.
T}
.sp 3p
T{
.page 219
.ix [tbl] preprocessor, column width %key tbl preprocessor, column width
\f[C]Z\fP or \f[C]z\fP
T}	T{
Ignore the data entry in calculating column width.
This is useful in allowing headings to run across
adjacent columns where spanned headings might be
inappropriate.
T}
.TE
.RE
.sp 2p
.PP
Key letters for a column can be written in any order.
They do not need to be separated, except when you specify both
a point size (\c
.CW p )
and a column separation number.
Thus, a numeric column entered in bold 18-point type with a
minimum column width of 1.5 inches and separated from the next
column by 12 ens can be written as:
.Ps
np18w(1.5i)B 12
.Pe
Two or more format lines can also be written on one line by
separating them with commas.
For example, the format lines:
.Ps
c c c
l l n.
.Pe
can be written as:
.Ps
c c c, l l n.
.Pe
.Ah "Changing the Format within a Table"
.ix [tbl] preprocessor, changing format~within table %key tbl preprocessor, changing format within table
All our examples so far have shown tables that consist of
somewhat complicated headings followed by identical rows of data.
Thus, we can keep the number of format lines comparatively small.
This may not be the case when a table is divided into sections,
each of which has its own heading.
Let's look at the following table (from AT&T's
.I "Documenter's Workbench Text Formatter's Reference" ):
.sp 5p
.TS
center,box,linesize (6), tab(@);
cB s s.
Horizontal Local Motions
_
.T&
cI | cI s
cI | cI s
cI | cI | cI
c | l s.
Function@Effect in
\^@_
\^@troff@nroff
_
\eh'N'@Move distance N
\e(space)@Unpaddable space-size space
\e0@Digit-size space
_
.T&
c | l | l.
\e|@1/6 em space@ignored
\e^@1/12 em space@ignored
.TE
.sp 2p
.PP
It has both a main header and column headers.
The body of the table is divided into two parts.
The upper part contains two columns, and the lower part contains
three.
To format each part correctly, we must enter a command line for
each row of data so that
.CW tbl
can keep track of which rows of the table have which format.
This process is tedious and prone to error.
Fortunately,
.CW tbl
has a way around this.
.PP
To change the format of columns within a table,
.CW tbl
has the table continue request
.CW .T& .
We can change the format of a table at any time by entering
.CW .T&
followed
.page 220
by the new format line(s) and the additional data.
The general format for the
.CW tbl
description is as follows:
.Ps
\&.TS
\f[I]option line;
format section.
data\fP
\&.T&
\f[I]new format section.
data\fP
\&.T&
\f[I]another new format section.
data\fP
\&.TE
.Pe
There are two things we cannot change after a
.CW .T&
request: the global options line and the number of
columns specified.
Our original options line holds for the entire table.
.PP
Let's see how we can use the
.CW .T&
request to produce the previous table:
.Ps
\&.TS
center,box,linesize (6),tab(@);
cB s s.
Horizontal Local Motions
_
\&.T&
cI | cI s
cI | cI s
cI | cI | cI
c | l s.
Function@Effect in
\\e^@_
\\e^@troff@nroff
_
\\eh'N'@Move distance N
\\e(space)@Unpaddable space-size space
\\e0@Digit-size space
_
\&.T&
c | l | l.
\\e|@1/6 em space@ignored
\\e^@1/12 em space@ignored
\&.TE
.Pe
We take the largest number of columns in the table, which is three.
We have two
.CW .T&
requests to break up the table into three parts with their own
format sections.
The first part applies to the main header only.
The second describes the column headers and the
.page 221
three-column segment of the table.
Finally, the lower part applies to the last part of the
table.
.PP
Although you can have hundreds of lines in a table,
.CW tbl
uses only the first 200 lines to set up the table.
.ig
	The original reads: "format changes you make after the
	200th column", but this should be "line".
	--Michael Hobgood
..
Any format changes you make after the 200th line will not
be processed by
.CW tbl .
In this case, you should break up the table into smaller table
segments.
.PP
Should you specify
.CW ".TS H"
but forget to follow it with
.CW .TH ,
some strange things will happen.
One recent instance of this caused the table to be output in a
nearly endless succession of pages.
(In
.CW troff
terms, a diversion created to capture the table heading filled up
with the table instead; this caused the first page break that
triggered the output of the diversion at the top of the next
page; each time the diversion was output, it caused a new page
break and the diversion was output again).
.Ah "Putting Text Blocks in a Column\"
.ix [tbl] preprocessor, putting text~blocks~in~a column %key tbl preprocessor, putting text blocks~in~a column
Some tables consist of column entries that cannot be conveniently
typed as a simple string between tabs.
Descriptive tables, for example, require ordinary flowing text
justified between the margins of the specific column in which it
appears in the table.
These section of flowing text are called
.I "text blocks" .
.PP
Each block of text is preceded by a
.CW T{
and followed by a
.CW T} .
The
.CW T{
marker must be at the end of a line, and the
.CW T}
must be at the start of a line:
.Ps
\&...T{
\f[I]Block of
text\fP
T}...
.Pe
When a text block is included in a row that contains other
columns of data or text, the
.CW T{
that marks the beginning of the text block must appear at the
end of the line in the text.
Even a single blank space following the
.CW T{
will cause the table to fail.
Likewise, the
.CW T}
symbol must always begin the line:
.Ps
\&... \f[I]Data\fP@T{
\f[I]Block of
text\fP
T}@\f[I]data\fP ...
.Pe
This makes it easy for you to revise text when necessary and
also allows you to insert any special
.CW nroff/troff
commands before or after the text block.
.PP
Let's lay out the following table:
.page 222
.ix [vi] editor, pattern~matching characters %key vi editor, pattern matching characters
.sp 5p
.RS
.TS
box,tab(@);
cb s
cI| cI
cw(1.25i) | lw(3.25i).
Some Pattern-Matching Characters in \f[I]vi\fP
_
Special Characters@Usage
_
\f[CW].\fP@T{
Matches any single character
except \f[I]newline\fP.
T}
.sp 1v
*@T{
Matches any number (including zero) of the
single character (including
a character specified by a regular expression)
that immediately precedes it.
T}
.sp 1v
\f[CW][...]\fP@T{
Matches any \f[I]one\fP of the characters enclosed
between the brackets.
A range of consecutive characters can be
specified by separating the
first and last characters in the range with a hyphen.
T}
.sp 1v
\f[CW]$\fP@T{
Requires that the preceding regular
expression be found at the end of the line.
T}
.sp 1v
\\{\f[I]n,m\fP\\}@T{
Matches a range of occurrences of the
single character (including a
character specified by a regular expression)
that immediately precedes
it. \f[I]n\fP and \f[I]m\fP are integers between
0 and 256 that specify how many occurrences to match.
T}
.TE
.RE
.sp 2p
.PP
The
.CW tbl
description of this table is:
.Ps
\&.TS
box,tab(@);
cb s
cI| cI
cw(1.25i) | lw(3.25i).
Some Pattern-Matching Characters in \\fIvi\\fR
_
Special Characters@Usage
_
\\fI.\\fR@Matches any single character\\
except \\fInewline\\fR.

*@T{
Matches any number (including zero) of the
single character (including
a character specified by a regular expression)
that immediately precedes it.
T}

.page 223
[...]@T{
Matches any \\fIone\\fR of the characters enclosed
between the brackets.
A range of consecutive characters can be
specified by separating the
first and last characters in the range with a hyphen.
T}

$@T{
Requires that the preceding regular
expression be found at the end of the line.
T}

\\{\\fIn,m\\fR\\}@T{
Matches a range of occurrences of the
single character (including a
character specified by a regular expression)
that immediately precedes
.ig
	The original has just n and m in the following line.
	However, the actual table has them as italic.
	Fixed the example to match the actual table.
	--Michael Hobgood
..
it. \\fIn\\fR and \\fIm\\fP are integers between
0 and 256 that specify how many occurrences to match.
T}
\&.TE
.Pe
What might confuse you about this source text is that each block
of text occupies two or more lines.
Just think of everything that comes between a
.CW T{
and a
.CW T}
as a single entry that occupies a single column in that row.
It is separated from its neighbors by tabs.
If you keep track of the tabs, you will be able to sort out
quite easily the sequence of columns.
.PP
In the previous description, we specified a minimum width for
each column.
If a width is not given,
.CW tbl
uses the default:
.Ps
\f[I]L * C\fP/(\f[I]N\fP+1)
.Pe
where
.I L
is the current line length,
.I C
is the number of table columns spanned by the text, and
.I N
is the total number of columns in the table.
It is sometimes better to define a column width because
.CW tbl
might make the table too narrow by default.
.PP
You can also use the
.CW nroff/troff
commands
.CW .na
and
.CW .ad
to left justify text blocks if the output doesn't come out fully
justified.
The
.CW tbl
description would be:
.Ps
\&... T{
\&.na
\f[I]Block of
text\fP
\&.ad
T}
.Pe
.page 224
The
.CW nroff
and
.CW troff
formatters can accept only about twenty or thirty small text
blocks in a table without exceeding certain internal limits.
If the limits are exceeded, you will get error messages like
\(lqtoo many string/macro names\(rq
or
\(lqtoo many number registers.\(rq
.PP
In this case, you should divide the table into two or more
independent tables, each with its own
.CW .TS
and
.CW .TE
requests.
The final formatted sections can be
\(lqjoined\(rq
and made to appear
as one table by inserting minus
.CW .sp
requests (such as
.CW ".sp -12p" )
between the sections.
This will cause the formatter to draw them together.
.PP
You can also change the vertical line spacing within a text
block using a key letter followed by
.CW v
(or
.CW V )
and a number.
The number may be a signed digit and is taken as an increase
or decrease from the current vertical spacing.
.Ah "Breaking Up Long Tables"
.ix [tbl] preprocessor, breaking~up long tables %key tbl preprocessor, breaking up long tables
If you have a very long table that will fill many pages, it might
be helpful to break up the table into several smaller ones, with
the main heading reproduced at the top of each page.
Then the reader doesn't have to keep returning to the first page
to see what the columns indicate.
The
.CW tbl
program also automatically breaks a boxed table if it runs over
one page.
.PP
.ix [tbl] preprocessor, repeating table~headers %key tbl preprocessor, repeating table headers
You can use the
.CW ".TS H"
and
.CW .TH
macros to reproduce the original heading at the top of each
page of the table:
.Ps
\&.TS H
\f[I]options;
format section.
main header\fP
\&.TH
\f[I]data\fP
\&.TE
.Pe
The
.CW .TH
(
.I "table header" )
macro is a feature of the
.CW ms
macro package (not
.CW tbl ).
This macro can take the letter
.CW N
as an argument; this causes the table header to be printed
.I "only if it is the first table header on a page" .
This is useful when you have to build a long table from smaller
.CW ".TS H/.TE"
segments.
For example:
.page 225
.Ps
\&.TS H
\f[I]global options;
format section.
main header\fP
\&.TH
\f[I]data\fP
\&.TE
\&.TS H
\f[I]global options;
format section.
main header\fP
\&.TH N
data
\&.TE
.Pe
This causes the table header to appear at the top of the first
table segment.
The header will not appear on top of the second segment when
both segments appear on the same page.
If the table continues to another page, the heading will still
appear at the top of the new page.
This feature is useful when breaking a long complex table
into segments.
.Ah "Putting Titles on Tables"
.ix [tbl] preprocessor, titling tables %key tbl preprocessor, titling tables
The
.CW mm
macro
.CW .TB
can be used to automatically number and title a table.
All tables with
.CW .TB
are numbered consecutively.
The title is centered above the table if it can fit on one line.
If the title is longer than one line, all succeeding lines of
the title are indented to line up with the first character of
the title.
The
.CW .TB
macro is normally used inside a
.CW .DS/.DE
pair.
.PP
The
.CW .TB
macro is not part of
.CW tbl .
Thus, it can be used to generate titles or headers for tables
that are created using only tabs and none of the
.CW tbl
commands.
The general format of the
.CW .TB
macro is:
.Ps
\&.TB [\f[I]title\fP] [\f[I]n\fP] [\f[I]flag\fP]
.Pe
where
.I n
is used to override the normal numbering.
The
.I flag
option can take one of the following values:
.Ps
0   \f[I]n\fP \fRis used as a prefix to the normal table number\fP
1   \f[I]n\fP \fRis used as a suffix to the normal table number\fP
2   \f[I]n\fP \fRreplaces the normal table number\fP
.Pe
If you put the
.CW .TB
macro before the
.CW .TS
macro, the title is placed above the table.
You can also put the title below the table by using the
.CW .TB
macro after
.CW .TE .
.PP
For example, we can modify one of our tables by adding a title
and labeling it as
.I "Table 5" .
We add the following lines before the
.CW .TS :
.page 226
.Ps
\&.DS
\&.TB "Horizontal Local Motions" "5" "2"
\&.sp
.Pe
And we add a
.CW .DE
after the
.CW .TE.
The table now looks like this.
.sp 5p
.TS
center;
l.
\f[B]Table 5.\fP  Horizontal Local Motions
.TE
.TS
center,box,linesize (6), tab(@);
cI | cI s
cI | cI s
cI | cI | cI
c | l s.
Function@Effect in
\^@_
\^@troff@nroff
_
\eh'N'@Move distance N
\e(space)@Unpaddable space-size space
\e0@Digit-size space
_
.T&
c | l | l.
\e|@1/6 em space@ignored
\e^@1/12 em space@ignored
.TE
.sp 2p
.PP
Another useful
.CW mm
macro
is the
.CW .TC
macro.
The
.CW .TC
macro is placed at the end of the file.
When the file is formatted,
.CW .TC
collects the titles of tables that were generated using
.CW .TB
for the table of contents.
Thus, if we had used
.CW .TB
to put headers in our examples, the table of contents might
look like this:
.sp 1v
.Ps
\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\f[R]LIST OF TABLES
.sp 1v
TABLE 1.  Production of Audio Equipment........2
.sp 1v
TABLE 2.  Output Device Configuration...........14
.sp 1v
TABLE 3.  Heating Value of Fuels.....................17\fP
.Pe
.Ah "A \f[CB]tbl\fP Checklist"
.ix [tbl] preprocessor, table~formatting checklist %key tbl preprocessor, table formatting checklist
Most table formatting errors come from specifying too few columns
in the format section, forgetting a tab character between column
entries in a table, or omitting one or more of the characters
that
.CW tbl
expects in a table description.
After you've finished laying out a table, check that you have the
following:
.RS
.Ls B
.Li
a
.CW .TS
with a
.CW .TE
.Li
a
.CW .TH
with a
.CW ".TS H"
.Li
a semicolon at the end of the options line (if there is one)
.page 227
.Li
a period at the end of the last format line (including format
sections with a
.CW .T& )
.Li
in the format section, an item for each column and a format line
for each line of the table
.Li
a tab symbol for each column in each line of the table, except
for the first column when horizontally spanning, and
within text blocks
.Li
for text blocks, a
.CW T{
with every
.CW T}
.Li
no extra blanks after:
.ti +5n
any
.CW .TS ,
.CW .TE ,
.CW ".TS H" ,
.CW .TH ,
or
.CW .T&
.ti +5n
the end of the options and format lines
.ti +5n
any \f[CW]T{\fP or \f[CW]T}\fP
.Li
no periods at the beginning of any
\(lqdata\(rq
text lines
(add a
.CW \e&
before the period, if necessary)
.Li
a space after each table entry of _ and = unless you want the
lines to extend across the column
.Le
.RE
.Ah "Some Complex Tables"
.ix [tbl] preprocessor, complex table~example %key tbl preprocessor, complex table example
Surely, the best way to learn more about
.CW tbl
is to study tables of greater complexity than the ones we've
.ig
	Original has: look at so far.
	This is wrong, should be looked at so far.  Fixed.
	--Michael Hobgood
..
looked at so far.
The
.CW tbl
article by M.E. Lesk in the
.I "UNIX Programmer's Manual"
provides many fine examples of difficult tables.
Look at the formatted tables and try to
\(lqbreak\(rq
the code that produced them.
In this section, you'll find two complicated tables followed by
the
.CW tbl
input for you to decipher.
.PP
The weight table shown in Figure 8-1 is taken from a manual that
describes the safe operation of mobile cranes.
This table was coded by an associate, Daniel Gilly, over several
hours.
The code is listed in Figure 8-2.
Look at how the vertical line indicator (\c
.CW | )
is used between entries to draw a line at the end of each column.
Note also the use of the alphabetic (\c
.CW a )
format specification to produce indented text.
.PP
The financial table shown in Figure 8-3 is adapted from a
prospectus prepared by
.CW troff
users at a large New York law firm.
The code for this table is listed in Figure 8-4.
Note the use of a leader character (\c
.CW \ea )
in the first entry, coupled with a fixed width specification
for the first column, to produce leaders that fill out the
column.
Also, notice how the table headings are printed in a smaller
point size than the rest of the table, using the format
specification (\c
.CW p8 ).
.page 228
.Fs
.ps 8
.vs 10
.TS
center, box, tab(@);
cb s s s
c|c|c|c
^|c|^|c
^|c|^|c
^|c|^|c.
WEIGHTS OF MATERIALS (Based On Volume)
_
Material@Approx.@Material@Approx.
@Weight,@@Weight,
@Lbs. Per@@Lbs. Per
@Cubic Foot@@Cubic Foot
_
.sp .5
.T&
lb|c|lb|c.
METALS@@TIMBER, AIR-DRY@
.T&
a|c|a|c.
Aluminum@165@Cedar@\022
Brass@535@Fir, Douglas, seasoned@\034
Bronze@500@Fir, Douglas, unseasoned@\040
Copper@560@Fir, Douglas, wet@\050
Iron@480@Fir, Douglas, glue@
Lead@710@\0\0laminated@\034
Steel@490@Hemlock@\030
Tin@460@Pine@\030
.T&
lb|c|a|c.
MASONRY@@Poplar@\030
.T&
a|c|a|c.
Ashlar masonry@140-160@Spruce@\028
.T&
a|c|lb|c.
Brick masonry, soft@110@LIQUIDS@
.T&
a|c|a|c.
Brick masonry, com-@@Alcohol, pure@\049
\0\0mon (about 3 tons@@Gasoline@\042
\0\0per thousand)@125@Oil@\058
Brick masonry, pressed@140@Water@\062
.T&
a|c|lb|a.
Clay tile masonry,@@EARTH@
.T&
a|c|a|c.
\0\0average@\060@Earth, wet@100
Rubble masonry@130-155@Earth, dry (about 2050@
Concrete, cinder,@@\0\0lbs. per cu. yd.)@\075
\0\0haydite@100-110@Sand and gravel, wet@120
Concrete, slag@130@Sand and gravel, dry@105
Concrete, stone@144@River sand (about 3240@
Concrete, stone,@@\0\0lbs. per cu. yd.)@120
.T&
a|c|lb|c.
\0\0reinforced (4050 lbs.@@VARIOUS BUILDING@
\0\0per cu. yd.)@150@\0\0MATERIALS@
.T&
lb|c|a|c.
ICE AND SNOW@@Cement, Portland, loose@\094
.T&
a|c|a|c.
Ice@\056@Cement, Portland, set@183
Snow, dry, fresh fallen@\0\08@Lime, gypsum, loose@53-64
Snow, dry, packed@12-25@Mortar, cement-lime,@
Snow, wet@27-40@\0\0set@103
.T&
lb|c|a|c.
MISCELLANEOUS@@Crushed rock (about@
.T&
a|c|a|c.
Asphalt@\080@\0\02565 lbs. per@
Tar@\075@\0\0cu. yd.)@90-110
Glass@160@@
Paper@\060@@
.sp .5
.TE
.Fe " A Complex Table"
.page 229
.Fs
.Ps
\&.ps 8
\&.vs 10
\&.TS
center,box,tab(@);
cb s s s
c|c|c|c
^|c|^|c
^|c|^|c
^|c|^|c.
WEIGHTS OF MATERIALS (Based On Volume)
_
Material@Approx.@Material@Approx.
@Weight,@@Weight,
@Lbs. Per@@Lbs. Per
@Cubic Foot@@Cubic Foot
_
\&.sp .5
\&.T&
lb|c|lb|c.
METALS@@TIMBER, AIR-DRY@
\&.T&
a|c|a|c.
Aluminum@165@Cedar@\\022
Brass@535@Fir, Douglas, seasoned@\\034
Bronze@500@Fir, Douglas, unseasoned@\\040
Copper@560@Fir, Douglas, wet@\\050
Iron@480@Fir, Douglas, glue@
Lead@710@\\0\\0laminated@\\034
Steel@490@Hemlock@\\030
Tin@460@Pine@\\030
\&.T&
lb|c|a|c.
MASONRY@@Poplar@\\030
\&.T&
a|c|a|c.
Ashlar masonry@140-160@Spruce@\\028
\&.T&
a|c|lb|c.
Brick masonry, soft@110@LIQUIDS@
\&.T&
a|c|a|c.
Brick masonry, com-@@Alcohol, pure@\\049
\\0\\0mon (about 3 tons@@Gasoline@\\042
\\0\\0per thousand)@125@Oil@\\058
Brick masonry, pressed@140@Water@\\062
\&.T&
a|c|lb|a.
Clay tile masonry,@@EARTH@
\&.T&
a|c|a|c.
\\0\\0average@\\060@Earth, wet@100
Rubble masonry@130-155@Earth, dry (about 2050@
.page 230
Concrete, cinder,@@\\0\\0lbs. per cu. yd.)@\\075
\\0\\0haydite@100-110@Sand and gravel, wet@120
Concrete, slag@130@Sand and gravel, dry@105
Concrete, stone@144@River sand (about 3240@
Concrete, stone,@@\\0\\0lbs. per cu. yd.)@120
\&.T&
a|c|lb|c.
\\0\\0reinforced (4050 lbs.@@VARIOUS BUILDING@
\\0\\0per cu. yd.)@150@\\0\\0MATERIALS@
\&.T&
lb|c|a|c.
ICE AND SNOW@@Cement, Portland, loose@\\094
\&.T&
a|c|a|c.
Ice@\\056@Cement, Portland, set@183
Snow, dry, fresh fallen@\\0\\08@Lime, gypsum, loose@53-64
Snow, dry, packed@12-25@Mortar, cement-lime,@
Snow, wet@27-40@\\0\\0set@103
\&.T&
lb|c|a|c.
MISCELLANEOUS@@Crushed rock (about@
\&.T&
a|c|a|c.
Asphalt@\\080@\\0\\02565 lbs. per@
Tar@\\075@\\0\\0cu. yd.)@90-110
Glass@160@@
Paper@\\060@@
\&.sp .5
\&.TE
.Pe
.Fe " Input for Figure 8-1"
.Fs
.ds a \a
.TS
expand,tab(@);
lw(13P) cbp8 s s s
lw(13P) c s s s
lw(13P) cbp8 cbp8 cbp8 cbp8
lw(13P) cbp8 s s s
lw(13P) n n n n.
@Year Ending December 31
.sp .2v
@_
@1986@1985@1984@1983
@(Dollars in millions)
.sp .5v
Premiums\*a@$\010,922.7@$\010,330.7@$\0\09,252.4@$\0\09,071.8
Investment income\*a@3,671.7@3,146.0@2,749.7@2,308.9
Federal income taxes\*a@24.4@91.6@71.9@20.8
Operating income\*a@359.8@346.1@342.6@309.6
Realized gains (losses)\*a@15.4@27.0@(30.2)@(15.2)
Net income\*a@375.2@373.1@312.4@295.8
Cash provided by operations\*a@4,123.2@3,560.8@3,514.9@3,067.4
Assets\*a@41,645.8@34,434.7@32,876.6@27,987.6
.TE
.Fe " Financial Table"
.page 231
.Fs
.Ps
\&.TS
expand, tab(@);
lw(13P) cbp8 s s s
lw(13P) c s s s
lw(13P) cbp8 cbp8 cbp8 cbp8
lw(13P) cbp8 s s s
lw(13P) n n n n.
@Year Ending December 31
\&.sp .2v
@_
@1986@1985@1984@1983
@(Dollars in millions)
\&.sp .5v
Premiums\\a@$\\010,922.7@$\\010,330.7@$\\0\\09,252.4@$\\0\\09,071.8
Investment income\\a@3,671.7@3,146.0@2,749.7@2,308.9
Federal income taxes\\a@24.4@91.6@71.9@20.8
Operating income\\a@359.8@346.1@342.6@309.6
Realized gains (losses)\\a@15.4@27.0@(30.2)@(15.2)
Net income\\a@375.2@373.1@312.4@295.8
Cash provided by operations\\a@4,123.2@3,560.8@3,514.9@3,067.4
Assets\\a@41,645.8@34,434.7@32,876.6@27,987.6
\&.TE
.Pe
.Fe " Input for Figure 8-3"
.ix %end [tbl] preprocessor %key tbl preprocessor

