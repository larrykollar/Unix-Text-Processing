.ig
	Typed by: Michael Hobgood
	Marked up by: Michael Hobgood
	Proofed on: 19 Oct 2002
..
.so utp.mac
.utp
.page 412
.Se 14 "Writing \f[CB]nroff\fP and \f[CB]troff\fP Macros" "Chapter" 1
.ix %begin [troff] formatter %key troff formatter
.LP 0
The
.CW nroff
and
.CW troff
formatters include a powerful macro definition and
substitution capability.
As we suggested when macros were first discussed in
Chapter 4, they are a good way to combine frequently used
sequences of formatting requests into a single instruction.
But after working with the
.CW ms
and
.CW mm
macro packages, you must know that macros are more than that.
.PP
Macros are an essential part of
.CW nroff
and
.CW troff \(em\c
you cannot escape them if you want to make serious use
of the formatter.
Precisely because macros are so essential, many users
never learn to fully use them.
The most obviously useful macros are already included in
the existing macro packages, whose complex internal control
structures make them difficult to understand and modify.
.PP
The purpose of this chapter is to introduce the fundamental
.CW nroff
and
.CW troff
requests that are used for creating macros.
You'll learn the basics in this chapter.
Then, in later chapters we can examine how to write macros
for specific purposes, without having to make continual
asides to introduce a new request.
.PP
Chapter 15 describes additional requests for creating
special effects (such as pictures) with your macros,
and Chapters 16 through 18 discuss how to go beyond
writing individual macros and how to develop or extend
an entire macro package.
.Ah "Comments"
.ix [troff] formatter, comments %key troff formatter, comments
.ix comments, in~[troff] %key comments, in troff
Before we start, we'll introduce the syntax for inserting
comments into your macro definitions.
Macros can get quite confusing, so we advise you to put
in comments that explain what you are doing.
This will help immensely when you go back weeks or
months later to modify a macro you have written.
.page 413
.LP
A line beginning with the sequence
.Ps
\&.\\"
.Pe
will not be interpreted or printed by the formatter.
Any part of a line following the sequence:
.CW \e\(dq
will be treated the same way.
For example:
.Ps
\&.\\" O'Reilly & Associates, Inc. custom macro set
\&.\\" Last modified 4/25/87
\&.de IZ \\" Initialization macro
                .
                .
                .
.Pe
Note that there is an important difference between:
.Ps
\&.\\" A full line comment
.Pe
and:
.Ps
\\" A partial line comment
.Pe
If you simply start the sequence
.CW \e\(dq
at the margin, the formatter will insert a blank line
into the output, because this sequence by itself does
not suppress newline generation.
.PP
(Note that comments can be used at any time, not just in
macros.
You can write notes to yourself in your input file and they
will never appear in the output.
But if you accidentally type the sequence
.CW \e\(dq
in your file, the remainder of the line on which it
appears will disappear from the output).
.Ah "Defining Macros"
.ix [.de] request %key de request
As we've already discussed, use the
.CW .de
request to define a macro:
.ix macros, defining
.ix [troff] formatter, defining macros %key troff formatter, defining macros
.ix [troff] formatter, [.de] request %key troff formatter, [.de] request
.Ps
\&.de AB \\" Define macro AB
\f[I]Requests and/or text of macro here\fP
\&..
.Pe
.PP
There are also requests to remove or add to existing macros.
.ix macros, appending to
.ix macros, removing
.ix [troff] formatter, appending to~a macro %key troff formatter, appending to a macro
.ix [troff] formatter, removing macros %key troff formatter, removing macros
.ix [.rm] request %key rm request
The
.CW .rm
request removes a macro:
.ix [troff] formatter, [.rm] request %key troff formatter, [.rm] request
.Ps
\&.rm PQ \\" Remove macro PQ
.Pe
You may sometimes want to define a macro for local use, and
remove it when you are done.
In general, though, this is an advanced request you will
not use often.
.PP
.ix [.am] request %key am request
The
.CW .am
request appends to the end of an existing macro.
It works just like
.CW .de
but does not overwrite the existing contents:
.ix [troff] formatter, [.am] request %key troff formatter, [.am] request
.Ps
\&.am DS \\" Append to the existing definition of DS
\&.ft CW
\&..
.Pe
At first, you may think that this request has only limited
usefulness.
However, as you work more with macros, you will find
unexpected uses for it.
We'll mention a few of these in later chapters.
.page 414
.Ah "Macro Names"
.ix [troff] formatter, macro names %key troff formatter, macro names
A macro name can be one or two characters, and can consist
of any character(s) not just alphanumeric characters.
.ix macros, naming conventions
For example:
.Ps
\&.de ^( \\" Macro used internally whose name, we hope,
	  \\" never has to be remembered
.Pe
You can even use control characters in macro names.
Names can be uppercase or lowercase, or any combination of
the two, and uppercase and lowercase are distinct.
For example, the four names
.CW .gm,
.CW .GM,
.CW .gM,
and
.CW .Gm
can all be used without conflict.
.PP
If you are starting from scratch, you can use whatever macro
or number register names you like except for the names of
existing formatter requests.
.ix [troff] formatter, names~of existing macros %key troff formatter, names of existing macros
However, if you are adding macros to an existing package,
you have to work around the existing names, because creating
a new macro with the same name as an old one will discard
the previously read-in definition.
.PP
This is not as easy as it sounds, because macro packages
include internal macro, string, and number register
definitions that are not visible to the casual user.
You may be surprised when your new macro makes some other
part of the package go haywire.
(In an attempt to forestall this problem, most macro
developers give odd, unmnemonic names to internally
called macros.
However, collisions still can and do occur).
.Bh "Finding the Names of Existing Macros"
.ix macros, listing existing names
Before you start adding macros to an existing package,
it's a good idea to print the names of all existing macros.
.PP
There are two ways to do this.
.ix [.pm] request %key pm request
.ix [troff] formatter, [.pm] request %key troff formatter, [.pm] request
The
.CW .pm
request will print (in blocks of 128 characters) the names
and sizes of all macros defined in a given run of the
formatter.
So, for example, creating a file containing the single
request:
.Ps
\&.pm
.Pe
and formatting it like this:
.Ps
$ \f[CB]nroff -ms pmfile\fP
.Pe
will print on the screen a list of all the macros defined
in the
.CW ms
macro package.
(The output could also be redirected to a file or printer).
.PP
However, macro names are drawn from the same pool as string
names (see the next example), so it might be better to
search for macro or string definitions using
.CW grep
.I "et al" ,
like this:
.Ps
$\f[CB]grep '^\\.d[esia]'\fP \f[I]macrofiles\fP\f[CB] | cut -f1,2 -d' ' | sort | uniq\fP
.Pe
(\c
.CW grep
will select all lines beginning with either
.CW .de,
.CW .ds,
.CW .di,
or
.CW .da;
.CW cut
will select only the first two space-separated fields on
each of those lines;
.CW sort
and
.CW uniq
together will produce a sorted list consisting of only one
copy of each line.
Note that for
.CW -mm ,
which does not use a space before the macro name, you would
need to specify
.CW "cut -f1"
only.
You will also need to substitute for
.I macrofiles
the actual filenames containing the macros of interest).
.page 415
.PP
You should do the same for number registers:
.ix [troff] formatter, names~of existing number~registers %key troff formatter, names of existing number~registers
.ix number~registers, finding names~of existing
.Ps
$ \f[CB]sed -n -e 's/.*.nr *\\(..\\).*/\\1/p'\fP \f[I]macrofile\fP\f[CB] | sort | uniq\fP
.Pe
here, because we can't rely on number registers being set
at the start of a line, as we can with macro definitions.
The one-line
.CW sed
script included here saves the first two nonspace
characters (\c
.CW .. )
following the string
.CW .nr ,
and substitutes them for the rest of the line (i.e.,it
throws away the rest of the line).
.PP
You could also just
.CW grep
for an individual macro, string, or number register name
before you use it!
Or you could take the easy way, and check Appendix B, where
we've listed all the names in each of the packages.
.PP
In addition to looking for conflicting names, you many also
need to look for conflicting usage, or to understand in
detail the operation of a macro you are intending to call
within a new macro you are writing.
.PP
To do this, you can simply read in the entire macro
definition file with the editor and search for what you want.
However, to make things easier, we use the
.CW getmac
shell script described in Chapter 12 to print out
the definition of the desired macro.
The script prints the result on standard output, which
can easily be redirected into a file, where it can become
the basis for your own redefinition.
.Bh "Renaming a Macro"
.ix macros, renaming
.ix [troff] formatter, renaming macros %key troff formatter, renaming macros
If you do find a conflict, you can rename macros that have
already been defined.
The
.CW .rn
macro renames an existing macro:
.ix [.rn] request %key rn request
.ix [troff] formatter, [.rn] request %key troff formatter, [.rn] request
.Ps
\&.rn ^( H1  \\" Rename ^( to H1; easier to remember
.Pe
The old name will no longer work.
You must use the new name to invoke the macro.
.PP
A good trick that you can
.I sometimes
pull off with
.CW .rn
is to temporarily redefine a macro (without ever modifying
its contents).
For example, the
.CW ms
macros include a macro to draw a box around a paragraph;
however, these macros do not leave any space above or
below the box.
We can add some like this:
.Ps
\&.rn B1 b1	\\" Rename B1 to b1
\&.de B1		\\" Now redefine B1
\&.sp .5		\\" Add some space before the box is drawn
\&.b1		\\" Execute the old definition
\&..
\&.rn B2 b2	\\" Rename B2 to b2
\&.de B2		\\" Now redefine B2
\&.b2		\\" Execute the old definition
\&.sp .5		\\" Add some space after the box is drawn
\&..
.Pe
This only works for adding extra control lines before or
after the current contents of the macro.
Remember it, though, because this trick may come in handy
if you don't want to (or can't) directly modify a macro
in one of the existing packages, but do want a slightly
different effect.
.page 416
.Ah "Macro Arguments"
.ix [troff] formatter, macro arguments %key troff formatter, macro arguments
.ix macros, arguments
The simplest kind of macro is a sequence of stored commands,
starting with a
.CW .de
request and ending with the two dots (\c
.CW .. )
at the beginning
of a line.
.PP
However, as you've seen when you've used
.CW mm
and
.CW ms ,
.ix arguments, in~macros
macros can take arguments, and can act differently depending
on various conditions.
It's also possible for a macro to save information and pass
it to other macros to affect their operation.
An understanding of how to do these things is essential if
you plan any serious macro design.
.PP
A macro can take up to nine arguments and can use them in
any way.
Arguments are described positionally by the character
sequences
.CW \e\e$1
through
.CW \e\e$9 *.
.FS
*Actually, the sequences are
.CW \e$1
through
.CW \e$9 ,
with only a single backslash.
But for reasons to be described shortly, you always need
at least two backslashes.
.FE
.PP
For example, we could define a very simple
.CW .B
macro to boldface a single argument:
.Ps
\&.de B		\\" Macro to boldface first argument
\\fB\\\\$1\\fP
\&..
.Pe
Or, we could write a simple paragraph macro that, instead
of having a fixed indent, might take a numeric argument
to specify the depth of the indent:
.Ps
\&.de PI		\\" Simple paragraph macro
\&.sp
\&.ne 2		\\" Prevent widows
\&.ti \\\\$1	\\" Indent to the depth specified by first
\&..		\\" argument
.Pe
As you can see in the first example, you can print an
argument in your text.
Or, shown in the second example, you can use it inside the
macro as an argument to one or more of the requests that
make up the macro.
.PP
Notice that there is nothing intrinsic about a macro that
causes a break.
The
.CW .B
macro, for instance, can be placed in the input file as in
the following example:
.Ps
There are a number of ways to
\&.B embolden
text.
.Pe
As long as filling is in effect, it will produce exactly
the same output as:
.Ps
There are a number of ways to \\fBembolden\\fP text.
.Pe
Macro arguments are separated by spaces.
If you want to include an explicit space in an argument,
you should enclose the entire string in quotation marks,
like this:
.page 417
.Ps
There are a number of ways to
\&.B "make text stand out."
.Pe
If you didn't enclose the phrase
.I "make text stand out"
in quotation marks, a single word,
.I make ,
would have been interpreted as the first argument, the next
word,
.I text ,
as the second argument, and so on.
This wouldn't cause a program error\(emthere is no
requirement that arguments to a macro be used
by that macro\(embut the unused arguments would simply
disappear from the output.
As shown here, the entire phrase is treated as a
single argument.
.PP
To actually print a quotation mark inside a macro argument,
double it.
For example:
.Ps
\&.B "The Quote ("") Character"
.Pe
will produce:
.sp .7v
.SS
\h'2n'\fBThe Quote (") Character\fP
.SE
.sp .8v
.LP
You've probably recognized that the syntax for specifying
arguments by position is very similar to that used with
shell scripts.
You might wonder, though, about backslashes, which are used
in the shell to prevent interpretation of a special character.
In fact, they serve the same function in
.CW troff .
.PP
The
.CW nroff
and
.CW troff
formatters always read a macro at least twice:
once when they read the definition (and store it away for
later use), and once when they encounter it in the text.
At the time the macro is defined,
.I "there are no arguments" ,
so it is essential to prevent the formatter from doing
any argument substitution.
.ix [troff] formatter, copy mode %key troff formatter, copy mode
.PP
When the macro definition is read, the formatter operates
in what is referred to (in the
.I "Nroff/Troff User's Manual" )
as
.ix copy mode
.ix macros, copy mode~in
.I "copy mode" .
That is, none of the requests are executed; they are simply
copied (in this case, presumably into memory) without
interpretation.
The exception is that various escape sequences that may
have a different value at macro definition time than at
macro execution time (most notably
.CW \en ,
for interpolating number registers,
.CW \e* ,
for interpolating strings, and
.CW \e$ ,
for interpolating arguments) are executed, unless you
suppress interpretation with a preceding backslash.
(Other escape sequences are also interpreted, but because
they have fixed values, this makes no difference to the
action of the macro).
.PP
A backslash prevents interpretation of the character that
follows it by sacrificing itself.
The backslash tells the formatter:
\(lqTake me but let the next guy go.\(rq
Each time the character sequence is read, the backslash is
stripped off\(emthat is,
.CW \e\e
is actually stored as
.CW \e .
(You can think of
.CW \e
as saying
\(lqI really mean ....\(rq
So in the shell, for example, if you want to use an asterisk
literally, rather than as a filename expansion metacharacter,
you write
.CW \e* \c
\(emthat is,
\(lqI really mean *.\(rq
In a similar way,
.CW \e\e
says
\(lqI really mean backslash.\(rq)
.PP
When macro definitions are nested inside one another, you
will need to add additional backslashes to get what you
want.
The true argument interpolation escape sequence is
.CW \e$ \c
.I n ,
rather than
.CW \e\e$ \c
.I n ;
the extra backslash is needed because the first one is
stripped when the macro is interpreted in copy mode.
The same rule applies when you want to interpolate the
value of a number register or a string in a macro
definition.
Think through the number of times the definition will be
read before it is executed, and
.page 418
specify the appropriate
number of backslashes, so that you get the actual value
used at the point where you need it.
A failure to understand this will cause more frustration
than almost any other error when you are writing macros.
.PP
In the example of the
.CW .B
macro, the sequences
.CW \efB
and
.CW \efP
did not need to be escaped, because
.CW troff
could just as easily interpret them at the time the macro
is defined.
However, the macro would also work if they were specified
with double backslashes\(emit is just that the
interpretation of the codes would take
place when the macro was used.
.Ah "Nested Macro Definitions"
.ix [troff] formatter, nested macros %key troff formatter, nested macros
We said previously that a macro definition begins with a
.CW .de
request and ends with two dots (\c
.CW .. ).
This is a simplification.
The
.CW .de
request takes an alternate terminator as an optional
second argument.
This feature allows you to create nested macro definitions.
.ix macros, nested
.Ps
\&.de M1		\\" Start first macro
\&.de M2 !!	\\" Start second macro
\&.!!		\\" End second macro
\&..		\\" End first macro
.Pe
You can also nest macros by delaying interpretation of
the
.CW ..
on the second macro:
.Ps
\&.de M1		\\" Start first macro
\&.de M2		\\" Start second macro
\\\\..		\\" End second macro
\&..		\\" End first macro
.	\"Note: should above be .. rather that ...?
.	\" Yes. I fixed it. --LK
.Pe
.PP
For example, a group of related macros for producing a
certain type of document might be nested inside a
\(lqmaster\(rq
macro.
A user would have to invoke the master macro, indicating
document type, to make the other macros available for use.
Nested macros could be used to provide alternate versions
of the same set of macros within a single macro package.
.Ah "Conditional Execution"
.ix %begin conditional execution, in [troff] %key conditional execution, in troff
One of the most powerful features of
.CW nroff
and
.CW troff 's
macro programming language is its facility for conditional
execution.
.ix [troff] formatter, conditional~execution %key troff formatter, conditional execution
.ix %begin [troff] formatter, [.el] request %key troff formatter, [.el] request
.ix %begin [troff] formatter, [.ie] request %key troff formatter, [.ie] request
.ix %begin [troff] formatter, [.if] request %key troff formatter, [.if] request
There are three conditional execution requests:
.CW .if ,
.CW .ie
.I "if else" ), (
and
.CW .el
.I else ). (
.ix %begin [.if] request %key if request
The
.CW .if
request is used for a single condition.
(\c
\(lqIf the condition is met, do this; otherwise, simply go to
the next line.\(rq\c
)
.ix %begin [.ie] request %key ie request
The
.CW .ie
and
.ix %begin [.el] request %key el request
.CW .el
requests are used as a pair, testing a condition and then
performing either one action or the other.
(\c
\(lqIf the condition is met, do this; otherwise, do that.\(rq\c
)
.page 419
.Bh "Predefined Conditions"
.ix [troff] formatter, predefined conditions %key troff formatter, predefined conditions
There are a number of different conditions that can be
tested with
.CW .if
and
.CW .ie .
The simplest looks to see if a predefined condition is
true or false.
There are four predefined conditions, as listed in
Table 14-1.
.ix predefined conditions, in~[troff] %key predefined conditions, in troff
.ix %begin [troff] formatter, number~registers %key troff formatter, number registers
.ix %begin [.nr] request %key nr request
.ix %begin number~registers
.Ts "Built-in Conditions"
.TS
center box tab (#);
c c
cf(CW) l .
Condition#True if
_
o#Current page number is odd
e#Current page number is even
n#The file is being formatted by \f[C]nroff\fP
t#The file is being formatted by \f[C]troff\fP
.TE
.Te
.PP
For example, in a page bottom macro, to print the page
number in the outside corner, you might write:
.Ps
\&.if o .tl '''%'	\\" If odd, put page number in right corner
\&.if e .tl '%'''	\\" If even, put page number in left corner
.Pe
(The
.CW .tl
request prints three-part titles, at the left, center, and
right of the page.
And, within this request, the
.CW %
character always prints the current page number.
We'll explain these two items in detail later, when we look
at how to write a complete page transition macro.
For right now, we just want to understand how the
conditions themselves work).
.PP
Because the two conditions, odd and even,
are mutually exclusive, you could also write:
.Ps
\&.ie o .tl '''%'	\\" If odd, put page number in right corner
\&.el .tl '%'''		\\" Otherwise, put it in left corner
.Pe
Notice that you do not specify a condition to be tested in
the
.CW .el
request.
.Bh "Arithmetic and Logical Expressions"
.ix [troff] formatter, arithmetic expressions %key troff formatter, arithmetic expressions
.ix arithmetic expressions, in~[troff] %key arithmetic expressions, in troff
A closely related condition simply tests for a nonzero
number or a true arithmetic expression.
This is generally used with number registers, but it could
also be used to test the value of numeric arguments to
a macro.
For example, we could write a paragraph macro that was
either indented or flush left, depending on the value of
its argument:
.Ps
\&.de P
\&.sp
\&.ne 2
\&.if \\\\$1 .ti \\\\$1 \\" If there is an arg, use it for indent
\&..
.Pe
.page 420
That is, if there is a nonzero numeric argument, do a
temporary indent to the distance specified by the value
of the argument.
.PP
Rather than using the simple presence of a numeric argument
to satisfy the condition, you could also use an arithmetic
expression to test for a value.
Used in this way, the argument can simply be a
.I flag
telling the macro what to do.
.Ps
\&.de P
\&.sp
\&.ne 2
\&.if \\\\$1=1 .ti 5n	\\" If first arg = 1, indent 5 ens
\&..
.Pe
The operators shown in Table 14-2 can be used
in constructing an expression.
.ix [troff] formatter, expression operators %key troff formatter, expression operators
.ix expression operators, in~[troff] %key expression operators, in troff
.Ts "Expression Operators"
.TS
center box tab (#);
c c
cf(CW) l.
Operator#Description
_
+,-,/,*#Standard arithmetic operators
%#Modulo
>,<#Greater than, less than
>=,<=#Greater than or equal, less than or equal
=,==#Equal
&#AND
:#OR
.TE
.Te
Expressions are evaluated from left to right, except where
indicated otherwise by the presence of parentheses.
There is no precedence of operators.
.PP
Frequently, you will see numeric conditions involving
number registers.
Here are a few simple examples:
.Ps
\&.if \\\\nb
\&.if \\\\nb>1
\&.if \\\\nb<\\\\nc
\&.if \\\\nb+\\\\nc>1
.Pe
(Be sure to note the double backslash before each number
register invocation: we are assuming that these requests are
made within a macro definition.
If they were made outside a macro, you would use only a
single backslash).
The first of these conditions is commonly used in the
existing macro packages.
It takes a little getting used to\(emit is not always
obvious to new users what is being tested
in an expression like:
.Ps
\&.if \e\enb
.Pe
A condition of this form simply tests that the specified
expression (the number register
.CW b
in this case) has a value greater than 0.
A more complex expression that does the same thing
might be:
.Ps
\&.if \\\\nb-1
.Pe
.page 421
.Bh "Comparing Strings"
.ix [troff] formatter, comparing strings %key troff formatter, comparing strings
.ix strings, comparing
Another frequent test that you can use as the basis of a
condition is whether or not two strings are equal\(emfor
example, whether an argument contains a particular
string.
The syntax is simply:
.Ps
\&.if "\f[I]string1\fP"\f[I]string2\fP"
.Pe
(Note that there are a total of three quotation
marks\(emeither single or double will do\(emand no equals
sign.
A frequent error among beginners is to use an equals sign
to compare string arguments, which will not work).
.PP
For example, suppose you are writing a macro to center
the output if the second argument is the letter
.I C .
You could write:
.Ps
\&.if "\\\\$2"C" .ce  \\" If 2nd arg is C, center the next line
.Pe
You can also test for a null argument in this way:
.Ps
\&.if "\\\\$1"" \f[I]do something\fP
.Pe
Use of this condition or its inverse, the test for a non-null
argument (described in the next section), allows the user
to skip over an argument by supplying a null string (\c
.CW \(dq\(dq ).
.Bh "Executing Multiple Requests as a Result of a Condition"
.ix [troff] formatter, multiline conditions %key troff formatter, multiline conditions
All of the examples we've shown so far consist of a single
request executed on the basis of a condition.
But often you'll want to execute more than one command when
a condition is met.
To do so, you enclose the sequence to be executed in
backslashes and braces, as in this example:
.Ps
\&.if o \\{\\
\&.po +.25i
\&.tl '''%'\\}
.Pe
The initial sequence is terminated with an additional
backslash to
\(lqhide the newline.\(rq
You could also type:
.Ps
\&.if o \\{ .po +.25i
\&.tl '''%'\\}
.Pe
However, the syntax shown in the first example is almost
always used, because it is easier to read.
There is one caveat!
You can't put any other characters, even a comment,
following the slash.
For example, if you type:
.Ps
\&.if o \\{\\		\\" If odd...
.Pe
you won't be escaping the newline, you'll be escaping the
spaces that precede the comment.
If you want to include a comment on a condition like this,
use the alternate syntax, and follow the brace with a dot,
just like you would if the comment started on a line
of its own:
.Ps
\&.if o \\{.		\\" If odd...
.Pe
.page 422
.PP
The concluding
.CW \e}
can appear on the same line as most requests.
However, we have found a problem when it immediately
follows a string definition or a
.CW .tm
request.
For some reason:
.Ps
\&.ds string \\}
.Pe
appends a
.CW ^Q
character to the end of the string, at least in
our version of
.CW troff .
The concluding
.CW \e}
should be put on the next line, after an initial
.CW .
to suppress newline generation in the output:
.Ps
\&.\\}
.Pe
.PP
Another convention followed in multiple-line execution is
to separate the initial request control character (\c
.CW .
or
.CW ' )
from the body of the request with a tab.
This greatly enhances readability, and can be used to show
nesting of conditions:
.Ps
\&.if o \\{\\
\&.	po +.25i
\&.	tl '''\\\\n%'\\}
.Pe
Conditions can be nested within each other using this syntax.
However, you might wonder if a nested condition could
instead be expressed using one of the logical
operators
.CW &
or
.CW :
in an expression.
Suppose, as described previously,
you want to put page numbers on the outside corners of each page,
except on the first page, where you want it in the center.
You might put the following requests in the page bottom macro:
.Ps
\&.ie \\\\n%>1 \\{\\	\\"If pageno > 1
\&.	if o .tl '''%'
\&.	if e .tl '%'''\\}
\&.el .tl ''%''
.Pe
.ig
	Note: notice the above example.  O'reilly violates
	his caveat about how to include comments!  This
	occurs several more times in this chapter.
	--Michael Hobgood
..
You might think to achieve the same result with
the following requests:
.Ps
\&.if \\\\n%>1&o .tl '''%'	\\"If pageno > 1 and odd
\&.if \\\\n%>1&e .tl '%'''	\\"If pageno > 1 and even
\&.if \\\\n%=1 .tl ''%''	\\"If pageno = 1
.Pe
Unfortunately, however, this example will not work.
The
.CW &
and
.CW :
operators can only be used to construct
arithmetic expressions.
For example, in the case of:
.Ps
\&.if \\\\nX&\\\\nY \f[I]do something\fP
.Pe
.I something
will be done only if both register X and register Y
are non-zero.
(Notice that there are no spaces surrounding the
.CW &
operator).
.PP
You can construct an else if clause by following an
.CW .el
with another
.CW .if ,
and then the request to be executed if the condition is met.
.Ps
\&.ie condition		\f[I]do something\fP
\&.el .if condition	\f[I]do something else if\fP
.Pe
.page 423
.Bh "Inverse Conditions"
.ix [troff] formatter, inverse conditions %key troff formatter, inverse conditions
.ix inverse conditions
The meaning of any of the condition types described can be
reversed by proceeding them with an exclamation
point (\c
.CW ! ).
For example:
.Ps
\&.if !e		\\" If the page number is not even
\&.if !\\\\nc=1	\\" If the number register c is not equal to 1
\&.if !"\\\\$1""	\\" If the first argument is non-null
.Pe
It may not be immediately obvious what this adds to
your repertoire.
However, we will encounter many cases in which it is
easier to detect when a condition is not met than
when it is.
In particular, negative conditions can be more comprehensive
than equivalent positive conditions.
For example, the condition:
.Ps
\&.if !\\\\nc=1
.Pe
tests not only for the cases in which number register
.CW c
has been set to some number larger than 0, or explicitly
to 0, but the case in which it has never been set at all.
.PP
The test for a non-null argument is also useful.
For example, in the sequence:
.Ps
\&.if !"\\\\$3"" \\{\\	\\" If there is a third argument
\&.ce			\\" center it
\&\\\\$3\\}
.Pe
you only want the
.CW .ce
request to be executed if there is an argument to
be centered.
Otherwise, the request will cause unexpected results,
perhaps centering the line of text following the macro.
Saying
\(lqIf the third argument is non-null, then it
exists\(rq
may be the inverse of the way you think, and will
take some getting used to.
.PP
If you are reading through the definitions for the
.CW ms
or
.CW mm
macros, you may also encounter a construct like this:
.Ps
\&.if \\\\n(.$-2
.Pe
The
.CW .$
is a special predefined number register (more on this
topic in a moment) that contains the number of
arguments that have been given to a macro.
If there are two or fewer arguments, the value of the
conditional expression shown will be 0.
However, it will evaluate true if there are more than
two arguments.
It is used in
.CW mm 's
.CW .SM
macro because a different action is taken on the second
argument if there are three arguments instead of two.
.Ps
\&.if \\\\n(.$-3 \\\\$1\\s-2\\\\$2\\s+2\\\\$3
\&.if \\\\n(.$-2 \\s-2\\\\$1\\s+2\\\\$2
.Pe
.Ah "Interrupted Lines"
.ix [troff] formatter, interrupted lines %key troff formatter, interrupted lines
.ix interrupted lines (in~[troff]) %key interrupted lines (in troff)
Occasionly, when writing a complex macro\(emespecially
one with multiple conditions\(emyou may find yourself
writing a request that is too
long to fit on a single 80-character line.
.ix %end [.el] request %key el request
.ix %end [.ie] request %key ie request
.ix %end [.if] request %key if request
.ix %end [troff] formatter, [.el] request %key troff formatter, [.el] request
.ix %end [troff] formatter, [.ie] request %key troff formatter, [.ie] request
.ix %end [troff] formatter, [.if] request %key troff formatter, [.if] request
.ix %end conditional execution, in [troff] %key conditional execution, in troff
.PP
You could simply let the line wrap on you screen
\(em
UNIX recognizes lines much longer than the 80 columns
usually available on a terminal screen.
However, you need
.page 424
not do this.
Simply putting a backslash at the end of a line will
\(lqhide the newline\(rq
and cause the next line to be interpreted
as a continuation of the first.
.Ah "Number Registers"
.ix [troff] formatter, [.nr] request %key troff formatter, [.nr] request
To set a number register, you use the
.CW .nr
.ix number~registers, naming
request. Like macros, number registers can have either
one- or two-character names consisting of any character(s),
not just alphanumeric characters.
For example:
.Ps
\&.nr ^( 1
.Pe
sets a number register called
.CW ^(
to 1.
Number register names are stored separately from macro
names, so there is no conflict in having a number register
with the same name as a macro.
Thus, you can create mnemonic number register names, which
helps to make macros that use those number registers
more readable.
.PP
(If you are writing your own macro package, you can name
registers from scratch.
If you are adding to an existing package, check the number
registers used by that package).
.PP
To use the value stored in a number register, use the escape
sequence
.CW \en \c
.I x
for a one-character number register name, and
.CW \en( \c
.I xx
for a two-character name.
.ix number~registers, interpolating
(In the standard
.CW nroff
and
.CW troff
documentation, this is referred to as
\(lqinterpolating\(rq
the value of the number register).
The point made previously, about using backslashes to
delay the interpretation of an argument, applies equally
to number registers.
In macros, you will usually see the invocation of number
registers preceded by a double backslash, because you
don't want to interpolate the value until the macro
is executed.
.PP
The values stored in number registers can be literal
numeric values (with or without scaling indicators), values
from other number registers (whose value can be
interpolated at a later time), or expressions.
You can also increment or decrement the value placed in a
number register by preceding the value with a plus
or a minus sign.
For example:
.Ps
\&.nr PN 1	\\" Set number register PN to 1
\&.nr PN +1	\\" Add 1 to the contents of number register PN
.Pe
.ix number~registers, scaled units
When you add scaling indicators to the value supplied to
a number register, be aware that values are converted to
basic units before they are stored, and that when you
increment the value of a number register, it is
incremented in basic units.
So, in the previous example, in which no units were
specified, the value of
.CW PN
after incrementing is 2, but
in the following case:
.Ps
\&.nr LL 6.5i
\&.nr LL +1
.Pe
the value initially stored into
.CW LL
is converted into units (i.e., for a 300 dpi output
device, it contains the value 1950); after incrementing,
it contains the value 1951 (again, assuming a 300
dpi device).
.ix %end [.nr] request %key nr request
If you want to increment
.CW LL
by 1 inch, append the proper scaling indicator.
Likewise, when interpolating the value of a number
register, specify that the value is in units.
For example, the construct:
.page 425
.Ps
\&.nr IN 1i
\&.in \\\\n(IN
.Pe
will produce unexpected results.
What you are really writing is:
.Ps
\&.in 300m
.Pe
(assuming a 300 dpi device) because the default scaling for
an indent request is ems.
The proper usage is:
.Ps
\&.in \\\\n(INu
.Pe
.Bh "Number Registers as Global Variables"
.ix number~registers, as~global variables
.ix number~registers, used~to~generalize macros
Number registers can be used in different ways.
First, and probably most important, they can generalize
a macro package.
For example, in
.CW ms ,
the default line length is stored in a number register
called
.CW LL .
.PP
Periodically, macros in the package may muck with the line
length, and then reset it to its default state.
Requests to reset the line length to its default value
thus have the form:
.Ps
\&.ll \\n(LLu	\\" Single backslash within the body of text
.Pe
or
.Ps
\&.ll \\\\n(LLu \\" Double backslash within a macro definition
.Pe
Because the line length is not
\(lqhard coded\(rq
in the document,
users can change the line length throughout simply by
changing the default value stored in the number register.
.PP
You might wonder why this is necessary.
After all, you can simply set an initial line length, and
then increment it or decrement it as necessary.
And many macros take this approach.
But there are other cases where the line length is a factor
in another calculation.
.PP
For example, the output text can be centered horizontally
on the physical page regardless of the line length if the
page offset is set not absolutely, but in terms of the
line length:
.Ps
\&.po (8.5i-\\n(LLu)/2u
.Pe
In general, it is good programming practice to place values
that are used at many different places in a program into
globally accessible variables.
To change the action of the program, it is only necessary to
change the value of the variable.
It is the same in
.CW nroff
and
.CW troff.
When we look at the overall design of a macro package in
Chapter 16, we'll return to this subject in more detail.
.Bh "Number Registers as Flags"
.ix number~registers, used~as~flags
In the chapters on the existing macro packages, you've
also seen number registers used as flags\(emsignals
to a macro to act in a certain way.
For example, in
.CW mm ,
paragraphs are flush left by default, but if the user sets
the
.CW Pt
number register to 1, all paragraphs will be indented.
.ix %end number~registers
.ix %end [troff] formatter, number~registers %key troff formatter, number registers
.page 426
.PP
Within the paragraph macro, there is a line that tests the
.CW Pt
register, and acts accordingly:
.Ps
\&.if \\\\n(Pt=1 .ti +\\\\n(Pin
.Pe
This line actually uses number registers in both ways.
If the number register
.CW Pt
is set to 1, the macro indents by the value stored in
another register,
.CW Pi .
.PP
One-character number register names can also be set from
the command line, with
.CW nroff
or
.CW troff 's
.CW -r
option.
This gives you the ability to construct macros that
will act differently depending on command-line options.
We'll show some examples of this in Chapter 16,
when we discuss how to print a document on either an
8\(12-by-11 inch or a 6-by-9 inch page, simply by
specifying a single command-line switch.
.Bh "Predefined Number Register Names"
.ix [troff] formatter, predefined number~register names %key troff formatter, predefined number register names
.ix number~registers, predefined
In addition to number registers set by the various macro
packages, or set by macros you write, there are quite a few
number registers whose usage is predefined by the formatter.
You've already seen one of these\(em\c
.CW % ,
which always contains the current page number.
Table 14-3 (and Table 14-4) list some of the most important
preset registers, and Appendix B includes a complete
listing.
Not all of these registers will be meaningful at this
point, but we'll tell you more about them as we go on.
.\" Note: table 14-3 moved. Now on page 427's markup.
.PP
The registers in Table 14-3 can be reset.
For example, if you want to arbitrarily reset the page
number to 1, you can type:
.Ps
\&.nr % 1
.Pe
The formatter will keep incrementing the register on each
new page, but will count from the new baseline.
(You might want to do this, for example, if you are
following the convention used in many technical manuals,
which number pages on a chapter-by-chapter basis, with
a number made up of both the chapter number and the
page number.
In this case, the page number is reset to 1 at the start
of each new chapter).
.page 427
.PP
Note that
.CW %
is a true number register name, and don't let the special
use of the
.CW %
character in the
.CW .tl
request confuse you.
In
.CW .tl ,
.CW %
alone will interpolate the current page number;
however, in any other place, you must specify the full
number register interpolation
.CW \en% .
.PP
The set of registers in Table 14-4 cannot be modified.
In reading their names, be sure to note that they are
two-character names beginning with
.CW .
(dot).
If you are reading through one of the existing macro
packages, it is easy either to confuse them with macros
or requests, because they begin with a period, or to miss
the period and read them as one-character names.
.KF
.Ts "Predefined Number Registers"
.TS
center box tab (#);
l c
cf(CW) lw (3i).
Register#Contents
_
%#Current page number
dl#Width (maximum) of the last completed diversion
dn#Height (vertical size) of the last completed diversion
dw#Current day of the week (1 to 7)
dy#Current day of the month (1 to 31)
hp#Current horizontal place on the \f[I]input\fP line
ln#Output line number
mo#Current month (1 to 12)
nl#Vertical position of the last printed text baseline
yr#Last two digits of the current year
.TE
.Te
.KE
.KF
.ix [troff] formatter, read-only number~registers %key troff formatter, read-only number registers
.ix number~registers, read-only
.Ts "Read-Only Number Registers"
.TS
center box tab (#);
l c
cf(CW) lw (3.1i).
Register#Contents
_
\&.$#Number of arguments available in the current macro
\&.c#Number of lines read from the current input file
\&.d#T{
Current vertical place in current diversion; equal to
\f[CW]nl\fP if no diversion
T}
\&.f#Current font position (1 to 4 in \f[CW]otroff\fP)
\&.H#Available horizontal resolution in machine units
\&.i#Current indent
\&.j#T{
.nf
Current adjustment mode (0 = \f[CW].ad l\fP or \f[CW].na\fP;
1 = \f[CW].ad b\fP; 3 = \f[CW].ad c\fP; 5 = \f[CW].ad r\fP)
.fi
T}
\&.L#Line spacing set with \f[CW].ls\fP
\&.l#Current line length
\&.n#Length of text on previous line
\&.o#Current page offset
\&.p#Current page length
\&.s#Current point size
\&.t#Distance to the next trap (usually the page bottom)
\&.u#Equal to 1 in fill mode and 0 in no-fill mode
\&.V#Available vertical resolution in machine units
\&.v#Current vertical line spacing
\&.w#Width of previous character
\&.z#Name of current diversion
.TE
.Te
.KE
.PP
The registers in Table 14-4 are particularly useful when
you want to temporarily change some value (for example,
the font) and then restore it, without having to know
what was there before.
.PP
For example, if you print an italicized footer on each
page, you might include the following requests in
your page bottom macro:
.Ps
\&.nr FT \\\\n(.f
\&.ft I
	.
	.
	.
\&.ft \\\\n(FT
.Pe
.page 428
This is safer than simply using the
.CW .ft
request without an argument to restore the previous font,
which can create havoc if a user makes a font change
within a definition of the footer string.
.PP
Be aware that registers with scaled values (e.g.
.CW .l
for the line lengths or
.CW .v
for the current vertical spacing) contain those values as
basic machine units (as do all
number registers containing scaled values).
As described previously, this means you should append a
.CW u
whenever you want to use the contents of one of these
registers as an argument to a request.
.Bh "Autoincrementing Registers"
.ix [troff] formatter, autoincrementing number~registers %key troff formatter, autoincrementing number registers
.ix autoincrementing number~registers
.ix number~registers, autoincrementing
We've described how to increment the value stored in a
register by prefixing the value you supply to the
.CW .nr
request with a plus sign (\c
.CW + ),
and how to decrement it
by specifying a minus sign (\c
.CW - ).
.PP
You can also
.I autoincrement
or
.I autodecrement
a register whenever you interpolate its value.
To make this work, you must supply two values to an initial
.CW .nr
request: the starting value and the increment value.
For example:
.Ps
\&.nr TE 1 1
\&.nr ST 10 3
.Pe
Then, when you interpolate the contents of the register,
instead of using the standard
.CW \en \c
.I x
or
.CW \en \c
.I xx ,
specify a plus or a minus after the
.CW \en
and before the register name.
The value that is interpolated will be the original
contents of the number register plus (or minus) the
increment (or decrement) value.
At the same time, the value in the register will be
updated by the increment value.
For example, assuming the initial definitions in the
previous example:
.Ps
\\n+(TE \\" Increment TE by 1, and interpolate the new value
\\n-(ST \\" Decrement ST by 3, and interpolate the new value
.Pe
Number register interpolations of the normal sort can still
be used and will, as always, simply give you the value
currently stored in the register.
.Bh "Altering the Output Format"
.ix number~registers, altering output format
As we've seen, sometimes number registers are simply used
to supply values to requests, or to pass information
between macros.
But there are many cases in which the value of a number
register is actually interpolated into the formatter output
and printed.
The page number register
.CW %
is a good example.
Although it might be used as the basis to test conditions
in macros, it is usually printed as well.
.PP
The
.CW .af
.I "alter format" ) (
request allows you to specify the format in which to
express the value of a number register.
This request takes two arguments, the name of the
register to be affected and the format:
.Ps
\&.af \f[I]register format\fP
.Pe
The
.I format
codes are given in Table 14-5.
.page 429
.KS
.Ts "Format Codes"
.TS
center box tab (#);
l c c
cf(CW) l lw (3i).
Format#Description#Numbering Sequence
_
1#Arabic#0,1,2,3,4,5,...
i#Lowercase roman#0,i,ii,iii,iv,v,...
I#Uppercase roman#0,I,II,III,IV,V,...
a#Lowercase alphabetic#0,a,b,c,...z,aa,ab,...zz,aaa,...
A#Uppercase alphabetic#0,A,B,C,...Z,AA,AB,...ZZ,AAA,...
.TE
.ft R
.Te
.KE
.PP
In addition to the numbering sequences in Table 14-5, an
arabic format having additional digits (e.g., 001)
will result in a numbering sequence with at least that
many digits (e.g., 001,002,003,...).
.PP
For example, to change to lowercase roman page numbering
in the front matter of a book, you could write:
.Ps
\&.af % i
.Pe
(Note that, depending on exactly how a macro package
implements page numbering, this may or may not work
exactly as shown.
Some macro packages interpolate
.CW %
into another register and print the contents of that register.
For example,
.CW ms
stores the page number in the register
.CW PN
and the request would be
.CW ".af PN i" ).
.PP
Alphabetic formats are generally used in macros for
automatically numbered (or lettered) lists.
We'll take a close look at some of these macros in
Chapter 17.
.Bh "Removing Registers"
.ix [troff] formatter, removing number~registers %key troff formatter, removing number registers
.ix number~registers, removing
With the very large number of possible register names
(nearly 10,000 names are possible, given all one- and
two-character combinations of the printing character
set), it is unlikely that you will run out of number
register names.
.PP
However, if your macros create a very large number of
registers, the formatter can run out of internal storage
space.
For this reason, it may occasionally be necessary (or
at least wise) to remove temporary registers that you
no longer need, using the
.CW .rr
request.
For example:
.Ps
\&.rr TE		\\" Remove register TE
.Pe
.Ah "Defining Strings"
.ix [troff] formatter, defining strings %key troff formatter, defining strings
.ix strings, defining
In addition to macros and number registers,
.CW nroff
and
.CW troff
allow you to define character strings that will be stored
and can be re-invoked at will.
This is not intended as a general-purpose abbreviation
function, although in certain cases it can be used that
way.
Rather, it is designed to allow you to store global string
variables for use throughout a package, in much the same
way that number registers provide numeric variables.
.\" the index has the .ds stuff on page 429, but the closest
.\" reference to it is on page 430.  I no longer have the
.\" original to double check, so I've put it within the
.\" the page 429 area per the index. -- Michael Hobgood
.ix [.ds] request %key ds request
.ix [troff] formatter, [.ds] request %key troff formatter, [.ds] request
.page 430
.PP
For example, in both
.CW ms
and
.CW mm ,
you can define headers, footers, or both that will be
printed on every page.
To do this, the header or footer macro contains a
reference to a predefined string.
All the user has to do is give the string a value.
The user doesn't have to modify the macro itself.
.PP
As we've already seen, to define a string, use the
.CW .ds
.I "define string" ) (
request.
For example:
.Ps
\&.ds RH Tools for Building Macros  \\" Define right header
.Pe
.ix strings, naming
String names, like macro and number register names, can
have either one or two characters.
However, unlike number registers, string names are drawn
from the same pool as macro and request names, so you have
to be careful not to conflict with existing names.
.PP
.ix strings, interpolating
To interpolate the value of a string, use the escape
sequence
.CW \e* \c
.I x
for a one-character name, or
.CW \e*( \c
.I xx
for a two-character name.
For example, our page top macro might include the lines:
.Ps
\&.if o .tl '\\\\*(RH''%'	\\" Print header string then page #
\&.if e .tl '%''\\\\(*RH'	\\" Print page # then header string
.Pe
Another good example of how to use this request (as well as
how to use predefined number registers) is given by the
technique used in
.CW ms
and
.CW mm
to build a date string.
.PP
The
.CW troff
program reads in the date from the system clock into the
predefined number registers
.CW mo
.I month ), (
.CW dy
.I day ), (
and
.CW yr
.I year ). (
To set a complete date string that users can easily
reference, we might write the following requests
in our macro package:
.Ps
\&.if \\n(mo=1 .ds MO January
\&.if \\n(mo=2 .ds MO February
\&.if \\n(mo=3 .ds MO March
\&.if \\n(mo=4 .ds MO April
\&.if \\n(mo=5 .ds MO May
\&.if \\n(mo=6 .ds MO June
\&.if \\n(mo=7 .ds MO July
\&.if \\n(mo=8 .ds MO August
\&.if \\n(mo=9 .ds MO September
\&.if \\n(mo=10 .ds MO October
\&.if \\n(mo=11 .ds MO November
\&.if \\n(mo=12 .ds MO December
\&.ds DY \\*(MO \\n(dy, 19\\n(yr
.Pe
(Note that these requests do not need to be executed from
within a macro.
The register values can be interpolated when the macro
package is first read in.
For this reason, the string and number register
interpolations shown here are not escaped with an
additional backslash).
.PP
.ix [troff] formatter, appending~to~a string %key troff formatter, appending to~a string
.ix strings, appending~to
.ix [troff] formatter, [.as] request %key troff formatter, [.as] request
.ix [.as] request %key as request
Another request,
.CW .as
.I "append [to] string" ), (
also allows you to add to the contents of an existing
string.
The last line of the previous sequence could also have
been written:
.Ps
.page 431
\&.as MO \\n(dy, 19\\n(yr
.Pe
to append the day and year to whatever value had been
stored into
.CW MO .
Here, this is a little contrived\(emit is better to
maintain the month and the date as a
whole in separate strings.
However, the technique of appending to a string is used
appropriately in the definition of a macro to produce
numbered section headers, as we'll see in Chapter 17.
.Ah "Diversions"
.ix diversions
So far, we have discussed macros that you define in advance
as a sequence of stored requests.
There is also another class of macros that are created
by a process called
.I diversion .
.PP
A diversion consists of temporary storage of text into a
macro,
which can be saved and output at a later time.
In reading the chapters on
.CW ms
or
.CW mm ,
you might have wondered how
.CW troff
manages to move footnotes embedded anywhere in the text to
the bottom of the page, or how it
\(lqfloats\(rq
a figure, table,
or block of text to the top of a succeeding page, after
filling the current page with text that comes later
in the input file.
.PP
.ix [troff] formatter, keeping~text~block~together %key troff formatter, keeping text~block~together
The answer is simple: the formatter stores the text (or
other output) in a macro created by diversion.
(Such a macro is often called simply a diversion).
The size of the diversion is stored into number registers
that you (your macros, that is) can test to see if
the diversion will fit on the current page, and how much
space you need to allocate for it.
The macro package can then make decisions about how and
where to place the contents of the diversion.
.PP
.ix [troff] formatter, [.di] request %key troff formatter, [.di] request
.ix [.di] request %key di request
.ix diversions, creating
To create a diversion, use the
.CW .di
.I divert ) (
request.
This request takes as an argument the name of a macro.
All subsequent text, requests, etc., will be processed
normally, but instead of being output, they will be stored
into the named macro.
.ix diversions, closing
A
.CW .di
request without an argument ends the diversion.
.PP
The output that has been stored in the diversion can now
be output wherever you like, simply by invoking the
macro named in the initial
.CW .di
request.
For many purposes, this invocation will be performed
automatically by a page transition macro.
We will look at this in more detail in succeeding chapters,
but just to get the idea, let's look at a simple
definition for a pair of keep macros.
.PP
(In general, diversions are handled by pairs of macros\(emone
to start the diversion, the other to end it.
However, there are other cases in which we will see that
this is not necessary).
.PP
Both
.CW ms
and
.CW mm
use diversions in their display macros.
.ix keep~and~release
In
.CW ms ,
the display macros handle text positioning, and call
lower-level macros called keep macros to make sure
the text in the display stays on the same page.
.PP
The purpose of the keep macros, in case you are not
familiar with this concept from earlier chapters, is to
make sure that a block of text is not split across two
pages.
A typical example of a block that should not be split
is a figure\(emwhether it is reserved space for a
figure, or an actual
picture created with
.CW pic
or some other graphics tool.
.PP
A simple macro to start a keep might look like this:
.page 432
.Ps
\&.de KS		\\" Keep Start
\&.br
\&.di KK
\&..
.Pe
A simple macro to end a keep might look like this:
.Ps
\&.de KE		\\" Keep End
\&.br
\&.di
\&.ne \\\\n(dnu
\&.nr fI \\\\n(.u
\&.nf
\&.KK
\&.if \\\\n(fI .fi
\&..
.Pe
.ix [troff] formatter, [.br] request %key troff formatter, [.br] request
.ix [.br] request %key br request
.ix breaks, importance~of
In both macros, the
.CW .br
requests are extremely important; they flush any partial
lines that have not yet been output.
In the
.CW .KS
macro, the break makes sure that the keep begins with the
text following the macro; in
.CW .KE ,
it makes sure that the last partial line is included
in the diversion.
.PP
It is also important to output the diversion in no-fill
mode.
If you don't, the text contained in the diversion will
be filled and adjusted a second time, with unpredictable
results.
(Consider, for example, when the diversion includes an
already formatted table.
The table would be scrambled by a second pass).
.PP
You can't just switch back to fill mode after you output
the diversion, though.
What if the body of the text was meant to be in no-fill
mode?
To get around this problem, you should save the value of
.CW troff 's
read-only register
.CW .u ,
and test the saved value to see whether or not filling
should be restored.
.PP
There are a few times when you might not want to follow
this rule.
For example, what should you do if there is a chance that
the diversion will be output on a page where the line
length is different?
You still want to avoid processing the text twice.
You can put the text into the diversion in no-fill mode,
and can embed any formatting requests into the diversion
by preceding them with a backslash (e.g.,
.CW "\e.in 5n" ).
Any requests treated in this way will be acted on when
the diversion is output.
.PP
As always, it is important to specify the correct units.
In the previous example, the value in
.CW dn
is stored using basic device units (as is the case with all
scaled values stored in a number register), so you
.I must
add a
.CW u
on the end of the interpolation.
For example, on a 300 dpi device, after a diversion 2
inches high,
.CW dn
will contain the value 600.
The request:
.Ps
\&.ne \\\\n(dn
.Pe
will always result in a page break because (in this
example) what you are really writing is:
.Ps
\&.ne 600
.Pe
What you want to write is:
.page 433
.Ps
\&.ne \\\\n(dnu
.Pe
.PP
Any text and requests that are issued between the initial
.CW .KS
and the terminating
.CW .KE
will be stored in the macro called
.CW .KK .
The height of the last-completed diversion is always stored
in the number register
.CW dn .
We can simply say that we need (\c
.CW .ne )
at least that much space.
If the size of the diversion is greater than the
distance to the bottom of the page, we simply start a
new page.
Otherwise, we output the text and continue as if the
diversion had never happened.
.PP
The case of a floating keep, in which text that follows
the keep in the source file floats ahead of it in the
output, and fills up the current page, is more difficult
to handle than the simple example just shown.
However, this example should give you an idea of how
to use diversions.
.PP
.ix [troff] formatter, appending~to~a diversion %key troff formatter, appending to~a diversion
.ix diversions, appending~to
.ix [troff] formatter, [.da] request %key troff formatter, [.da] request
.ix [.da] request %key da request
There is also a
.CW .da
.I "divert append" ) (
request that adds output to an existing diversion.
(A second
.CW .di
given the same macro name as the first will overwrite the
diversion's previous contents, but
.CW .da
will add the new material to the end).
.PP
The
.CW .da
request has numerous applications.
For example, consider footnotes.
To calculate where to place the first footnote, you need
to calculate the size of all the footnotes you want to
put on the page.
That's easy\(emjust append them to the same diversion.
.PP
However, there are other far less obvious applications
for appended diversions.
For example, you can divert and append section headings
or index entries to macros that will be processed at the
end of the file to produce a table of contents
or an index.
.Ah "Environment Switching"
.ix [troff] formatter, environment switching %key troff formatter, environment switching
.ix [troff] formatter, [.ev] request %key troff formatter, [.ev] request
.ix environments
.ix [.ev] request %key ev request
The
.CW nroff
and
.CW troff
formatters allow you to issue many requests that globally
affect the format of a document.
The formatter is generally quite thorough in providing
ways to change and restore the value of various parameters.
This makes it relatively easy to change values such as the
line length or fill/no-fill mode in order to treat
certain blocks of text differently and then restore
the original values.
.PP
Nonetheless, if you want to make major changes to a
number of values, it can be awkward to save and restore
them all individually.
For this reason,
.CW nroff
and
.CW troff
provide a mechanism called
.I "environment switching" .
By default, text processing takes place in what is
considered to be environment 0.
The
.CW .ev
request allows you to switch to either of two additional
environments, referred to as environment 1 and
environment 2.
.PP
For example, to change to environment 2, you would enter:
.ig
	Added a colon on the above line for consistency.
	--Michael Hobgood
..
.Ps
\&.ev 2
.Pe
To restore a previous environment, you simply issue an
.CW .ev
request without an argument.
Environments are stored in a
\(lqpush down stack.\(rq
So if you are using multiple environment switches, a
sequence of
.CW .ev
requests without arguments won't toggle you between
two environments, but will actually backtrack the specified
number of environment switches. That is:
.page 434
.Ps
\&.ev 1
\f[I]do something\fP
\&.ev 2
\f[I]do something\fP
\&.ev	\\" Go back to ev 1
\&.ev	\\" Go back to ev 0
.Pe
.PP
If you use
.CW .ev
with an argument, you will not pop the stack.
For example, the requests:
.Ps
\&.ev 2
\&.ev 0
.Pe
will leave both environments on the stack.
You might get away with this on one occasion, but if you
do this in a macro that is used with any frequency, your
stack will keep getting deeper until it overflows and the
formatter fails with the message
\(lqCannot do ev.\(rq
.PP
Within each environment, settings made with the following
requests are remembered separately:
.Ps
\&.c2 .cc .ce .cu .fi .ft .hc .hy .in .it .lc .ll .ls .lt
\&.mc .nf .nh .nm .nn .ps .sp .ss .ta .tc .ti .ul .vs
.Pe
Number registers, macros, and strings are common to all
environments.
However, any partially collected lines are part of a
given environment.
If you switch environments without causing a break, these
partial lines will be held till the environment
that contains them is restored.
.PP
What this means is best shown by example:
.Ps
\&.		\\" Set parameters for environment 0
\&.ll 4.5i
\&.ad b
\&.ev 1		\\" Switch to environment 1
\&.ll -10n	\\" Set parameters for environment 1
\&.in +10n
\&.ad l
\&.ev		\\" Restore previous environment (ev 0)
This text will be formatted using the parameters for
environment 0. Notice that part of the last input
line appears to be lost when we switch environments.
It reappears when the environment is restored.
\&.ev 1
\&.sp		\\" The break caused by this request is in ev 1
Now we've switched to environment 1. Notice how the text
is now formatted using the parameters for environment 1.
Also notice that this time, we're going to issue an .sp
request after this sentence to cause a break and make sure
the last partial line is output before we leave this
environment.
\&.sp
.page 435
\&.ev		\\" Back once more to environment 0
This sentence will be preceded by the remainder of input
left over from the last time we were in this environment.
.Pe
Here's the resulting output (from
.CW nroff ):
.sp .7v
.SS
.Ps
This  text  will  be  formatted   using   the
parameters  for environment 0.  You'll notice
that part of the last input line  appears  to
be lost  when  we  switch  environments.   It
.sp
         Now we've switched to environment 1.  Notice
         how the text is now formatted using the
         parameters for environment 1.  Also notice
         that this time, we're going to issue an .sp
         request after this sentence to cause a break
         and make sure the last partial line is output
         before we leave this environment.
.sp
reappears when the environment  is  restored.
This   sentence   will  be  preceded  by  the
remainder of the input  left  over  from  the
last time we were in this environment.
.sp
.Pe
.SE
.sp .8v
.PP
Environments are very powerful and versatile.
The example given previously could have been handled more
appropriately with a macro.
However, as you will find, there are tasks that are best
handled by an environment switch.
.PP
Printing footnotes is a primary example.
Footnotes are usually collected in a diversion, which must
be output at the bottom of the page without causing a break
or other interference with the text.
.PP
Unfortunately, you must use environment switching with caution
if you are working within one of the existing macro packages,
because they may use different environments internally, and
changing parameters in an environment may affect the operation
of the package.
For example, it was necessary to process the preceding example
independently with
.CW nroff ,
and then read the resulting output into the source file,
because the use of environments by the macro package that
produced this book was incompatible with what we were
trying to show.
.Ah "Redefining Control and Escape Characters"
.ix [.c2] request %key c2 request
.ix [.cc] request %key cc request
.ix [.ec] request %key ec request
.ix [.eo] request %key eo request
.ix [troff] formatter, [.c2] request %key troff formatter, [.c2] request
.ix [troff] formatter, [.cc] request %key troff formatter, [.cc] request
.ix [troff] formatter, [.ec] request %key troff formatter, [.ec] request
.ix [troff] formatter, [.eo] request %key troff formatter, [.eo] request
.ix [troff] formatter, redefining control~and~escape characters %key troff formatter, redefining control and~escape characters
.ix redefining control~and~escape characters
There are special requests to reset the control characters
that begin requests (\c
.CW .
and
.CW ' )
and the escape character:
.page 436
.Ps
\&.eo	\\" Turn escape character off except for comments
\&.ec !	!"  Set escape character to !
\&.ec \\	\\" Set escape character back to \\
\&.cc #	\\" Change control character from . to #
\&.c2 ^	\\" Change no-break control character from ' to ^
.Pe
As far as we can tell by experiment, turning the escape
character off entirely with
.CW .eo
does not affect the comment sequence
.CW \e" ;
however, if you change the escape character with
.CW .ec ,
comments must be introduced by the new escape character.
.PP
We have not found a significant use for these requests in our
own work, or in macros we've studied, although there are no
doubt cases where they are precisely what is needed.
.PP
One application that immediately suggests itself is the
representation of control and escape characters in the
examples shown in this book.
However, in practice there are many problems.
.PP
For example, if you use these requests in a pair of macros
to frame examples, the closing macro must be invoked with
the appropriate control character, creating inconsistencies
for the user.
Even more seriously, if control character translations are in
effect during a page transition (something that is difficult
to control) or other macro invoked by a trap, they will render
that macro inoperable, unless it has been designed with
the same control and escape characters.
.PP
.ix [troff] formatter, [.tr] request %key troff formatter, [.tr] request 
.ix [.tr] request %key tr request
Our preferred solution to this problem is to use the
.CW .tr
request, which is discussed in the next chapter.
.Ah "Debugging Your Macros"
.ix %begin [troff] formatter, debugging %key troff formatter, debugging
.ix %begin debugging, in [troff] %key debugging, in troff
When using a markup language as complex as that provided by
.CW nroff
and
.CW troff ,
it is easy to make mistakes, particularly when you are
designing complex macros.
.PP
To limit the number of mistakes you make, you can take lessons
from programmers in more general-purpose languages:
.RS
.Ls B
.Li
Start by writing and testing small pieces of a complex macro.
Then, after you know the pieces work, put them together.
It is much easier to find a problem in a simple macro than
in one that is already very complex.
.Li
Be aware of interactions between the macro you are writing
and other macros in the package.
Initialize variables (number registers and strings) that might
also be used by other macros.
.Li
Include extensive comments, so you can reconstruct what you
were trying to do when you go back to the macro later.
(Errors often arise unexpectedly after the macro has been
in use for a while, and you have a chance to exercise it
fully.
Be sure you can follow what you originally wrote).
.Li
Test each macro thoroughly before you put it into general use.
.Le
.RE
.page 437
However, even with the best of intentions, you are likely to
make mistakes.
This short section is intended to give you a few pointers on
how to track them down.
.PP
The term debugging is familiar even to nonprogrammers.
In general, it refers to the process of finding errors in
programs.
I would like to suggest an alternate definition that may give
you better insight into how to go about this process:
.I "Debugging is the process of finding out what your macro really \
does, instead of what you though it should do".*
.FS
*I am indebted to Andrew Singer of Think Technologies for this
definition. Andrew used similar words in describing to me
the debugging philosophy of his company's innovative Pascal
compiler for the Macintosh, Lightspeed Pascal.
.FE
.PP
When you write a program or a macro, you have an idea in your
mind of what you want to accomplish.
When it doesn't do what you expect, you consider it an error.
.PP
But as we all know, computers are very literal.
They generally do just what they are told.
(The exception being when there is an error in some underlying
layer of software that causes problems on a higher layer).
Therefore, the essence of debugging is to compare, on a
step-by-step basis, exactly what the program or macro is
actually doing with what you expect it to do.
.PP
There are several tools that you can use in debugging macros.
First, and most obviously, you can look carefully at the
output.
Try to reconstruct the sequence of instructions and text that
have been executed to produce the (presumably) undesirable
result.
Often, this will be all you need to do\(emthink
like a text formatter, and go through the requests that
have been executed, in the order that they are executed.
.PP
You will often find that problems are due to an incorrect
understanding of the action of one of the requests or
escape sequences, so it may be advisable to consult the
bible of macro programming, Joseph Osanna's extraordinarily
dense but thorough
.I "Nroff/Troff User's Guide" .
.PP
.ix [troff] formatter, interactive~use %key troff formatter, interactive use
Secondly, you can use
.CW nroff
or
.CW troff
interactively.
If you simply type:
.Ps
$ \f[CB]nroff\fP
.Pe
or:
.Ps
$ \f[CB]troff -a\fP
.Pe
the program will take standard input from the keyboard and
send its results to standard output (the screen).
The
.CW "troff -a"
command creates an ASCII approximation of what the
.CW troff
output would be; if you are using
.CW ditroff ,
you can also save the normal output in a file and look
directly at the output.
However, this output is in an obscure format and takes
considerable time to learn.
.PP
With
.CW "troff -a" ,
special characters (such as underlines) are represented by
their special character names.
For example, underlining will show up as a sequence of
.CW \e(ul s.
Because proportional type is considerably more compact than
the characters that appear on a terminal screen, lines will
appear too long, and will wrap around on the screen.
However, what you see does represent how
.CW troff
will break the lines.
.page 438
.PP
.ix [.so] request %key so request
.ix [troff] formatter, [.so] request %key troff formatter, [.so] request 
Now, by typing in your macros
(or reading them in from existing files with the
.CW .so
request),
you can reproduce the environment of the formatter,
and watch the results as you type in text.
As each line is completed in the input buffer, the formatted
result will be output.
.ix [.fl] request %key fl request
.ix [troff] formatter, flushing output~buffer %key troff formatter, flushing output buffer
.ix [troff] formatter, [.fl] request %key troff formatter, [.fl] request
You can force output of a partially completed line with the
.CW .fl
.I flush ) (
request, which was designed for this purpose.
.PP
This method has definite limits, but has just as definite
a place in pinning down what the commands you type are doing.
.PP
.ix [troff] formatter, ignoring input %key troff formatter, ignoring input
.ix [.ig] request %key ig request
.ix [troff] formatter, [.ig] request %key troff formatter, [.ig] request
Another debugging tool that you may find useful is the
.CW .ig
.I ignore ) (
request.
It tells the formatter to ignore subsequent input, up to a
specified terminator (\c
.CW ..
by default).
The
.CW .ig
request acts like
.CW .de ,
only the input is discarded.
(The only exception to this is that autoincremented registers
whose values are interpolated within the ignored block will
still be incremented or decremented).
.PP
This request is useful when you are trying to pin down exactly
where in an input file (or a long macro definition) a fatal
error (one that causes the formatter to stop processing)
occurs.
By successively isolating parts of the file with
.CW .ig ,
you can locate the problem more closely.
.PP
This request is also useful for
\(lqcommenting out\(rq
extensive
blocks of macro definition or input text that you don't want
in your output.
It is much easier to bracket a large block of input in this
way than it is to insert comment characters at the
beginning of each line.
.PP
Because you may want to
\(lqignore\(rq
more than one macro definition,
you may want to get in the habit of specifying a special
delimiter for the
.CW .ig
request, so that the
\(lqignore\(rq is not accidentally terminated by
the end of the first macro definition.
This will also make it much easier to find the end of the
ignored section.
For example, if you insert the line:
.Ps
\&.ig ++
.Pe
anywhere in your input, the formatter will ignore the input
until it sees the request:
.Ps
\&.++
.Pe
.ix [troff] formatter, terminal messages %key troff formatter, terminal messages
.ix terminal messages~from [troff] %key terminal messages from troff
.ix [troff] formatter, [.tm] request %key troff formatter, [.tm] request
.ix [.tm] request %key tm request
The final tool provided for debugging is the
.CW .tm
.I "terminal message" ) (
request, which prints a message on standard error.
This is particularly useful for tracking down errors
involving number registers.
For example, if you have set a condition based on the
value of a number register, and the condition never seems
to be satisfied, you might want to insert
.CW .tm
messages to print out the value of the number register at
certain points in your file.
For example:
.Ps
\&.tm Before calling B1, the value of BC is \\n(BC
\&.B1
\&.tm After calling B1, the value of BC is \\n(BC
.Pe
(Note that there are no double backslashes before the
number register interpolations, because these requests are not
made while you're inside a macro definition.
From inside a macro, be sure to double the backslashes, or
you will get the value of the number register at the
time the macro was defined).
.ix %end [troff] formatter, debugging %key troff formatter, debugging
.ix %end debugging, in [troff] %key debugging, in troff
.PP
A read-only number register that is useful in this regard is
.CW .c ,
which contains the number of lines read from the current
input file.
This allows you to create messages
.page 439
that will help you (or the user of your macros) find out
where in the input file an error (or other event) occurs:
.Ps
\&.tm On input line \\\\n(.c, the value of BC was \\\\n(BC
.Pe
(Here, there are double backslashes, because this example
is intended to be inside a macro definition).
Sometimes it is helpful to follow just how far the formatter
has gotten in a file.
The most difficult errors to track are those that cause the
formatter to quit without producing a block of output.
A series of messages of the form:
.Ps
\&.tm At top of page \\\\n%, I've processed \\\\n(.c input lines
.Pe
inserted into the page top macro will help you determine how
far the formatter has gotten, and can thus help locate an error.
If the formatter is processing standard input rather than an
individual file, the
.CW .c
register will be empty.
.PP
Another register that you may find useful in printing error
messages is
.CW .F ,
which contains the name of the current file.
(Yes, the filename is a string, even though it's stored in
a number register).
.PP
The
.CW .R
register is also useful.
It contains the number of free number registers.
You can print its value to see if you are running out of
number registers or coming close to the limit. (\c
.CW tbl
and
.CW eqn
use many dynamic number registers, and it is possible
to run out if you use a lot in your macros as well).
.PP
Although we use the tools described here to debug our
macros, we know that they don't always help you deal with
the complexity of a macro package.
The relationships among different macros are not always
apparent.
For instance, you can usually tell from looking at your
output what macro is causing a problem; however, when you
look at the macro definition, you might find that this macro
is calling several other macros or testing registers that have
been set elsewhere in the macro package.
It soon leads to the wish for a debugging tool that traced
the interpretation and execution of macro definitions.
.PP
At least one version of
.CW troff
does support a
.I trace
facility.
.ix SQ[troff] %key SQtroff
Users of SoftQuad's
.CW SQtroff
can enable a trace mode to show the invocation of each
request, diversion, trap, and macro call.
For instance, suppose that a macro tests the value of a
number register to determine whether a request should be
executed.
In trace mode, you can see at what point the
.CW .if
request was invoked, whether it was evaluated as true or false,
and determine the actual value of the number register at
that point.
SoftQuad has also taken another step to make debugging easier
by improving
.CW troff 's
obscure error messages.
In general, SoftQuad has enhanced standard
.CW troff
in other ways that aid the process of macro writing and
debugging, such as allowing longer names (up to 14 characters)
for macros, requests, strings, registers, and fonts.
.Ah "Error Handling"
.ix [troff] formatter, error handling %key troff formatter, error handling
.ix errors, in [troff]~macros %key errors, in troff macros
There are many different ways that users can get into trouble
while coding documents, and your macros can help them identify
and recover from problems.
The three most common classes we have encountered are:
.page 440
.RS
.Ls B
.Li
A user fails to properly understand the action of the
formatter itself.
For example, he or she begins a text line with a single quote
or period, or defines a special character (such as %) as an
.CW eqn
delimiter.
This problem becomes more pronounced as users try out more
advanced capabilities without really understanding them.
.Li
A user fails to properly understand the macro package.
For example, he or she gives the wrong argument to a macro
or specifies the wrong units.
.Li
A user temporarily resets some condition, either directly
or by failing to close a set of paired macros.
This causes undesirable effects to propagate through the
document.
.Le
.RE
The
.CW mm
macros attempt to solve the first problem by creating so
comprehensive a macro package that users never need use
many low-level formatter requests.
However, in doing so, its developers have created an
environment that is in may ways more complex than the raw
formatter environment itself.
And in our opinion, no macro package is comprehensive
enough to meet all user needs.
Over time, users come up with formatting problems that they
need to know how to solve on their own.
There is no solution to this problem except better user
education.
.PP
To some extent, you can compensate for the second problem
by testing for arguments and printing error messages if
a macro is misused.
For example, if a macro requires an argument, consider
printing a message if the user fails to supply it:
.Ps
\&.if "\\\\$1"" .tm Line \\\\n(.c: .Se requires section \\
number as first argument
.Pe
Of course, by the time the user sees the error message, he
or she has already formatted the document, and it is too late
to do anything else but repair the damage and reprint.
However, messages can sometimes make it easier for users to
find errors and can give them warning to look more closely
at their printout.
.PP
.ix [.ab] request %key ab request
.ix [troff] formatter, [.ab] request %key troff formatter, [.ab] request
.ix [troff] formatter, aborting %key troff formatter, aborting
The
.CW .ab
request takes things one step further\(emit lets you
terminate processing if the formatter encounters
a condition you don't like.
For example, you could write a macro that aborts if it is
called without a necessary argument:
.Ps
\&.if !\\\\n(.$ .ab You forgot the argument!
.Pe
The
.CW .ab
request prints its argument as an error message, just like
.ix terminal~messages~from [troff] %key terminal messages~from troff
.ix [troff] formatter, [.tm] request %key troff formatter, [.tm] request
.ix [.tm] request %key tm request
.CW .tm .
It just takes the further, definite step of quitting on the
spot.
.PP
Probably more suitable, though, is a separate tool for checking
macro syntax.
Such a tool exists for
.CW mm
in the
.CW mmcheck
program.
A program like this checks the syntax of macros and requests
used in a document and reports possible errors.
.PP
This kind of approach is especially suitable for the third
kind of error\(emthe failure to close a set
of paired macros.
.page 441
.Ah "Macro Style"
.ix [troff] formatter, macro style %key troff formatter, macro style
.ix macros, style
As you develop more of your own macros, you might begin
thinking about overall macro style.
Developing macros that behave in a consistent, reliable way
becomes all the more important as the number of new macros
you have increases along with the number of people using them.
Recognizing different styles of macro writing helps to
suggest alternatives and improvements in the way a macro works.
.PP
If you have read the chapters on
.CW ms
and
.CW mm
in detail, or if you are already familiar with both of these
packages, you have probably noticed that they embody
somewhat different text-processing philosophies.
.PP
For example,
.CW ms
generally attempts to recover and continue when it encounters
a serious error, but
.CW mm
aborts the formatting run.
And although
.CW ms
allows a certain amount of user customization (generally by
providing a few number registers and strings that the user
is expected to modify), it has nowhere near the complexity of
.CW mm
in this regard.
An
.CW mm
user is expected to set up various number registers that affect
the operation of many different macros.
.PP
In writing your own macros (especially ones that will be
integrated with one of the existing packages), you should take
some time to think about style, and how you want users to
interact with your macros.
This is most easily shown by comparing several different
paragraph macros:
.Ps
\&.de P			\\" A very simple paragraph macro
\&.br
\&.ne 2v
\&.ti 2P
\&..
.Pe
.ne 6
.Ps
\&.de LP			\\" An ms style flush left paragraph
\&.RT
\&.ne 1.1
\&.sp \\\\n(PDu
\&.ti \\\\n(.iu
\&..
.Pe
.ne 6
.Ps
\&.de PP			\\" An ms style indented paragraph
\&.RT
\&.ne 1.1
\&.sp \\\\n(PDu
\&.ti +\\\\n(PIu
\&..
.Pe
.ne 7
.Ps
\&.deP			\\" An mm style variable paragraph
\&.br			\\" Note that this is much
\&.sp (\\\\n(Ps*.5)u	\\" simplified from true mm code
\&.ne 1.5v
.page 442
\&.if\\\\n(.$>0&(0\\\\$1) .ti+\\\\n(Pin
\&.if\\\\n(.$=0 .if\\\\n(Pt=1 .ti+\\\\n(Pin
\&..
.Pe
The first example shows a very simple paragraph macro using
a fixed indent value.
.PP
The second and third examples are adapted from
.CW ms .
They show the use of an embedded reset macro (discussed in
Chapter 16) and the specification of values such as indents
and interparagraph spacing by means of number registers so
that users can change them without rewriting the macro.
The different types of paragraphs (flush left or indented)
are handled by defining two different macros.
.PP
The fourth example is adapted from
.CW mm .
It shows how a macro can be controlled in a number of different
ways.
First of all, the size of the paragraph indent can be
controlled by the user, as in
.CW ms .
Second, though, users can specify whether they want an indent
for a particular paragraph by specifying an argument to the
macro.
Finally, they can specify whether all paragraphs are to be
indented or flush left by setting the
.CW Pt
.I "paragraph type" ) (
register.
.PP
Although you many not want to go as far as
.CW mm
in giving different ways to affect the action of a macro, it
is good to realize that all of these options are available and
to draw on them as necessary.
.PP
However, it does make sense to be consistent in the
mechanisms you use.
For example, suppose you create macros to put captions on
figures, tables, and examples.
If you allow the user to control the amount of space before
the caption with an optional argument, you ought to do so
in all three analogous macros.
.PP
As much as possible, a user should be able to infer the
action of a macro from its name, and should be able to
guess at its arguments by analogy to other, similar macros
in the same package.
If you are capricious in your design, other users will have
a much greater burden to shoulder when it comes time for
them to learn your macros.
Even if you are the only user of macros you develop,
consistency will help you keep out of trouble as you
gradually extend your package.
.PP
The issue of macro style really comes up as you begin to
develop your own custom macro package, as you will see
when we examine the elements of a macro package in
Chapters 16 and 17.
