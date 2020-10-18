.ig
        appa.t
        Typed by: Heinz-Jürgen Oertel
        Marked up by: Heinz-Jürgen Oertel
        Proofed on: 22 Oct 2002 by Andreas Kähäri <andreas.kahari@unix.net>

        $Id: appa.t,v 1.1 2003/07/28 01:28:44 lkollar Exp $
	$Log: appa.t,v $
	Revision 1.1  2003/07/28 01:28:44  lkollar
	Version 1.0 upload to FFII. Release candidate 1.
	
	Revision 1.4  2003/02/02 12:14:02  oe
	added index macros .ix

	Revision 1.3  2002/11/02 20:10:29  oe
	used .page macro and \(lq, \(rq

	Revision 1.2  2002/11/02 19:53:07  oe
	1. proof reading by Andreas Kähäri

..
.so utp.mac
.utp
.fam P
.page 569
.chapter A "Editor Command Summary" Appendix 1
.LP
This section is divided into five major parts,
describing the commands in the text editors
.CW vi ,
.CW ex ,
.CW sed ,
and
.CW awk ,
and the pattern-matching syntax common to all of them.

.Ah "Pattern-Matching Syntax
.ix regular expressions
.LP
A number of UNIX text-processing programs,
including
.CW ed ,
.CW ex ,
.CW vi ,
.CW sed ,
and
.CW grep ,
allow you to perform searches,
and in some cases make changes,
by searching for text patterns rather than fixed strings.
These text patterns
(also called regular expressions)
are formed by combining normal characters
with a number of special characters.
The special characters and their use are as follows:
.RS
.IP "\f(CW." 10
Matches any single character except newline.
.\"-----------------------------------------------------------------
.IP "\f(CW*" 10
Matches any number (including zero) of the single character
(including a character specified by a regular expression)
that immediately precedes it.
For example, because
.CW .
means \(lqany character,\(rq
.CW .*
means \(lqmatch any number of any characters.\(rq
.\"-----------------------------------------------------------------
.IP "\f(CW[\fP...\fP]" 10
Matches any one of the characters enclosed between the brackets.
For example,
.CW [AB]
matches either A or B.
A range of consecutive characters
can be specified by separating
the first and last characters in the range with a hyphen.
For example,
.CW [A-Z]
matches any uppercase letter from A to Z,
and
.CW [0-9]
matches any digit from 0 to 9.
If a caret (\c
.CW ^ )
is the first character in the brackets,
the comparison is inverted:
the pattern will match any characters
.I except
those enclosed in the brackets.
.\"-----------------------------------------------------------------
.page 570
.IP "\f(CW\e{\fIn\fP,\fPm\fP\e}" 10
.\" I've altered the typeface used for some of the characters in
.\" this item.  UTP uses roman for the comma in \{n,m\}, and I'm
.\" pretty sure some of the \{ and \} are roman too, but I think
.\" they should be courier.  /Andreas 2002-10-21
Matches a range of occurrences of the single character
(including a character specified by a regular expression)
that immediately precedes it.
.I n
and
.I m
are integers between 0 and 256
that specify how many occurrences to match.
\f(CW\e{\fIn\fP\e}\fR
matches exactly
.I n
occurrences,
\f(CW\e{\fIn\fP,\e}\fR
matches at least \fIn\fP occurrences,
and
\f(CW\e{\fIn\fP,\fPm\fP\e}\fR
matches any number of
occurrences between
\fIn\fP
and
\fIm\fP.
For example,
.CW A\e{2,3\e}
matches either AA (as in AARDVARK) or AAA (as in AAA Travel Agency)
but will not match the single letter A.
This feature is not supported in all versions of
.CW vi .
.\"-----------------------------------------------------------------
.IP "\f(CW^" 10
Requires that the following regular expression
be found at the beginning of the line.
.\"-----------------------------------------------------------------
.IP "\f(CW$" 10
Requires that the preceding regular expression
be found at the end of the line.
.\"-----------------------------------------------------------------
.IP "\f(CW\e" 10
Treats the following special character as an ordinary character.
For example,
.CW \e.
stands for a period and
.CW \e*
for an asterisk.
.\"-----------------------------------------------------------------
.IP "\f(CW\e( \e)" 10
Saves the pattern enclosed between
.CW \e(
and
.CW \e)
in a special holding space.
Up to nine patterns can be saved in this way on a single line.
They can be \(lqreplayed\(rq in substitutions by the escape sequences
.CW \e1
to
.CW \e9 .
This feature is not used in
.CW grep
and
.CW egrep .
.\"-----------------------------------------------------------------
.IP "\f(CW\e\fIn" 10
Matches the
.I n th
pattern previously saved by
.CW \e(
and
.CW \e) ,
where
.I n
is a number from 0 to 9
and previously saved patterns are counted from the left on the line.
This feature is not used in
.CW grep
and
.CW egrep .
.RE
.LP
The
.CW egrep
and
.CW awk
programs use an extended set of metacharacters:
.RS
.IP "\fIregexp\f(CW+" 15
Matches one or more occurrences of the regular expression
(\fIregexp\fP).
.IP "\fIregexp\f(CW?" 15
Matches zero or one occurrences of the regular expression.
.IP "\fIregexp \f(CW|\fP regexp" 15
Matches lines containing either
.I regexp .
.IP "(\fIregexp\fP)" 15
Used for grouping in complex regular expressions
(e.g., with | above).
.RE
.LP
Regular expressions in
.CW ex
(\c
.CW :
commands from
.CW vi )
offer some different extensions:
.RS
.IP "\f[CW]\e<"
Constrains the following pattern to be matched only at the beginning of a
word.
.IP "\f[CW]\e>"
Constrains the following pattern to be matched only at the end of a word.
.IP "\f[CW]\eu"
Appended to the
.I replacement
string of a substitute command,
converts first character of replacement string to uppercase.
.page 571
.IP "\f[CW]\eU"
Appended to the
.I replacement
string of a substitute command,
converts entire replacement string to uppercase.
.IP "\f[CW]\el"
Appended to the
.I replacement
string of a substitute command,
converts first character of replacement string to lowercase.
.IP "\f[CW]\eL"
Appended to the
.I replacement
string of a substitute command,
converts entire replacement string to lowercase.
.RE

.Ah "The \f[CB]vi\fP Editor"
.Bh "Command-Line Syntax"
.ix	[vi] editor, summary~of options %key vi editor, summary of options
.LP
There are two commands to invoke the
.CW vi
editor.
.Ps
vi \fR[\fIoptions\fP] [\fIfile(s)\fP]
.Pe
or:
.Ps
view \fR[\fIfile(s)\fP]
.Pe
.LP
.\" Just a short note on a thought that struck me:  After
.\" reading the original UTP, I'm now pretty sure that the
.\" original source used "text\f(CW text\fP text" (or something
.\" equivalent) when switching back and forth between roman and
.\" courier.  You can see this in several places in the book,
.\" where the space before a courier word is much larger than
.\" the space after the same word (in the paragraph hereunder
.\" for example).  This is probably due to some personal habit
.\" of one of the original authors and has no impact whatsoever on
.\" this work.  Just a curiosity.  /Andreas 2002-10-21
If a file is not named,
.CW vi
will open a file that can be given a name with the
.CW :f
command or when it is saved using the
.CW :w
command.
If more than one file is named,
the first file is opened for editing and
.CW :n
is used to open the next file.
The
.CW view
command opens the first \fIfile\fP for read-only use;
changes cannot be saved.
.LP
.I Options:
.RS
.TS
lfCW l.
-l	Open file for editing LISP programs
-r	Recover file
-R	Open file in read-only mode; same as using \f(CWview
-t\fItag	Start at \fItag\fP
-x	Open encrypted file
+	Open file at last line
+\fIn	Open file at line \fIn\fP
+/\fIpattern	Open file at first occurrence of \fIpattern\fP
-w\fIn	Set window to \fIn\fP lines
.TE
.RE
.Bh "Operating Modes"
.LP
After the file is opened, you are in command mode.
From command mode,
you can invoke insert mode,
issue editing commands,
move the cursor to a different position in
.page 572
the file,
invoke
.CW ex
commands or a UNIX shell,
and save or exit the current version of
the file.
.PP
The following commands invoke insert mode.
.PP
\f(CWa A i I o O R s S\fP
.LP
While in insert mode, you can enter new text in the file.
Press the
.I ESCAPE
key to exit insert mode and return to command mode.

.Bh "Command Syntax
.ix	[vi] editor, command syntax %key vi editor, command syntax
.LP
The syntax for editing commands is:
.Ps
[\fIn\fP] \fIoperator\fP [\fIn\fP] \fIobject\fP
.Pe
The commands that position the cursor in the file
represent objects that the basic editing operators can take as arguments.
Objects represent all characters up to (or back to) the designated object.
The cursor movement keys and pattern-matching commands
can be used as objects.
Some basic editing operators are.
.RS
.TS
lfCW l.
c	Change
d	Delete
y	Yank or copy
.TE
.RE
If the current line is the object of the operation,
then the operator is the same as the object:
.CW cc ,
.CW dd ,
.CW yy .
.I n
is the number of times the operation is performed
or the number of objects the operation is performed on.
If both
.I n 's
are specified, the effect is
.I n
times
.I n .
.PP
The following text objects are represented:
.RS
.IP "\fIword" 13
Includes characters up to a space or punctuation mark.
Capitalized object is variant form that recognizes only blank spaces.
.IP "\fIsentence" 13
Up to
.CW ". ! ?
followed by two spaces.
.IP "\fIparagraph" 13
Up to next blank line or paragraph macro defined by
.CW para=
option.
.IP "\fIsection" 13
Up to next section heading defined by
.CW sect=
option.
.RE
.LP
Examples:
.RS
.TS
lfCW l.
2cw	Change the next two words
d}	Delete up to the next paragraph
d^	Delete back to the beginning of the line
.page 573
5yy	Copy the next five lines
3dl	Delete three characters to the right of the cursor
.TE
.RE
.Bh "Status Line Commands
.ix	[vi] editor, status~line %key vi editor, status line
.LP
Most commands are not echoed on the screen as you input them.
However, the status line at the bottom of the screen
is used to echo input for the following commands:
.RS
.IP "\f[CW]/ ?"
Start pattern-matching search forward (\c
.CW / )
or backwards (\c
.CW ? )
.IP "\f[CW]:"
Invoke an \f(CWex\fP command
.IP "\f[CW]!"
Invoke a UNIX command that takes as its input an object in the
buffer and replaces it with output from the command
.RE
.LP
Commands that are input on the status line
must be entered by pressing the
.I RETURN
key.
In addition, error messages and output from the ^G command
are displayed on the status line.

.Bh "Summary of \f[CB]vi\fP Commands
.ix	[vi] editor, command summary %key vi editor, command summary
.LP
.RS
.TS
lfCW l.
\ .	Repeat last command (insert, change, or delete).
^@	Repeat last command.
@\fIbuffer	Execute command stored in \fIbuffer.
\ a	Append text after cursor.
\ A	Append text at end of line.
^A	Unused.
\ b	Back up to beginning of word in current line.
\ B	Back up to word, ignoring punctuation.
^B	Scroll backward one window.
\ c	Change operator.
\ C	Change to end of current line.
^C	Unused.
\ d	Delete operator.
\ D	Delete to end of current line.
^D	Scroll down half-window.
\ e	Move to end of word.
\ E	Move to end of word, ignoring punctuation.
^E	Show one more line at bottom of window.
\ f	Find next character typed forward on current line.
\ F	Find next character typed back on current line.
.page 574
^F	Scroll forward one window.
\ g	Unused.
\ G	Go to specified line or end of file.
^G	Print information about file on status line.
\ h	Left arrow cursor key.
\ H	Move cursor to home position.
^H	Left arrow cursor key; \fIBACKSPACE\fP key in insert mode.
\ i	Insert text before cursor.
\ I	Insert text at beginning of line.
^I	Unused in command mode; in insert mode, same as \fITAB\fP key.
\ j	Down arrow cursor key.
\ J	Join two lines.
^J	Down arrow cursor key.
\ k	Up arrow cursor key.
\ K	Unused.
^K	Unused.
\ l	Right arrow cursor key.
\ L	Move cursor to last position in window.
^L	Redraw screen.
\ m	Mark the current cursor position in register (a-z).
\ M	Move cursor to middle position in window.
^M	Carriage return.
\ n	Repeat the last search command.
\ N	Repeat the last search command in reverse direction.
^N	Down arrow cursor key.
\ o	Open line below current line.
\ O	Open line above current line.
^O	Unused.
\ p	Put yanked or deleted text after or below cursor.
\ P	Put yanked or deleted text before or above cursor.
^P	Up arrow cursor key.
\ q	Unused.
\ Q	Quit \f(CWvi\fP and invoke \f(CWex\fP.
.\" Inserted full stop on the line above.  Paper UTP doesn't
.\" have this.  /Andreas 2002-10-21
^Q	Unused in command mode; in input mode, quote next character.
\ r	Replace character at cursor with the next character you type.
\ R	Replace characters.
^R	Redraw the screen.
\ s	Change the character under the cursor to typed characters.
\ S	Change entire line.
^S	Unused.
\ t	Move cursor forward to character before next character typed.
\ T	Move cursor back to character after next character typed.
^T	Unused in command mode; in insert mode, used with \fIautoindent\fP option set.
.page 575
\ u	Undo the last change made.
\ U	Restore current line, discarding changes.
^U	Scroll the screen upward half-window.
\ v	Unused.
\ V	Unused.
^V	Unused in command mode; in insert mode, quote next character.
\ w	Move to beginning of next word.
\ W	Move to beginning of next word, ignoring punctuation.
^W	Unused in command mode; in insert mode, back up to beginning of word.
\ x	Delete character under the cursor.
\ X	Delete character before cursor.
^x	Unused.
\ y	Yank or copy operator.
\ Y	Make copy of current line.
^Y	Show one more line at top of window.
\ z	T{
Redraw the screen, repositioning cursor when followed by
\f(CWCR\fP at the top, \f(CW.\fP at the middle, and \f(CW-\fP at
the bottom of screen.
T}
ZZ	Exit the editor, saving changes.
^Z	Unused.
.TE
.Bh "Characters Not Used in Command Mode
.ix	[vi] editor, characters~not~used~in command~mode %key vi editor, characters not~used~in command~mode
.LP
The following characters are unused in command mode
and can be mapped as user-defined commands.
.RS
.TS
lfCW 6 lfCW 6 lfCW 6 lfCW.
^A	\ g	\ K	^K
^O	\ q	^T	\ v
\ V	^W	^X	^Z
.T&
lfCW lfCW lfCW s.
\ *	\ \e	\ \_ (underscore)
.TE
.RE
.Bh "\f[CB]vi set\fP Options"
.ix	[vi] editor, setting options %key vi editor, setting options
.LP
The following options can be specified with the
.CW :set
command.
.\" The row separation in the table below needs to be slightly
.\" larger, for readability and to match the paper UTP.
.\" /Andreas 2002-10-21
.TS
tab(#), expand;
cbw(1i) 2 L 2 cbw(1.2i) 2 L 2 cbw(6i-3i)
cb        L cb            L   cb
LfCW      L CfCW          L   L.
Option
(Abbreviation)##Default##Description
_##_##_
.\"----------------------------------------------------
T{
autoindent
.br
(ai)
T}##noai##T{
Indents each line to the same level as the line above.
Use with
.CW shiftwidth
option.
T}
.\"----------------------------------------------------
.page 576
T{
autoprint
.br
(ap)
T}##ap##T{
Changes are displayed after each editor command.
(For global replacement, last replacement displayed.)
T}
.\"----------------------------------------------------
T{
autowrite
.br
(aw)
T}##noaw##T{
Automatically writes (saves) file
if changed before opening another file with
.CW :n
or before giving UNIX command with
.CW :! .
T}
.\"----------------------------------------------------
T{
beautify
.br
(bf)
T}##nobf##T{
Ignores all control characters during input
(except tab, newline, or formfeed).
T}
.\"----------------------------------------------------
T{
directory
.br
(dir)
T}##=tmp##T{
Names directory in which
.CW ex
stores buffer files.
(Directory must be writable.)
T}
.\"----------------------------------------------------
T{
edcompatible
T}##T{
noed-
.br
compatible
T}##T{
Uses
.CW ed -like
features on substitute commands.
T}
.\"----------------------------------------------------
T{
errorbells
.br
(eb)
T}##errorbells##T{
Error messages ring bell.
T}
.\"----------------------------------------------------
T{
hardtabs
.br
(ht)
T}##=8##T{
Defines boundaries for terminal hardware tabs.
T}
.\"----------------------------------------------------
T{
ignorecase
.br
(ic)
T}##noic##T{
Disregards case during a search.
T}
.\"----------------------------------------------------
T{
lisp
T}##nolisp##T{
Indents are inserted in appropriate LISP format.
() {} [[ and ]] are modified to
have meaning for
.I lisp .
T}
.\"----------------------------------------------------
T{
list
.br
(li)
T}##nolist##T{
Tabs print as
^I;
ends of lines are marked with $.
(Used to tell if end
character is a tab or a space.)
T}
.\"----------------------------------------------------
T{
magic
T}##magic##T{
Wildcard characters . * [ are special in 
.I patterns .
T}
.\"----------------------------------------------------
T{
mesg
T}##mesg##T{
Permits messages to display on terminal while editing in
.CW vi .
T}
.\"----------------------------------------------------
T{
number
.br
(nu)
T}##nonu##T{
Displays line numbers on left of screen
during editing session.
T}
.\"----------------------------------------------------
T{
open
T}##open##T{
Allows entry to
.I open
or
.I visual
mode from
.CW ex .
T}
.\"----------------------------------------------------
.page 577
T{
optimize
.br
(opt)
T}##noopt##T{
Deletes carriage returns at the end of lines
when printing multiple lines;
speeds output on dumb terminals when
printing lines with leading white space
(blanks or tabs).
T}
.\"----------------------------------------------------
T{
paragraphs
.br
(para)
T}##T{
=IPLPPPQP
.br
LIpplpipbp
T}##T{
Defines paragraph delimiters for movement by
.CW {
or
.CW } .
The pairs of characters in the value are the names of
.CW nroff/troff
macros that begin paragraphs.
T}
.\"----------------------------------------------------
T{
prompt
T}##prompt##T{
Sets \f(CWex\fP prompt (:).
T}
.\"----------------------------------------------------
T{
readonly
.br
(ro)
T}##noro##T{
Any writes (saves) of a file will fail unless you use
.CW !
after the write
(works with
.CW w ,
.CW ZZ ,
or autowrite).
T}
.\"----------------------------------------------------
T{
redraw
.br
(re)
T}##noredraw##T{
Terminal will redraw the screen whenever edits are made
(insert mode pushes over existing characters;
deleted lines immediately close up).
Default depends on line speed and terminal type.
.CW noredraw
is useful at slow speeds on a dumb terminal;
deleted lines show up as @,
and inserted text appears to overwrite existing text until
you press
.I ESC .
T}
.\"----------------------------------------------------
T{
remap
T}##remap##T{
Allows nested map sequences.
T}
.\"----------------------------------------------------
T{
report
T}##=5##T{
Size of a large edit (i.e., number of lines affected by a single edit)
that will trigger a warning message on bottom line of screen.
T}
.\"----------------------------------------------------
T{
scroll
T}##=[\fR\(12\fP window]##T{
Amount of screen to scroll.
T}
.\"----------------------------------------------------
T{
sections
T}##=SHNHH HU##T{
Defines section delimiters for
.CW "{ }"
movement.
The pairs of characters in the value are the names of
.CW nroff/troff
macros that begin sections.
T}
.\"----------------------------------------------------
T{
shell
.br
(sh)
T}##=/bin/sh##T{
Pathname of shell used for shell escape (\c
.CW :! )
and shell command (\c
.CW :sh ).
Value
is derived from shell environment.
.page 578
T}
.\"----------------------------------------------------
T{
shiftwidth
.br
(sw)
T}##sw=8##T{
Defines number of spaces to indent when using the
.CW >>
or
.CW <<
commands in the \f(CWautoindent\fP option.
T}
.\"----------------------------------------------------
T{
showmatch
.br
(sm)
T}##nosm##T{
In
.CW vi ,
when
.CW )
or
.CW }
is entered, cursor
moves briefly to matching
.CW (
or
.CW {.
(If match is not on the screen, rings the error message bell.)
Very useful for programming.
T}
.\"----------------------------------------------------
T{
showmode
.br
(smd)
T}##nosmd##T{
(System V, Release 2
.CW vi
only).
The string
.I "Input Mode"
is printed on the command line whenever input mode is entered.
T}
.\"----------------------------------------------------
T{
slowopen
.br
(slow)
T}####T{
Holds off display during insert.
Default depends on line speed and terminal type.
T}
.\"----------------------------------------------------
T{
tabstop
.br
(ts)
T}##=8##T{
Sets number of spaces that a
.I TAB
indents during editing session.
(Printer still uses system tab of 8.)
T}
.\"----------------------------------------------------
T{
taglength
.br
(H)
T}##=0##T{
Defines the number of characters that are significant for tags.
Default (zero) means that all characters are significant.
T}
.\"----------------------------------------------------
T{
tags
T}##T{
=tags
.br
/usr/lib/tags
T}##T{
Pathname of files containing tags.
(See the
.CW tag (1)
command.) By default,
system searches
.CW /usr/lib/tags
and the file tags in the current directory.
T}
.\"----------------------------------------------------
T{
term
T}####T{
Terminal type.
T}
.\"----------------------------------------------------
T{
terse
T}##noterse##T{
Displays briefer error messages.
T}
.\"----------------------------------------------------
T{
timeout
T}##timeout##T{
Macros \(lqtime out\(rq after 1 second.
T}
.\"----------------------------------------------------
T{
ttytype
T}####T{
Terminal type.
T}
.\"----------------------------------------------------
T{
warn
T}##warn##T{
Displays
.I "No write since last change"
as warning.
T}
.\"----------------------------------------------------
T{
window
.br
(w)
T}####T{
Shows a certain number of lines of the file on the screen.
Default depends on line speed and terminal type.
T}
.\"----------------------------------------------------
T{
wrapscan
.br
(ws)
T}##ws##T{
Searches wraparound end of file.
T}
.page 579
.\"----------------------------------------------------
T{
wrapmargin
.br
(wm)
T}##=0##T{
Defines right margin.
If greater than zero, automatically inserts carriage returns to break lines.
T}
.\"----------------------------------------------------
T{
writeany
.br
(wa)
T}##nowa##T{
Allows saving to any file.
T}
.TE
.RE
.Ah "The \f[CB]ex\fP Editor"
.ix	%begin [ex] editor, command summary %key ex editor, command summary
.LP
The
.CW ex
editor is a line editor that serves as the foundation for the screen editor,
.CW vi .
All
.CW ex
commands work on the current line or a range of lines in a file.
In
.CW vi ,
.CW ex
commands are preceded by a colon and entered by pressing
.I RETURN .
In
.CW ex
itself, the colon is supplied as the prompt at which you enter commands.
.PP
.ix	[ex] editor, invoking %key ex editor, invoking
The
.CW ex
editor can also be used on its own.
To enter
.CW ex
from the UNIX
prompt:
.Ps
\f(CWex\fI filename
.Pe
.LP
Any of the options described for invoking \f(CWvi\fP
may also be used with \f(CWex\fP.
In addition, the \f(CWvi\fP command \f(CWQ\fP
can be used to quit the \f(CWvi\fP editor and enter \f(CWex\fP.
.PP
.ix	[ex] editor, exiting %key ex editor, exiting
To exit \f(CWex\fP:
.RS
.IP
.IP "\f[CW]x"
Exit, saving changes
.IP "\f[CW]q!"
Quit, without saving changes
.IP "\f[CW]vi"
Enter
.CW vi
from
.CW ex
.RE
.PP
.ix	[vi] editor, command summary %key vi editor, command summary
To enter an
.CW ex
command from
.CW vi :
.Ps
\f(CW:\fIaddress\fP command \fIoptions\fP
.Pe
.LP
The colon (\c
.CW : )
indicates an
.CW ex
command.
The
.I address
is a line number or range of lines
that are the object of the
.I command .
.PP
The following options can be used with commands.
.RS
.IP "\f[CW]!" 12
Indicates a variant form of the command.
.IP "\f[I]parameters" 12
Indicates that additional information can be supplied.
A parameter can be the name of a file.
.IP "\f[I]count" 12
Is the number of times the command is to be repeated.
.IP "\f[I]flag" 12
.CW # ,
.CW p ,
and
.CW l
indicate print format.
.RE
.LP
Unlike
\f(CWvi\fP
commands, the
.I count
cannot precede the command as it will be taken for the
.I address .
.CW d3
deletes three lines beginning with the current line;
.CW 3d
deletes line 3.
.page 580
As you type the address and command,
it is echoed on the status line.
Enter the command by pressing the
.I RETURN
key.

.Bh Addresses
.LP
.ix	[ex] editor, line addressing~in %key ex editor, line addressing in
If no address is given,
the current line is the object of the command.
If the address specifies a range of lines, the format is:
.PP
\fIx\f(CW,\fPy
.LP
where
.I x
and
.I y
are the first and last addressed lines.
.I x
must precede
.I y
in the buffer.
.I x
and
.I y
may be line numbers or primitives.
Using
.CW ;
instead of
.CW ,
sets the current line to
.I x
before interpreting
.I y
(that is, the current position will be at
.I x
at the completion of the command).
.CW 1,$
addresses all lines in the file.
.PP
.ix	[ex] editor, address symbols %key ex editor, address symbols
The following address symbols can be used.
.\" Typefaces in the addresses below differs a bit from the
.\" printed UTP.  I'm trying to keep to italics for variable
.\" things and courier for the rest.  /Andreas 2002-10-21
.RS
.IP "\f[CW]." 15
Current line
.IP "\f[I]n" 15
Absolute line \fIn\fPumber
.IP "\f[CW]$" 15
Last line
.IP "\f[CW]%" 15
All lines, same as
.CW 1,$
.IP "\f[I]x\f[CW]-|+\f[I]n" 15
.I n
line before or after
.I x
.IP "\f[CW]-[\f[I]n\f[P]]" 15
One or
.I n
lines previous
.IP "\f[CW]+[\f[I]n\f[P]]" 15
One or
.I n
lines ahead
.IP "\f[CW]'\f[I]x" 15
Line marked with
.I x
.IP "\f[CW]''" 15
Previous context
.IP "\f(CW/\fIpat\fP/\fR or \f(CW?\fIpat\fP?" 15
Ahead or back to line matching
.I pat
.RE
.Bh "\f[CB]ex Commands"
.LP
.\" The list below need larger space between items.
.\" /Andreas 2002-10-21
.TS
tab(#), expand;
lfCW lw(4i).
abbrev#T{
.CW ab[\c
.I "string text"\c
.CW ]\&
.br
.R
Define
.I string
when typed to be translated into
.I text .
If
.I string
and
.I text
are not specified, list all current abbreviations.
T}
append#T{
.CW [\c
.I address\c
.CW ]a[!]
.br
.I text
.br
.CW .
.br
.R
Append
.I text
at specified
.I address ,
or at present address if none is specified.
With the
.CW !
flag, toggle the
.CW autoindent
setting during the input of
.I text .
T}
.page 581
args#T{
.CW ar
.br
.R
Print the members of the argument list,
with the current argument printed within brackets (\c
.CW "[ ]" ).
T}
change#T{
.CW [\c
.I address\c
.\fPCW ]c[!]
.br
.I text
.br
.CW .
.br
.R
Replace the specified lines with
.I text .
With the
.CW !
flag, toggle the
.CW autoindent
setting during the input of
.I text .
T}
copy#T{
.CW [\c
.I address\c
.CW ]co\c
.I destination
.br
.R
Copy the lines included in
.I address
to the specified
.I destination
address.
The command
.CW t
is a synonym for
.CW copy .
T}
delete#T{
.CW [\c
.I address\c
.CW ]d[\c
.I buffer\c
.CW ]
.br
.R
Delete the lines included in
.I address.
If
.I buffer
is specified, save or append the text to the named buffer.
T}
.\"-----------------------------------------------------------------------
edit#T{
.CW e[!][+\c
.I n\c
.CW ]\c
.I file
.br
.R
Begin editing on
.I file .
If the
.CW !
flag is used,
do not warn if the present file has not been saved since the last change.
If the +\c
.I n
argument is used, begin editing on line
.I n .
T}
.\"-----------------------------------------------------------------------
file#T{
.CW f[\c
.I filename\c
.CW ]
.br
.R
Change the name of the current file to
.I filename ,
which is considered \(lqnot edited.\(rq
If no
.I filename
is specified, print the current status of the file.
T}
.\"-----------------------------------------------------------------------
global#T{
.CW [\c
.I address\c
.CW ]g[!]/\c
.I pattern\c
.CW /[\c
.I commands\c
.CW ]
.br
.R
Execute
.I commands
on all lines that contain
.I pattern .
If
.I commands
are not specified, print all such lines.
If the
.CW !
flag is used, execute
.I commands
on all lines not containing
.I pattern .
T}
.\"-----------------------------------------------------------------------
insert#T{
.CW [\c
.I address\c
.CW ]i[!]
.br
.I text
.br
.CW .
.br
.R
Insert
.I text
at line before the specified
.I address ,
or at present address if none is specified.
With the
.CW !
flag, toggle the
.CW autoindent
setting during the input of
.I text .
T}
.\"-----------------------------------------------------------------------
join#T{
.CW [\c
.I address\c
.CW ]j[\c
.I count\c
.CW ]
.br
.R
Place the text in the specified range on one line,
with white space adjusted to provide two blank characters after a (.),
no blank characters if a ) follows,
and one blank character otherwise.
T}
.\"-----------------------------------------------------------------------
k#T{
.CW [\c
.I address\c
.CW ]k\c
.I char
.br
.R
Mark the given
.I address
with
.I char .
T}
.\"-----------------------------------------------------------------------
.page 582
list#T{
.CW [\c
.I address\c
.CW ]l[\c
.I count\c
.CW ]
.br
.R
Print the specified lines in an unambiguous manner.
T}
.\"-----------------------------------------------------------------------
map#T{
.CW map
.I char
.I commands
.br
.R
Define a macro named
.I char
in visual mode with the specified sequence of
.I commands .
.I char
may be a single character, or the sequence
.CW #\c
.I n ,
.R
representing a function key on the keyboard.
T}
.\"-----------------------------------------------------------------------
mark#T{
.CW [\c
.I address\c
.CW ]ma\c
.I char
.br
.R
Mark the specified line with
.I char ,
a single lowercase letter.
Return later to the line with
.CW 'x .
T}
.\"-----------------------------------------------------------------------
move#T{
.CW [\c
.I address\c
.CW ]m\c
.I destination
.br
.R
Move the lines specified by
.I address
to the
.I destination
address.
T}
.\"-----------------------------------------------------------------------
next#T{
.CW n[!][[+\c
.I command\c
.CW ]\c
.I filelist\c
.CW ]
.br
.R
Edit the next file in the command-line argument list.
Use
.CW args
for a listing of arguments.
If
.I filelist
is provided, replace the current argument list with
.I filelist
and begin editing on the first file;
if
.I command
is given (containing no spaces), execute
.I command
after editing the first such file.
T}
.\"-----------------------------------------------------------------------
number#T{
.CW [\c
.I address\c
.CW ]nu[\c
.I count\c
.CW ]
.br
.R
Print each line specified by
.I address
preceded by its buffer line number.
.CW #
may be used as an abbreviation for
.CW number
as well as
.CW nu .
T}
.\"-----------------------------------------------------------------------
open#T{
.CW [\c
.I address\c
.CW ]o[/
.I pattern\c
.CW /]
.br
.R
Enter
.CW open
mode at the lines specified by
.I address ,
or lines matching pattern.
Exit
.CW open
mode with
.CW Q .
T}
.\"-----------------------------------------------------------------------
preserve#T{
.CW pre
.br
.R
Save the current editor buffer as though the system had crashed.
T}
.\"-----------------------------------------------------------------------
print#T{
.CW [\c
.I address\c
.CW ]p[\c
.I count\c
.CW ]
.br
.R
Print the lines specified by
.I address
with nonprinting characters printed.
.CW P
may also be used as an abbreviation.
T}
.\"-----------------------------------------------------------------------
put#T{
.CW [\c
.I address\c
.CW ]pu[\c
.I char\c
.CW ]
.br
.R
Restore previously deleted or yanked lines
from named buffer specified by
.I char
to the line specified by
.I address ;
if
.I char
is not specified,
the last deleted or yanked text is restored.
T}
.\"-----------------------------------------------------------------------
quit#T{
.CW q[!]
.br
.R
Terminate current editing session.
If the file was not saved since the last change,
or if there are files in the argument list
that have not yet be accessed,
you will not be ab1e to quit without the
.CW !
flag.
T}
.\"-----------------------------------------------------------------------
.page 583
read#T{
.CW [\c
.I address\c
.CW ]r[!][\c
.I file\c
.CW ]
.br
.R
Copy the text of
.I file
at the specified
.I address .
If
.I file
is not specified, the current filename is used.
T}
.\"-----------------------------------------------------------------------
read#T{
.CW [\c
.I address\c
.CW "]r !"\c
.I command
.br
.R
Read in the output of
.I command
into the text after the line specified by
.I address .
T}
.\"-----------------------------------------------------------------------
recover#T{
.CW rec[
.I file\c
.CW ]
.br
.R
Recover
.I file
from system save area.
T}
.\"-----------------------------------------------------------------------
rewind#T{
.CW rew[!]
.br
.R
Rewind argument list and begin editing the first file in the list.
The
.CW !
flag rewinds without warning
if the file has not been saved since the last change.
T}
.\"-----------------------------------------------------------------------
set#T{
.CW se\ \c
.I "parameter parameter2 ..."
.br
.R
Set a value to an option with each
.I parameter ,
or if no
.I parameter
is supplied, print all options that have been changed from their defaults.
For Boolean-valued
options, each
.I parameter
can be phrased as
.I option
or
.CW no\c
\fIoption\fR;
other options can be assigned with the syntax,
.I option=value .
T}
.\"-----------------------------------------------------------------------
shell#T{
.CW sh
.br
.R
Create a new shell.
Resume editing when the shell is terminated.
T}
.\"-----------------------------------------------------------------------
source#T{
.CW so
.I file
.br
.R
Read and execute commands from
.I file .
T}
.\"-----------------------------------------------------------------------
substitute#T{
.CW [\c
.I address\c
.CW ]s[[/\c
.I pattern\c
.CW /\c
.I repl\c
.CW /]\c
.I options\c
.CW ][\c
.I count\c
.CW ]
.br
.R
Replace each instance of
.I pattern
on the specified lines with
.I repl .
If
.I pattern
and
.I repl
are omitted, repeat last substitution.
The following options are supported:
  \f[CW]g\fP   Substitute all instances of \fIpattern\fP
  \f[CW]c\fP   Prompt for confirmation before each change
T}
.\"-----------------------------------------------------------------------
t#T{
.CW [\c
.I address\c
.CW ]t\c
.I destination
.br
.R
Copy the lines included in
.I address
to the specified
.I destination
address.
T}
.\"-----------------------------------------------------------------------
ta#T{
.CW [\c
.I address\c
.CW ]ta
.I tag
.br
.R
Switch the focus of editing to
.I tag .
T}
.\"-----------------------------------------------------------------------
unabbreviate#T{
.CW una
.I word
.br
.R
Remove
.I word
from the list of abbreviations.
T}
.\"-----------------------------------------------------------------------
undo#T{
.CW u
.br
.R
Reverse the changes made by the last editing command.
T}
.\"-----------------------------------------------------------------------
.page 584
unmap#T{
.CW unm
.I char
.br
.R
Remove
.I char
.R
from the list of macros.
T}
.\"-----------------------------------------------------------------------
v#T{
.CW [\c
.I address\c
.CW ]v/\c
.I pattern\c
.CW /[\c
.I commands\c
.CW ]
.br
.R
Execute
.I commands
on all lines not containing
.I pattern .
If
.I commands
are not specified, print all such lines.
T}
.\"-----------------------------------------------------------------------
version#T{
.CW ve
.br
.R
Print the current version number of the editor and the date the editor
was last changed.
T}
.\"-----------------------------------------------------------------------
visual#T{
.CW [\c
.I address\c
.CW ]vi\ [\c
.I type\c
.CW ][\c
.I count\c
.CW ]
.br
.R
Enter
.CW visual
mode at the line specified by
.I address .
Exit with
.CW Q .
.I type
is either
.CW - ,
.CW ^ ,
or
.CW .
(see the
.CW z
command).
.I count
specifies an initial window size.
T}
.\"-----------------------------------------------------------------------
write#T{
.CW [\c
.I address\c
.CW ]w[!][[>>]\c
.I file\c
.CW ]
.br
.R
Write lines specified by
.I address
to
.I file ,
or full contents of buffer if
.I address
is not specified.
If
.I file
is also omitted, save the contents of the buffer to the current filename.
If
.CW >>\c
.I file
.R
is used, write contents to the end of the specified
.I file .
The
.CW !
flag forces the editor to write over any current contents of
.I file .
T}
.\"-----------------------------------------------------------------------
write#T{
.CW [\c
.I address\c
.CW "]w !"\c
.I command
.br
.R
Write lines specified by
.I address
to command through a pipe.
T}
.\"-----------------------------------------------------------------------
wq#T{
.CW wq[!]
.br
.R
Write and quit the file in one movement.
T}
.\"-----------------------------------------------------------------------
xit#T{
.CW x
.br
.R
Write file if changes have been made to the buffer since last write,
then quit.
T}
.\"-----------------------------------------------------------------------
yank#T{
.CW [\c
.I address\c
.CW ]ya[\c
.I char\c
.CW ][\c
.I count\c
.CW ]
.br
.R
Place lines specified by
.I address
in named buffer indicated by
.I char .
If no
.I char
is specified, place in general buffer.
T}
.\"-----------------------------------------------------------------------
z#T{
.CW [\c
.I address\c
.CW ]z[\c
.I type\c
.CW ][\c
.I count\c
.CW ]
.br
.R
Print a window of text with line specified by
.I address
at the top.
.I type
is as follows:
.RS
.IP "\f[CW]+"
\fPPlace specified line at the top of the window (default)
.IP "\f[CW]-"
\fPPlace specified line at bottom of the window
.IP "\f[CW]^"
\fPPrint the window before the window associated with type -
.IP "\f[CW]="
\fPPlace specified line in the center of the window and leave the
current line at this line
.RE
.LP
.I count
specifies the number of lines to be displayed.
T}
.\"-----------------------------------------------------------------------
.page 585
!#T{
.CW [\c
.I address\c
.CW ]!\c
.I command
.br
.R
Execute
.I command
in a shell.
If
.I address
is specified, apply the lines contained in
.I address
as standard input to
.I command ,
and replace the lines with the output.
T}
.\"-----------------------------------------------------------------------
\&=#T{
.CW [\c
.I address\c
.CW ]=\c
.br
.R
Print the line number of the line indicated by
.I address .
T}
.\"-----------------------------------------------------------------------
< >#T{
.CW [\c
.I address\c
.CW ]<[\c
.I count\c
.CW ]
.br
.R
or
.CW [\c
.I address\c
.CW ]>[\c
.I count\c
.CW ]
.br
.R
Shift lines specified by
.I address
in specified direction.
Only blanks and tabs are shifted in a left shift (\c
.CW < ).
T}
.\"-----------------------------------------------------------------------
\fIaddress#T{
.I address
.br
.R
Print the lines specified in
.I address .
T}
.\"-----------------------------------------------------------------------
\fIRETURN#T{
.I RETURN
.br
.R
Print the next line in the file.
T}
.\"-----------------------------------------------------------------------
&#T{
.CW [\c
.I address\c
.CW ]&[\c
.I options\c
.CW ][\c
.I count\c
.CW ]
.br
.R
Repeat the previous substitute command.
T}
.\"-----------------------------------------------------------------------
\(ti#T{
.CW [\c
.I address\c
.CW ]\(ti[\c
.I count\c
.CW ]
.br
.R
Replace the previous regular expression
with the previous replacement pattern from a
.CW substitute
command.
T}
.TE
.ix	%end [ex] editor, command summary %key ex editor, command summary

.Ah "The \f[CB]sed\fP Editor"
.ix	%begin [sed] editor %key sed editor
.ix	[sed] editor, invoking %key sed editor, invoking
.LP
.RS
\f(CWsed\fP [\fIoptions\fP]\fP file(s)
.RE
.LP
The following options are recognized:
.RS
.IP
.IP "\f[CW]-n" 10
Only print lines specified with the
.CW p
command, or the
.CW p
flag of the
.CW s
command
.IP "\f[CW]-e \f[I]cmd" 10
Next argument is an editing command
.IP "\f[CW]-f \f[I]file" 10
Next argument is a file containing editing commands
.RE
.LP
.ix	[sed] editor, command syntax %key sed editor, command syntax
All
.CW sed
commands have the general form:
.RS
[\fIaddress\fP][\f(CW,\fP\fIaddress\fP][\f(CW!\fP]\fIcommand
\fP[\fIarguments\fP]
.RE
.LP
The
.CW sed
editor copies each line of input into a pattern space.
.CW sed
instructions consist of addresses and editing commands.
If the address of the command matches the line in the pattern space,
then the command is applied to that line.
If a command has no address,
then it is applied to each input line.
It is important to note that a command affects the contents of the space;
subsequent command addresses
attempt to match the line in the pattern space,
not the original input line.
.page 586

.Bh "Pattern Addressing
.ix	[sed] editor, addressing %key sed editor, addressing
.LP
In a
.CW sed
command, an
.I address
can either be a line number or a
.I pattern ,
enclosed in slashes (\f(CW/\fIpattern\fP/\fR).
Address types cannot be mixed when specifying two addresses.
Patterns can make use of regular expressions,
as described at the beginning of this appendix.
Additionally,
.CW \en
can be used to match any newline in the pattern space
(resulting from the
.CW N
command),
but not the newline at the end of the pattern space.
If no pattern is specified,
.I command
will be applied to all lines.
If only one address is specified,
the command will be applied to all lines
between the first and second addresses, inclusively.
Some commands can only accept one address.
.PP
The
.CW !
operator following a pattern causes
.CW sed
to apply the command to all lines that do not contain the pattern.
.PP
A series of commands can be grouped after one pattern
by enclosing the command list in curly braces:
.DS
[\f[CW]/\fIpattern\fP/\fR][\f(CW,/\fIpattern\f[CW]/\fR]\f(CW{\fI
command1
command2
\f[CW]}
.DE
.Bh "Alphabetical List of Commands"
.ix	%begin [sed] editor, command summary %key sed editor, command summary
.\" Personally, I think that all the square brackets in the
.\" list below ([]) should be roman (\fR).  They are not to be
.\" entered by the user but denotes optional elements.  The
.\" use of font-changing requests (instead of escapes) makes
.\" changing them a pain, so I haven't done that.
.\" /Andreas 2002-10-22
.LP
.TS
tab(#), expand;
lfCW lw(5.3i).
:#T{
\f(CW:\fIlabel
.br
.R
Specify a label to be branched to by
.CW b
or
.CW t .
.I label
may contain up
to eight characters.
T}
.\" -----------------------------------------------------------------------
\&=#T{
.CW [/\c
.I pattern\c
.CW /]=
.br
.R
Write to standard output the line number of each line addressed by
.I pattern.
T}
.\" -----------------------------------------------------------------------
a#T{
.CW [\c
.I address\c
.CW ]a\e\c
.br
.I text
.br
.R
Append
.I text
following each line matched by
.I address .
If
.I text
goes over more than one line, newlines must be \(lqhidden\(rq
by preceding them with a backslash.
The insertion will be terminated by the first newline
that is not hidden in this way.
The results of this command
are read into the pattern space
(creating a multiline pattern space)
and sent to standard output when the list of editing is finished
or a command explicitly prints the pattern space.
T}
.\" -----------------------------------------------------------------------
b#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW ]b[\c
.I label\c
.CW ]
.br
.R
Branch to
.I label
placed with
.CW :
command.
If no
.I label ,
branch to the end of the script.
That is, skip all subsequent editing commands
(up to
.I label )
for each addressed line.
T}
.\" -----------------------------------------------------------------------
.page 587
c#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW ]c\e
.br
.I text
.br
.R
Replace pattern space with
.I text .
(See
.CW a
for details on
.I text .)
T}
.\" -----------------------------------------------------------------------
d#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW ]d
.br
.R
Delete line in pattern space.
Thus, line is not passed to standard output
and a new line of input is read;
editing resumes with first command in list.
T}
.\"_ -----------------------------------------------------------------------
D#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW ]D
.br
.R
Delete first part (up to embedded newline)
of multiline pattern created by
.CW N
command and begin editing.
Same as
.CW d
if
.CW N
has not been applied to a line.
T}
.\" -----------------------------------------------------------------------
g#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW ]g
.br
.R
Copy contents of hold space (see
.CW h
or
.CW H
command) into pattern space, wiping out previous contents.
T}
.\" -----------------------------------------------------------------------
G#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW ]G
.br
.R
Append contents of hold space (see
.CW h
or
.CW H
command) to contents of the pattern space.
T}
.\" -----------------------------------------------------------------------
h#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW ]h
.br
.R
Copy pattern space into hold space, a special buffer.
Previous contents of hold space are obliterated.
T}
.\" -----------------------------------------------------------------------
H#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW ]H
.br
.R
Append pattern space to contents of the hold space.
Previous and new contents are separated by a newline.
T}
.\" -----------------------------------------------------------------------
i#T{
.CW [\c
.I address\c
.CW ]i\e
.br
.I text
.br
.R
Insert
.I text
before each line matched by
.I address .
(See
.CW a
for details on
.I text .)
T}
.\" -----------------------------------------------------------------------
n#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW ]n
.br
.R
Read next line of input into pattern space.
Current line is output but control passes to next editing command
instead of beginning at the top of the list.
T}
.\" -----------------------------------------------------------------------
N#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW ]N
.br
.R
Append next input line to contents of pattern space;
the two lines are separated by an embedded newline.
(This command is designed to allow pattern matches across two lines.)
T}
.\" -----------------------------------------------------------------------
p#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW ]p
.br
.R
Print the addressed line(s).
Unless the
.CW -n
command-line option is used,
this command will cause duplication of the line in the output.
Also used when commands change flow control
(\c
.CW d ,
.CW N ,
.CW b ).
T}
.\" -----------------------------------------------------------------------
.page 588
P#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW ]P
.br
.R
Print first part
(up to embedded newline) of multiline pattern
created by
.CW N
command.
Same as
.CW p
if
.CW N
has not been applied to a line.
T}
.\" -----------------------------------------------------------------------
q#T{
.CW [\c
.I address\c
.CW ]q
.br
.R
Quit when
.I address
is encountered.
The addressed line is first written to output,
along with any text appended to it by previous
.CW a
or
.CW r
commands.
T}
.\" -----------------------------------------------------------------------
r#T{
.CW [\c
.I address\c
.CW "]r "
.I file
.br
.R
Read contents of
.I file
and append after the contents of the pattern space.
Exactly one space must separate the
.CW r
and the filename.
T}
.\" -----------------------------------------------------------------------
s#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW ]s/\c
.I pattern\c
.CW /\c
.I replacement\c
.CW /[\c
.I flags\c
.CW ]
.br
.R
Substitute
.I replacement
for
.I pattern
on each addressed line.
If pattern addresses are used,
the pattern
.CW //
represents the last pattern address specified.
The following flags can be specified:
.\" set line length to column width
.nr xyz \n[LL]
.nr LL \n[.l]
.RS
.IP "\f[CW]g" 6
Replace all instances of
.I /pattern/
on each addressed line, not just the first instance.
.br
.IP "\f[CW]p" 6
Print the line if a successful substitution is done.
.br
If several successful substitutions are done,
multiple copies of the line will be printed.
.br
.IP "\f[CW]w\fIfile" 6
Write the line to a
.I file
if a replacement was done.
A maximum of ten different
files
can be opened.
.\" restore line length
.nr LL \n[xyz]
.RE
T}
.\" -----------------------------------------------------------------------
t#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW "]t ["\c
.I label\c
.CW ]
.br
.R
Test if successful substitutions have been made on addressed lines,
and if so, branch to
.I label .
(See
.CW b
and
.CW : .)
If label is not specified,
drop to bottom of list of editing commands.
T}
.\" -----------------------------------------------------------------------
w#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW "]w "
.I file
.br
.R
Write contents of pattern space to
.I file .
This action occurs when the command is encountered
rather than when the pattern space is output.
Exactly one space must separate the
.CW w
and the filename.
A maximum of ten different files can be opened.
T}
.\" -----------------------------------------------------------------------
x#T{
.CW [\c
.I address1\c
.CW ][,\c
.I address2\c
.CW ]x
.br
.R
Exchange contents of the pattern space with the contents of the hold space.
T}
.TE
.ix	%end [sed] editor %key sed editor
.ix	%end [sed] editor, command summary %key sed editor, command summary
.LP
.Ah awk
.ix	[awk], command summary %key awk, command summary
.LP
An
.CW awk
program consists of patterns and procedures:
.RS
.LP
.I pattern
.CW {
.I procedure
.CW }
.RE
.page 589
.LP
Both are optional.
If
.I pattern
is missing,
.CW {\fIprocedure\fP}
will be applied to all lines.
If
.CW {\fIprocedure\fP}
is missing, the line will be passed unaffected to standard output
(i.e., it will be printed as is).
.PP
Each input line, or record,
is divided into fields by white space (blanks or tabs)
or by some other user-definable record separator.
Fields are referred to by the variables
.CW $1 ,
.CW $2 ,...,
.CW $\fIn .
.CW $0
refers to the entire record.

.Bh "Patterns"
.ix	[awk], pattern~matching %key awk, pattern matching
.LP
Patterns can be specified using regular expressions
as described at the beginning of this appendix.
.RS
.LP
.I pattern
.CW {\fIprocedure\fP}
.br
.R
The following additional pattern rules can be used in
.CW awk :
.IP \(bu
The special pattern
.CW BEGIN
allows you to specify procedures
that will take place before the first input line is processed.
(Generally, you set global variables here.)
.IP \(bu
Interrupt place after the last input line is processed.
.\" The preceding doesn't make sense as it stands...
.\" should it be describing the END pattern?? --LK
.IP \(bu
.CW ^
and
.CW $
can be used to refer to the beginning and end of a field, respectively,
rather than the beginning and end of a line.
.IP \(bu
A pattern can be a relational expression
using any of the operators
.CW < ,
.CW <= ,
.CW == ,
.CW != ,
.CW >= ,
and
.CW > .
For example,
.CW "$2 > $1"
selects lines for which the
second field is greater than the first.
Comparisons can be either string or numeric.
.IP \(bu
Patterns can be combined with the Boolean operators
.CW ||
(or),
.CW &&
(and), and
.CW !
(not).
.IP \(bu
Patterns can include any of the following predefined variables.
For example,
.CW "NF > 1"
selects records with more than one field.
.RE

.Bh "Special Variables"
.ix	[awk], system variables %key awk, system variables
.LP
.RS
.TS
expand;
lfCW lw(4i).
FS	Field separator (blank and tab by default)
RS	Record separator (newline by default)
OFS	Output field separator (blank by default)
ORS	Output record separator (newline by default)
NR	Number of current record
NF	Number of fields in current record
$0	Entire input record
.page 590
$1, $2,..., $\fIn\fP	T{
First, second, ...\c
.I n th
field in current record,
where fields are separated by
.CW FS
T}
.TE
.RE

.Bh Procedures
.ix	[awk], syntax~of procedures %key awk, syntax of procedures
.LP
Procedures consist of one or more commands, functions, or variable assignments,
separated by newlines or semicolons, and contained within curly braces.
Commands fall into four groups:
.IP \(bu
variable or array assignments
.IP \(bu
printing commands
.IP \(bu
built-in functions
.IP \(bu
control flow commands
.LP
.Bh "Variables and Array Assignments"
.ix	[awk], variables %key awk, variables
.LP
Variables can be assigned a value with an
.CW =
sign. For example:
.Ps
FS = ``,''
.Pe
Expressions using the operators
.CW + ,
.CW - ,
.CW / ,
and
.CW %
(modulo) can be assigned to variables.
.PP
.ix	[awk], arrays %key awk, arrays
Arrays can be created with the
.CW split
function (see following
.CW awk
commands)
or can be simply named in an assignment statement.
.CW ++ ,
.CW += ,
and
.CW -=
are used to increment or decrement an array,
as in the C language.
Array elements can be subscripted with numbers
(\fIarray\fP[1], ..., \fParray\fP[\fPn\fP])
or with names.
.\" The sentence below is in parenthesis in the paper copy, but
.\" lacks the right ). I decided to remove the left ( at well.
.\" /Andreas 2002-10-22
For example, to count
the number of occurrences of a pattern, you could use the following program:
.Ps
\f[CW]/\fIpattern\fP/ {\fIn\fP["/\fIpattern\fP/"]++}
END {print \fIn\fP["/\fIpattern\fP/"]}
.Pe

.Bh "\f[CB]awk\fP Commands"
.ix	%begin [awk], command summary %key awk, command summary
.LP
.\"===================
.TS
tab(#), expand;
lfCW lw(5i).
for#T{
.CW "for(\fIi=lower\fP; \fIi\fP<=\fIupper\fP; \fIi\fP++\fP)
.br
.I "        command"
.br
.R
While the value of variable
.I i
is in the range between
.I lower
and
.I upper ,
do
.I command .
A series of commands must be put within braces.
.CW <=
or any relational operator can be used;
.CW ++
or
.CW --
can be used to decrement variable.
T}
.\" -----------------------------------------------------------------------
for#T{
.CW "for \fIi\fP in \fIarray\fP"
.br
.I "        command"
.br
.R
For each occurrence of variable
.I i
in
.I array ,
do
.I command .
A series of
commands must be put inside braces.
T}
.\" -----------------------------------------------------------------------
if#T{
.CW "if(\fIcondition\fP)"
.br
.I "        command"
.br
.CW else ] [
.br
.I "        \fR[\fPcommand\fR]\fP"
.br
.br
.br
If
.I condition
is true, do
.I command(s) ,
otherwise do
.I command
in
.CW else
clause.
.I condition
can be an expression using any of the relational operators
.CW < ,
.CW <= ,
.CW == ,
.CW != ,
.CW >=
or
.CW > ,
as well as the
pattern-matching operator
.CW \(ti
(e.g.,
.CW "if $1 \(ti /[Aa].*/" ).
A series of commands must be put within braces.
T}
length#T{
.CW "x = length(\fIarg\fP)"
.br
.R
Return the length of
.I arg .
If
.I arg
is not supplied,
.CW $0
is assumed.
T}
.\" -----------------------------------------------------------------------
log#T{
.\" The paper copy doesn't have spaces around '=' below.  I
.\" prefer to have spaces.  /Andreas 2002-10-22
.CW "x = log(\fIarg\fP)"
.br
.R
Return logarithm of
.I arg .
T}
.\" -----------------------------------------------------------------------
print#T{
.CW print [\fIargs\fP]
.br
.R
Print
.I args
on output.
.I args
is usually one or more fields,
but may also be one or more of the predefined variables.
Literal strings must be surrounded by quotation marks.
Fields are printed in the order they are listed.
If separated by commas in the argument list,
they are separated in the output by the character specified by
.CW OFS .
If separated by spaces,
they are concatenated in the output.
T}
.\" -----------------------------------------------------------------------
printf#T{
.\" I believe that the paper copy is wrong on the line
.\" below.  It says "format,"expression(s) instead of
.\" "format",expression(s).  The version that I believe is
.\" correct is presented below.  /Andreas 2002-10-22
\f[CW]printf "\fIformat\fP",\fIexpression(s)\fP
.br
.R
Formatted print statement.
Fields or variables can be formatted
according to instructions in the
.I format
argument.
The number of arguments must correspond
to the number specified in the format sections.
.sp
.I Format
follows the conventions of the C language's
.CW printf
statement.
Here are a few of the most common formats:
.br
.nr xyz \n[LL]
.nr LL \n[.l]
.RS
.IP \f[CW]%\fIn.m\fPd 9
a floating point number;
.br
.I n
\&= total number of digits.
.br
.I m
\&= number of digits after decimal point.
.IP \f[CW]%[-]\fInc\fP 9
.I n
specifies minimum field length for format type c.
.CW -
justifies value in field;
otherwise value is right justified.
.RE
.LP
.I Format
can also contain embedded escape sequences:
.CW \en
(newline) or
.CW \et
(tab) are the most common.
.LP
Spaces and literal text can be placed in the
.I format
argument by surrounding the entire argument with quotation marks.
If there are multiple expressions to be printed,
you should specify multiple formats.
An example is worth a thousand words.
For an input file containing only the line:
.br
.\" The fives below are typeset in roman font in the printed
.\" UTP, and the text below it, up to the description of the
.\" split command is shifted to the left by one tab stop.  Also,
.\" the double quotes in the format of the printf statement are
.\" ``'' instead of "".  I think what's done here is better.
.\" /Andreas 2002-10-2
.CW "5  5"
.br
.R
The program:
.RS
.nf
\f[CW]{printf ("The sum of line %s is %d \en", NR, $1+$2)}
.RE
.R
will produce:
.br
.CW "     The sum of line 1 is 10"
.br
.R
followed by a newline.
.\" restore line length
.nr LL \n[xyz]
T}
.\" -----------------------------------------------------------------------
split#T{
.CW "x = split(\fIstring\fP, \fIarray\fP[, \fIsep\fP])"
.br
.R
Split
.I string
into elements of array
.CW "array[1],..., array[\fIn\fP]" .
.I string
is split at each occurrence of separator
.I sep .
If
.I sep
is not specified,
.CW FS
is used.
The number of array elements created is returned.
T}
.\" -----------------------------------------------------------------------
sprintf#T{
.\" I added (s) after expression.  I'm not sure why the book
.\" doesn't use the same format for sprintf as for printf.
.\" /Andreas 2002-10-22
\f[CW]x = sprintf("\fIformat\fP", \fIexpression(s)\fP)
.br
.R
Return the value of
.I expression(s) ,
using the specified
.I format
(see
.CW printf ).
T}
.\" -----------------------------------------------------------------------
sqrt#T{
.CW "x = sqrt(\fIarg\fP)"
.br
.R
Return square root of
.I arg .
T}
.\" -----------------------------------------------------------------------
substr#T{
.CW "x = substr(\fIstring\fP, \fIm\fP, [\fIn\fP])"
.br
.R
Return substring of
.I string
beginning at character position
.I m
and consisting of the next
.I n
characters.
If
.I n
is omitted, include all characters to the end of
.I string .
T}
.\" -----------------------------------------------------------------------
while#T{
.CW "while (\fIcondition\fP)
.br
.I "        command"
.br
Do
.I command
while
.I condition
is true (see
.CW if
for a description of allowable conditions).
A series of commands must be put within braces.
T}
.TE
.ix	%end [awk], command summary %key awk, command summary
