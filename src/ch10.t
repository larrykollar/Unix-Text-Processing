
.ig
	Typed by: Michael Hobgood
	Marked up by: Michael Hobgood
	Proofed on: 17 Oct 2002
..

.so utp.mac
.utp
.ig
	redefine PS and PE to override -ms auto centering
	of pic images.  This also puts space above and
	below pic images.  Note: this works _VERY_WELL_
	to generate output that matches the O'Reilly
	printed book.  It breaks the html output
	completely.  However, taking this out and
	letting the normal -ms macros handle pic,
	results in unacceptable printed output and
	html output that is horrible!.  So, anyone
	can muck with this to their hearts content.
	But, don't come to me with bug reports or
	criticisms if you change this.  Cordially,
	--Michael Hobgood
..
.\" So let's move the old PS/PE out of the way &
.\" restore them at the end of the chapter. --LK
.rn PS oldPS
.rn PE oldPE
.de PS
.br
.ev pic_display
.in .5i
.sp 1v
..
.de PE
.br
.ev
.sp 1v
..
.Se 10 "Drawing Pictures" "Chapter" 1
.page 253
.ix %begin [pic] preprocessor %key pic preprocessor
.ix graphics
If you are one of those who can't draw a straight line, let
alone a decent picture or graph, you probably replace
pictures with verbal descriptions.
Perhaps you know what it is like to describe a drawing to a
person who knows how to draw.
The
.CW pic
preprocessor requires you to follow the process of using
\(lqwords\(rq
to describe something pictorial.
.PP
The
.CW pic
preprocessor has a dual purpose.
The first is to provide a
\(lqnatural language\(rq
.ix [pic] preprocessor, language~of %key pic preprocessor, language of
method of
describing simple pictures and graphs in your documents.
The second is to offer a
\(lqprogramming language\(rq
for
generating pictures and graphs with minimal user input.
Learning
.CW pic
is an iterative process: describe what you want and then
look at what you get.
We have included many examples that show both the
description and the resulting picture or graph.
Take the time to create variations of these descriptions,
making modifications and improvements.
.PP
The
.CW pic
preprocessor was designed to produce output on a typesetter,
which makes
.CW pic
expensive and difficult to learn.
Fortunately, some graphics terminals and most laser
printers can be set up to display or print
.CW pic
drawings.
Access to one or the other is essential if you are going to
get enough practice to know how
.CW pic
responds.
.PP
As a preprocessor,
.CW pic
is a program that processes a specific portion of an input
file before the whole document goes to the
.CW troff
formatter.
(The
.CW nroff
.ix [nroff] formatter, inability~to~use~[pic]~with %key nroff formatter, inability to~use~[pic]~with
.ix [pic] preprocessor, inability~to~use~with~[nroff] %key pic preprocessor, inability to~use~with~[nroff]
formatter cannot produce
.CW pic
output for terminals or line printers).
The preprocessors translate your description into
low-level formatter requests for
.CW troff .
.ix [pic] preprocessor, used~with [troff] %key pic preprocessor, used with [troff]
.ix [troff] formatter, using~[pic] with %key troff formatter, using [pic] with
.PP
Just like with
.CW tbl
and
.CW eqn ,
a pair of macros in the input file mark the beginning and
end of input to be processed by
.CW pic .
The delimiters for
.CW pic
are:
.Ps
\&.PS
pic \f[I]description\fP
\&.PE
.Pe
.ix [pic] preprocessor, start~and~end macros %key pic preprocessor, start and~end macros
When you format a document that contains
.CW pic
descriptions, you must invoke the
.CW pic
preprocessor as follows:
.Ps
$ \f[CB]pic\fP \fIfile\fP \f[CB]| troff |\fP \fIdevice\fP
.Pe
.page 254
.Ah "The \f[CB]pic\fP Preprocessor"
Imagine that you have to describe over the telephone the
following picture:
.ig
	see comments in the pic description below.
..
.PS
down
ellipse
# original had move down 1.25, changed to better fit the
# display of letter size paper
move down .75
circle radius .35
move left 1i from left of last circle; box
move right 1i from right of last circle; box
arrow from lower left of last ellipse to top of 1st box
arrow from lower right of last ellipse to top of 2nd box
arrow <-> from bottom of last ellipse to top of last circle
.PE
You might say:
\(lqThere's an ellipse at the top. Arrows are
connected to two boxes and a circle below it.\(rq
Now, think about describing this picture to someone who is
attempting to draw it.
No matter how careful you are, you realize that it is
difficult to translate a drawing into words.
.QP
\(lqFirst, draw an ellipse.
Move down and draw a circle below it.
Then draw one box to the left and draw another box of the
same size to the right.
Then draw an arrow from the bottom of the ellipse to the
top of the left-hand box.
Then draw a line from the bottom of the ellipse to the
top of the right-hand box.
The last thing to do is draw a line between the circle and
the ellipse and put arrowheads on both ends.\(rq
.LP
Here's what the actual
.CW pic
description looks like:
.ix [pic] preprocessor, typical figure~description %key pic preprocessor, typical figure description
.Ps
\&.PS
down
ellipse
move down 1.25
circle radius .35
move left 1i from left of last circle; box
move right 1i from right of last circle; box
arrow from lower left of last ellipse to top of 1st box
arrow from lower right of last ellipse to top of 2nd box
arrow <-> from bottom of last ellipse to top of last circle
\&.PE
.Pe
Even though you may know nothing about
.CW pic ,
you should be able to make some sense out of this description.
It names several objects: an ellipse, two boxes, a circle,
.page 255
and three arrows.
It specifies motion in inches as well as changes in
direction.
It also arranges some objects in relation to others,
locating the boxes to the left and right of the circle
and drawing arrows between the ellipse and the circle.
.PP
Having seen a full description of a
.CW pic
drawing in this example, you should be able to get something
of the flavor of
.CW pic .
The simpler the drawing, the less explaining you have to do.
We won't go into any more detail about this
.CW pic
description right now.
We'll look at it later in this chapter after we've covered
the basics of the
.CW pic
language.
.Bh "Naming Objects"
The
.CW pic
program is easy to use if you are describing only a single
.ix [pic] preprocessor, describing single~objects %key pic preprocessor, describing single objects
box or a circle.
To draw a circle, you name that object within the
.CW .PS /\c
.CW .PE
macros:
.Ps
\&.PS
circle
\&.PE
.Pe
When this description is processed by
.CW pic
it produces:
.PS
circle
.PE
.PP
There are seven graphic primitives:
.CW arc ,
.CW arrow ,
.CW box ,
.CW circle ,
.CW ellipse ,
.CW line ,
and
.CW spline .
.ix [pic] preprocessor, basic figures (graphics~primitives) %key pic preprocessor, basic figures (graphics primitives)
We will show these primitives in examples that present
additional aspects of
.CW pic .
.PP
In using a computer language, you have to be precise, using
as few words as possible to get the picture you want.
This means that you allow the program to make as many
of the decisions about the drawing as is practical.
After you understand
.CW pic 's
normal behavior, you will know what
.CW pic
will do on its own.
.PP
For instance, we didn't specify the size of the circle in
the last example.
By default,
.CW pic
draws a circle with a diameter of \(12 inch (or a radius of
\&.25 inch).
You can get a circle of a different size, but you have to
specify the size.
.ix [pic] preprocessor, specifying size~of graphics~primitives %key pic preprocessor, specifying size of graphics~primitives
.KS
.Ps
\&.PS
circle radius .5
\&.PE
.Pe
.KE
The
.CW pic
program understands any number to be in inches.
.ix [pic] preprocessor, units~of measure %key pic preprocessor, units of measure
You specify the size of a circle by giving its
.CW radius ,
which can be abbreviated as
.CW rad ,
or its
.CW diameter ,
which can be abbreviated as
.CW diam .
The previous input produces a circle twice the size of
the standard circle:
.page 256
.PS
circle radius .5
.PE
.PP
Similarly, if you specify
.CW box ,
you will get a box with a height of .5 inch and a width
.ix [pic] preprocessor, height~of object %key pic preprocessor, height of object
of .75 inch.
You can get a larger or smaller box by changing its
dimensions:
.ix [pic] preprocessor, specifying dimensions %key pic preprocessor, specifying dimensions
.Ps
\&.PS
box height 1i width .5
\&.PE
.Pe
The output for this example is a box twice as high as
it is wide:
.PS
box height 1i width .5
.PE
.PP
You can also use the abbreviations
.CW ht
and
.CW wid
for these attributes.
The order in which you specify the dimensions does not
matter, and you can change one attribute without
changing the other.
That is how we can draw a square:
.Ps
\&.PS
box ht .75
\&.PE
.Pe
The default width is already .75 inch, so this
.CW pic
description produces:
.PS
box ht .75
.PE
.PP
With the attribute
.CW same ,
you can reuse the dimensions specified for a previous
object of the same type.
.ix [pic] preprocessor, reusing dimensions %key pic preprocessor, reusing dimensions
For instance, after you had described the square box,
.CW "box same"
would duplicate a square of the same size.
.page 257
.Bh "Labeling Objects"
.ix [pic] preprocessor, labeling objects %key pic preprocessor, labeling objects
To provide a label for any object, specify the text
within double quotation marks after the name of the object.
The label is placed at the center of the object.
.Ps
\&.PS
box ht .75 "Square One"
\&.PE
.Pe
This
.CW pic
description produces:
.PS
box ht .75 "Square One"
.PE
Even if a label does not contain blank spaces, you must
enclose it within double quotation marks.
Each individually quoted item will be output on a new line.
.Ps
box wid .5 "Second" "Square"
.Pe
This description produces:
.PS
box wid .5 "Second" "Square"
.PE
Because
.CW troff ,
not
.CW pic ,
actually handles the text,
.CW pic
doesn't really try to fit a label inside an object.
.ix [pic] preprocessor, adjusting label~placement %key pic preprocessor, adjusting label placement
You must determine the amount of text that will fit.
The
.CW pic
program ignores lines beginning with a period, permitting
you to use
.CW troff
requests to change the point size, font, or typeface.
.ix [pic] preprocessor, used~with [troff] %key pic preprocessor, used with [troff]
.ix [troff] formatter, using~[pic]~with %key troff formatter, using [pic]~with
It is best to avoid spacing requests, and be sure
to reset any change in point size.
.PP
When you specify a single text label with a
.CW line ,
.CW pic
centers it on the line.
.ix [pic] preprocessor, line %key pic preprocessor, line
For instance, inline
.CW troff
requests can be used to print a label in 14-point
italic (i.e., 4 points larger than the current point size).
.Ps
\&.PS
line "\\fI\\s14pic\\s10\\fR"
\&.PE
.Pe
It produces:
.ig
	The original output did not reflect the italic font
	specified.  I have let the output match the given
	input.
	--Michael Hobgood
..
.PS
line "\f[I]\s14pic\s10\fP"
.PE
Because the standard placement of labels is not always
useful, you can specify the attributes
.CW above
or
.CW below .
In the following example, the point size is specified using
the following
.CW .ps
request:
.page 258
.Ps
\&.ps +2
line "\\fIPIC\\fR" above
\&.ps -2
.Pe
It produces:
.PS
line "\f[I]\s+2PIC\s-2\fP" above
.PE
If you supply two quoted arguments with
.CW line ,
the first will be printed above the line and the
second printed below.
.PP
You can also select a
.CW line
or
.CW box
that is
.CW dotted
or
.CW dashed ,
as you can see in the next example:
.Ps
box dotted "\\f(CWbox dotted\\fP" above
.Pe
Note the inline request to invoke the constant-width font
for the label.
The
.CW above
keyword places the label above the center line of the box.
This description produces:
.PS
box dotted "\f[C]box dotted\fP" above
.PE
The box, composed of dots, contains a label printed in
constant-width font.
It is obvious here that
.CW pic
made no attempt to fit the label
\(lqinside\(rq
the box.
The
.CW above
attribute does not place text above the box, but rather
above the center of the box.
The description:
.Ps
line dashed "sign here" below
.Pe
produces a dashed line:
.PS
line dashed "sign here" below
.PE
If the attributes of texture are followed by a value,
.CW pic
will try to keep that amount of spacing between the dashes
or dots.
The description
.CW "dashed .1"
will result in dashes spaced .1 inch apart.
.Bh "\f[CB]pic\fP's Drawing Motion"
.ix [pic] preprocessor, drawing~motion %key pic preprocessor, drawing motion
After you have named an object and determined its size,
you have to think about where
.CW pic
is going to draw it.
(Indentation and other matters concerning the placement of
the drawing on the page are supplied by either the
.CW .PS /\c
.CW .PE
or
.CW .DS /\c
.CW .DE
macros.
The
.CW pic
program places a single object at the left margin.
If you name three objects in the same description,
where will
.CW pic
draw them?
.page 259
.Ps
\&.PS
circle "A"
line "1" "2"
box "B"
\&.PE
.Pe
The following output is produced:
.PS
circle "A"
line "1" "2"
box "B"
.PE
Objects are placed one after another from left to right.
The
.CW pic
program assumes that objects should be connected, as in the
following example:
.Ps
\&.PS
box ht 1.25
box ht 1
box ht .75
box ht .5
\&.PE
.Pe
This description produces a row of boxes of decreasing size:
.PS
box ht 1.25
box ht 1
box ht .75
box ht .5
.PE
If you don't want objects to be connected, you can
.ix [pic] preprocessor, leaving space~between objects %key pic preprocessor, leaving space between objects
.CW move
before specifying the next object.
In the next example,
.CW move
places a
.CW box
to the right of a
.CW circle :
.Ps
\&.PS
circle "A" ; move ; box "B"
\&.PE
.Pe
As shown in this example,
.CW pic
commands can be entered on the same line, separated by
semicolons, instead of on separate lines.
This description produces:
.PS
circle "A" ; move ; box "B"
.PE
.page 260
.Bh "Changing Direction"
.ix [pic] preprocessor, changing direction~of drawing %key pic preprocessor, changing direction of drawing
As you have seen,
.CW pic
places objects in a continuous motion from left to right.
You can also get
.CW pic
to change direction using the attributes
.CW left ,
.CW right ,
.CW up ,
or
.CW down .
We'll see examples of their use shortly.
.PP
The distance of a
.CW move
is the same length as a
.CW line
(.5 inch).
If you want to change the distance of a
.ix [pic] preprocessor, adjusting drawing~motion %key pic preprocessor, adjusting drawing motion
.CW move
or the length of a
.CW line ,
then the change must be accompanied by an attribute of
direction.
Although it seems natural to write:
.Ps
line 2; move 1; arrow 1 \f[I]Wrong\fP
.Pe
.CW pic
does not accept this command unless you specify directions
for all three cases.
When
.CW pic
objects to your choice of words, it will display the
offending line, using a caret (^) to mark the error.
.Ps
pic: syntax error near line 1, file test
 context is
       line 2 ^; move 1
.Pe
Only the first error on the line is marked. (It is
acceptable to write
.CW line ;
.CW move ,
using the standard length and distance).
The next example shows how to draw a line of a specified
length and how to move a specified distance.
The
.CW pic
program assumes that any value is in inches; thus you can
say
.CW 2i
or simply
.CW 2
to indicate 2 inches.
.Ps
line up 2; move down 1; arrow right 1
.Pe
Note that the attribute of direction precedes the distance.
The preceding description produces:
.PS
line up 2; move down 1; arrow right 1
.PE
You cannot specify
.CW "down 1"
or
.CW "right 1"
without also specifying either a
.CW line
or
.CW move .
These attributes change the direction of the motion used
to draw objects.
They do not cause movement.
The attributes of direction affect the position of the
objects that follow it, as shown in the next example.
.page 261
.Ps
\&.PS
down; circle "A"; line; box "B"
\&.PE
.Pe
These objects are drawn from top to bottom:
.PS
down; circle "A"; line; box "B"
.PE
.PP
If you describe a change of motion, it affects the points
where objects are connected.
Look what happens if we specify the attribute
.CW down
.I after
the circle:
.Ps
\&.PS
circle "A"; down; line; box "B"
\&.PE
.Pe
Now the line begins at a different position:
.PS
circle "A"; down; line; box "B"
.PE
.PP
The
.CW pic
program keeps track of the start and end points for each
.ix [pic] preprocessor, start~and~end~of~an object %key pic preprocessor, start and~end~of~an object
object, and their relationship to the direction in which
objects are being drawn.
The next object is drawn from the exit point of the
previous object.
Entry and exit points may seem obvious for a line,
but not so obvious with circles.
When the motion is from left to right, a circle's entry point
is at 9 o'clock and its exit point is at 3 o'clock.
When we specified
.CW down
after the
.CW circle
in the first example, the exit point of the circle did not
change; only the direction in which the line was drawn
from that point changed.
Entry and exit points are reversed when the motion is from
right to left, as specified by the
.CW left
attribute.
.page 262
.Ps
left; arrow; circle "A"; arrow; box "B"
.Pe
This description produces:
.PS
left; arrow; circle "A"; arrow; box "B"
.PE
.PP
You can draw a diagonal line by applying two changes in
.ix [pic] preprocessor, diagonal lines %key pic preprocessor, diagonal lines
direction.
Look at how we describe a right triangle:
.KS
.Ps
\&.PS
line down 1i
line right 1i
line up 1i left 1i
\&.PE
.Pe
.KE
This description produces:
.PS
line down 1i
line right 1i
line up 1i left 1i
.PE
The diagonal line is drawn by combining two attributes of
direction,
.CW up
and
.CW left .
You can describe a continuous line using
.CW then .
In the next example we use
.CW arrow
.ix [pic] preprocessor, [arrow] %key pic preprocessor, [arrow]
to demonstrate that we are describing a single object.
.Ps
\&.PS
arrow down 1i then right 1i then up 1i left 1i
\&.PE
.Pe
When using
.CW then ,
you have to define the motion on a single line or escape
the end of the line with a backslash
.CW \e ). (
It produces:
.PS
arrow down 1i then right 1i then up 1i left 1i
.PE
If the description ended with:
.page 263
.Ps
.ix [pic] preprocessor, drawing~in clockwise direction %key pic preprocessor, drawing in clockwise direction
then up 1i then left 1i
.Pe
we would have a 1-inch square instead of a right triangle.
.PP
An
.CW arc
.ix [pic] preprocessor, [arc] %key pic preprocessor, [arc]
is a portion of a circle.
Naming four arcs consecutively will draw a circle.
An arc is drawn counterclockwise from the current position
(from 6 o'clock to 3 o'clock, for instance).
The next example uses arcs to produce a box with rounded
corners:
.Ps
line right 1; arc; line up ; arc
line left 1; arc; line down; arc
.Pe
This description starts with the bottom line of the curved
box.
The motion is counterclockwise.
.PS
line right 1; arc; line up; arc
line left 1; arc; line down; arc
.PE
The attribute
.CW cw
draws an arc in a clockwise direction:
.ix [pic] preprocessor, drawing~in clockwise direction %key pic preprocessor, drawing in clockwise direction
.Ps
arc "A"; arc "B" cw
.Pe
This description produces:
.PS
arc "A"; arc "B" cw
.PE
Note that text is placed at what
.CW pic
considers to be the center of the arc, which is the
center of the corresponding circle.
.PP
A
.CW spline
.ix [pic] preprocessor, [spline] %key pic preprocessor, [spline]
is a cross between an
.CW arc
and a
.CW line .
It is used to draw smoothed curves.
In this example, a spline traces a path between two circles.
.Ps
circle rad .25
spline right 1 then down .5 left 1 then right 1
circle same
.Pe
This description produces:
.PS
circle rad .25
spline right 1 then down .5 left 1 then right 1
circle same
.PE
.page 264
A
.CW spline
is used in the same way as a
.CW line .
When drawn continuously using
.CW then ,
a
.CW spline
that changes direction draws a curve.
(Similarly, a
.CW line
would produce an angle).
We'll see more examples of
.CW spline
later.
.Bh "Placing Objects"
.ix [pic] preprocessor, placing objects %key pic preprocessor, placing objects
It isn't always useful to place objects in a continuous
motion.
Look at the following example, which seems like it ought
to work but doesn't:
.Ps
\&.PS
down; arrow; box
right; arrow; ellipse; arrow
\&.PE
.Pe
This
.CW pic
description produces:
.PS
down; arrow; box
right; arrow; ellipse; arrow
.PE
Note the short arrow, drawn from the box to the circle.
What happened?
The end point of the box was not on the right, but on the
bottom, because the motion in effect where the box is drawn is
.CW down .
Changing direction (\c
.CW right )
affects only the direction in which the arrow is drawn;
it does not change where the arrow begins.
Thus, the arrow is drawn along the bottom line of the box.
.PP
Sometimes, it is best to place an object in relation to
previously placed objects.
The
.CW pic
program provides a natural way to locate objects that have
been drawn.
For example, the attribute
.CW first
locates the first occurrence of an object, and the
attribute
.CW from
specifies that the object serves as a starting point
for the next object drawn.
.Ps
\&.PS
circle ; move; circle ; arrow up from first circle
\&.PE
.Pe
It produces:
.PS
# original has first, not 1st. gpic doesn't recognize
# the old syntax.
circle ; move; circle ; arrow up from 1st circle
.PE
.page 265
You can reference each type of object using an ordinal
number.
Referring to the order in which an object is drawn, you can
say
.CW "first box"
(\c
.CW "1st box"
is also acceptable) or
.CW "2nd circle" .
You can also work back from the last object, specifying the
.CW "last box"
or
.CW "2nd last box" .
.PP
The center of each object is used as the reference point.
In the last example, the arrow was drawn from the center
of the circle.
The attribute
.CW chop
can be used to chop off the part of the line that would
extend to the center of each circle.
In the next example, a chopped line is drawn between the
first and third circles:
.Ps
\&.PS
circle "1" ; move down from last circle
circle "2" ; move right from last circle; circle "3"
line from 1st circle to last circle chop
\&.PE
.Pe
This description produces:
.PS
circle "1" ; move down from last circle
circle "2" ; move right from last circle; circle "3"
line from 1st circle to last circle chop
.PE
The amount that is chopped is by default equal to the radius
of the circle.
You can specify how much of the line is chopped, for use
with other objects or text, by supplying either one or
two values after the attribute.
If a single value is given, then both ends of the line
are chopped by that amount.
If two values are given, the start of the line is chopped
by the first amount and the end of the line chopped by the
second amount.
.PP
It is important to remember that movement
.CW from
a referenced object is measured from its center, unless
.ix [pic] preprocessor, movement~from~a referenced object %key pic preprocessor, movement from~a referenced object
otherwise specified.
Look at these four circles:
.PS
circle "1"
move right from last circle; circle "2"
move right from right of last circle; circle "3"
move right from bottom of last circle; circle "4"
.PE
The second circle is produced by the description:
.Ps
move right from last circle; circle "2"
.Pe
Because the distance (.5 inch by default) is measured
from the center of the circle, there is only .25 inch
between the two circles.
The third circle is produced by the description:
.page 266
.Ps
move right from right of last circle; circle "3"
.Pe
Now the distance is measured from the right of the second
circle.
There is twice as much space between the second and third
circle as between the first and second.
The fourth circle is produced by the description:
.Ps
move right from bottom of last circle; circle "4"
.Pe
The starting point of the fourth circle (its left
\(lqside\(rq)
is .5 inch from the bottom of the previous circle.
.PP
Using
.CW bottom ,
.CW top ,
.CW right ,
and
.CW left ,
you can locate specific points on any object.
.ix [pic] preprocessor, locating specific points %key pic preprocessor, locating specific points
.ix [pic] preprocessor, turning~a corner %key pic preprocessor, turning a corner
In the next example, we solve the problem of turning a
corner by specifying the place from which the arrow will
be drawn:
.Ps
\&.PS
down; arrow; box
right; arrow from right of last box; ellipse; arrow ; box
up; arrow from top of last box
\&.PE
.Pe
In our earlier example, the arrow was drawn from the bottom
of the box; now we change the starting point of the arrow
to the
.CW right
of the previous box.
This description produces:
.PS
down; arrow; box
right; arrow from right of last box; ellipse; arrow ; box
up; arrow from top of last box
.PE
.PP
With boxes and ellipses, you can refer to an
.CW upper
or
.CW lower
position:
.Ps
\&.PS
box; arrow from upper right of last box;
arrow down from lower left of last box
\&.PE
.Pe
This description produces:
.PS
box; arrow from upper right of last box;
arrow down from lower left of last box
.PE
.page 267
With objects like lines and arcs, it is more useful to refer
to the
.CW start
and
.CW end
of the object.
.ix [pic] preprocessor, start~and~end~of~an object %key pic preprocessor, start and~end~of~an object
For example, here's another way to draw a triangle:
.Ps
\&.PS
line down 1i
line right
line from start of 1st line to end of 2nd line
\&.PE
.Pe
The last line could also be written:
.Ps
line to start of 1st line
.Pe
.KS
The
.CW pic
description produces:
.PS
line down 1i
line right
line from start of 1st line to end of 2nd line
.PE
.KE
You now know enough of the basic features of
.CW pic
to benefit from a second look at the
.CW pic
description shown at the beginning of this chapter.
The only thing we haven't covered is how to get a
double-headed arrow.
.ix [pic] preprocessor, double-headed arrow %key pic preprocessor, double-headed arrow
Because an
.CW arrow
can also be specified as
.CW "line ->"
or
.CW "line <-" ,
you can get a double-headed arrow with
.CW "line <->" .
.Ps
\&.PS
1	down
2	ellipse
3	move down 1.25
4	circle radius .35
5	move left 1i from left of last circle; box
6	move right 1i from right of last circle; box
7	arrow from lower left of last ellipse to top of \\
	1st box
8	arrow from lower right of last ellipse to top of \\
	2nd box
9	line <-> from bottom of last ellipse to top of last \\
	circle
\&.PE
.Pe
The lines in this description are numbered for easy
reference in the following exercise.
.PP
As is true with almost anything you describe, a
.CW pic
description could be written in several different ways.
In fact, you will learn a lot about
.CW pic
by making even minor changes and checking the results.
See if you can answer these questions:
.page 268
.RS
.Ls B
.Li
Why is
.CW down
specified before the
.CW ellipse ?
If you removed
.CW down ,
would the circle be centered underneath the ellipse?
.Li
.CW down
changes direction of movement.
Does
.CW pic
allow you to say
.CW "move 1.25"
as well as
.CW "move down 1.25" ?
.Li
Where is the exit point  of the
.CW circle
when it is drawn with a downward motion in effect?
If lines 5 and 6 were replaced by:
.Ps
.ti +13n
move left 1i; box
.ti +13n
move right 2i; box
.Pe
where would the boxes be drawn?
.Li
There is 1 inch between the circle and each box.
How much space would there be if lines 5 and 6 were
replaced by:
.Ps
.ti +13n
move left from last circle; box
.ti +13n
move right from last circle; box
.Pe
Hint: The distance of a move is .5 inch, and this would be
measured from the center of the circle, which has a radius
of .35 inch.
.Li
Line 8 draws an arrow from the lower right of the ellipse
to the top of the right-hand box.
If it were simplified to:
.Ps
.ti +13n
arrow from last ellipse to 2nd box
.Pe
where would the beginning and ending of the arrow be?
.Li
This drawing can present an interesting problem if the
circle is omitted.
How would you draw the two boxes if the circle was not
there as a reference point?
.Le
.RE
Fortunately, there is a simple way to deal with the
.ix [pic] preprocessor, invisible reference~object %key pic preprocessor, invisible reference object
problem presented in the last question.
Lacking a reference object, you can create an invisible one
using the
.CW invis
attribute.
This lets you specify a circle that is not drawn but still
holds a place that you can reference.
.Ps
\&.PS
down
ellipse
move down 1.25
circle radius .35 invis
move left 1i from left of last circle; box
move right 1i from right of last circle; box
arrow from lower left of last ellipse to top of 1st box
arrow from lower right of last ellipse to top of 2nd box
\&.PE
.Pe
.page 269
This
.CW pic
description produces:
.PS
down
ellipse
move down 1.25
circle radius .35 invis
move left 1i from left of last circle; box
move right 1i from right of last circle; box
arrow from lower left of last ellipse to top of 1st box
arrow from lower right of last ellipse to top of 2nd box
.PE
One thing that seems hard to get used to is that your current
position always changes after an object is drawn, based on
the motion in effect.
This means you have to keep in mind the location of the
starting point for the next object that you are going to
draw.
.PP
You can use braces to enclose an object (or a series of
objects or motions) so that the starting point is
unchanged.
In the last drawing, if the
.CW invis
attribute didn't solve the problem so easily, we could
have used braces to maintain a central point
below the ellipse from which you can move to draw
the boxes.
Here's a different example that illustrates how braces
can be used to control your position:
.Ps
\&.PS
{arrow down}
{arrow up}
{arrow left}
arrow right
\&.PE
.Pe
Each object, except the last, is enclosed in braces; all
objects share the same starting point.
This description produces:
.PS
{arrow down}
{arrow up}
{arrow left}
arrow right
.PE
.page 270
.Bh "Placing Text"
.ix [pic] preprocessor, placing text~in~a drawing %key pic preprocessor, placing text in~a drawing
Text can be placed in a drawing just like an object.
You have to take care in placing text, as in the
next example, where we specify a move so that the compass
points are not drawn on top of the arrowheads:
.Ps
\&.PS
{arrow down; move; "S" }
{arrow up; move; "N" }
{arrow left; move; "W" }
{arrow right; move; "E" }
\&.PE
.Pe
Notice that the attributes of direction cause the object to
be drawn in that direction and establish a new motion for
successive objects.
This description produces:
.PS
{arrow down; move; "S" }
{arrow up; move; "N" }
{arrow left; move; "W" }
{arrow right; move; "E" }
.PE
As mentioned,
.CW pic
does not really handle text, allowing
.CW troff
to do the work.
In some ways, this is unfortunate.
The thing to remember is that
.CW pic
does not know where the text begins or ends.
(You can use the attributes
.CW ljust
or
.CW rjust
to have the text left justified\(emthe first character
is positioned at that point\(emor right justified\(emthe
last character is at that point.
These attributes can also be used with text labels).
.PP
The
.CW pic
program does not keep track of the start and the end of a
text object.
It only knows a single point which is the point where
.CW troff
centers the text.
In other words, a text item does not cause a change in
position.
Two consecutive quoted items of text (not used as labels
to another object) will overwrite one another.
Objects are drawn without regard to where the text item
is, as shown in the next example:
.Ps
"Start"; line;arrow;line; "Finish"
.Pe
This description produces:
.PS
"Start"; line; arrow; line; "Finish"
.PE
This example can be improved by right justifying the first
text item (\c
.CW \(dqStart\(dq
.CW  rjust )
and left justifying the last text item (
.CW \(dqFinish\(dq
.CW ljust ).
As you'll
.page 271
notice, though, the picture starts at the margin, and the
label is forced out where it doesn't belong.
.PS
"Start" rjust; line; arrow; line; "Finish" ljust
.PE
The location of the point that
.CW pic
knows about is unchanged.
Most of the time, you will have to use the
.CW move
command before and after inserting text.
.PP
Because
.CW pic
works better with objects than text, the
.CW invis
attribute can be used to disguise the object behind the
text, and give you a way to place text where you can
point to it.
.Ps
\&.PS
down
ellipse invis "DECISION?"
move down 1.25
circle rad .35 invis "Maybe"
move left 1i from left of last circle; box invis "Yes"
move right 1i from right of last circle; box invis "No"
arrow from lower left of last ellipse to top of 1st box
arrow from lower right of last ellipse to top of 2nd box
line <-> from bottom of last ellipse to top of last circle
\&.PE
.Pe
This description produces:
.PS
down
ellipse invis "DECISION?"
move down 1.25
circle rad .35 invis "Maybe"
move left 1i from left of last circle; box invis "Yes"
move right 1i from right of last circle; box invis "No"
arrow from lower left of last ellipse to top of 1st box
arrow from lower right of last ellipse to top of 2nd box
line <-> from bottom of last ellipse to top of last circle
.PE
You may have recognized that the description for this
drawing is basically the same one that produced the
drawing at the beginning of this chapter.
The
.CW invis
attribute makes text
labels, not objects, the subject of this picture.
This should lead you to the idea that
.CW pic
descriptions can be reused.
Try to think of the form of a drawing separately from its
content.
Most drawings contain forms that can be reworked in the
service of new material.
.page 272
.Bh "Place and Position Notation"
.ix [pic] preprocessor, place~and~position notations %key pic preprocessor, place and~position notations
Can you locate the starting points of the arrows on this
ellipse?
.PS
ellipse
arrow up left from upper left of last ellipse
arrow up from top of last ellipse
arrow up right from upper right of last ellipse
arrow right from right of last ellipse
arrow right down from lower right of last ellipse
arrow down from bottom of last ellipse
arrow left down from lower left of last ellipse
arrow left from left of last ellipse
.PE
To write the description for this example is a test of
patience and thoroughness, if nothing else.
We start at the
.CW "upper left"
of the ellipse and move clockwise around the ellipse.
.Ps
\&.PS
ellipse
arrow up left from upper left of last ellipse
arrow up from top of last ellipse
arrow up right from upper right of last ellipse
arrow right from right of last ellipse
arrow right down from lower right of last ellipse
arrow down from bottom of last ellipse
arrow left down from lower left of last ellipse
arrow left from left of last ellipse
\&.PE
.Pe
Although you can say
.CW "upper left"
or
.CW "lower left" ,
you cannot say
.CW "top left"
or
.CW "bottom right" .
.PP
Sometimes
.CW pic 's
English-like input can get to be cumbersome.
Fortunately,
.CW pic
supports several different kinds of place and position
notations that shorten descriptions.
.PP
You can reduce the phrase:
.Ps
from bottom of last ellipse
.Pe
to either of the following:
.Ps
from .b of last ellipse
from last ellipse.b
.Pe
You can use this notation for the primary points of any
object.
You can also refer to the compass points of an object, which
provides a way to specify corners.
Table 10-1 lists the placename notations.
.page 273
.Ts "\f[CB]pic\fP Placename Notations"
.TS
box center;
l l.
Value	Position
_
\f[C]t\fP	Top
\f[C]b\fP	Bottom
\f[C]l\fP	Left
\f[C]r\fP	Right
\f[C]n\fP	North
\f[C]e\fP	East
\f[C]w\fP	West
\f[C]s\fP	South
\f[C]nw\fP	Northwest
\f[C]sw\fP	Southwest
\f[C]ne\fP	Northeast
\f[C]se\fP	Southeast
.TE
.Te
.PP
Instead of writing:
.Ps
from lower left of last ellipse
.Pe
you might write:
.Ps
from last ellipse.sw
.Pe
Another simple way to shorten a description is to give
an object its own name.
.ix [pic] preprocessor, naming~an object %key pic preprocessor, naming an object
The name must begin with an uppercase letter.
If we assign the placename
.CW Elp
to the ellipse:
.Ps
Elp: ellipse
.Pe
then we have either of the following ways to refer to
specific points:
.Ps
arrow up left from upper left of Elp
arrow up left from Elp.nw
.Pe
Here's the condensed version of the description for
the previous example:
.Ps
\&.PS
Elp: ellipse
arrow up left from Elp.nw
arrow up from Elp.n
arrow up right from Elp.ne
arrow right from Elp.e
arrow right down from Elp.se
arrow down from Elp.s
arrow left down from Elp.sw
arrow left from Elp.w
\&.PE
.Pe
At least it helps to keep you from confusing the placement
of the arrow with the drawing motion.
.page 274
.PP
If you want to specify a point that is not at one of the
compass points, you can indicate a point somewhere in
between two places.
You can use the following kind of construction:
.Ps
\f[I]fraction\fP of the way between \f[I]first.position\fP and \f[I]second.position\fP
.Pe
or use the following notation:
.Ps
\f[I]fraction\fP < \f[I]first.position,second.position\fP >
.Pe
The following example shows both forms:
.Ps
box
arrow down left from 1/2 of the way between last box.sw \\
and last box.w
arrow down right from 1/2 < last box.se, last box.e >
.Pe
Although you may not want to intermix different forms for
the sake of someone reading the description,
.CW pic
does allow it.
The preceding description produces:
.PS
box
arrow down left from 1/2 of the way between last box.sw \
and last box.w
arrow down right from 1/2 < last box.se, last box.e >
.PE
The
.CW at
attribute can be used to position objects in a drawing.
.Ps
box "A"; box with .se at last box.nw "B"
box with .sw at last box.ne "C"
.Pe
This description produces:
.PS
box "A"; box with .se at last box.nw "B"
box with .sw at last box.ne "C"
.PE
.PP
The next example illustrates again the problem of placing
text.
.ix [pic] preprocessor, placing text~in~a drawing %key pic preprocessor, placing text in~a drawing
This time we want to position callouts above and below
the text.
.page 275
.KS
.PS
     #    "#" introduces a comment
     #
     # Describe box; escape end of line to include
     # text on separate line
     #
Path: box ht .25 wid 4.5 \
"\f[C]PATH=.:/bin:/usr/bin:/usr/local/bin:/usr/fred/bin\fP"
     #
     # Describe line down from box and put top of ellipse
     # at end of last line; label will be printed
     # in 9-point italic.
     #
line down from 1/3 <Path.sw, Path.s>
ellipse "\f[I]\s9Current" "Directory\s0\fP" with .t at \
end of last line
     #
     # Describe two lines, one up from box
     # and a second down to the point right of it.
     #
line up from 1/2 <Path.nw, Path.n>
line to 2/3 <Path.nw, Path.n>
ellipse "\f[I]\s9UNIX System" "Programs\s0\fP" with .b at \
start of last line
     #
     # Describe the third callout below the box.
     #
line down from Path.s
ellipse "\f[I]\s9Site-Specific" "Programs\s0\fP" with .t at \
end of last line
.PE
.KE
We position the text inside a long box.
Because the callout lines will point to the box
that surrounds the text rather than to the text itself,
we try to specify approximately where to draw the lines.
.Ps
\&.PS
     #    "#" introduces a comment
     #
     # Describe box; escape end of line to include
     # text on separate line
     #
Path: box ht .25 wid 4 \\
"\\f(CWPATH=.:/bin:/usr/bin:/usr/local/bin:/usr/fred/bin\\fR"
     #
     # Describe line down from box and put top of ellipse
     # at end of last line; label will be printed
     # in 9-point italic.
     #
line down from 1/3 <Path.sw, Path.s>
ellipse "\\fI\\s9Current" "Directory\\s0\\fP" with .t at \\
end of last line
     #
     # Describe two lines, one up from box
     # and a second down to the point right of it.
     #
line up from 1/2 <Path.nw, Path.n>
.page 276
line to 2/3 <Path.nw, Path.n>
ellipse "\\fI\\s9UNIX System" "Programs\\s0\\fP" with .b at \\
start of last line
     #
     # Describe the third callout below the box.
     #
line down from Path.s
ellipse "\\fI\\s9Site-Specific" "Programs\\s0\\fP" with .t at \\
end of last line
\&.PE
.Pe
Admittedly, positioning callouts is guesswork; it took
several iterations to align the callouts with the
appropriate text.
.Bh "Defining Object Blocks"
.ix [pic] preprocessor, defining object~blocks %key pic preprocessor, defining object blocks
You can describe any sequence of motions or objects as
a block.
A block is defined between a pair of brackets (\c
.CW [] ).
You can also give the block a placename, beginning with an
uppercase letter.
Some of the objects that we have created in this chapter,
such as a square, triangle, or compass, could be defined as
blocks and named so that we can refer to each one
as a single object.
.Ps
Rtriangle: [
       linewid = 1
       line down then right then up left
       ]
\&.ps 18
\&.ft I
"1" at Rtriangle.w
"2" at Rtriangle.s
"3" at Rtriangle
\&.ft R
\&.ps 10
.Pe
This description produces:
.ig
	original display had courier font. Changed to match
	the description in the previous paragraph.
	--Michael Hobgood
..
.PS
Rtriangle: [
       linewid = 1
       line down then right then up left
       ]
.ps 18
.ft I
"1" at Rtriangle.w
"2" at Rtriangle.s
"3" at Rtriangle
.ft R
.ps 10
.PE
We are able to refer to the compass points of the block,
although these points may not always be where you expect.
The number 3 is printed at the center of
.CW Rtriangle
according to
.CW pic .
But in fact its position is the side opposite the right
angle.
The
\(lqcenter\(rq
of this block is at the center of a box that
shares the bottom and left sides of the right triangle.
.page 277
.PP
You can also refer to positions for a single block using
brackets.
The reference
.CW [] .\c
.CW w
is a position at the west end of the block.
.PP
In this example, instead of specifying individual line
lengths, we redefined the variable
.CW linewid .
This is the variable that
.CW pic
accesses to determine how long a line should be.
Shortly, we'll look at all the variables preset by
.CW pic .
Generally, what you describe within a block remains local
to the block.
Thus,
.CW linewid
would not affect other lines outside the block.
Otherwise, resetting a variable has an effect not only
on other objects in that drawing but also on other
drawings in that file.
.PP
The best use of blocks in a drawing is to define
.ix [pic] preprocessor, use~of object~blocks %key pic preprocessor, use of object~blocks
significant portions so that you can position them accurately.
Blocks usually relate to the content of a drawing.
In the next example, we describe a two-dimensional box
to represent a modem.
.Ps
MOD: [
BOXA: box wid 1 ht .25 " \\(bu  \\(bu  \\(bu  \\(bu  \\(bu "
line from BOXA.nw up 1 right .5
.ig
	deleted an x at the end of the previous line.
	refer to the actual pic code below for BOXA
	for the reason why.  the x was probably just
	a typo
	--Michael Hobgood
..
then right 1 then down 1 left .5 to BOXA.ne
line from BOXA.se up 1 right .5 then up .25
]
.Pe
The block, named
.CW MOD ,
consists of a box followed by a series of lines.
The box is given a name,
.CW BOXA .
The special character sequence
.CW \e(bu
represents a bullet (interpreted by
.CW troff ,
not
.CW pic ).
This description produces:
.PS
MOD: [
BOXA: box wid 1 ht .25 " \(bu  \(bu  \(bu  \(bu  \(bu "
# original has an x at the end of the next line.
# it doesn't work. remove the x, and add a \
# and it works. without the \, get a syntax error
# on the line "then right..."
line from BOXA.nw up 1 right .5\
then right 1 then down 1 left .5 to BOXA.ne
line from BOXA.se up 1 right .5 then up .25
]
.PE
The next block, named
.CW WALL ,
describes a drawing of a telephone wall socket.
It contains two objects, a box named
.CW BOXB
and a circle inside the box named
.CW CIR .
.Ps
WALL: [
BOXB: box wid .25 ht .5
CIR: circle at center of BOXB radius .05
] with .s at MOD.ne + (.5,1)
.Pe
To position this block in relation to
.CW MOD ,
we describe a position 1 inch up and .5 inch
.ix [pic] preprocessor, positioning object~blocks %key pic preprocessor, positioning object blocks
to the left of the top right-hand corner of
.CW MOD .
Then we draw a spline from the modem to the wall socket.
This introduces us to the fact that no matter how we
specify an object,
.CW pic
locates that object in a Cartesian coordinate system.
We'll look at this in more detail in a later section.
For now, it is sufficient to note how we change position
by adding or subtracting from the position on the x-axis
and y-axis.
.CW "MOD.ne+(.5,1)"
adds .5 to the x-axis (moving to the right) and 1 to the
y-axis (moving up) from the coordinates of
.CW MOD.ne .
.page 278
.Ps
spline from MOD.n up .25 right .5 then right 1 to center \\
of WALL.CIR
.Pe
Notice that we can refer to objects inside a block.
If we had not named the circle, we could still refer
to it as
.CW WALL.circle .
.PP
The last thing to do is to position the text:
.Ps
move right 1 from WALL.e; " Telephone Line"
move down .5 from MOD.s "Modem"
.Pe
.KS
.PP
This entire description produces the following drawing:
.PS
MOD: [
BOXA: box wid 1 ht .25 " \(bu  \(bu  \(bu  \(bu  \(bu "
line from BOXA.nw up 1 right .5\
then right 1 then down 1 left .5 to BOXA.ne
line from BOXA.se up 1 right .5 then up .25
]
WALL: [
BOXB: box wid .25 ht .5
CIR: circle at center of BOXB radius .05
] with .s at MOD.ne + (.5,1)
spline from MOD.n up .25 right .5 then right 1 to center \
of WALL.CIR
move right 1 from WALL.e; "Telephone Line"
move down .5 from MOD.s "Modem"
.PE
.KE
.Bh "Resetting Standard Dimensions
.ix [pic] preprocessor, redefining standard dimensions %key pic preprocessor, redefining standard dimensions
The
.CW pic
program has a number of built-in variables that define the
.ix [pic] preprocessor, dimension variables %key pic preprocessor, dimension variables
values used to draw standard
.CW pic
objects.
.PP
Refer to Table 10-2.
.ix [pic] preprocessor, default dimensions~of standard~objects %key pic preprocessor, default dimensions of standard~objects
You can redefine these variables anywhere in a
.CW pic
description.
A variable set inside one
.CW pic
description will remain in effect for other descriptions
within the same file.
One exception is a variable defined within a block;
that definition is local to the block.
.page 279
.KF
.Ts "\f[CB]pic\fP System Variables"
.TS
box,center;
lw (1i) l l.
T{
Variable
T}	T{
Default Value
T}	T{
Meaning
T}
_
.ft C
arcrad	.25	\f[R]Radius of arc\fP
arrowwid	.05	\f[R]Width or thickness of arrowhead\fP
arrowht	.1	\f[R]Height or length of arrowhead\fP
boxwid	.75	\f[R]Width of box\fP
boxht	.5	\f[R]Height of box\fP
circlerad	.25	\f[R]Radius of  circle\fP
dashwid	.05	\f[R]Width of dash\fP
ellipseht	.5	\f[R]Height of ellipse\fP
linewid	.5	\f[R]Length of horizontal line\fP
lineht	.5	\f[R]Length of vertical line\fP
movewid	.5	\f[R]Distance of horizontal motion\fP
moveht	.5	\f[R]Distance of vertical motion\fP
scale	1	\f[R]Scale dimensions\fP
textwid	0	\f[R]Width of area used for drawing\fP
textht	0	\f[R]Height of area used for drawing\fP
.ft R
.TE
.Te
.KE
.PP
For instance, we can specify an oversize arrow by changing
the following variables:
.Ps
.ig
	see comment in pic code below for the oversize arrow
..
arrowwid = 1
arrowht = 1
linewid = 2
arrow
.Pe
It produces the following
.CW pic
drawing:
.PS
.sp 2v
#arrowhead = 0 needed to get open arrow with gpic
#without it, you get a solid head.
arrowhead = 0
arrowwid = 1
arrowht = 1
linewid = 2
arrow
.sp 1v
.PE
.Bh "Controlling the Dimensions of a Drawing"
.ix [pic] preprocessor, controlling~the dimensions~of~a drawing %key pic preprocessor, controlling the dimensions~of~a drawing
.ig
	from experiments and readings, gpic doesn't
	have two variables. it apparently has only one.
	it also doesn't recognize .PF and the -ms
	package doesn't have a macro such as this.
	therefore, although the code is reproduced
	faithfully between the .Ps/.Pe utp macro pairs,
	modified code was used to simulate the output.
	--Michael Hobgood
..
The
.CW textwid
and
.CW textht
variables control the width and height respectively, of
.ix [pic] preprocessor, automatic scaling %key pic preprocessor, automatic scaling
the area use by
.CW pic
on a page.
(It doesn't refer to the amount of space occupied by an
item of text).
These values can also be set as arguments to the
.CW .PS
macro.
.Ps
\&.PS \f[I]width height\fP
.Pe
.page 280
When you specify the width or height or both,
.CW pic
scales the drawing to that size regardless of the
absolute dimensions that are specified within the drawing.
The only thing it doesn't scale adequately is text.
It can be easier to describe a drawing with simple units
and have them scaled more precisely to fit on the page
than to work with exact sizes.
.PP
A good example of scaling is turning the rounded box
described previously in this chapter into a representation
of a terminal screen.
.Ps
\&.PS 2 4
line right 1; arc; line up ; arc
line left 1; arc; line down; arc
\&.PE
.Pe
Although the
.CW pic
description is made up of 1-inch lines, the actual screen
produced by
.CW pic
will be 4 inches wide and 2 inches high.
.PP
Normally, you want
.CW troff
to output the regular lines of text on lines that
follow the
.CW pic
drawing.
If the
.CW .PF
(\c
.I F
for
.I flyback )
macro is used in place of
.CW .PE ,
.CW troff
will return to the position it held before the
.CW pic
drawing was output.
This feature is useful if we want to put formatted text
within our large screen.
.Ps
\&.PS 2 4
line right 1; arc; line up ; arc
line left 1; arc; line down; arc
\&.PE
\&.ft CW
\&.sp 2
Alcuin Development System       5/31/87
\&.sp
Please login:
\&.sp 6
.Pe
This description produces:
.sp .7v
.ne 10
.ll 4i
.SS
.Ps
.sp
Alcuin Development System       5/31/87
.sp
Please login:
.sp 6
.Pe
.SE
.sp .8v
.page 281
.LP 0
You have to remember to provide the space after the text
to push the current position past the end of the screen.
Otherwise subsequent text will also appear within the box.
.Bh "Debugging \f[CB]pic\fP Descriptions"
.ix debugging, [pic] %key debugging, pic
.ix [pic] preprocessor, debugging %key pic preprocessor, debugging
You can invoke the
.CW pic
preprocessor on its own to have it check through your file
and report any syntax errors.
This can save a lot of time, especially if your file contains
other text that will be sent to
.CW troff ,
assuming that you wouldn't want the file processed unless
the
.CW pic
descriptions succeeded.
If you have the file
.CW circles ,
for example, that contains a
.CW pic
description, you can invoke
.CW pic
as:
.Ps
$ \f[CB]pic circles\fP
.Pe
If processing is successful,
.CW pic
output will stream past on your terminal screen.
If
.CW pic
finds an error in your description, it will print the
error message.
.PP
If you have several
.CW pic
descriptions in a file, or you have regular text surrounding
a
.CW pic
description, you can send the output to
.CW /dev/null ,
and only the error messages will be displayed on your screen.
.PP
You may want to invoke
.CW pic
on its own simply to look at the output
.CW pic
produces.
For a discussion of the output that
.CW pic
sends to
.CW troff ,
read about line drawing in Chapter 14.
.Ah "From Describing to Programming Drawings"
.ix [pic] preprocessor, programming drawings %key pic preprocessor, programming drawings
As we look at more advanced examples of
.CW pic ,
you may begin to question the amount of description that
is required to produce a drawing.
You may be amazed that drawings that look so simple require
so many words.
After you realize that you are approaching the limits of
what can be described using an English-like syntax, you may
want to look at
.CW pic
from another perspective.
You can view
.CW pic
as a programming language for generating graphics.
.ix [pic] preprocessor, as~a programming language %key pic preprocessor, as a programming language
.PP
Looking at this other side of
.CW pic ,
you will find that the descriptions are perhaps more difficult
to read but much easier to write.
The purpose of a
\(lqprogrammed\(rq
.CW pic
description is not to imitate a verbal description, but to
minimize user input, to provide structures that can be
used to produce several kinds of drawings and to make it
easier to change a drawing.
.PP
The focus of the rest of this chapter will be to introduce
many of these special features of
.CW pic ,
including variables, expressions, and macros.
But there are more possibilities than we can attempt to
describe.
The
.CW pic
program follows the general UNIX philosophy that any program
should be able to accept input from any program and
direct its output to another program,
.CW troff .
Thus,
.CW pic
descriptions can be built by other UNIX utilities.
For instance, you might develop an
.CW awk
program specifically designed for creating
flow charts.
.page 282
.Bh "Locating Objects Using Cartesian Coordinates
.ix [pic] preprocessor, locating~objects~using Cartesian~coordinates %key pic preprocessor, locating objects~using Cartesian~coordinates
For more exact positioning of objects and text,
.CW pic
uses a standard Cartesian coordinate system.
The first object drawn, including a
.CW move ,
starts at position 0,0.
The
.I x
and
.I y
position of a circle, an ellipse, or a box is at the center
of the object.
For lines, this position refers to the beginning.
For arcs, this position is at the center point of the
related circle.
You can position objects using the
.CW at
attribute:
.Ps
circle "0,0" at 0,0
circle "1,1" at 1,1
circle "1,0" at 1,0
circle "2,1" at 2,1
.Pe
This description produces:
.PS
circle "0,0" at 0,0
circle "1,1" at 1,1
circle "1,0" at 1,0
circle "2,1" at 2,1
.PE
The center of the circle is placed at the specified coordinates.
You could also write:
.Ps
circle with .t at 1,1
.Pe
and it would place the top of the circle at that position.
A reference to
.CW "last circle"
would still locate the center of the circle, but a line
drawn
.CW "from 1,1"
would begin at the top of the circle.
.PP
Note that the position of 0,0 will not always be the same
place on the page.
The first object drawn is the point of reference; movement
to the left of that point will cause 0,0 to be moved over
toward the center of the page.
.Ps
box ht 0.3 wid 0.3 "0,0"
move to 1,0
box "1,0" same
move to -1,0
box "-1,0" same
.Pe
This description produces:
.PS
box ht 0.3 wid 0.3 "0,0"
move to 1,0
box "1,0" same
move to -1,0
box "-1,0" same
.PE
It may be helpful to sketch a drawing on graph paper and
then translate it into a
.CW pic
description.
Standard graph paper is divided into quarter-inch squares.
When you use
.page 283
graph paper, you might find it useful to set the
.CW scale
variable to 4.
All dimensions and positions will be divided by the value of
.CW scale ,
.ix [pic] preprocessor, scaling %key pic preprocessor, scaling
which is 1 by default.
.PP
It is much easier to describe a drawing in full units rather
than fractions.
Look at the following description:
.Ps
scale=4
line from 0,0 to 0,3 then to 6,3 then to 6,0 then to 0,0
line from 6,0 to 8,1 then to 8,4 then to 2,4 then to 0,3
line from 6,3 to 8,4
.Pe
The distance between 0 and 1 is normally 1 inch.
Because we are scaling this drawing by 4, the actual distance
is \(14 inch.
It seems easier to describe a point as 2,3 rather than
5,.75.
This description produces a two-dimensional box:
.PS
scale=4
line from 0,0 to 0,3 then to 6,3 then to 6,0 then to 0,0
line from 6,0 to 8,1 then to 8,4 then to 2,4 then to 0,3
line from 6,3 to 8,4
.PE
.PP
Although
.CW pic
scales the location of text, it is your responsibility to
reduce the size of the text to fit a scaled object.
You can also use
.CW scale
to change the basic unit of measurement from inches to any
other unit.
For instance, setting
.CW scale
to 6 will cause all dimensions and coordinates to be
interpreted in picas (6 picas to the inch).
.PP
Splines and arcs are much easier to draw using coordinates.
.ix [pic] preprocessor, [arc] %key pic preprocessor, [arc]
.ix [pic] preprocessor, spline %key pic preprocessor, spline
In the following example, we use a spline to draw a smooth
curve between several points on a crude graph.
.PS
scale=4
line from 0,0 to 0,4
line from 0,0 to 9,0
spline from 0,0 to 3,3 then to 5,.25 then to 8,1.5
.PE
The graph is produced by the following description:
.Ps
scale=4
line from 0,0 to 0,4
line from 0,0 to 9,0
spline from 0,0 to 3,3 then to 5,.25 then to 8,1.5
.Pe
.PP
You can also specify relative coordinates as an expression
within parentheses.
It has the effect of adding or subtracting from the absolute
coordinates of a particular place.
.page 284
.Ps
circle rad .5
circle same at last circle+(.25,0)
.Pe
The
.CW same
attribute allows us to duplicate the size of a previous object.
The expression
.CW "circle same"
means
\(lqthe same size as the last circle.\(rq
This description produces:
.	\" Note:
.	\" need to reset scale to 1 after the above example
.	\" or display will be to small.
.PS
scale = 1
circle rad .5
circle same at last circle+(.25,0)
.PE
Similarly, you can achieve finer control over positioning
by moving from a compass point:
.Ps
box with .sw at last box.ne+(.05,-.05)
.Pe
.Bh "Expressions and User-Defined Variables"
.ix [pic] preprocessor, expressions %key pic preprocessor, expressions
An expression can be used to supply the dimensions or the
position of an object.
Any of the following operators can be used in an expression:
.CW  + ,
.CW  - ,
.CW  * ,
.CW  / ,
and
.CW %
.ig
	The original had a stray right quote after (modulo).
	Deleted.
	--Michael Hobgood
..
(modulo).
Expressions can be used to manipulate the built-in variables
as follows:
.Ps
circle rad circlerad/2
.Pe
This will draw a circle with a radius that is half the size
of the default radius.
An expression can also refer to the value of placenames.
The coordinates of any object can be specified as
.CW .x
and
.CW .y .
Here's a list of some of the possibilities:
.RS
.TS
tab (#);
lf(CW) l.
BoxA.x#The x-coordinate of the center of \f[CW]BoxA\fP
last box.y#The y-coordinate of the center of the last box
BoxA.s.y#The y-coordinate of the southern compass point of \f[CW]BoxA\fP
BoxA.wid#The width of \f[CW]BoxA\fP
last circle.rad#The radius of the last circle
.TE
.RE
The next description defines a box and then divides the
specified height and width of that box to produce
a second box half that size.
.Ps
Boxa: box ht 2 wid 3; arrow
box ht Boxa.ht/2 wid Boxa.wid/2
.Pe
The
.CW pic
program also has a number of functions that can be evaluated
.ix [pic] preprocessor, functions %key pic preprocessor, functions
in an expression, as shown in Table 10-3:
.page 285
.Ts "\f[CB]pic\fP Functions"
.TS
center box;
c c
l l.
Function	Description
_
\f[C]sin(\f[I]a\fP)	\f[R]Sine of \f[I]a\fP
\f[C]cos(\f[I]a\fP)	\f[R]Cosine of \f[I]a\fP
\f[C]atan2(\f[I]a,b\fP)	\f[R]Arctangent of \f[I]a/b\fP
\f[C]log(\f[I]a\fP)	\f[R]Natural logarithm of \f[I]a\fP
\f[C]sqrt(\f[I]a\fP)	\f[R]Square root of \f[I]a\fP
\f[C]int(\f[I]a\fP)	\f[R]Integer \f[I]a\fP
\f[C]max(\f[I]a,b\fP)	\f[R]Maximum value of \f[I]a,b\fP
\f[C]min(\f[I]a,b\fP)	\f[R]Minimum value of \f[I]a,b\fP
\f[C]rand(\f[I]a\fP)	\f[R]Random number generator\fP
.TE
.Te
.PP
In giving the size or length of an object, you can name and
define your own variables.
.ix [pic] preprocessor, user-defined variables %key pic preprocessor, user-defined variables
A variable is any lowercase name that is not reserved as part
of the
.CW pic
language.
A variable can be defined as a constant or an expression.
.Ps
a=ellipsewid*3
b=ellipseht/2
ellipse wid a ht b
.Pe
This description produces:
.PS
a=ellipsewid*3
b=ellipseht/2
ellipse wid a ht b
.PE

.Bh "Defining Macros"
.ix %begin [pic] preprocessor, macros %key pic preprocessor, macros
.ix [pic] preprocessor, defining macros %key pic preprocessor, defining macros
With macros, you can predefine a series of objects or motions
that will be included in the description each time you
refer to the macro by name.
.Ps
define \f[I]name %
          definition
	         %\fP
.Pe
A percent sign (%) is used here as the delimiter but any
character not in the definition can be used.
The format of the
.CW define
statement is shown on three lines for readability only;
a simple macro could be put on a single line.
The definition can extend across as many lines as necessary.
.PP
When you refer to
.I name
.ig
	Original had a capital t in the word "the" in the
	next line, which is wrong.  Fixed.
	--Michael Hobgood
..
in your description, the
.CW pic
program will replace it with the definition.
.PP
Macros can also take arguments.
These arguments are specified in the definition as $1 thru $9.
They will be replaced by the arguments supplied when the macro
is invoked.
.page 286
.Ps
name(arg1, arg2, arg3)
.Pe
A macro does not exist as a place or position as far as
.CW pic
is concerned.
The
.CW pic
program simply replaces the macro name with the lines defined
in the macro.
You cannot refer to the macro as you would refer to a block.
However, you can set positions from within a macro.
.PP
In the following example, the
\(lqtail\(rq
hanging down from the
box and the list of items drawn to the right of it were
produced by a macro.
.PS
# The original printed book has the text in the box
# boldfaced.  Although not in the example code to
# produce the drawing, I have added it here to get the
# proper display.  Later, when the Ps/Pe pairs are used
# to list the pic code, the embolding is not shown.
# --Michael Hobgood
box ht .75 wid 1.75 2 "\fBAlcuin Product Operation\fP"
line down .25 from bottom of last box
define dept %
             line down .25
           { line right .15; move right .2; "$1" ljust }
           %
dept(Controller)
dept(Marketing)
dept(Engineering)
dept(Documentation)
dept(Quality Assurance)
dept(Customer Support)
.PE
In the
.CW pic
description that produced this drawing, the box is drawn
explicitly and a short line is started down from the
bottom of the box.
Then a macro named
.CW dept
is invoked to produce each item on the list.
.Ps
define dept %
              line down .25
            { line right .15; move right .2; "$1" ljust }
            %
.Pe
In this macro, after a line down is described, the rest
of the description is put within braces to reserve the
starting position for the next macro call.
A short line is drawn, followed by a move to place the text
in the correct position.
Quotation marks are placed around the argument because
the argument will contain a text label.
.PP
This macro is invoked for the first item as:
.Ps
dept(Controller)
.Pe
.CW Controller
is supplied as the first argument, which the macro inserts
as a text object.
Notice that the argument in the definition is quoted (\c
.CW \(dq$1\(dq )
so that the actual text when specified does not have to be
quoted.
.page 287
.PP
The previous drawing was modeled after an example shown in
.I "Estimating Illustration Costs: A Guide"
published by the Society for Technical Communication.
The guide considered this drawing to be of medium difficulty
and estimated that it would require an hour of an illustrator's
time.
It took ten to fifteen minutes to design and execute this
description for
.CW pic ,
including correcting some syntax errors and formatting for
the laser printer.
Here's the complete description of the drawing:
.Ps
\&.PS
box ht .75 wid 1.75 "Alcuin Product Operation"
line down .25 from bottom of last box
define dept %
             line down .25
           { line right .15; move right .2; "$1" ljust }
           %
dept(Controller)
dept(Marketing)
dept(Engineering)
dept(Documentation)
dept(Quality Assurance)
dept(Customer Support)
\&.PE
.Pe
.PP
The second example of macro use is probably harder to read
than it is to write.
Let's look at it in portions.
The purpose of the drawing is to represent a network of
computers.
We decided to use three types of objects to represent each
type of computer: a square, a triangle, and small circle.
These objects will appear in a hierarchy and lines will
be drawn to connect an object on one level with an object on
the level below it.
Before starting to describe it in
.CW pic
terms, we prepared a rough sketch of the
drawing on graph paper.
This made us realize that we could easily determine the
coordinate points of objects; thus, all the macros are set
up to accept coordinate positions.
.PP
Comments, beginning with #, describe the user-supplied
arguments.
Following are the definitions for three macros:
.CW backbone
(a box),
.CW local
(a triangle), and
.CW endpt
(a small circle).
.Ps
scale = 4
top = 10
define backbone %
          #  $1 = x coordinate ; $2 = label
          ycoord = top-2
          BB$1: box wid 1 ht 1 with .sw at $1,ycoord
          "$2" at ($1,ycoord)+(2,1) ljust
          %
define local %
          # $1 = x coordinate; $2 = label
          ycoord = top-5
          LO$1: move to $1,ycoord
          line down 1 left 1 then right 2 then up 1 left 1
.page 288
          "$2" at ($1,ycoord)-(0,.7)
          %
define endpt %
         # $1 = x coordinate
         ycoord = top-8
         circle rad .125 with .n at $1,yccord
         EP$1: last circle.n
         %
.Pe
Because each type of object maintained the same height (or
position on the y-axis), a variable
.CW ycoord
was set up to supply that position from the
.CW top
of the drawing.
(The top of the drawing is defined by another variable).
.PP
Each of these macros requires that you supply an x-axis
coordinate as the first argument.
This argument is also used to assign a unique placename that
is used later when we draw lines between objects.
.PP
The
.CW backbone
and
.CW local
macros also take a second argument for a label.
Handling text inside a macro definition is especially
convenient if you are going to change the font
and point size.
.PP
The next task is to connect the backbone systems to the
local systems and the local systems to endpoints.
Although we know which types of objects are connected, not
all objects are connected in the same way.
We decided that the macros require two arguments to supply
the x-coordinate for each of the two objects.
.Ps
define BtoL %
            # $1 = x coord of backbone; $2 = x coord of
            # local
            line from BB$1-(0,.5) to LO$2
            %
define LtoE %
            # $1 = x coord of local; $2 = x coord of endpt
            line from LO$1-(0,1) to EP$2
            %
.Pe
The
.CW BtoL
and
.CW LtoE
macros draw lines between the placenames set up by the
.CW backbone ,
.CW local ,
and
.CW endpt
macros.
.PP
Here are the actual macro calls:
.Ps
backbone(10,IBM/370)
backbone(18,DEC VAX)
local(8,68K-1)
local(13,68K-2)
local(17,68K-3)
endpt(7)
endpt(9)
endpt(12)
endpt(13)
endpt(14)
endpt(16)
endpt(18)
.page 289
BtoL(10,8)
BtoL(10,13)
BtoL(18,17)
LtoE(8,7); LtoE(8,9)
LtoE(13,12); LtoE(13,13); LtoE(13,14)
LtoE(17,16); LtoE(17,18)
line from LO13 to LO17
"\\s8Personal Computers\\s0" at 13,1
"\\s12\\fBA Network of Computers\\s0\\fR" ljust at 10,top
.Pe
Notice that arguments supplied to a macro are separated by
commas and that an argument may contain a space.
Here's what the description produces:
.PS
scale = 4
top = 10
define backbone %
          #  $1 = x coordinate ; $2 = label
          ycoord = top-2
          BB$1: box wid 1 ht 1 with .sw at $1,ycoord
         "$2" at ($1,ycoord)+(2,1) ljust
          %
define local %
          # $1 = x coordinate; $2 = label
          ycoord = top-5
          LO$1: move to $1,ycoord
          line down 1 left 1 then right 2 then up 1 left 1
          "$2" at ($1,ycoord)-(0,.7)
          %
define endpt %
         # $1 = x coordinate
         ycoord = top-8
         circle rad .125 with .n at $1,ycoord
         EP$1: last circle.n
         %
define BtoL %
            # $1 = x coord of backbone; $2 = x coord of
            # local
            line from BB$1-(0,.5) to LO$2
            %
define LtoE %
            # $1 = x coord of local; $2 = x coord of endpt
            line from LO$1-(0,1) to EP$2
             %
backbone(10,IBM/370)
backbone(18,DEC VAX)
local(8,\s768K-1\s0)
local(13,\s768K-2\s0)
local(17,\s768K-3\s0)
endpt(7)
endpt(9)
endpt(12)
endpt(13)
endpt(14)
endpt(16)
endpt(18)
BtoL(10,8)
BtoL(10,13)
BtoL(18,17)
LtoE(8,7); LtoE(8,9)
LtoE(13,12); LtoE(13,13); LtoE(13,14)
LtoE(17,16); LtoE(17,18)
line from LO13 to LO17
"\s8Personal Computers\s0" at 13,1
"\s12\fBA Network of Computers\s0\fP" ljust at 10,top
.PE
Twelve objects are specified and eleven lines are drawn between
the objects.
One line is explicitly drawn connecting the second triangle
to the third triangle.
It didn't make sense to define a macro for this single instance.
But if you were setting this up for others to use,
such a macro would be necessary.
.PP
Shortly, we will be looking at several relatively new features
that make
.CW pic
even more powerful for generating pictures.
In particular, these features allow us to improve our
effort to generate a diagram of a computer network.
.Bh "\f[CB]pic\fP's Copy Facility"
.ix [pic] preprocessor, copy~facility %key pic preprocessor, copy facility
The
.CW pic
program provides an interesting copy facility that has two
different uses: it allows you to read a
.CW pic
description from a remote file, and it allows you to read
.ix [pic] preprocessor, reading description~from remote file %key pic preprocessor, reading description from remote file
lines of data and pass them as individual arguments to a macro.
.PP
If you are going to use
.CW pic
regularly, you should think about maintaining a macro library.
You might define frequently used objects, such as triangles,
.ix [pic] preprocessor, library~of frequently~used objects %key pic preprocessor, library of frequently~used objects
and place
.page 290
them in their own file.
You can include the file in your description with the
following line:
.Ps
copy "/usr/lib/macros/pic/triangles"
.Pe
Putting the filename in double quotation marks is required.
Any
.CW .PS /\c
.CW .PE
macros that are found in the remote file are ignored.
.PP
You might also define a set of related macros for a particular
type of drawing, such as an organizational chart or a flow
diagram.
After you have taken the time to create and test a description,
you should consider structuring it so that the forms can be
easily used in other drawings.
.PP
This copy facility replaces an older construct that allowed
you to redirect input from another file through the
.CW .PS
macro.
.Ps
\&.PS < triangles
.Pe
.PP
A second use of the copy facility is to read data through
a macro.
We'll show how the
.CW endpt
macro from our last example can be designed to use this facility.
In a file where we had already defined a macro named
.CW endpt ,
we could invoke this macro with the following command:
.Ps
copy thru endpt
7
9
12
13
14
16
18
.Pe
The
.CW pic
program reads each line of data up to the
.CW .PE
and replaces each argument in the macro definition with the
corresponding field from each line.
In this example, the macro is executed seven times, once
for each line of data.
.PP
We could put the data in a separate file, named
.CW endpt.d ,
for example.
Then you enter this version of the
.CW copy
command:
.Ps
copy "endpt.d" thru endpt
.Pe
The double quotation marks are required.
Now the
.CW endpt
macro will be executed for each line in the file
.CW endpt.d.
(The filename suffix
.CW .d
is optional and signifies that the file contains
data for a macro call).
.PP
You can specify a string that
.CW pic
will recognize in the remote file as a signal to stop
reading input.
Used with
.CW "copy thru" ,
.CW until
is followed by the string.
In the following example, the word
.I STOP
is used as the string:
.Ps
copy "endpt.d" thru endpt until STOP
.Pe
You can also use
.CW until
when you are taking input from the same file:
.Ps
copy thru local until STOP
8 68K-1
13 68K-2
.page 291
17 68K-3
STOP
.Pe
In both cases,
.CW pic
will read lines of data until it comes across the string
.I STOP .
.PP
Another way to use
.CW "copy thru"
is to supply the macro definition.
This is a compact, single-step method:
.Ps
copy "endpt.d" thru %
         # $1 = x coordinate
         ycoord = top-8
         circle rad .125 with .n at $1,ycoord
         EP$1: last circle.n
                    %
.Pe
Although the percent sign is used as the delimiter, any
character not found in the definition could be used.
The
.CW "copy thru"
statement with the macro definition can be put on a single
line, which is helpful for short definitions.
.Ps
copy thru % box at $1,$2 %
1 1
1 2
1 3
1 4
.Pe
Because you can get a description down to this level,
basically consisting of functions, you could have a standard
description file associated with independent data files.
You could write a program to build the data files from
user input or from some other source.
.ix %end [pic] preprocessor, macros %key pic preprocessor, macros
.Bh "Executing UNIX Commands"
.ix [pic] preprocessor, executing~UNIX~commands~from %key pic preprocessor, executing UNIX~commands~from
You can execute any UNIX command from
.CW pic ,
using the following syntax:
.Ps
sh % \f[I]command\fP %
.Pe
Again, the percent sign represents any valid delimiter
character.
The
.CW pic
program submits this command to the shell for execution and
then returns to interpret the next line of the description.
You could issue a command to obtain data from another file:
.Ps
sh % awk -F: {print$1} /etc/passwd %
.Pe
.Ah "\f[CB]pic\fP Enhancements"
.ix [pic] preprocessor, enhancements~to %key pic preprocessor, enhancements to
Most of the enhancements found in new versions of
.CW pic
are aimed at developing
.CW pic
as a graphics programming language.
.ix [pic] preprocessor, as~a programming~language %key pic preprocessor, as a programming~language
Additional capabilities include
.CW for
loops and
.CW if
conditional statements.
A
.CW for
loop allows one or more
.ix [pic] preprocessor, [for]~loops %key pic preprocessor, [for] loops
.CW pic
commands to be executed as long as a condition is met
.page 292
.Ps
for i=1 to 3 by .05
do%
box ht i;move
%
.Pe
Each time through the loop the value of the variable
.CW i
is incremented by .05, producing five boxes of increasing
height.
The
.CW by
clause specifies the amount that the variable is incremented
each time through the loop.
If the
.CW by
clause is omitted, then the variable is incremented by 1.
The
.CW %
is used as the delimiter marking the commands to
be executed on each pass.
.PP
The
.CW if
statement evaluates an expression to determine if it is true
.ix [pic] preprocessor, [if] conditional~statements %key pic preprocessor, [if] conditional statements
or false.
If true,
.CW then
specified
.CW pic
commands are executed.
If false, the
.CW then
clause is not acted upon; instead, an
.CW else
clause, if specified, is read and commands specified inside
it are executed.
.Ps
if x > y then % x = y % else % x = x + 1%
.Pe
This conditional statement evaluates the expression
.CW "x > y" .
If true,
.CW x
is set to
.CW y ;
if false, the value of
.CW x
is incremented by 1.
The
.CW %
is a delimiter marking the beginning and end of
the commands specified for both
.CW then
and
.CW else
clauses.
The expression inside an
.CW if
statement can use any of the relational operators that
.ix [pic] preprocessor, relational~operators~for [if]~statements %key pic preprocessor, relational operators~for [if]~statements
are shown in Table 10-4.
.Ts "\f[CB]pic\fP Relational Operators"
.TS
center box;
lf(CW) l.
\fROperator\fP	Meaning
_
==	Equal to
!=	Not equal to
>	Greater than
>=	Greater than or equal to
<	Less than
<=	Less than or equal to
&&	And
|	Or
!	Not
.TE
.Te
.PP
In addition to enhancements that add more graphics programming
features to
.CW pic ,
progress has been made in allowing input to be taken from
bit-mapped graphic terminals and translated into
.ix [pic] preprocessor, using bit-mapped input %key pic preprocessor, using bit-mapped input
.CW pic
output.
A separate program called
.CW cip ,
available on some systems, allows users to create drawings
using a mouse (a la MacDraw for the Macintosh).
The
.CW cip
program generates a
.CW pic
description of a drawing that can be included in any file
to be processed by
.CW troff .
.ix %end [pic] preprocessor %key pic preprocessor
.rn oldPS PS
.rn oldPE PE
.PS
reset
.PE
