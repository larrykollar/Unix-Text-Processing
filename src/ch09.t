
.ig
	Typed by: Michael Hobgood
	Marked up by: Michael Hobgood
	Proofed on: 15 Oct 2002
..
.so utp.mac
.utp
.EQ
delim ``
.EN
.Se 9 "Typesetting Equations with \f[CB]eqn\fP" "Chapter" 1
.LP
.ix %begin [eqn] preprocessor %key eqn preprocessor
Typesetting mathematical equations has always been a problem
for users who have a limited knowledge of mathematics or
typesetting.
This is because mathematical expressions are often a mixture
of standard text and special characters in different point
sizes.
For example, the equation:
.EQ I
sum from i=0 to {inf} c sup i = lim from {m -> inf} {sum
from i=0 to {m} c sup i}
.EN
requires three special characters (`sum`, `inf`, and `->`)
and roman and italic characters in two different sizes.
Expressions also may require horizontal and vertical
printing motions (as in subscripts and superscripts).
.PP
You could code this example using
.CW troff
requests, but the syntax for describing the printing motions,
sizes, and fonts are difficult to learn and difficult
to type in correctly.
UNIX has formatting tools specifically designed for
documents containing mathematical symbols\(emthe programs
.CW eqn
and
.CW neqn .
The
.CW eqn
program is a preprocessor for
.CW troff ;
.CW neqn
is a preprocessor for
.CW nroff .
.PP
With
.CW eqn
you can typeset both inline equations and equations that
are set off from the body of the text like the example
shown.
It takes an English-like description of a mathematical
equation and generates a
.CW troff
script.
You don't need to understand what you are typing.
.PP
The
.CW eqn
preprocessor was designed to be easy to learn and even
easier to use.
This implies that normal mathematical conventions such as
operator precedence and parentheses cannot be used.
Nor does
.CW eqn
assume that parentheses are always balanced, or that
an expression is better written in another form.
There are only a few rules, keywords, special symbols,
and operators to remember.
If something works in one situation, it should work
everywhere.
.PP
This section shows you how to typeset mathematical equations
using a set of special words that belong to the
.CW eqn
vocabulary.
With
.CW eqn ,
you can format the following quite easily:
.RS
.Ls B
.Li
the Greek alphabet
.ix Greek characters
.ix [eqn] preprocessor, Greek~alphabet %key eqn preprocessor, Greek alphabet
.Li
special symbols, such as summations (`size 8 sum`),
.ix [eqn] preprocessor, special character~names %key eqn preprocessor, special character names
products (`size 8 prod`),integrals (`size 8 int`),
and square roots (`sqrt ""`)
.Li
positional notation, such as subscripts and
superscripts, fractions, matrices, and vertical piles
.Li
diacritical marks
.ix [eqn] preprocessor, diacritical marks %key eqn preprocessor, diacritical marks
.Li
sizes and fonts
.ix [eqn] preprocessor, fonts %key eqn preprocessor, fonts
.ix [eqn] preprocessor, point~sizes %key eqn preprocessor, point sizes
.Li
horizontal and vertical spacing
.ix [eqn] preprocessor, horizontal spacing %key eqn preprocessor, horizontal spacing
.ix [eqn] preprocessor, vertical spacing %key eqn preprocessor, vertical spacing
.Le
.RE
You can even define a string that appears repeatedly
throughout the document so that you do not need to type it
in each time it appears.
.Ah "A Simple \f[CB]eqn\fP Example"
.ix [eqn] preprocessor, simple example %key eqn preprocessor, simple example
To best illustrate how
.CW eqn
works and how easy it is to learn the syntax, let's take a
simple example:
.ix [eqn] preprocessor, syntax %key eqn preprocessor, syntax
.EQ I
a sub 2 over b
.EN
If you were to read this mathematical expression aloud to
another person, you might say
\(lqa sub 2 over b.\(rq
This is exactly how you would describe the expression to
.CW eqn .
The word
.CW sub
denotes a
.I sub \c
script;
the word
.CW over
denotes a fraction.
You will see the other words that
.CW eqn
treats as special (i.e., that belong to the
.CW eqn
vocabulary) as we move along in this section.
.PP
When you use
.CW eqn ,
it assumes that you have a two-dimensional picture of how
the equation should appear in the document.
The key in writing the
.CW eqn
description is to familiarize yourself with the special
words used by
.CW eqn
in printing mathematical characters.
Then, describe the equation as if you were reading it aloud
to another person.
.PP
The
.CW eqn
preprocessor takes care of the standard things that you
would expect to happen automatically, such as printing
superscripts and subscripts in an appropriately
smaller size, and adjusting the length and size of
fraction bars.
Following mathematical convention, variables are made
italic, parentheses, operators, and digits are made
roman, and normal spacing is automatically adjusted to
make the expression look better.
.Ah "Using \f[CB]eqn\fP"
The
.CW eqn
preprocessor is used not only for typesetting equations,
but also for typesetting nontechnical documents.
For example, many documents contain subscripted
or superscripted words.
Using
.CW eqn
can be easier than formatting the subscript or
superscript using
.CW troff
commands.
.PP
To format a document with
.CW eqn ,
you would enter:
.ix [eqn] preprocessor, invoking %key eqn preprocessor, invoking
.Ps
$ \f[CB]eqn /usr/pub/eqnchar\fP \fIfiles\fP \f[CB]| troff [\fP\fIoptions\fP\f[CB]]\fP
.Pe
You can then pipe the output to the desired printer.
The file
.CW /usr/pub/eqnchar
contains definitions of additional special characters that
can be used by
.CW eqn .
It is not essential that you use it, but you may get better
results with certain equations if you do.
.PP
If you use
.CW eqn
with the
.CW tbl
.ix [eqn] preprocessor, using~[tbl]~with %key eqn preprocessor, using [tbl]~with
.ix [tbl] preprocessor, using~eqn~with %key tbl preprocessor, using eqn~with
preprocessor to print tables containing mathematical
expressions, invoke
.CW tbl
before
.CW eqn
to minimize the data passed through the pipe:
.Ps
$\f[CB]tbl /usr/pub/eqnchar\fP \fIfile\fP \f[CB]| eqn | troff\fP
.Pe
If you are using
.CW nroff
.ix [nroff] formatter, using~eqn~with %key nroff formatter, using eqn~with
.ix [eqn] preprocessor, using~[nroff]~with %key eqn preprocessor, using [nroff]~with
instead of
.CW troff ,
you can get a reasonable approximation of
.CW eqn
output by using
.CW neqn .
However, printers used with
.CW nroff
may be unable to print many of the special characters
used in equations.
.Ah "Specifying Equations"
Mathematical documents contain both displayed equations
and standard text mixed with mathematical expressions.
The
.CW eqn
preprocessor allows you to typeset both forms.
.Bh "Displayed Equations"
.ix [eqn] preprocessor, displayed equations %key eqn preprocessor, displayed equations
For equations that appear outside the body of the text,
mark the beginning of each equation with an
.CW .EQ
and the end with an
.CW .EN .
Note that these delimiters may or may not also be defined
as macros.
They are recognized by
.CW eqn
as flags to begin and end processing.
.PP
If they are not defined as macros by the package you are
using, you can define them yourself, or can simply
supplement them with
.CW troff
requests (such as
.CW .ce
to center the equation) as desired.
.PP
If you are using the
.CW ms
macro package,
.CW .EQ
and
.CW .EN
are defined as macros, and the equation is centered by
default.
Thus, if you type:
.Ps
\&.EQ
C=Ax+By
\&.EN
.Pe
the output will be:
.EQ
C=Ax+By
.EN
.PP
In
.CW ms ,
you can also left justify the equation using
.CW ".EQ L"
or indent it using
.CW ".EQ I" .
You can further specify an arbitrary equation number or label
that will be printed at the right margin.
For example, the lines:
.Ps
\&.EQ I (13a)
C=Ax+By
\&.EN
.Pe
produce the following:
.EQ I (13a)
C=Ax+By
.EN
The mathematical symbols
.CW + ,
.CW - ,
.CW =
and
.CW ()
are typed in just as they
appear in the equation.
.PP
If you're using the
.CW mm
.ix [eqn] preprocessor, using~[mm]~with %key eqn preprocessor, using [mm]~with
macro package, put the
.CW .EQ /\c
.CW .EN
pair inside a
.CW .DS /\c
.CW .DE
pair so that the format looks like this:
.Ps
\&.DS
\&.EQ
\f[I]equation\fP
\&.EN
\&.DE
.Pe
This automatically centers the displayed equation.
You can also use a break producing request (such as
.CW .br
or
.CW .sp )
immediately following the
.CW .DS
macro but before the
.CW .EQ
macro to display the equation at the left margin of the text.
.Bh "Inline Expressions"
.ix [eqn] preprocessor, inline expressions %key eqn preprocessor, inline expressions
If you are using
.CW ms
or
.CW mm ,
.CW .EQ
and
.CW .EN
imply a displayed equation and so cannot be used for short inline
expressions.
But
.CW eqn
provides a shorthand notation for
displaying this type of expression.
You can define any two characters as delimiters to mark the
beginning and end of an inline equation, and then type the expression
right in the middle of the text.
To do this, define the equation delimiters within an
.CW .EQ
and an
.CW .EN
at the beginning of your file.
.PP
For example, to set both delimiters to
.CW # ,
add the following lines:
.Ps
\&.EQ
delim ##
\&.EN
.Pe
.PP
If you're using
.CW mm ,
do not use the
.CW .DS /\c
.CW .DE
pair to enclose a
.CW .EQ /\c
.CW .EN
pair that only defines the delimiters for inline equations.
If you do, extra blank lines will appear in the output.
.PP
Do
.I not
use braces (\c
.CW {} ),
a circumflex (\c
.CW ^ ),
a tilde (\c
.CW \(ap ),
or double quotation marks (\c
.CW \(dq )
as delimiters because these have a special meaning to
.CW eqn .
Choose characters that you are unlikely to use within any equation
in the document.
After you have defined your delimiter, you can begin using it
within a line of text as in the following example:
.Ps
The possible prices of an ice cream cone in cents are
#y sub 1 = 75#, #y sub 2 = 85#, and #y sub 3 = 95#.
.Pe
This produces the line:
.ig
	Note: the original example output had "Assume that"
	in front of "the possible".  Deleted it so that the
	example output matches the example layout.
	--Michael Hobgood
..
.Ps
\f[R]The possible prices of an ice cream cone in cents are
`y sub 1 = 75`, `y sub 2 = 85`, and `y sub 3 = 95`.\fP
.Pe
The
.CW eqn
program leaves enough room before and after a line containing inline
expressions with fractions or large characters so that they don't
interfere with the surrounding lines.
.PP
To turn off the delimiters, use:
.Ps
\&.EQ
delim off
\&.EN
.Pe
Throughout this section, we will use the delimiters ## in our
.CW eqn
examples.
However, we will typically show the results as a displayed
equation.
.Ah "Spaces in Equations"
.ix [eqn] preprocessor, spaces~in equations %key eqn preprocessor, spaces in equations
You may have noticed in the previous example that the word
.CW sub
is surrounded by blanks, and the subscript is separated from the =
sign with a blank.
Spaces and new lines are used to tell
.CW eqn
that certain words belong to the
.CW eqn
vocabulary and deserve special treatment.
The spaces and new lines that you type in the input equation do
.I not
appear in the printed output.
.PP
For example, all of the following equations:
.Ps
#C=Ax+By#
#C = Ax + By#
#C= A x +
     By#
.Pe
produce the same output:
.EQ I
C=Ax+By
.EN
.ig
	Note: the above equation WILL NOT give what the
	example output shows. eqn will put a space equal
	to that of a tilde, between the = and +. This
	behavior matches the eqn manual by AT&T. Since the
	original example output had everything butting up
	together with no space between any character, the
	original was probably wrong or produced on a version
	of eqn/troff that did not put whitespace in. Since I
	don't know which, I've just let eqn take its course.
	--Michael Hobgood
..
Note that the spaces and newlines were ignored by
.CW eqn .
.PP
You should use spaces as freely as possible to break up more
complex equations and make your input more readable and easier
to edit.
Remember that any spaces or newlines you enter within an equation are
.I not
printed out.
This is often a point of confusion for new users.
If your equation doesn't turn out the way it should, chances are you
missed typing in a space somewhere.
A useful rule of thumb is: when in doubt, use a space.
.Bh "Printing Spaces in the Output"
You may want to fine-tune the printed appearance of an equation by
adding spaces between groups of terms.
If you want to print spaces in the output, use a tilde (\c
.CW  \(ap)
for each space.
A circumflex (\c
.CW ^ )
gives a space half the width of a tilde.
For example:
.Ps
#C\(ap=\(apAx\(ap+\(apBy#
.Pe
yields:
.EQ I
C~=~Ax~+~By
.EN
and:
.Ps
#C^=^Ax^+^By#
.Pe
yields:
.EQ I
C^=^Ax^+^By
.EN
You can also use tabs to separate parts of an equation, but the tab
.ix [eqn] preprocessor, tabs~within equations %key eqn preprocessor, tabs within equations
stops must be set by the
.CW troff
.CW .ta
request.
For example:
.Ps
\&.ta 1i 1.5i 2i 2.5i
\&.EQ
x sub 1
+x sub 2
+s sub 1
=10
\&.EN
\&.EQ
-2x sub 1
+s sub 1
=42
\&.EN
.Pe
yields:
.ig
	The above example, when typed in _as_it_is in the
	original book, will not work.  References to lining
	up equations in the Kernighan and Cherry "Typesetting
	Mathematics User's Guide", does not mention using tabs
	_at_all to line up equations.  It mentions lineup & mark.
	So, I will fake the output just to match the original
	printed book, but this is something that will need
	looked into. (BTW, just using eqn and troff, it still
	doesn't work.  If you know that this does, drop the list
	a note, and show me how!
	--Michael Hobgood
..
.ne 2
.Ps
`x sub 1`          `+x sub 2`     `+s sub 1`     `=10`
`-2x sub 1`                `+s sub 1`     `=42`
.Pe
(Note that each equation must have its own pair of
.CW .EQ /\c
.CW .EN
delimiters).
Another way of aligning equations uses the
.CW eqn
words
.CW mark
and
.CW lineup ,
as you will see later.
.ix %begin [eqn] preprocessor, subscripts %key eqn preprocessor, subscripts
.ix %begin [eqn] preprocessor, superscripts %key eqn preprocessor, superscripts
.Bh "Subscripts and Superscripts: A Common Use"
.ix subscripts
.ix superscripts
Perhaps the most common application of
.CW eqn
is in generating subscripts and superscripts within a line of text
or a table.
As you have seen in previous examples, subscripts are denoted by
the word
.CW sub .
Superscripts are designated by
.CW sup .
For example:
.Ps
#y sub 1 = x sup 2^+^1#
.Pe
yields:
.EQ I
y sub 1 = x sup 2^+^1
.EN
There are two simple rules to remember in writing subscripts
and superscripts:
.RS
.Ls N
.Li
Put at least one space or space delimiter (such as
.CW ^
or
.CW \(ap )
before
.I and
after the words
.CW sup
and
.CW sub .
.Li
Leave at least one space or space delimiter after the
subscript or superscript.
.Le
.RE
.PP
Let's see the effect on the output when you omit necessary spaces.
For example:
.ig
	The original example has as input:
	y sub 1 =x sup2^+^1
	but the displayed results were for this input:
	y sub 1=x sup2^+^1.
	I have let eqn produce what it may with the
	example input, rather than recreating the error.
	Therefore, this portion of the book will not match
	the original.  Another error that needs fixing.
	--Michael Hobgood
..
.Ps
#y sub 1 =x sup2^+^1#
.Pe
yields:
.EQ I
y sub 1 =x sup2^+^1
.EN
and
.ig
	the original example input will not produce the
	original example output. The original input is:
	y sub 1 =x sup 2+^1.  The example output was for:
	y sub 1=x sup 2+^1
	I have let eqn produce output for the example input.
	Again, this means that this portion of the book will
	not match the original.
	Another error that needs fixing.
	--Michael Hobgood
..
.Ps
#y sub 1 =x sup 2+^1#
.Pe
yields:
.EQ I
y sub 1 =x sup 2+^1
.EN
If you don't leave a space after
.CW sub
or
.CW sup
(as in the first example),
.CW eqn
will not recognize them as special words, and so will not produce
a subscript or superscript.
Also, if you don't leave a space after the subscript or superscript,
.CW eqn
thinks that the character(s) following it are still part of the
subscript or superscript.
This is a very common mistake made by new users.
.PP
You can also write subscripted subscripts and superscripted
superscripts.
If a superscript and subscript both appear for the same item,
.CW sub
should come before
.CW sup .
Therefore:
.Ps
#a sub k sup 2#
.Pe
yields:
.EQ I
a sub k sup 2
.EN
Reversing the order of the words:
.Ps
#a sup 2 sub k#
.Pe
yields:
.EQ I
a sup 2 sub k
.EN
Some equations also require you to type chemical symbols like:
.EQ I
"" sup 2 He sub 4
.EN
.ig
	The original output had 2He sub 4, but the input
	was for "" sup 2 He sub 4. I've let the output
	reflect what is given as input (see below).
	Another error that needs fixing.
	--Michael Hobgood
..
Because
.CW sup
technically means a superscript on something, you must use a
placeholder (a pair of double quotation marks) before the word
.ix [eqn] preprocessor, quotation~marks %key eqn preprocessor, quotation marks
.CW sup
and write this expression as:
.Ps
#"" sup 2 He sub 4#
.Pe
.ix %end [eqn] preprocessor, subscripts %key eqn preprocessor, subscripts
.ix %end [eqn] preprocessor, superscripts %key eqn preprocessor, superscripts
.Ah "Using Braces for Grouping"
.ix [eqn] preprocessor, using~braces~for grouping %key eqn preprocessor, using braces~for grouping
Normally, you would use a blank or a space delimiter to signal
the end of a subscript or superscript.
But if your subscript or superscript consists of two or more
characters or words separated by blanks, or if you are writing
nested subscripts or superscripts, this will not work.
In this case, use braces to mark the beginning and end of your
subscript or superscript.
.PP
For example, the line:
.Ps
#r sub {i=5;t=10^years}#
.Pe
yields:
.EQ I
r sub {i=5;t=10^years}
.EN
In contrast, this line without the braces:
.Ps
#r sub i=5;t=10^years#
.Pe
yields:
.EQ I
r sub i=5;t=10^years
.EN
In the first example, we used braces to force
.CW eqn
to treat the string:
.Ps
i=5;t=10 years
.Pe
as a subscript.
Use braces to make your intent perfectly clear whenever you are
unsure of how
.CW eqn
will treat the equation.
You can also use braces within braces, as in the line:
.Ps
#e sup {i sup {k+1}}#
.Pe
which yields:
.EQ I
e sup {i sup {k+1}}
.EN
Make sure that a left brace always has a corresponding right brace.
.PP
If you have to print braces in your document, enclose them in
double quotation marks like "{" and "}".
.Ah "Special Character Names"
.ix [eqn] preprocessor, special character~names %key eqn preprocessor, special character names
In many mathematical equations, you use the Greek alphabet to define
variables.
To print Greek letters, spell them out in the case that you want.
.ix [eqn] preprocessor, Greek~alphabet %key eqn preprocessor, Greek alphabet
For example,
.CW delta
produces `delta`, and
.CW DELTA
gives `DELTA`.
Thus, you only need to spell out the character `pi`, as in:
.Ps
#pi r sup 2#
.Pe
to print:
.EQ I
pi r sup 2
.EN
.PP
Note that special names don't exist for all uppercase Greek letters,
such as ALPHA or ETA, because they are identical to the equivalent
English letters.
See Table 9-1 for a list of Greek letters.
.ix Greek characters
.KS
.Ts " Names for Greek Letters"
.TS
center,box;
lf(CW) c cf(CW) c.
\fRName\fP	Character	\fRName\fP	Character
_
T{
DELTA
T}	T{
`DELTA`
T}	T{
iota
T}	T{
`iota`
T}
T{
GAMMA
T}	T{
`GAMMA`
T}	T{
kappa
T}	T{
`kappa`
T}
T{
LAMBDA
T}	T{
`LAMBDA`
T}	T{
lambda
T}	T{
`lambda`
T}
T{
OMEGA
T}	T{
`OMEGA`
T}	T{
mu
T}	T{
`mu`
T}
T{
PHI
T}	T{
`PHI`
T}	T{
nu
T}	T{
`nu`
T}
T{
PI
T}	T{
`PI`
T}	T{
omega
T}	T{
`omega`
T}
T{
PSI
T}	T{
`PSI`
T}	T{
omicron
T}	T{
`omicron`
T}
T{
SIGMA
T}	T{
`SIGMA`
T}	T{
phi
T}	T{
`phi`
T}
T{
THETA
T}	T{
`THETA`
T}	T{
pi
T}	T{
`pi`
T}
T{
UPSILON
T}	T{
`UPSILON`
T}	T{
psi
T}	T{
`psi`
T}
T{
XI
T}	T{
`XI`
T}	T{
rho
T}	T{
`rho`
T}
T{
alpha
T}	T{
`alpha`
T}	T{
sigma
T}	T{
`sigma`
T}
T{
beta
T}	T{
`beta`
T}	T{
tau
T}	T{
`tau`
T}
T{
chi
T}	T{
`chi`
T}	T{
theta
T}	T{
`theta`
T}
T{
delta
T}	T{
`delta`
T}	T{
upsilon
T}	T{
`upsilon`
T}
T{
epsilon
T}	T{
`epsilon`
T}	T{
xi
T}	T{
`xi`
T}
T{
eta
T}	T{
`eta`
T}	T{
zeta
T}	T{
`zeta`
T}
T{
gamma
T}	T{
`gamma`
T}	T{
T}
.TE
.Te
.KE
.PP
A common mistake is to forget to put a space around the Greek name.
For example, typing:
.Ps
#f(theta)#
.Pe
yields:
.EQ I
f(theta)
.EN
and not:
.EQ I
f( theta )
.EN
which is what we want.
Because there are no spaces surrounding the word
.CW theta ,
.CW eqn
doesn't recognize it as a special word.
.PP
You can also use
.CW troff
four-character names for characters, as in the description:
.Ps
#c = a \\(pl b#
.Pe
which yields:
.EQ I
c = a \(pl b
.EN
.Ah "Special Symbols"
.ix [eqn] preprocessor, special character~names %key eqn preprocessor, special character names
The
.CW eqn
program recognizes the sequences in Table 9-2 as belonging to the
.CW eqn
vocabulary, and translates them to the appropriate symbols.
.KS
.Ts "\f[CB]eqn\fP Special Symbols"
.TS
center,box;
cf(CW) c cf(CW) c.
\fRSequence\fP	Symbol	\fRSequence\fP	Symbol
T{
>=
T}	T{
`>=`
T}	T{
approx
T}	T{
`approx`
T}
T{
<=
T}	T{
`<=`
T}	T{
nothing
T}	T{
T}
T{
==
T}	T{
`==`
T}	T{
cdot
T}	T{
`cdot`
T}
T{
!=
T}	T{
`!=`
T}	T{
times
T}	T{
`times`
T}
T{
+-
T}	T{
`+-`
T}	T{
del
T}	T{
`del`
T}
T{
->
T}	T{
`->`
T}	T{
grad
T}	T{
`grad`
T}
T{
<-
T}	T{
`<-`
T}	T{
\&...
T}	T{
`...`
T}
T{
<<
T}	T{
`<<`
T}	T{
,...,
T}	T{
`,...,`
T}
T{
>>
T}	T{
`>>`
T}	T{
sum
T}	T{
`sum`
T}
T{
inf
T}	T{
`inf`
T}	T{
int
T}	T{
`int`
T}
T{
partial
T}	T{
`partial`
T}	T{
prod
T}	T{
`prod`
T}
T{
half
T}	T{
`half`
T}	T{
union
T}	T{
`union`
T}
T{
prime
T}	T{
`prime`
T}	T{
inter
T}	T{
`inter`
T}
.TE
.Te
.KE
.ig
	Original had "w<-" rather than <-
	in the above table. Fixed
	--Michael Hobgood
..
.PP
The following examples illustrate the use of these character
sequences.
.Ps
#C sub O prime#
.Pe
yields:
.EQ I
C sub O prime
.EN
and:
.Ps
#0 <= a <= 1#
.Pe
yields:
.EQ I
0 <= a <= 1
.EN
and:
.Ps
#del y / del x#
.Pe
yields:
.EQ I
del y / del x
.EN
and:
.Ps
#partial x / partial t#
.Pe
yields:
.EQ I
partial x / partial t
.EN
Digits, parentheses, brackets, punctuation marks, and the
following mathematical words are converted into roman font
instead of the italic font used for other text:
.Ps
sin  cos  tan  sinh cosh tanh arc
max  min  lim  log  ln   exp
Re   Im   and  if   for  det	
.Pe
.Bh "Summations, Integrals, Products, and Limits"
.ix [eqn] preprocessor, integrals %key eqn preprocessor, integrals
.ix [eqn] preprocessor, limits %key eqn preprocessor, limits
.ix [eqn] preprocessor, summations %key eqn preprocessor, summations
Summations, integrals, products, and limits often require an upper
and lower part around the symbol.
The word
.CW from
indicates the character sequence to be entered at the lower part;
the word
.CW to
indicates the upper part.
These parts are both optional, but if they are used, they should
appear in that order.
For example, you would type:
.Ps
.ig
	The original had pi sub 1, not pi sub i, but the example
	output has pi sub i.  I changed the input to match the
	output, for a change.
	Another item that needs fixed.
	--Michael Hobgood
..
#Expected\(apValue\(ap=\(apsum from {i=1} to inf pi sub i X sub i#
.Pe
to print the following expression:
.EQ I
Expected~Value~=~sum from {i=1} to inf pi sub i X sub i
.EN
Notice that we used braces around the
.CW from
part although this was not necessary because there were no
embedded blanks in the string
.\" original: imbedded, flagged as spelling error. (LK)
.CW i=1 .
But if the
.CW from
and
.CW to
parts contain any blanks to separate special words, you must use
braces around them.
.PP
A
.CW from
does not necessarily need an accompanying
.CW to ,
as you will see in the following example:
.Ps
#lim from {m -> inf} sum from i=0 to m c sup i#
.Pe
which yields:
.EQ I
lim from {m -> inf} sum from i=0 to m c sup i
.EN
.Bh "Square Root Signs"
.ix [eqn] preprocessor, quotation~marks %key eqn preprocessor, quotation marks
To draw a square root sign, use the word
.CW sqrt .
For example:
.Ps
#sqrt {b sup 2 - 4ac}#
.Pe
yields:
.EQ I
sqrt {b sup 2 - 4ac}
.EN
Square roots of tall quantities appear too dark and heavy.
Big square root quantities are better written to the power
\(12,
as in:
.EQ I
2C sub o /D sup half
.EN
Creating a cube root or a higher root sign requires a little
imagination.
You can think of a cube root sign, for example, as consisting of
two parts: a superscript 3 (with nothing before it) and a
square root sign.
However, you can't type:
.Ps
#sup 3 sqrt x#
.Pe
because a
.CW sup
is a superscript on something.
You must use a pair of double quotation marks as a placeholder for
.ix [eqn] preprocessor, square~root signs %key eqn preprocessor, square root signs
.CW sup .
For example:
.Ps
#"" sup 3 sqrt x#
.Pe
yields:
.EQ I
"" sup 3 sqrt x
.EN
.Bh "Enclosing Braces and Brackets"
.ix [eqn] preprocessor, braces~and~brackets %key eqn preprocessor, braces and~brackets
You can generate big brackets
.CW [] ,
braces
.CW {} ,
parentheses
.CW () ,
and
bars
.CW |
around quantities by using the words
.CW left
and
.CW right ,
followed by the desired character.
For example:
.Ps
#P\(ap=\(apR\(apleft [ 1^-^{1+i sup n } over i right ]#
.Pe
yields:
.ig
	Again, the output in the book doesn't match the given
	input.  Again, I've let eqn do what it will with the
	given input.  Another item that needs fixed.
	--Michael Hobgood
..
.EQ I
P~=~R~left [ 1^-^{1+i sup n } over i right ]
.EN
The resulting brackets (and any character you specify) are made
big enough to enclose the quantity.
(Braces are typically bigger than brackets and parentheses).
Note the spaces surrounding the words
.CW left
and
.CW right
and the character to be expanded.
.PP
Two other characters that you can use are the
.CW floor
and
.CW ceiling
characters shown in the following example:
.Ps
#left floor a over b right floor !=
left ceiling x over y right ceiling#
.Pe
which yields:
.EQ I
left floor a over b right floor !=
left ceiling x over y right ceiling
.EN
A
.CW left
does not need a corresponding
.CW right .
If the
.CW right
part is omitted, use braces to enclose the quantity that you want
the left bracket to cover.
This is useful when you are making piles, as you will see in the
next section.
.PP
You can also omit the
.CW left
part, although technically you can't have a
.CW right
without an accompanying
.CW left .
To get around this, you must type:
.Ps
#left "" expression right )#
.Pe
The
.CW left
.CW \(dq\(dq
in this equation means a \(lqleft nothing\(rq.
.Ah "Other Positional Notation"
.EQ I
matrix {
lcol {1 above 0}
rcol {half above -1}
}
.EN
This produces a matrix with the first column left justified and
the second column right justified.
Each item is separated from the item below it by the word
.CW above .
You can also center the columns using
.CW ccol .
You can adjust each column separately and use as many columns
as you like.
However, each column must have the
.I same
number of items in it as the other columns.
.PP
A matrix should be used when the items in the columns don't all
have the same height (for example, when you have fractions mixed
with whole numbers).
This forces the items to line up because
.CW matrix
looks at the entire structure before deciding what spacing to use.
.Bh "Vertical Piles"
.ix [eqn] preprocessor, vertical~piles (columns) %key eqn preprocessor, vertical piles (columns)
To make vertical piles or columns of items, use the word
.CW pile
before the equation description and the keyword
.CW above
to separate the items.
You can also enclose the piles in big braces or big brackets.
For example:
.Ps
\&.EQ
P\(ap=\(apleft [
  pile { nu sub 1 above nu sub 2 above cdot
  above cdot above cdot above nu sub N }
right ]
\&.EN
.Pe
yields:
.EQ I
P~=~left [
pile { nu sub 1 above nu sub 2 above cdot
above cdot above cdot above nu sub N }
right ]
.EN
The items are centered one above the other and separated by the
word
.CW above .
Braces enclose the entire pile list.
The items in the pile can themselves contain piles.
.PP
You can left justify (\c
.CW lpile ),
right justify (\c
.CW rpile ),
or center (\c
.CW cpile ),
the elements of the pile.
(A
.CW cpile
is the same as a regular pile).
However, the vertical spacing you get using these three forms will
be somewhat larger than the normal pile.
For example:
.Ps
\&.EQ
f sub x (x)^=^left {
  rpile { 0 above 2x above 0 }
  \(ap\(aplpile { x < 0 above 0 <= x <= 1 above x > 1}
\&.EN
.Pe
yields:
.EQ I
f sub x (x)^=^left {
rpile { 0 above 2x above 0 }
~~lpile { x < 0 above 0 <= x <= 1 above x > 1}
.EN
Note that in this example, we have a left brace without a
corresponding right brace.
.Ah "Diacritical Marks"
.ix [eqn] preprocessor, diacritical~marks %key eqn preprocessor, diacritical marks
With
.CW eqn ,
writing diacritical marks on top of letters is straightforward.
The words known by
.CW eqn
follow, with examples of how they appear on top of the letter x:
.RS
.TS
lf(CW)7 l.
bar	`x bar`
under	`x under`
dot	`x dot`
dotdot	`x dotdot`
hat	`x hat`
tilde	`x tilde`
vec	`x vec`
dyad	`x dyad`
.TE
.RE
The following examples show how these keywords are used:
.Ps
#cr e hat pes#
.Pe
yields:
.EQ I
cr e hat pes
.EN
and:
.Ps
#Citr o dotdot en#
.Pe
yields:
.EQ I
Citr o dotdot en
.EN
and:
.Ps
#a vec + b vec#
.Pe
yields:
.EQ I
a vec + b vec
.EN
and:
.Ps
#X bar sub st#
.Pe
yields:
.EQ I
X bar sub st
.EN
The
.CW eqn
program positions the diacritical marks at the appropriate height.
It also makes
.CW bar
and
.CW under
the right length to cover the entire item.
Other marks are centered above the character(s).
.PP
Typing words with diacritical marks may seem confusing at first
because you have to leave spaces around the letter and its
corresponding mark.
Just remember that
.CW eqn
doesn't print the spaces you type in.
.Ah "Defining Terms"
.ix [eqn] preprocessor, abbreviating~a string %key eqn preprocessor, abbreviating a string
In some documents, you type a string of characters often, either
within the text or within several equations.
If you notice a string that is frequently used, you can name it
using a
.CW define
statement within an
.CW .EQ
and
.CW .EN .
Then you can use the name within an expression instead of typing
the whole string.
.PP
Suppose you notice that the string
.CW "2 sup i"
appears repeatedly in equations.
You can avoid retyping by naming it
.CW 2i ,
for example, as in the following commands:
.Ps
\&.EQ
define 2i '2 sup i'
\&.EN
.Pe
You should enclose the string between single quotation marks
or between any two characters that don't appear inside the
definition.
After you've defined a term, you can use it as a convenient
shorthand in other equations, just as if it were one of
.CW eqn 's
special keywords.
.PP
A note about using definitions: although a definition can use
a previous definition, do
.I not
define something in terms of itself.
Thus:
.Ps
\&.EQ
.ig
	Oreilly has back tic in line one.  Since this
	chapter has that character being used to delimit inline
	equations, I've changed the example to use a regular
	single quote.
	--Michael Hobgood
..
define 2i '2 sup i'
define 1/2i '1 over 2i'
\&.EN
.Pe
is acceptable, but:
.Ps
\&.EQ
define X 'X bar'
\&.EN
.Pe
is not because
.CW X
is defined in terms of itself.
If you want to do this, protect the
.CW X
in the definition with double quotation marks, as in:
.Ps
\&.EQ
define X ' "X" bar '
\&.EN
.Pe
You can also redefine
.CW eqn
keywords.
For example, you can make
.CW /
mean
.CW over
by typing:
.Ps
\&.EQ
define / 'over'
\&.EN
.Pe
.Ah "Quoted Text"
.ix [eqn] preprocessor, quotation~marks %key eqn preprocessor, quotation marks
You have seen the use of double quotation marks as placeholders
(in the
.CW sup ,
.CW sqrt ,
and
.CW define
examples) when
.CW eqn
needs something grammatically but you don't want anything
in the output.
Quotation marks are also used to get braces and other
.CW eqn
keywords printed in the output.
For example:
.Ps
#"{ size beta }"#
.Pe
prints the words:
.EQ I
"{ size beta }"
.EN
instead of looking up the two words
.CW size
and
.CW beta
in the
.CW eqn
vocabulary and converting them.
(The word
.CW size
is used to change the size of the characters from the
10 point default).
.PP
Any string entirely within quotation marks is not subject to font
changes and spacing adjustments normally done by
.CW troff
or
.CW nroff
on the equation.
This provides for individual spacing and adjusting, if needed.
Thus, the line:
.Ps
#italic "cos(x)" + cos (x)#
.Pe
yields:
.EQ I
italic "cos(x)" + cos (x)
.EN
To print a literal quotation mark, you must escape it with a
backslash character in the form
.CW \e" .
.Ah "Fine-Tuning the Document"
Typesetting a technical document is not only a matter of getting
the
.CW eqn
vocabulary right so you can print the appropriate mathematical
expressions.
Although
.CW eqn
tries to make some actions automatic and puts items in the proper
places, some fine-tuning is occasionally needed.
With
.CW eqn ,
you can line up equations, define font sizes and types, and
vary horizontal and vertical spacing.
.Bh "Lining Up Equations"
.ix [eqn] preprocessor, lining~up equations %key eqn preprocessor, lining up equations
Earlier we showed you how to line up pieces of an equation
using tabs.
Another method of doing this is to use the commands
.CW mark
and
.CW lineup .
This is useful when you have to line up a series of equations
at some horizontal position, often at an
equal sign.
.PP
For example, you would type in:
.Ps
\&.EQ
mu\(apmark =\(aplambda t
\&.EN
\&.EQ
lineup =\(apint from 0 to t lambda dz
\&.EN
.Pe
to line up the two equations:
.EQ I
mu~mark =~lambda t
.EN
.EQ I
lineup =~int from 0 to t lambda dz
.EN
The word
.CW mark
can appear
.I "only once"
at any place in an equation.
Successive equations should also contain
.CW lineup
only once.
Thus, when you have a series of equations that require you to line
up items in more than one position, like the following:
.RS
.TS
lw (1i) l l.
T{
`a sub 1 + a sub 2`
T}	T{
`+ x sub 1 + x sub 2`
T}	T{
`=34`
T}
T{
`2a sub 1`
T}	T{
`+ 4a sub 2`
T}	T{
`=28`
T}
T{
`3a sub 1`
T}	T{
`+ 4x sub 2`
T}	T{
`=56`
T}
.TE
.RE
it might be better to line up the pieces of the equation on the
left-hand side using tabs, and those on the right-hand side using
.CW mark
and
.CW lineup .
.PP
If at all possible, you should type in the longest expression first
to serve as the
.CW mark ing
point.
If you type in shorter expressions first,
.CW mark
will not have enough room to line up successive longer expressions.
.Bh "Changing Fonts and Sizes"
.ix [eqn] preprocessor, fonts %key eqn preprocessor, fonts
.ix [eqn] preprocessor, point~sizes %key eqn preprocessor, point sizes
.ix fonts, changing ([eqn]) %key fonts, changing (eqn)
.ix point~size, changing ([eqn]) %key point size, changing (eqn)
In
.CW eqn ,
equations are automatically set in 10-point type, with standard
mathematical conventions to write some characters as roman or
italic.
To change sizes and fonts, use the following keywords:
.RS
.TS
l7 lw (4.6i).
T{
\f[C]size\fP
T}	T{
Change to any of the following legal sizes:
T}
.sp 3p
T{
T}	T{
\f[C]\s-212, 14, 16, 18, 20, 22, 24, 28, 36\s0\fP
T}
T{
T}	T{
.sp 3p
You can also change the size by a relative amount, such as
\f[C]size +2\fP
to make a character 2 points bigger, or
\f[C]size -2\fP
to make it 2 points smaller.
T}
.sp 3p
T{
\f[C]bold\fP
T}	T{
Change to bold.
T}
.sp 3p
T{
\f[C]fat\fP
T}	T{
Widen the current font by overstriking.
T}
.sp 3p
T{
\f[C]italic\fP
T}	T{
Change to italic.
T}
.sp 3p
T{
\f[C]roman\fP
T}	T{
Change to roman.
T}
.TE
.RE
.PP
Like
.CW sup
and
.CW sub ,
these keywords only apply to the character(s) immediately
following them, and revert to the original size and font at
the next space.
To affect more complex or longer strings (such as a whole equation),
use braces.
Consider the following examples:
.ig
	At least on my machine, the roman and fat examples
	do not work.  Also, size 8 is not a legal size
	according to the above table of keywords.
	--Michael Hobgood
..
.RS
.TS
lf(CW)p9 7 l.
#bold qP#	`bold qP`
#roman alpha\(apbeta#	`roman alpha~beta`
#fat half#	`fat half`
#size +3 x =y#	`size +3 x =y`
#size 8 {A + B}#	`size 8 {A + B}`
.TE
.RE
If the entire paper is to be typeset in a nonstandard size or
format, you can avoid redefining each and every character sequence
by setting a global size (\c
.CW gsize )
or font (\c
.CW gfont )
that will affect the whole document.
You can set this up at the top of your file (or wherever the font
and size changes begin) within an
.CW .EQ
and
.CW .EN .
.PP
For example, to change the fonts to roman and the size to 12, you
could enter:
.Ps
\&.EQ
gfont R
gsize 12
\&.EN
.Pe
The rest of the equations in the document (up to another
.CW gfont
or
.CW gsize )
will be set in 12-point roman type.
You can use any other
.CW troff
font names in place of
.CW R .
.Bh "Horizontal and Vertical Motions"
.ix [eqn] preprocessor, vertical spacing %key eqn preprocessor, vertical spacing
You have already learned how to obtain small extra horizontal spaces
in the output using
.CW \(ap
and
.CW ^ .
To move terms at some arbitrary length backward or forward, use the
commands
.CW back
.I n
and
.CW fwd
.I n ,
where
.I n
denotes how far you want to move, in 1/100s of an em.
(An em is about the width of the letter
.I m ).
.PP
You can also move items up or down using
.CW up
.I n
or
.CW down
.I n ,
where
.I n
is the same unit of measure as described.
These local horizontal and vertical motions affect only the
character(s) next to the keyword.
To move larger strings or whole expressions, enclose them
in braces.
.Ah "Keywords and Precedence"
.ix [eqn] preprocessor, precedence~of operations %key eqn preprocessor, precedence of operations
Braces are used to group items or change the precedence of operations
.ix [eqn] preprocessor, grouping items %key eqn preprocessor, grouping items
if you are unsure of how
.CW eqn
will treat multiple keywords in a single expression.
If you don't use braces,
.CW eqn
performs the operations in the following order:
.Ps
dyad vec under bar tilde hat dot dotdot
fwd back down up
fat roman italic bold size
sub sup sqrt over
from to
.Pe
All operations group to the right, except for the following, which
group to the left:
.Ps
over sqrt left right
.Pe
.Ah "Problem Checklist"
.ix [eqn] preprocessor, problem~checklist %key eqn preprocessor, problem checklist
The
.CW eqn
program usually displays self-explanatory messages when it
encounters a syntax error or any other formatting error.
To check a document before printing, type:
.Ps
$ \f[CB]eqn\fP \fIfiles\fP \f[CB]> /dev/null\fP
.Pe
This discards the output but prints the error message.
Some of the error messages you might encounter are:
.Ps
eqn: syntax error between lines 14 and 42, file book
.Pe
A syntax error (such as leaving out a brace, having one too many
braces, having a
.CW sup
with nothing before it, or using a wrong delimiter) has occurred
between lines 14 and 42, approximately, in the file
.CW book .
These line numbers are not accurate, so you have to look at
nearby lines as well.
If the following message is displayed:
.Ps
word overflow
.Pe
you have exceeded the limits of
.CW troff 's
internal buffer.
If you print the equation as a displayed equation, this message
will usually go away.
If the message is
.CW "line overflow" ,
the only solution is to break up the equation across multiple
lines, marking each with a separate
.CW .EQ
and
.CW .EN .
The
.CW eqn
program does not warn about equations that are too long for one
line.
If the following message is displayed:
.Ps
eqn: fatal error: Unexpected end of input at 2 sub a
.Pe
you forgot to put a closing quotation mark after the string
.CW "2 sub a"
when you named it in the
.CW define
statement.
.PP
It is also easy to leave out an ending delimiter in an equation.
In this case,
.CW eqn
thinks that successive character sequences (which may run to
hundreds of lines) are still part of the inline expression.
You may then get an overflow error or a garbled document.
The
.CW checkeq
.ix [checkeq] command %key checkeq command
program checks for misplaced or missing inline delimiters and
similar problems.
.PP
For example, when run on a draft of this chapter,
.CW checkeq
produced the following report:
.Ps
$ \f[CB]checkeq sect1\fP
sect1:
   New delims ##, line 6
   2 line ##, lines 618-619
   2 line ##, lines 619-620
   2 line ##, lines 620-621
             .
             .
             .
   EQ in ##, line 689
   EN in ##, line 691
   13 line ##, lines 709-721
             .
             .
             .
   2 line ##, lines 1300-1301
   2 line ##, lines 1301-1302
   Unfinished ##
.Pe
This report (which ran to 66 lines) was telling us that somewhere
before line 618 there was an unclosed inline equation using the
delimiter
.CW # .
Sure enough, the following error was found:
.Ps
B#f( theta )
.Pe
Because there was only one delimiter,
.CW eqn
gets \(lqout of phase\(rq and all subsequent delimiters
are misplaced.
After we fixed this one error,
.CW checkeq
printed the following \(lqnull\(rq report:
.Ps
$ \f[CB]checkeq sect1\fP
sect1:
.Pe
Because a simple problem like the one shown here can cause every
subsequent equation in the file to be garbled, and can waste an
entire formatting run, it makes sense to run
.CW checkeq
before you format any files containing equations.
.ix %end [eqn] preprocessor %key eqn preprocessor
.ig
	The following .sp -1v just keeps a blank page from
	being output.  The turning off the delimiter is causing
	just enough space being output to kick over to a new page.
	It can come out when no longer needed.  Or this can be
	moved to just before the last .Ah command, positioning
	it there also keeps the blank page from being emited.
	--Michael Hobgood
..
.sp -1v
.EQ
delim off
.EN
