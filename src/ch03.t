
.ig
	ch03.t
	Typed by: Heinz-J�rgen Oertel
	Marked up by: Heinz-J�rgen Oertel
	Proofed on: 3 Oct 2002
..
.so utp.mac
.utp
.chapter 3 "Learning  \f[CB]vi\fP" "Chapter" 1
.ix %begin [vi] editor %key vi editor
.LP
UNIX has a number of editors that can process the contents of readable files,
whether those files contain data, source code, or text.
There are line editors,
such as
.CW ed
and
.CW ex ,
which display a line of the file on the screen,
and there are screen editors,
such as
.CW vi
and
.CW emacs ,
.ix [emacs] editor %key emacs editor
which display a part of the file on your terminal screen.
.PP
The most useful standard text editor on your system is
.CW vi .
Unlike
.CW emacs,
it is available in nearly identical form
on almost every UNIX system,
thus providing a kind of text editing
.I "lingua franca" .
The same might be said of
.CW ed
and
.CW ex ,
but screen editors are generally much easier to use.
With a screen editor you can scroll the page,
move the cursor, delete lines, insert characters, and more,
while seeing the results of your edits as you make them.
Screen editors are very popular
because they allow you to make changes as you read a file,
much as you would edit a printed copy,
only faster.
.PP
To many beginners,
.CW vi
looks unintuitive and cumbersome\c
\(em\&instead of letting you type normally
and use special control keys for word-processing functions,
it uses all of the regular keyboard keys for issuing commands.
You must be in a special
.I "insert mode
.ix [vi] editor, insert mode %key vi editor, insert mode
before you can type.
In addition, there seem to be
.I "so many
commands.
.PP
You can't learn
.CW vi
by memorizing every single
.CW vi
command.
Begin by learning some basic commands.
As you do, be aware of the patterns of usage
that commands have in common.
Be on the lookout for new ways to perform tasks,
experimenting with new commands and combinations of commands.
.PP
As you become more familiar with
.CW vi ,
you will find that you need fewer keystrokes
to tell
.CW vi
what to do.
You will learn shortcuts that transfer more and more
of the editing work to the computer\c
\(em\&where it belongs.
Not as much memorization is required
as first appears from a list of
.CW vi
commands.
Like any skill,
the more editing you do, the more you know about it
and the more you can accomplish.
.PP
This chapter has three sections,
and each one corresponds to a set of material about
.CW vi
that you should be able to tackle in a single session.
After you have finished each session,
put aside the book for a while and do some experimenting.
When you feel comfortable with what you have learned,
continue to the next session.
.Ah "Session 1: Basic Commands
.LP
The first session contains the basic knowledge
you need to operate the
.CW vi
editor.
After a general description of
.CW vi ,
you are shown some simple operations.
You will learn how to
.RS
.Ls B
.Li
open and close a file;
.Li
give commands and insert text;
.Li
move the cursor;
.Li
edit text (change, delete, and copy).
.Le
.RE
You can use
.CW vi
to edit any file
that contains readable text,
whether it is a report,
a series of shell commands,
or a program.
The
.CW vi
editor
copies the file to be edited into a buffer
(an area temporarily set aside in memory),
displays as much of the buffer as possible on the screen,
and lets you add, delete, and move text.
When you save your edits,
.CW vi
copies the buffer into a permanent file,
overwriting the contents of
the old file.
.Ah "Opening a File
.ix %begin [vi] editor, opening~a file %key vi editor, opening a file
.LP
The syntax for the
.CW vi
command is:
.Ps
vi [\fIfilename\fP]
.Pe
where
.I filename
is the name of either
an existing file or a new file.
If you don't specify a filename,
.CW vi
will open an unnamed buffer,
and ask you to name it before you can save any edits you have made.
Press
.I RETURN
to execute the command.
.PP
A filename must be unique inside its directory.
.ix files, naming restrictions
On AT&T (System V) UNIX systems,
it cannot exceed 14 characters.
(Berkeley UNIX systems allow longer filenames).
A filename can include any ASCII character
except /,
which is reserved as the separator
between files and directories in a pathname.
You can even include spaces in a filename
by \(lqescaping\(rq them with a backslash.
In practice, though,
filenames consist of any combination of uppercase and lowercase letters,
numbers, and the characters
.CW \.
(dot) and
.CW _
(underscore).
Remember that UNIX is case-sensitive:
lowercase filenames are distinct from uppercase
filenames, and, by convention, lowercase is preferred.
.PP
If you want to open a new file called
.CW notes
in the current directory,
enter:
.Ps
$ \f[CB]vi notes\fP
.Pe
The
.CW vi
command clears the screen
and displays a new buffer for you to begin work.
Because
.CW notes
is a new file,
the screen displays a column of
.I tildes
(\c
.CW \(ap )
to indicate that there is no text in the file,
not even blank lines.
.ix %end [vi] editor, opening~a file %key vi editor, opening a file
.SS
.nf
.ft CW
\(ap
\(ap
\(ap
\(ap
\(ap
\(ap
\(ap
\(ap
\(ap
\(ap
\(ap
\(ap
"notes" [New file].
.ft P
.SE
.sp 1.2v
.LP 0
If you specify the name of a file that already exists,
its contents will be displayed on the screen.
For example:
.Ps
$ \f[CB]vi letter\fP
.Pe
might bring a copy of the existing file
.CW letter
to the screen.
.SS
.nf
.ft CW
Mr. John Fust
Vice President, Research and Development
Gutenberg Galaxy Software
Waltham, Massachusetts 02159

Dear Mr. Fust.

In our conversation last Thursday, we discussed a
documentation project that would produce a user's manual
on the Alcuin product.  Yesterday, I received the product
demo and other materials that you sent me.
\(ap
\(ap
\(ap
\(ap
"letter" 11 lines, 250 characters
.ft P
.SE
.sp 1.2v
.LP 0
The prompt line at the bottom of the screen
echoes the name and size of the file.
.ix [vi] editor, prompt line %key vi editor, prompt line
.ix [TERM] variable %key TERM variable
.ix [ex] editor, [:] prompt %key ex editor, [:] prompt
.ix [vi] editor, errors~when~opening %key vi editor, errors when~opening
.ix [vi] editor, quitting %key vi editor, quitting
.ix terminal type
.PP
Sometimes when you invoke
.CW vi ,
you may get either of the following messages:
.Ps
[using open mode]
.Pe
or:
.Ps
Visual needs addressable cursor or upline capability
.Pe
In both cases,
there is a problem identifying the type of terminal you are using.
You can quit the editing session immediately by typing
.CW :q .
.PP
Although
.CW vi
can run on almost any terminal,
it must know what kind of terminal you are using.
The terminal type is usually set as part of the UNIX login sequence.
If you are not sure whether your terminal type is defined correctly,
ask your system administrator
or an experienced user
to help you set up your terminal.
If you know your terminal type (\c
.CW wy50
for instance),
you can set your
.CW TERM
environment variable with the following command:
.Ps
TERM=wy50; export TERM
.Pe
.Bh "\f(CBvi\fP Commands
.LP
The
.CW vi
editor has two
.I modes :
command mode and insert mode.
.ix [vi] editor, command mode %key vi editor, command mode
Unlike many word
processors,
.CW vi 's
command mode is the initial or
.I default
mode.
To insert lines of text,
.ix [vi] editor, insert mode %key vi editor, insert mode
.ix [vi] editor, inserting text %key vi editor, inserting text
you must give a command to enter insert mode and then type away.
.PP
Most commands consist of one or two characters.
For example:
.RS
\f(CWi\fP         insert
.br
\f(CWc\fP         change
.RE
.PP
Using letters as commands, you can edit a file quickly.
You don't have to
memorize banks of function keys
or stretch your fingers to reach awkward combinations
of keys.
.PP
In general,
.ix [vi] editor, command~syntax %key vi editor, command syntax
.CW vi
commands
.RS
.Ls B
.Li
are case-sensitive
(uppercase and lowercase keystrokes mean different things;
e.g.,
.I I
is different from
.I i );
.Li
are not echoed on the screen;
.Li
do not require a
.I RETURN
after the command.
.Le
.RE
.PP
There is also a special group of commands
that echo on the bottom line of the screen.
Bottom-line commands are indicated by special symbols.
The slash (\c
.CW / )
and the question mark (\c
.CW ? )
begin search commands,
which are discussed in session 2.
A colon (\c
.CW : )
indicates an
.CW ex
.ix [ex] editor, executing~from [vi] %key ex editor, executing from [vi]
command.
You are introduced to one
.CW ex
command
(to quit a file without saving edits)
in this chapter,
and the
.CW ex
line editor is discussed in detail in Chapter 7.
.PP
To tell
.CW vi
that you want to begin insert mode,
press
.CW i .
Nothing appears on the screen,
but you can now type any text at the cursor.
To tell
.CW vi
.ix [vi] editor, leaving insert~mode %key vi editor, leaving insert mode
to stop inserting text,
press
.I ESC
and you will return to command mode.
.PP
For example, suppose that you want to insert the word
.I introduction .
If you type
the keystrokes
.CW iintroduction ,
what appears on the screen is
.Ps
introduction
.Pe
Because you are starting out in command mode,
.CW vi
interprets the first keystroke (\f(CWi\fP)
as the insert command.
All keystrokes after that result in characters placed in the file,
until you press
.I ESC .
If you need to correct a mistake while in insert mode,
backspace and type over the error.
.PP
While you are inserting text,
press
.I RETURN
to break the lines before the right margin.
An autowrap option provides a carriage return automatically
after you exceed the right margin.
To move the right margin in ten spaces,
for example, enter
.ix [vi] editor, wrapmargin %key vi editor, wrapmargin
.CW ":set wm=10" .
.PP
Sometimes you may not know if you are in insert mode or command mode.
Whenever
.CW vi
does not respond as you expect, press
.I ESC .
When you hear a beep, you are in command mode.
.Bh "Saving a File
.ix [vi] editor, saving~a file %key vi editor, saving a file
.LP
You can quit working on a file at any time,
save the edits,
and return to the UNIX prompt.
The
.CW vi
command to quit and save edits is
.CW ZZ .
(Note that
.CW ZZ
is capitalized).
.PP
Let's assume that you create a file called
.CW letter
to practice
.CW vi
commands
and that you type in 36 lines of text.
To save the file,
first check that you are in command mode by pressing
.I ESC ,
and then give the write and save command,
.CW ZZ .
Your file is saved as a regular file.
The result is:
.Ps
"letter"  [New file]  36 lines,  1331 characters
.Pe
You return to the UNIX prompt.
If you check the list of files in the directory,
by typing
.CW ls
at the prompt,
the new file is listed.
.Ps
$ \f[CB]ls\fP
ch01  ch02  letter
.Pe
You now know enough to create a new file.
As an exercise,
create a file called
.CW letter
and insert the text shown in Figure 3-1.
When you have finished,
type
.CW ZZ
to save the file and return to the UNIX prompt.
.Ah "Moving the Cursor
.ix [vi] editor, cursor~movement %key vi editor, cursor movement
.ix cursor movement
.LP
Only a small percentage of time in an editing session
may be spent adding new text in insert mode.
Much of the time,
you will be editing existing text.
.PP
In command mode,
you can position the cursor anywhere in the file.
You start all basic edits
(changing, deleting, and copying text)
by placing the cursor at the text
that you want to change.
Thus, you want to be able to quickly move the cursor to that
place.
.Fs
.Ps
                                         April 1, 1987

Mr. John Fust
Vice President, Research and Development
Gutenberg Galaxy Software
Waltham, Massachusetts 02159

Dear Mr. Fust:

In our conversation last Thursday, we discussed a
documentation project that would produce a user's
manual on the Alcuin product.  Yesterday, I received
the product demo and other materials that you sent me.

Going through a demo session gave me a much better
understanding of the product.  I confess to being
amazed by Alcuin.  Some people around here, looking
over my shoulder, were also astounded by the
illustrated manuscript I produced with Alcuin.  One
person, a student of calligraphy, was really impressed.

Today, I'll start putting together a written plan
that shows different strategies for documenting
the Alcuin product.  After I submit this plan, and
you have had time to review it, let's arrange a
meeting at your company to discuss these strategies.

Thanks again for giving us the opportunity to bid on
this documentation project.  I hope we can decide upon
a strategy and get started as soon as possible in order
to have the manual ready in time for the first customer
shipment.  I look forward to meeting with you towards
the end of next week.
                                        Sincerely,


                                        Fred Caslon

.Pe
.Fe "A sample letter entered with \f[CB]vi\fP"
.ix [vi] editor, cursor~movement %key vi editor, cursor movement
.PP
There are
.CW vi
commands to move
.RS
.Ls B
.Li
up, down, left, or right, one
.I character
at a time;
.Li
forward or backward by
.I "blocks of text"
such as words, sentences, or paragraphs;
.Li
forward or backward through a file, one
.I screen
at a time.
.Le
.RE
To move the cursor, make sure you are in command mode by pressing
.I ESC .
Give the command for moving forward or backward in the file
from the current cursor position.
When you have gone as far in one direction as possible,
you'll hear a beep and the cursor stops.
You cannot move the cursor past the tildes (\c
.CW \(ap )
at the end of the file.
.Bh "Single Movements
.ix [vi] editor, moving cursor~by~single~lines %key vi editor, moving cursor by~single~lines
The keys
.CW h ,
.CW j ,
.CW k ,
and
.CW l ,
right under your fingertips, will move the cursor:
.ix [vi] editor, moving cursor~by~spaces %key vi editor, moving cursor by~spaces
.RS
\f(CWh\fP         left one space
.br
\f(CWj\fP         down one line
.br
\f(CWk\fP         up one line
.br
\f(CWl\fP         right one space
.RE
You
.I could
use the cursor arrow keys
(\(ua, \(da, \(->, \(<-)
or the
.I RETURN
and
.I BACKSPACE
keys,
but they are out of the way and are not supported on all terminals.
.PP
You can also combine the
.CW h ,
.CW j ,
.CW k ,
and
.CW l
keys with numeric arguments and
other
.CW vi
commands.
.Bh "Numeric Arguments
.ix [vi] editor, numeric arguments~to commands %key vi editor, numeric arguments to commands
.LP 0
You can precede movement commands with numbers.
The command
.CW 4l
moves the cursor
(shown as a small box around a letter)
four spaces to the right,
just like typing the letter
.CW l
four times (\c
.CW llll ).
.sp .7v
.ne 8
.X1
\zI_n our conversation





.X2
.CW 4l
move right
4 characters
.X3
In o\zu_r conversation





.X4
.sp 1v
.LP 0
This one concept
(being able to multiply commands)
gives you more options
(and power)
for each command.
Keep it in mind as you are introduced to additional commands.
.Bh "Movement by Lines
.ix [vi] editor, screen~lines~vs.~logical~lines %key vi editor, screen lines~vs.~logical~lines
.LP 0
When you saved the file
.CW letter,
the editor displayed a message
telling you how many lines were in that file.
A
.I line
in the file is not necessarily the same length as a
physical line
(limited to 80 characters)
that appears on the screen.
A line is any text
entered between carriage returns.
If you type 200 characters before pressing
.I RETURN ,
.CW vi
regards all 200 characters as a single line
(even though those 200 characters
look like several physical lines on the screen).
.PP
Two useful commands in line movement are:
.RS
\f(CW0\fP <zero>		move to beginning of line
.br
\f(CW$\fP			move to end of line
.RE
In the following file,
the line numbers are shown.
To get line numbers on your screen,
enter
.CW ":set nu" .
.ix [vi] editor, displaying line~numbers %key vi editor, displaying line numbers
.Ps
1  With the screen editor you can scroll the page,
2  move the cursor, \z_delete lines, and insert characters,
   while seeing the results of edits as you make them.
3  Screen editors are very popular.
.Pe
The number of logical lines (3)
does not correspond to the number of physical lines (4)
that you see on the screen.
If you enter
.CW $ ,
with the cursor positioned on the
.I d
in the word
.I delete ,
the cursor would move to the period following the word
.I them .
.Ps
1  With the screen editor you can scroll the page,
2  move the cursor, delete lines, and insert characters,
   while seeing the results of edits as you make them\z_.
3  Screen editors are very popular .
.Pe
.ig
	NOTE:
	The original pdf file had the next sentence written as
	"If you enter 0 (zero) the cursor would move back to the
	letter t in the word the, at the beginning of the line."
	This is an obvious error in the original, as the
	sentence as written does not match any of the sentences
	given in the example lines.  Therefore, I have changed
	it to match what should occur based on the actual
	sentences in the example and what had taken place with
	the above movement.

	2 Oct 2002
	Michael Hobgood
..
If you enter
.CW 0
(zero),
the cursor would move back to the letter
.I m
in the word
.I move ,
at the beginning of the line.
.Ps
1  With the screen editor you can scroll the page,
2  \z_move the cursor, delete lines, and insert characters,
   while seeing the results of edits as you make them.
3  Screen editors are very popular .
.Pe
.PP
If you do not use the automatic wraparound option (\c
.CW ":set wm=10" )
in
.CW vi ,
you must break lines with carriage returns
to keep the lines of manageable length.
.Bh "Movement by Text Blocks
.ix [vi] editor, moving cursor~by~text~blocks %key vi editor, moving cursor by~text~blocks
.LP 0
You can also move the cursor by blocks of text
(words, sentences, or paragraphs).
.PP
The command
.CW w
moves the cursor forward one word at a time,
treating symbols
and punctuation marks as equivalent to words.
The following line shows cursor movement caused by ten successive
.CW w
commands:
.Ps
\zm_ove \zt_he \zc_ursor\z,_  \zd_elete \zl_ines\z,_ \za_nd \zi_nsert \zc_haracters\z,_
.Pe
You can also move forward one word at a time,
ignoring symbols and punctuation
marks,
using the command
.CW W
(note the uppercase
.I W ).
It causes the cursor to move to the first character
following a blank space.
Cursor movement using
.CW W
looks like this:
.Ps
\zm_ove \zt_he \zc_ursor,  \zd_elete \zl_ines, \za_nd \zi_nsert \zc_haracters,
.Pe
To move backward one word at a time,
use the command
.CW b .
The
.CW B
command allows you
to move backward one word at a time, ignoring punctuation.
.PP
With either the
.CW w ,
.CW W ,
.CW b ,
or
.CW B
commands,
you can multiply the movement with numbers.
For example,
.CW 2w
moves forward two words;
.CW 5B
moves back five words,
ignoring punctuation.
Practice using the cursor movement commands,
combining them with numeric multipliers.
.ix %begin [vi] editor, deleting single characters %key vi editor, deleting single characters
.Ah "Simple Edits
.ix [vi] editor, deleting text %key vi editor, deleting text
.ix [vi] editor, inserting text %key vi editor, inserting text
.ix [vi] editor, moving text %key vi editor, moving text
.LP 0
When you enter text in your file,
it is rarely perfect.
You find errors or want to improve a phrase.
After you enter text,
you have to be able to change it.
.PP
What are the components of editing?
You want to
.I insert
text
(a forgotten word or a missing sentence).
And you want to
.I delete
text
(a stray character or an entire paragraph).
You also need to
.I change
letters and words
(correct misspellings or reflect a change of mind).
You want to
.I move
text from one place to another part of your file.
And on occasion,
you want to
.I copy
text to duplicate it in another part of your file.
.PP
There are four basic edit commands:
.CW i
for
.I insert
(which you have already seen),
.CW c
for
.I change ,
.CW d
for
.I delete ,
.CW d
then
.CW p
for
.I move
(delete and put),
and
.CW y
for
.I yank
(copy).
Each type of edit is described in this section.
Table 3-1 gives a few simple examples.
.Ts "Basic Editing Commands
.TS
box, center;
l l l l
l lfCW lfCW lfCW.
Object	Change	Delete	Copy(Yank)
_
One word	cw	dw	yw
Two words	2cW	2dW	2yW
Three words back	3cb	3db	3yb
One line	cc	dd	yy \fRor\fP Y
To end of line	c$ \fRor\fP C	d$ \fRor\fP D	y$
To beginning of line	c0	d0	y0
Single character	r	x	yl
.TE
.Te
.Bh "Inserting New Text
.LP 0
You have already used the insert command
to enter text into a new file.
You also use
the insert command while editing existing text
to add characters, words, and sentences.
Suppose you have to insert
.CW Today ,
at the beginning of a sentence.
Enter the following sequence of commands and text:
.sp .7v
.ne 8
.X1
I'll start putting
together a written
plan that shows
\zd_ifferent strategies

.X2
.CW 3k
move up 3
lines
.X3
\zI_'ll start putting
together a written
plan that shows
different strategies

.X4
.ne 8
.X1
\zI_'ll start putting
together a written
plan that shows
different strategies

.X2
.CW "iToday, <ESC>"
insert
.I Today ,
.X3
Today\z,_ I'll start putting
together a written
plan that shows
different strategies

.X4
.sp 1v
.LP 0
In the previous example,
.CW vi
.ix [vi] editor, leaving insert~mode %key vi editor, leaving insert mode
.ix [vi] editor, on~a dumb~terminal %key vi editor, on a dumb~terminal
.ix terminal type
moves existing text to the right
as the new text is inserted.
That is because we are showing
.CW vi
on an \(lqintelligent\(rq terminal,
which can adjust the screen with each character you type.
An insert on a \(lqdumb\(rq terminal
(such as an
.CW adm3a )
will look different.
The terminal itself cannot update the screen
for each character typed
(without a tremendous sacrifice of speed),
so
.CW vi
doesn't rewrite the screen
until after you press
.I ESC .
Rather, when you type,
the dumb terminal appears to
overwrite the existing text.
When you press
.I ESC ,
the line is adjusted immediately so
that the missing characters reappear.
Thus, on a dumb terminal,
the same insert would
appear as follows:
.sp .7v
.ne 8
.X1
\zI_'ll start putting
together a written
plan that shows
different strategies

.X2
.CW iToday ,
insert
.I Today ,
.X3
Today, \za_rt putting
together a written
plan that shows
different strategies

.X4
.ne 8
.LP
.X1
Today, \za_rt putting
together a written
plan that shows
different strategies

.X2
.CW <ESC>
leave
insert mode
.X3
Today,_I'll start putting
together a written
plan that shows
different strategies

.X4
.Bh "Changing Text
.ix %begin [vi] editor, changing text %key vi editor, changing text
.LP 0
You can replace any text in your file with the change command,
.CW c .
To identify the amount of text that you want replaced,
combine the change command with a movement command.
For example,
.CW c
can be used to change text from the cursor
.RS
.IP \f(CWcw\fP 10
to the end of a word
.IP \f(CW2cb\fP 10
back two words
.IP \f(CWc$\fP 10
to the end of a line
.RE
.LP
Then you can replace the identified text with any amount of new text:
no characters at all, one word, or hundreds of lines.
The
.CW c
command leaves you in insert mode
until you press the
.I ESC
key.
.Bh "Words
.LP 0
You can replace a word (\c
.CW cw )
with a longer word,
a shorter word,
or any amount of text.
The
.CW cw
command can be thought of as
\(lqdelete the word marked and insert new text
until
.I ESC
is pressed.\(rq
.PP
Suppose that you have the following lines in your file
.CW letter
and want to
change
.I "designing"
to
.I "putting together" .
You only need to change one word.
.sp .7v
.ne 8
.X1
I'll start
\zd_esigning a



.X2
.CW cw
change a
word
.X3
I'll start
\zd_esignin$ a



.X4
.sp 1v
.LP 0
Note that the
.CW cw
command places a
.CW $
at the last character of the word to be changed.
.sp .7v
.ne 8
.X1
I'll start
\zd_esignin$ a



.X2
.CW putting
.CW together
<\f(CWESC\fP>
enter change
.X3
I'll start
putting togethe\zr_ a



.X4
.sp 1v
.PP
The
.CW cw
command also works on a portion of a word.
For example,
to change
.I putting
to
.I puts ,
position the cursor on the second
.I t ,
enter
.CW cw ,
then type
.I s
and press
.I ESC .
By using numeric prefixes,
you can change multiple words
or characters immediately.
For example:
.RS
\f(CW3cw\fP			change three words to the right of the cursor
.br
\f(CW5cl\fP			change five letters to the right of the cursor
.RE
.LP
You don't need to replace the specified number of words,
characters, or lines with a like amount of text.
For example:
.sp .7v
.ne 8
.X1
I'll start
\zp_utting together a



.X2
.CW 2cw
designing
<ESC>
.X3
I'll start
designin\zg_ a



.X4
.Bh "Lines
.LP 0
To replace the entire current line,
there is the special change command
.CW cc .
This command changes an entire line,
replacing that line with the text entered before an
.I ESC .
The
.CW cc
command replaces the entire line of text,
regardless of where the cursor is located on the line.
.PP
The
.CW C
command replaces characters from the current cursor position
to the end of the line.
It has the same effect as combining
.CW c
with the special end-of-line indicator,
.CW $
(as in
.CW c$ ).
.Bh "Characters
.ix [vi] editor, replacing characters %key vi editor, replacing characters
.LP 0
One other replacement edit is performed with the
.CW r
command.
This command replaces a single character with another single character.
One of its uses is to correct misspellings.
You probably don't want to use
.CW cw
in such an instance,
because you would have to retype the entire word.
Use
.CW r
to replace a single character at the cursor:
.sp .7v
.ne 8
.X1
Y\za_sterday, I received




.X2
.CW re
replace \c
.I a
with \c
.I e
.X3
Y\ze_sterday, I received




.X4
.sp 1v
.LP 0
The
.CW r
command makes only a single character replacement.
You do
.I not
have to press
.I ESC
to finish the edit.
Following an
.CW r
command,
you are automatically returned to command mode.
.ix %end [vi] editor, changing text %key vi editor, changing text
.ix %begin [vi] editor, deleting text %key vi editor, deleting text
.Bh "Deleting Text
.LP 0
You can also delete any text in your file with the delete command,
.CW d .
Like the change command,
the delete command requires an argument
(the amount of text to be operated on).
You can delete by word (\c
.CW dw ),
by line (\c
.CW dd
and
.CW D ),
or by other movement commands that you will learn later.
.PP
With all deletions,
you move to where you want the edit to take p1ace
and enter the delete command (\c
.CW d )
followed by the amount of text to be deleted
(such as a text object,
.CW w
for
.I word ).
.Bh "Words
.LP 0
Suppose that in the following text
you want to delete one instance of the word
.I start
in the first line.
.sp .7v
.ne 8
.X1
Today, I'll \zs_tart
start putting together
a written plan
thatth shows different

.X2
.CW dw
delete word
.X3
Today, I'll_
start putting together
a written plan
thatth shows different

.X4
.sp 1v
.LP 0
The
.CW dw
command deletes from the cursor's position
to the end of a word.
Thus,
.CW dw
can be used to delete a portion of a word.
.sp .7v
.ne 8
.X1
that\zt_h shows different





.X2
.CW dw
delete word
.X3
that\zs_hows different





.X4
.sp .7v
.LP 0
As you can see,
.CW dw
deleted not only the remainder of the word,
but also the space before any subsequent word on the same line.
To retain the space between words,
use
.CW de ,
which will delete only to the end of the word.
.sp .7v
.ne 8
.X1
that\zt_h shows different





.X2
.CW de
delete to
word end
.X3
that_shows different





.X4
.sp 1v
.LP 0
You can also delete backwards (\c
.CW db )
or to the end or beginning of a line
(\c
.CW d$
or
.CW d0 ).
.Bh "Lines
.LP 0
The
.CW dd
command deletes the entire line that the cursor is on.
Using the same text as in the previous example,
with the cursor positioned on the first line as shown,
you can delete the first two lines:
.ix %end [vi] editor, deleting single characters %key vi editor, deleting single characters
.LP 0
The
.CW X
command deletes the character before the cursor.
Prefix either of these commands with a number
to delete that number of characters.
For example,
.CW 5X
will delete the five characters to the left of the cursor.
.ix %end [vi] editor, deleting text %key vi editor, deleting text
.Bh "Moving Text
.ix [vi] editor, moving text %key vi editor, moving text
.LP 0
You can move text by deleting it
and then placing that deleted text elsewhere in the file,
like a \(lqcut and paste.\(rq
Each time you delete a text block,
that deletion is temporarily saved in a buffer.
You can move to another position in the file
and use the
.CW put
command
to place the text in a new position.
Although you can move any block of text,
this command sequence is more useful with lines than with words.
.PP
The put command,
.CW p ,
places saved or deleted text
(in the buffer)
.I after
the cursor position.
The uppercase version of the command,
.CW P ,
puts the text
.I before
the cursor.
If you delete one or more lines,
.CW p
puts the deleted text on a new line(s) below the cursor.
If you delete a word,
.CW p
puts the deleted text on the same line after the cursor.
.PP
Suppose that in your file
.CW letter
you have the following lines
and you want to
move the fourth line of text.
Using delete,
you can make this edit.
First delete the line in question:
.sp .7v
.ne 8
.X1
Today, I'll start
putting together a
plan for documenting
\zt_he Alcuin product
that shows
.X2
.CW dd
delete line
.X3
Today, I'll start
putting together a
plan for documenting
\zt_hat shows

.X4
.sp 1v
.LP 0
Then use
.CW p
to restore the deleted line at the next line below the cursor:
.sp .7v
.ne 8
.X1
Today, I'll start
putting together a
plan for documenting
\zt_hat shows

.X2
.CW p
restore deleted
line
.X3
Today, I'll start
putting together a
plan for documenting
that shows
\zt_he Alcuin product
.X4
.sp 1v
.LP 0
You can also use
.CW xp
(delete character and put after cursor)
to transpose two letters.
For example, in the word
.I mvoe ,
the letters
.I vo
are transposed (reversed).
To correct this,
place the cursor on
.I v
and press
.CW x
then
.CW p .
.PP
After you delete the text,
you must restore it
before the next change or delete command.
If you make another edit that affects the buffer,
your deleted text will be lost.
You can repeat the put command over and over,
as long as you don't make a new edit.
In the advanced
.CW vi
chapter,
you will learn how to retrieve text from named
and numbered buffers.
.Bh "Copying Text
.ix [vi] editor, copying text %key vi editor, copying text
.LP
Often, you can save editing time
(and keystrokes)
by copying part of your file to another place.
You can copy any amount of existing text
and place that copied text elsewhere
in the file
with the two commands
.CW y
(\c
.I yank )
and
.CW p
(\c
.I put ).
The yank command is used to get a copy of text into the buffer
without altering the original text.
This copy can then be placed elsewhere in the file
with the put command.
.PP
Yank can be combined with any movement command
(for example,
.CW yw ,
.CW y$ ,
or
.CW 4yy ).
Yank is most frequently used with a line
(or more)
of text,
because to yank and put a word
generally takes longer than simply inserting the word.
For example, to yank five lines of text:
.sp .7v
.ne 8
.X1
\zo_n the Alcuin product.
Yesterday, I received
the product demo
and other materials
that you sent me.
\(ap
\(ap
\(ap
.X2
.CW 5yy
yank 5
lines
.X3
\zo_n the Alcuin product.
Yesterday, I received
the product demo
and other materials
that you sent me.
\(ap
\(ap
5 lines yanked
.X4
.sp 1v
.PP
To place the yanked text,
move the cursor to where you want to put the text,
and use the
.CW p
command to insert it below the current line, or
.CW P
to insert it above the current line.
.sp .7v
.ne 8
.X1
\zt_hat you sent me.
\(ap
\(ap
\(ap
\(ap
\(ap



.X2
.CW P
place yanked
text
.X3
that you sent me.
\zo_n the Alcuin product.
Yesterday, I received
the product demo
and other materials
that you sent me.

5 more lines

.X4
.sp 1v
.LP 0
The yanked text will appear
on the line below the cursor.
Deleting uses the same buffer as yanking.
Delete and put can be used in much the same way as yank and put.
Each new deletion or yank
replaces the previous contents of the yank buffer.
As we'll see later,
up to nine previous yanks or deletions
can be recalled with put commands.
.Bh "Using Your Last Command
.LP
.ix [vi] editor, repeating last~command %key vi editor, repeating last command
.ix [vi] editor, undoing last change %key vi editor, undoing last change
Each command that you give
is stored in a temporary buffer
until you give the next command.
If you insert
.I the
after a word in your file,
the command used to insert the text,
along with the text that you entered,
is temporarily saved.
Anytime you are making the same editing command repeatedly,
you can save time by duplicating the command with
.CW \.
(dot).
To duplicate a command,
position the cursor anywhere on the screen,
and press
.CW \.
to repeat your last command
(such as an insertion or deletion)
in the buffer.
You can also use numeric arguments
(as in
.CW 2. )
to repeat the previous command more than once.
.PP
Suppose that you have the following lines in your file
.CW letter .
Place the cursor on the line you want to delete:
.sp .7v
.ne 8
.X1
Yesterday, I received
the product demo.
\zY_esterday, I received
other materials

.X2
.CW dd
delete line
.X3
Yesterday, I received
the product demo.
\zo_ther materials


.X4
.LP 0
.ne 8
.X1
Yesterday, I received
the product demo.
\zo_ther materials


.X2
.CW \.
repeat last
command (\f(CWdd\fP)
.X3
Yesterday, I received
\zt_he product demo.



.X4
.sp 1v
.PP
In some versions of
.CW vi ,
the command CTRL-@ (\c
.CW ^@ )
repeats the last insert
(or append) command.
This is in contrast to the
.CW \.
command,
which repeats the last command that changed the text,
including delete or change commands.
.PP
You can also
.I undo
your last command
if you make an error.
To undo a command,
the cursor can be anywhere on the screen.
Simply press
.CW u
to undo the last command
(such as an insertion or deletion).
.PP
To continue the previous example:
.sp .7v
.ne 8
.X1
Yesterday, I received
\zt_he product demo.



.X2
.CW u
undo last
command
.X3
Yesterday, I received
the product demo.
\zo_ther materials


.X4
.sp 1v
.LP 0
The uppercase version of
.CW u
(\c
.CW U )
undoes all edits on a single line,
as long as the cursor remains on that line.
After you move off a line, you can no longer use
.CW U .
.ix [vi] editor, joining lines %key vi editor, joining lines
.Bh "Joining Two Lines with J"
.LP 0
Sometimes while editing a file,
you will end up with a series of short lines
that are difficult to read.
When you want to merge two lines,
position the cursor anywhere on the first line
and press
.CW J
to join the two lines.
.sp .7v
.ne 8
.X1
\zY_esterday,
I received
the product demo.


.X2
.CW J
join lines
.X3
\zY_esterday, I received
the product demo.



.X4
.sp 1v
.LP 0
.ix [vi] editor, quitting~without saving edits %key vi editor, quitting without saving edits
A numeric argument joins that number of consecutive lines.
.Bh "Quitting without Saving Edits
.LP
When you are first learning
.CW vi ,
especially if you are an intrepid experimenter,
there is one other command that is handy
for getting out of any mess that you might create.
You already know how to save your edits with
.CW ZZ ,
but what if you want to wipe out all the edits
you have made in a session and return to the original file?
.PP
You can quit
.CW vi
without saving edits
with a special bottom-line command
based on the
.CW ex
line editor.
The
.CW ex
commands are explained fully in the advanced
.CW vi
chapter,
but for basic
.CW vi
editing you should just memorize this command:
.Ps
:q!   <RETURN>
.Pe
The
.CW q!
command quits the file you are in.
All edits made since the last time you saved the file are lost.
.PP
You can get by in
.CW vi
using only the commands you have learned in this session.
However, to harness the real power of
.CW vi
(and increase your own productivity)
you will want to continue to the next session.
.Ah "Session 2: Moving Around in a Hurry
.LP
You use
.CW vi
not only to create new files
but also to edit existing files.
You rarely open to the first line in the file
and move through it line by line.
You want to get to a specific place in a file
and start work.
.PP
All edits begin with moving the cursor
to where the edit begins
(or, with
.CW ex
line editor commands,
identifying the line numbers to be edited).
This chapter shows you
how to think about movement in a variety of ways
(by screens, text, patterns, or line numbers).
There are many ways to move in
.CW vi ,
because editing speed depends
on getting to your destination with only a few keystrokes.
.ix %begin [vi] editor, scrolling %key vi editor, scrolling
.ix %begin scrolling
.ix [vi] editor, moving~by screenfuls %key vi editor, moving by screenfuls
.PP
In this session, you will learn how to move around in a file by
.RS
.Ls B
.Li
screens;
.Li
text blocks;
.Li
searches for patterns;
.Li
lines.
.Le
.RE
.Ah "Movement by Screens
.LP
When you read a book you think of \(lqplaces\(rq in the book by page:
the page where you stopped reading
or the page number in an index.
Some
.CW vi
files take up only a few lines,
and you can see the whole file at once.
But many files have hundreds of lines.
.PP
You can think of a
.CW vi
file as text on a long roll of paper.
The screen is a window of (usually) 24 lines of text
on that long roll.
In insert mode,
as you fill up the screen with text,
you will end up typing on the bottom line of the screen.
When you reach the end and press
.I RETURN ,
the top line rolls out of sight,
and a blank line for new text appears on the bottom of the screen.
This is called
.I scrolling .
You can move through a file
by scrolling the screen ahead or back to see any text in the file.
.Bh "Scrolling the Screen
.LP
There are
.CW vi
commands to scroll forward and backward through the file
by full and halfscreens:
.RS
\f(CW^F\fP	forward one screen
.br
\f(CW^B\fP	backward one screen
.br
\f(CW^D\fP	forward halfscreen
.br
\f(CW^U\fP	backward halfscreen
.RE
(The
.CW ^
symbol represents the
.ix {CTRL} key %key CTRL key
.I CTRL
key.
.CW ^F
means to simultaneously press the
.I CTRL
key and the
.I F
key).
.sp .7v
.SS
.nf
.CW
In our conversation last Thursday, we
discussed a documentation project that would
produce a user's manual on the Alcuin product.
Yesterday, I received the product demo and
other materials that you sent me.

Going through a \zd_emo session gave me a
much better understanding of the product.  I
confess to being amazed by Alcuin.  Some

.R
.SE
.sp 1v
.LP 0
If you press
.CW ^F ,
the screen appears as follows:
.sp .7v
.SS
.nf
.CW
\zb_etter understanding of the product.  I
confess to being amazed by Alcuin.  Some
people around here, looking over my shoulder,
were also astounded by the illustrated
manuscript I produced with Alcuin.  One
person, a student of calligraphy, was really
impressed.

Today, I'll start putting together a written

.R
.SE
.sp 1v
.LP 0
There are also commands
to scroll the screen up one line
(\c
.CW ^E )
and down one line
(\c
.CW ^Y ).
(These commands are not available on small systems,
such as the PDP-11 or Xenix for the PC-XT).
.ix %end [vi] editor, scrolling %key vi editor, scrolling
.ix %end scrolling
.ix [vi] editor, cursor~movement within screen %key vi editor, cursor movement within screen
.Bh "Movement within a Screen
.LP
You can also keep your current screen or view of the file
and move around within the screen using:
.RS
\f(CWH\fP		home\(emtop line on screen
.br
\f(CWM\fP		middle line on screen
.br
\f(CWL\fP		last line on screen
.br
\fIn\fP\f(CWH\fP		to \fIn\fP lines below top line
.br
\fIn\fP\f(CWL\fP		to \fIn\fP lines above last line
.RE
.LP
The
.CW H
command moves the cursor from anywhere on the screen
to the first, or
.I home ,
line.
The
.CW M
command moves to the middle line,
.CW L
to the last.
To move to the line
below the first line, use
.CW 2H .
.sp .7v
.ne 8
.X1
Today, I'll start
putting together a
written plan that
\zs_hows the different
strategies for the
.X2
.CW 2H
move to
second line
.X3
Today, I'll start
\zp_utting together a
written plan that
shows the different
strategies for the
.X4
.sp 1v
.LP 0
These screen movement commands
can also be used for editing.
For example,
.CW dH
deletes to the top line shown on the screen.
.Bh "Movement within Lines
.ix [vi] editor, cursor~movement within lines %key vi editor, cursor movement within lines
.LP
Within the current screen
there are also commands to move by line.
You have already learned the line movement commands
.CW $
and
.CW 0 .
.RS
\fIRETURN\fP		beginning of next line
.br
\f(CW^\fP			to first character of current line
.br
\f(CW+\fP			beginning of next line
.br
\f(CW-\fP			beginning of previous line
.RE
.sp .7v
.ne 8
.X1
Going through a demo
session gave m\ze_ a much
better understanding
of the product.

.X2
.CW -
go to start
of previous
line
.X3
\zG_oing through a demo
session gave me a much
better understanding
of the product.

.X4
.sp 1v
.LP 0
The
.CW ^
command moves to the first
.I character
of the line, ignoring any spaces or tabs.
(\c
.CW 0 ,
by contrast, moves to the first
.I position
of the line,
even if that position is blank).
.Ah "Movement by Text Blocks
.ix [vi] editor, cursor~movement~by text~blocks %key vi editor, cursor movement~by text~blocks
.LP
Another way that you can think of moving through a
.CW vi
file is by text blocks\(emwords,
sentences, or paragraphs.
You have already learned to move forward and backward by word (\c
.CW w
or
.CW b ).
.LP
.RS
\f(CWe\fP		end of word
.br
\f(CWE\fP		end of word (ignore punctuation)
.br
\f(CW(\fP		beginning of previous sentence
.br
\f(CW)\fP		beginning of next sentence
.br
\f(CW{\fP		beginning of previous paragraph
.br
\f(CW}\fP		beginning of next paragraph
.RE
.PP
The
.CW vi
program locates the end of a sentence
by finding a period followed by at least two spaces,
or a period as the last nonblank character on a line.
If you have left only a single space following a period,
the sentence won't be recognized.
.PP
A
.I paragraph
is defined as text up to the next blank line,
or up to one of the default paragraph macros
(\c
.CW .IP ,
.CW .P ,
.CW .PP ,
or
.CW .QP )
in the
.CW mm
or
.CW ms
macro packages.
The macros that are recognized as paragraph separators
can be customized with the
.CW :set
command, as described in Chapter 7.
.sp .7v
.ne 8
.X1
In our conversation
last Thursday, we ...

Going through a \zd_emo
session gave me ...
.X2
.CW {
go to start
of previous
paragraph
.X3
\zI_n our conversation
last Thursday, we ...

Going through a demo
session gave me ...
.X4
.sp 1v
.ix [vi] editor, cursor~movement~with numeric~argument %key vi editor, cursor movement~with numeric~argument
.PP
Most people find it easier to visualize moving ahead,
so the forward commands are generally more useful.
.PP
Remember that you can combine numbers with movement.
For example,
.CW 3)
moves ahead three sentences.
Also remember that you can edit
using movement commands.
.CW d)
deletes to the end of the current sentence,
.CW 2y}
copies (yanks) two paragraphs ahead.
.Ah "Movement by Searches
.ix %begin [vi] editor, search~for pattern %key vi editor, search for pattern
.ix search
.LP
One of the most useful ways
to move around quickly in a large file
is by searching for text,
or, more properly, for a
.I pattern
of characters.
The pattern can include a \(lqwildcard\(rq shorthand
that lets you match more than one character.
For example, you can search for a misspelled word
or each occurrence of a variable in a program.
.PP
The search command is the
.I slash
character (\c
.CW / ).
When you enter a slash,
it appears on the bottom line of the screen;
then type in the pattern
(a word or other string of characters)
that you want to find:
.RS
.sp .5v
.CW /
\fItext\fP<RETURN>  search forward for
.I text
.RE
.sp .5v
.LP 0
A space before or after
.I text
will be included in the search.
As with all bottom-line commands,
press
.I RETURN
to finish.
.PP
The search begins at the cursor and moves forward,
wrapping around to the start of the file if necessary.
The cursor will move to the first occurrence of the pattern
(or the message \(lqPattern not found\(rq
will be shown on the status line if there is no match).
.PP
If you wanted to search for the pattern
.I shows :
.sp .7v
.ne 8
.X1
Today, I'll start
putting together a
written \zp_lan that
shows the different
\(ap
\(ap
\(ap
.X2
.CW /shows<CR>
search for
.I shows
.X3
Today, I'll start
putting together a
written plan that
\zs_hows the different
\(ap
\(ap
/shows
.X4
.ne 8
.X1
Today, I'll start
putting together a
\zw_ritten plan that
shows the different
\(ap
\(ap
\(ap
.X2
.CW /th<CR>
search for
.I th
.X3
Today, I'll start
putting together a
written plan \zt_hat
shows the different
\(ap
\(ap
/th
.X4
.sp 1v
.LP 0
The search proceeds forward from the present position in the file.
You can give any combination of characters;
a search does not have to be for a complete word.
.PP
You can also search backwards using the
.CW ?
command:
.sp .5v
.RS
\f(CW?\fP\fItext\fP\f(CW<RETURN>\fP  search backward for
.I text
.RE
.sp .5v
.PP
The last pattern that you searched for
remains available throughout your editing session.
After a search,
instead of repeating your original keystrokes,
you can use a command to search again for the last pattern.
.ix [vi] editor, repeat last search %key vi editor, repeat last search
.LP
.RS
\f(CWn\fP			repeat search in same direction
.br
\f(CWN\fP			repeat search in opposite direction
.br
\f(CW/<RETURN>\fP	repeat search in forward direction
.br
\f(CW?<RETURN>\fP	repeat search in backward direction
.RE
.PP
Because the last pattern remains available,
you can search for a pattern,
do some work,
and then search again for the pattern without retyping
by using
.CW n ,
.CW N ,
.CW / ,
or
.CW ? .
The direction of your search (\c
.CW / =forwards,
.CW ? =backwards)
is displayed at the bottom left of the screen.
.PP
Continuing the previous example,
the pattern
.I th
is still available to search for:
.sp .7v
.ne 8
.X1
Today, I'll start
putting together a
written plan \zt_hat
shows the different

.X2
.CW n
search for
next \c
.I th
.X3
Today, I'll start
putting together a
written plan that
shows \zt_he different

.X4
.LP 0
.ne 8
.X1
Today, I'll start
putting together a
written plan that
shows \zt_he different
\(ap
\(ap
\(ap
.X2
.CW ?<CR>
search back
for \c
.I th
.X3
Today, I'll start
putting together a
written plan \zt_hat
shows the different
\(ap
\(ap
?the
.X4
.LP 0
.X1
Today, I'll start
putting together a
written plan \zt_hat
shows the different

.X2
.CW N
repeat search
in opposite
direction
.X3
Today, I'll start
putting together a
written plan that
shows \zt_he different

.X4
.sp 1v
.LP 0
This section has given only the barest introduction
to searching for patterns.
Chapter 7 will teach more about pattern matching
and its use in making global changes to a file.
.ix [vi] editor, search~within current~line %key vi editor, search within current~line
.Bh "Current Line Searches
.LP 0
There is also a miniature version of the search command
that operates within the current line.
The command
.CW f
moves the cursor to the next instance of the character you name.
Semicolons can then be used to repeat the \(lqfind.\(rq
Note, however, that the
.CW f
command will not move the cursor to the next line.
.RS
.IP \f(CWf\fIx 10
find (move cursor to) next occurrence of
.I x
in the line,
where
.I x
can be any character
.IP \f(CW; 10
repeat previous find command
.RE
.LP
Suppose that you are editing on this line:
.sp .7v
.ne 8
.X1
\zT_oday, I'll start




.X2
.CW f'
find first '
in line
.X3
Today, I\z'_ll start




.X4
.sp 1v
.LP 0
Use
.CW df'
to delete up to and including the named character
(in this instance  ' ).
This command is useful in deleting or copying partial lines.
.PP
The
.CW t
command works just like
.CW f ,
except it positions the cursor just before the character searched for.
As with
.CW f
and
.CW b ,
a numeric prefix will locate the
.I n th
occurrence.
For example:
.sp .7v
.ne 8
.X1
\zT_oday, I'll start




.X2
.CW 2ta
place cursor
before 2nd \fIa\fP
in line
.X3
Today, I'll s\zt_art




.X4
.sp 1v
.ix %end [vi] editor, search~for pattern %key vi editor, search for pattern
.ix [vi] editor, cursor~movement~by line~numbers %key vi editor, cursor movement~by line~numbers
.ix line number, in [vi] %key line number, in vi
.Ah "Movement by Line Numbers
.LP 0
A file contains sequentially numbered lines,
and you can move through a file by specifying line numbers.
Line numbers are useful for identifying the beginning
and end of large blocks of text
you want to edit.
Line numbers are also useful for programmers
because compiler error messages refer to line numbers.
Line numbers are also used by
.CW ex
commands, as you will learn in Chapter 7.
.ix [vi] editor, displaying line~numbers %key vi editor, displaying line numbers
.PP
If you are going to move by line numbers,
you need a way to identify line numbers.
Line numbers can be displayed on the screen using the
.ix [vi] editor, movement~by line~number %key vi editor, movement by line~number
.CW :set
.CW  nu
option described in Chapter 7.
In
.CW vi ,
you can also display the current line number on the bottom of the screen.
.PP
The command
.CW ^G
displays the following on the bottom of your screen:
the current line number,
the total number of lines in the file,
and what percentage of the total
the present line number represents.
For example, for the file
.CW letter ,
.CW ^G
might display:
.Ps
"letter" line 10 of 40  --25%--
.Pe
.LP
.CW ^G
is used to display the line number to use in a command,
or to orient yourself
if you have been distracted from your editing session.
.PP
The
.CW G
(\c
.I "go to" )
command uses a line number as a numeric argument,
and moves to the first position on that line.
For instance,
.CW 44G
moves the cursor to the beginning of line 44.
The
.CW G
command without a line number
moves the cursor to the last line of the file.
.ix [vi] editor, returning~to~a position %key vi editor, returning to~a position
.PP
Two single quotes (\c
.CW '' )
return you to the beginning of the line you were originally on.
Two backquotes (\c
.CW `` )
return you to your original position exactly.
If you have issued a search command
(\c
.CW /
or
.CW ? ),
.CW ``
will return the cursor
to its position when you started the search.
.PP
The total number of lines shown with
.CW ^G
can be used to give yourself a rough idea
of how many lines to move.
If you are on line 10 of a 1000-line file:
.Ps
"ch01" line 10 of 1000 --1%--
.Pe
and know that you want to begin editing near the end of that file,
you could give an approximation of your destination with.
.Ps
800G
.Pe
Movement by line number can get you around quickly in a large file.
.Ah "Session 3:  Beyond the Basics
.LP 0
You have already been introduced to the basic
.CW vi
editing commands,
.CW i ,
.CW c ,
.CW d ,
and
.CW y .
This session expands on what you already know about editing.
You will learn
.RS
.Ls B
.Li
additional ways to enter vi;
.Li
how to customize vi;
.Li
how to combine all edits with movement commands;
.Li
additional ways to enter insert mode;
.Li
how to use buffers that store deletions, yanks, and your last command;
.Li
how to mark your place in a file.
.ix [vi] editor, opening~a~file~to~a specific~place %key vi editor, opening a~file~to~a specific~place
.Le
.RE
.Ah "Command-Line Options
.LP 0
There are other options to the
.CW vi
command that can be helpful.
You can open a file directly
to a specific line number or pattern.
You can also open a file in read-only mode.
Another option recovers all changes to a file
that you were editing when the system crashes.
.ix [vi] editor, command~line options %key vi editor, command line options
.Bh "Advancing to a Specific Place
.LP 0
When you begin editing an existing file,
you can load the file
and then move to the first occurrence of a pattern
or to a specific line number.
You can also combine the open command,
.CW vi ,
with your first movement by search or by line number.
For example:
.Ps
$ \f(CBvi +\fP\fIn\fP \f(CBletter\fP
.Pe
opens
.CW letter
at line number
.I n .
The following:
.Ps
$ \f(CBvi + letter\fP
.Pe
opens
.CW letter
at the last line.
And:
.Ps
$ \f(CBvi +/\fP\fIpattern\fP \f(CBletter\fP
.Pe
opens
.CW letter
at the first occurrence of
.I pattern .
.PP
To open the file
.CW letter
and advance directly to the line containing
.I Alcuin ,
enter:
.Ps
$ \f(CBvi +/Alcuin letter\fP
.Pe
.SS
.nf
.CW
Today I'll start putting together a
written plan that presents the different
strategies for the \zA_lcuin
\(ap
\(ap
\(ap
\(ap
\(ap
\(ap
\(ap
\(ap
\(ap
.SE
.sp 1v
.LP 0
There can be no spaces in the pattern
because characters after a space are interpreted as
filenames.
.PP
If you have to leave an editing session before you are finished,
you can mark your place by inserting a pattern such as
.CW ZZZ
or
.CW HERE .
Then when you return to the file,
all you have to remember is
.CW /ZZZ
or
.CW /HERE .
.ix [vi] editor, read-only mode %key vi editor, read-only mode
.ix [vi] editor, view mode %key vi editor, view mode
.ix [view] command %key view command
.Bh "Read-Only Mode
.LP 0
There will be times that you want to look at a file,
but you want to protect that file
from inadvertent keystrokes and changes.
(You might want to call in a lengthy file to practice
.CW vi
movements,
or you might want to scroll through a command file or program).
If you enter a file in read-only mode,
you can use all the
.CW vi
movement commands,
but you cannot change the file with any edits.
To look at your file
.CW letter
in read-only mode, you can enter either:
.Ps
$ \f(CBvi -R letter\fP
.Pe
or:
.Ps
$ \f(CBview letter\fP
.Pe
.ix [vi] editor, recovering~a buffer %key vi editor, recovering a buffer
.Bh "Recovering a Buffer
.LP 0
Occasionally, there will be a system failure
while you are editing a file.
Ordinarily, any edits made after your last write (save) are lost.
However, there is an option,
.CW -r ,
which lets you recover the edited buffer at the time of a system crash.
(A system program called
.CW preserve
saves the buffer as the system is going down).
.PP
When you first log in after the system is running again,
you will receive a mail message stating that your buffer is saved.
The first time that you call in the file,
use the
.CW -r
option to recover the edited buffer.
For example, to recover the edited buffer of the file
.CW letter
after a system crash, enter:
.Ps
$ \f(CBvi -r letter\fP
.Pe
If you first call in the file
.I without
using the
.CW -r
option, your buffered edits are lost.
.PP
You can force the system to preserve your buffer
even when there is not a crash
by using the command
.CW :pre .
You may find this useful
if you have made edits to a file,
then discover you can't save your edits
because you don't have write permission.
(You could also just write a copy of the file out
under another name
or in a directory where you do have write permission.)
.Ah "Customizing \f[CB]vi\fP"
.ix customizing [vi] %key customizing vi
.LP 0
A number of options that you can set as part of your editing environment
affect how
.ix %begin [vi] editor, setting options %key vi editor, setting options
.CW vi
operates.
For example,
you can set a right margin
that will cause
.CW vi
to wrap lines automatically,
so you don't need to insert carriage returns.
.PP
You can change options from within
.CW vi
by using the
.CW :set
command.
In addition,
.CW vi
reads an initialization file in your home directory
called
.ix [.exrc] file %key exrc file
.ix [ex] editor, [.exrc] file %key ex editor, [.exrc] file
.CW .exrc
for further operating instructions.
By placing
.CW set
commands in this file,
you can modify the way
.CW vi
acts whenever you use it.
.PP
You can also set up
.CW .exrc
files in local directories
to initialize various options
that you want to use in different environments.
For example, you might define one set of options for editing text,
but another set for editing source programs.
The
.CW .exrc
file in your home directory will be executed first,
then the one on your current directory.
.ix [EXINIT] variable %key EXINIT variable
.ix [ex] editor, [EXINIT] variable %key ex editor, [EXINIT] variable
.ix environment variables, [EXINIT] %key environment variables, EXINIT
.PP
Finally, if the shell variable
.CW EXINIT
is set in your environment
(with the Bourne shell
.ix Bourne shell, [export] command %key Bourne shell, export command
.ix [export] command %key export command
.CW export
command, or the C shell
.CW setenv
command), any commands it contains
will be executed by
.CW vi
on startup.
If
.CW EXINIT
is set,
it will be used instead of
.CW \&.exrc ;
.CW vi
will not take commands from both.
.Bh "The \f[CB]set\fP Command
.ix [vi] editor, setting options %key vi editor, setting options
.LP 0
There are two types of options
that can be changed with the
.CW set
command:
toggle options,
which are either on or off,
and options that take a numeric or string value
(such as the location of a margin or the name of a file).
.PP
Toggle options may be on or off by default.
To turn a toggle option on, the command is:
.Ps
:set \fIoption\fP
.Pe
To turn a toggle option off, the command is:
.Ps
:set no\fIoption\fP
.Pe
For example, to specify that pattern searches should ignore case, you type:
.ix [vi] editor, ignoring case~during searches %key vi editor, ignoring case during searches
.Ps
:set ic
.Pe
If you want
.CW vi
to return to being case-sensitive in searches, give the command:
.Ps
:set noic
.Pe
.PP
Some options have values.
For example, the option
.CW window
sets the number of lines
shown in the screen \(lqwindow.\(rq
You set values for these options with an equals sign (\(eq). For example:
.ix [vi] editor, size~of window %key vi editor, size of window
.Ps
:set window=20
.Pe
During a
.CW vi
session, you can check what options are available.
The command:
.Ps
:set all
.Pe
displays the complete list of options,
including options that you have set
and defaults that
.CW vi
has chosen.
The display will look something like this:
.sp .7v
.SS
.nf
.CW
.ta 22n 48n
noautoindent	open	tabstop=8
autoprint	prompt	taglength=0
noautowrite	noreadonly	term=wy50
nobeautify	redraw	noterse
directory=/tmp	/remap	timeout
noedcompatible	report=5	ttytype=wy50
noerrorbells	scrolls=11	warn
hardtabs=8	sections=AhBhChDh	window=20
noignorecase	shell=/bin/csh	wrapscan
nolisp	shiftwidth=8	wrapmargin=10
nolist	noshowmatch	nowriteany
magic	noslowopen	
mesg	paragraphs=IPLPPPQP LIpp1pipbb
number	tags=tags /usr/lib/tags
nooptimize
.SE
.sp 1v
.ix [ex] editor, [.exrc] file %key ex editor, [.exrc] file
.LP 0
You can also ask about the setting for any individual option by name,
using the command:
.Ps
:set \fIoption\fP?
.Pe
The command
.CW :set
shows options that you have specifically changed,
or set,
either in your
.CW \&.exrc
file or during the current session.
For example, the display might look like this:
.Ps
number  window=20  wrapmargin=10
.Pe
See
.pdfhref L -D AppendixA -- Appendix A
for a description of what these options mean.
.ix [.exrc] file %key exrc file
.Bh "The \f(CB.exrc\fP File
.LP 0
The
.CW \&.exrc
file that controls the
.CW vi
environment for you
is in your home directory.
Enter into this file the
.CW set
options that you want to have in effect
whenever you use
.CW vi
or
.CW ex .
.PP
The
.CW \&.exrc
file can be modified with the
.CW vi
editor, like any other file.
A sample
.CW \&.exrc
file might look like this:
.Ps
set wrapmargin=10  window=20
.Pe
Because the file is actually read by
.CW ex
before it enters visual mode (\c
.CW vi ),
commands in
.CW \&.exrc
should not have a preceding colon.
.Bh "Alternate Environments
.LP 0
You can define alternate
.CW vi
environments by saving option settings in an
.CW \&.exrc
file that is placed in a local directory.
If you enter
.CW vi
from that directory,
the local
.CW \&.exrc
file will be read in.
If it does not exist,
the one in your home directory will be read in.
.PP
For example, you might want to have one set of options for programming:
.Ps
set number lisp autoindent sw=4 tags=/usr/lib/tags terse
.Pe
and another set of options for text editing:
.Ps
set wrapmargin=15  ignorecase
.Pe
Local
.CW \&.exrc
files are especially useful
when you define abbreviations, which are described in Chapter 7.
.Bh "Some Useful Options
.LP 0
As you can see when you type
.CW ":set all" ,
there are many options.
Most options are used internally by
.CW vi
and aren't usually changed.
Others are important in certain cases,
but not in others
(for example,
.CW noredraw
and
.CW window
can be useful on a dialup line at a low baud rate).
Appendix A contains a brief description of each option.
We recommend that you take some time
to play with option setting\(emif an option looks interesting,
try setting it
(or unsetting it)
and watch what happens while you edit.
You may find some surprisingly useful tools.
.ix [vi] editor, wrapmargin %key vi editor, wrapmargin
.PP
There is one option that is almost essential for editing
nonprogram text.
The
.CW wrapmargin
option specifies the size of the right margin
that will be used to autowrap text as you type.
(This saves manually typing carriage returns).
This option is in effect if its value is set to greater than 0.
A typical value is 10 or l5.
.Ps
set wrapmargin=15
.Pe
.PP
There are also three options that control how
.CW vi
acts in conducting a search.
By default, it differentiates between uppercase and lowercase
(\fIfoo\fP does not match \fIFoo\fP),
wraps around to the beginning of the file during a search
(this means you can begin your search anywhere in the file
and still find all occurrences),
and recognizes wildcard characters when matching patterns.
The default settings that control these options are
.ix [vi] editor, search options %key vi editor, search options
.ig
	The original book has noignorcase.  This is wrong.
	Fixed by: Michael Hobgood
..
.CW noignorecase ,
.CW wrapscan ,
and
.CW magic ,
respectively.
To change any of these defaults,
set the opposite toggles:
.CW ignorecase ,
.CW nowrapscan ,
or
.CW nomagic .
.ix [vi] editor, shiftwidth %key vi editor, shiftwidth
.PP
Another useful option is
.CW shiftwidth .
This option was designed
to help programmers properly indent their programs,
but it can also be useful to writers.
The
.CW >>
and
.CW <<
commands can be used to indent
(or un-indent)
text by
.CW shiftwidth
characters.
The position of the cursor on the line doesn't matter\(emthe
entire line will be shifted.
The
.CW shiftwidth
option is set to 8 by default,
but you can use
.CW :set
to change this value.
.PP
Give the
.CW >>
or
.CW <<
.ig
	The original book had "to affect more than on line."
	This is wrong.  Fixed by Michael Hobgood.
..
command a numeric prefix to affect more than one line.
For example:
.Ps
10>>
.Pe
will indent the next 10 lines by
.CW shiftwidth .
.ix %end [vi] editor, setting options %key vi editor, setting options
.Ah "Edits and Movement
.LP 0
You have learned the edit commands
.CW c ,
.CW d ,
and
.CW y ,
and how to combine them with movements and numbers
.ix [vi] editor, numeric prefixes~to commands %key vi editor, numeric prefixes to commands
(such as
.CW 2cw
or
.CW 4dd).
Since that point,
you have added many more movement commands to your repertoire.
Although the fact
that you can combine edit commands with movement
is not a \(lqnew\(rq concept to you,
Table 3-2
gives you a feel for the many editing options you now have.
.Ts "Combining \f[CB]vi\fP Commands
.TS
center, box, tab(#);
l l l l
l lfCW lfCW lfCW.
From Cursor to#Change#Delete#Copy
_
Bottom of screen#cL#dL#yL
Next line#c+#d+#y+
Next sentence#c)#d)#y)
Next paragraph#c}#d}#y}
Pattern#c/\fIpattern\fP#d/\fIpattern\fP#y/\fIpattern\fP
End of file#cG#dG#yG
Line number 13#c13G#d13G#y13G
.TE
.Te
.ix %end [vi] editor %key vi editor
.ix [vi] editor, copying text %key vi editor, copying text
.ix [vi] editor, replacing characters %key vi editor, replacing characters
.sp -4p	\"adjust whitespace so it's even
.\" (even with what? -LK)
.PP
You can also combine numbers
with any of the commands in Table 3-2
to multiply them.
For example,
.CW 2c)
changes the next two sentences.
Although this table may seem forbidding,
experiment with combinations and try to understand the patterns.
When you find how much time and effort you can save,
combinations of change and movement keys will no longer seem obscure,
but will readily come to mind.
.ix [vi] editor, alternative insert commands %key vi editor, alternative insert commands
.Ah "More Ways to Insert Text
.LP 0
You have inserted text before the cursor with the sequence:
.Ps
i\fItext\fP <ESC>
.Pe
There are many insert commands.
The difference between them is
that they insert text at different positions
relative to the cursor:
.ix [vi] editor, append text %key vi editor, append text
.ix [vi] editor, opening~a new~line~for insertion %key vi editor, opening a new~line~for insertion
.RS
.IP \f(CWa 10
append text after cursor
.IP \f(CWA 10
append text to end of current line
.sp .5
.IP \f(CWi 10
insert text before cursor
.IP \f(CWI 10
insert text at beginning of line
.sp .5
.IP \f(CWo 10
open new line below cursor for text
.IP \f(CWO 10
open new line above cursor for text
.sp .5
.IP \f(CWR 10
overstrike existing characters with new characters
.RE
.LP
All these commands leave you in insert mode.
After inserting text, remember to press
.I ESC
to escape back to command mode.
.PP
The
.CW A
(\c
.I append )
and
.CW I
(\c
.I insert )
commands save you from having to move the cursor
to the end or beginning of the line
before invoking insert mode.
For example,
.CW A
saves one keystroke over
.CW $a .
Although one keystroke might not seem like a timesaver,
as you become a more adept
(and impatient) editor,
you'll want to omit any unnecessary keystrokes.
.PP
There are other combinations of commands
that work together naturally.
For example,
.CW ea
is useful for appending new text to the end of a word.
(It sometimes helps to train yourself
to recognize such frequent combinations
so that invoking them becomes automatic).
.Ah "Using Buffers
.LP 0
While you are editing,
you have seen that your last deletion
(\c
.CW d
or
.CW x )
or yank (
.CW y )
is saved in a buffer (a place in stored memory).
You can access the contents of that buffer
and put the saved text back in your file
with the put command (\c
.CW p
or
.CW P ).
.PP
The last nine deletions are stored by
.CW vi
in
.I numbered
buffers.
You can access any of these numbered buffers
.ix %begin [vi] editor, numbered buffers %key vi editor, numbered buffers
to restore any (or all) of the last nine deletions.
You can also place yanks (copied text) in buffers
identified by
.I letters .
You can fill up to 26 buffers
(\c
.I a
through
.I z )
with yanked text
and restore that text with a put command any time
in your editing session.
.ix [vi] editor, recovering deletions %key vi editor, recovering deletions
.ix [vi] editor, undoing last change %key vi editor, undoing last change
.PP
The
.CW vi
program also saves your last edit command
(insert, change, delete, or yank)
in a buffer.
Your last command is available to repeat
or undo with a single keystroke.
.Bh "Recovering Deletions
.LP 0
Being able to delete large blocks of text at a single bound
is all well and good,
but what if you mistakenly delete 53 lines that you need?
There is a way to recover any of your past nine deletions,
which are saved in numbered buffers.
The last deletion is saved in buffer 1;
the second-to-last in buffer 2,
and so on.
.PP
To recover a deletion,
type
.CW \(dq
(quotation mark),
identify the buffered text by number, and then give the put command.
For example,
to recover your second-to-last deletion from buffer 2, type:
.Ps
"2p
.Pe
.ix [vi] editor, showing contents~of numbered~buffers %key vi editor, showing contents of numbered~buffers
.PP
Sometimes it's hard to remember
what's in the last nine buffers.
Here's a trick that can help.
.PP
The
.CW \.
command (repeat last command)
has a special meaning when used with
.CW p
and
.CW u .
The
.CW p
command will print the last deletion or change,
but
.CW 2p
will print the last two.
By combining
.CW p ,
.CW \&.
(dot),
and
.CW u
(undo),
you can step back through the numbered buffers.
.PP
The
.CW \(dq1p
command will put the last deletion,
now stored in buffer 1, back into your text.
If you then type
.CW u ,
it will go away.
But when you type the
.CW \&.
command,
instead of repeating the last command (\c
.CW \(dq1p ),
it will show the next buffer as if you'd typed
.CW \(dq2p .
You can thus step back through the buffers.
For example, the sequence:
.Ps
"1pu.u.u.u.u.
.Pe
will show you, in sequence, the contents of the last six numbered buffers.
.ix %begin [vi] editor, named buffers %key vi editor, named buffers
.Bh "Yanking to Named Buffers
.LP 0
With unnamed buffers,
you have seen that you must put
(\c
.CW p
or
.CW P )
the contents of the buffer before making any other edit,
or the buffer is overwritten.
You can also use
.CW y
with a set of 26 named buffers
(\fIa\fP through \fIz\fP),
which are specifically for copying and moving text.
If you name a buffer to store the yanked text,
you can place the contents of the named buffer
at any time during your editing session.
.ix %end [vi] editor, numbered buffers %key vi editor, numbered buffers
.PP
To yank into a named buffer,
precede the yank command with a quotation mark (\c
.CW \(dq )
and the character for the name of the buffer you want to load.
For example:
.RS
.IP \f(CW"dyy 10
yank current line into buffer \fId\fP
.IP \f(CW"a6yy 10
yank next six lines into buffer \fIa\fP
.RE
.PP
After loading the named buffers and moving to the new position,
use
.CW p
or
.CW P
to put the text back.
.RS
.IP \f(CW"dP 10
put buffer \fId\fP before cursor
.IP \f(CW"ap 10
put buffer \fIa\fP after cursor
.RE
.ix [vi] editor, appending~to named buffers %key vi editor, appending to named buffers
.sp .7v
.ne 8
.X1
\zI_n our conversation last
Thursday, we discussed a
documentation project
that would produce a
user's manual on the
Alcuin product.




.X2
.CW \(dqa6yy
yank 6 lines
to buffer \fIa\fP
.X3
\zI_n our conversation last
Thursday, we discussed a
documentation project
that would produce a
user's manual on the
Alcuin product.


6 lines yanked

.X4
.LP
.ne 10
.X1
\zA_lcuin product.








.X2
.CW \(dqap
put buffer \fIa\fP
after cursor
.X3
.nf
Alcuin product.
\zI_n our conversation last
Thursday, we discussed a
documentation project
that would produce a
user's manual on the
Alcuin product.


.X4
.sp 1v
.LP 0
There is no way to put part of a buffer
into the text\(emit is all or nothing.
.PP
Named buffers allow you to make other edits
before placing the buffer with
.CW p .
After you know how to travel between files
without leaving
.CW vi ,
you can use named buffers to selectively transfer text between files.
.PP
You can also delete text into named buffers,
using much the same procedure.
For example:
.RS
.IP \f(CW"a5dd 10
delete five lines into buffer \fIa\fP
.RE
.LP
If you specify the buffer name with a capital letter,
yanked or deleted text
will be
.I appended
to the current contents of the buffer.
For example:
.RS
.IP \f(CW"byy 10
yank current line into buffer \fIb\fP
.IP \f(CW"B5dd 10
delete five lines and append to buffer \fIb\fP
.IP \f(CW3} 10
move down three paragraphs
.IP \f(CW"bP 10
insert the six lines from buffer \fIb\fP above the cursor
.RE
.LP
When you put text from a named buffer,
a copy still remains in that buffer;
you can repeat the put as often as you like
until you quit your editing session
or replace the text in the buffer.
.PP
For example, suppose you were preparing a document
with some repetitive elements,
such as the skeleton for each page
of the reference section in a manual.
You could store the skeleton in a named buffer,
put it into your file,
fill in the blanks,
then put the skeleton in again each time you need it.
.ix %end [vi] editor, named buffers %key vi editor, named buffers
.ix [vi] editor, marking place~in file %key vi editor, marking place in file
.ix marking~a position, in [vi] %key marking a position, in vi
.ix returning to~a marked position, in [vi] %key returning to a marked position, in vi
.Ah "Marking Your Place
.LP 0
During a
.CW vi
session, you can mark your place in the file
with an invisible \(lqbookmark,\(rq
perform edits elsewhere,
then return to your marked place.
In the command mode:
.RS
.IP \f(CW"m\fIx\fP 10
marks current position with \fIx\fP (\fIx\fP can be any letter)
.IP \f(CW"\'\fIx\fP 10
moves cursor to beginning of line marked by \fIx\fP
.IP \f(CW"\`\fIx\fP 10
moves cursor to character marked by \fIx\fP
.IP \f(CW"\`\` 10
returns to previous mark or context after a move
.RE
.sp .7v
.ne 8
.X1
Today, I'll start
putting together \za_
written plan that


.X2
.CW mxG
mark and move
to end of file
.X3
Sincerely,



\zF_red Caslon
.X4
.LP
.ne 8
.X1
Sincerely,



\zF_red Caslon
.X2
.CW `x
return to mark
.X3
Today, I'll start
putting together \za_
written plan that


.X4
.sp 1v
.LP 0
Place markers are set only during the current
.CW vi
session; they are not stored in the file.
.Ah "Other Advanced Edits
.LP 0
You may wonder why we haven't discussed global changes,
moving text between files,
.ix [vi] editor, moving text %key vi editor, moving text
or other advanced
.CW ex
topics.
The reason is that, to use these tools,
it helps to learn more about
.CW ex
and a set of UNIX pattern-matching tools
that we discuss together in Chapter 7.
