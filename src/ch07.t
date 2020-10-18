

.ig
	Typed up by: Heinz-Jürgen Oertel
	Marked up by: Heinz-Jürgen Oertel
	Proofed on: 13 Oct 2002
..
.so utp.mac
.utp
.chapter 7 "Advanced Editing" "Chapter" 1
.LP
.ix %begin [ex] editor %key ex editor
.ix %begin [vi] editor %key vi editor
Sometimes, in order to advance,
you have to go backward.
In this chapter, we are going to demonstrate
how you can improve your text-editing skills
by understanding how line editors work.
This doesn't mean you'll have to abandon full-screen editing.
The
.CW vi
editor was constructed on top of a line editor named
.CW ex ,
which was an improved version of another line editor named
.CW ed .
So in one sense we'll be looking at the ancestors of
.CW vi .
We'll look at many of the ways
line editors attack certain problems
and how that applies to those of us who use full-screen editors.
.PP
.ig
	The original book has "... terminals,"  This is wrong.
	Fixed by: Heinz-Jürgen Oertel
..
Line editors came into existence for use on \(lqpaper terminals\(rq,
which were basically printers.
This was before the time of video display terminals.
A programmer, or some other person of great patience,
worked somewhat interactively on a printer.
Typically, you saw a line of your file by printing it out on paper;
you entered commands that would affect just that line;
then you printed out the edited line again.
Line editors were designed for this kind of process,
editing one line at a time.
.PP
People rarely edit files on paper terminals any more,
but there are diehards who still prefer line editors.
For one thing, it imposes less of a burden on the computer.
Line editors display the current line;
they don't update the entire screen.
.PP
On some occasions,
a line editor is simpler and faster than a full-screen editor.
Sometimes, a system's response can be so slow
that it is less frustrating to work if you switch to a line editor.
Or you may have occasion to work remotely over a dial-up line
operating at a baud rate that is too slow
to work productively with a full-screen editor.
In these situations,
a line editor can be a way to improve your efficiency.
It can reduce the amount of time
you are waiting for the computer
to respond to your commands.
.PP
The truth is, however,
that after you switch from a screen editor to a line editor,
you are likely to feel deprived.
But you shouldn't skip this chapter
.ig
	The original book has: "using a line editor."  This
	is wrong.  It should read "using a full-screen"  Fixed.
	--Michael Hobgood
..
just because you won't be using a full-screen editor.
The purpose of learning
.CW ex
is to extend what you can do in
.CW vi .
.Ah "The \f[CB]ex\fP Editor
.LP
The
.CW ex
editor is a line editor with its own complete set of editing commands.
Although it is simpler to make most edits with
.CW vi ,
the line orientation of
.CW ex
is an advantage when you are making large-scale changes
to more than one part of a file.
With
.CW ex ,
you can move easily between files
and transfer text from one file to another
in a variety of ways.
You can search and replace text on a line-by-line basis,
or globally.
You can also save a series of editing commands as a macro
and access them with a single keystroke.
.PP
Seeing how
.CW ex
works when it is invoked directly
will help take some of the \(lqmystery\(rq
out of line editors
and make it more apparent to you how many
.CW ex
commands work.
.PP
Let's open a file and try a few
.CW ex
commands.
After you invoke
.CW ex
on a file,
you will see a message about the total number of lines in the file,
and a colon command prompt.
For example:
.Ps
$ \f[CB]ex intro\fP
 "intro" 20 lines, 731 characters
:
.Pe
.ix [ex] editor, invoking %key ex editor, invoking
.LP
You won't see any lines in the file,
unless you give an
.CW ex
command that causes one or more lines to be printed.
.ix [ex] editor, printing line(s) %key ex editor, printing line(s)
.ix [ex] editor, syntax~of commands %key ex editor, syntax of commands
.PP
All
.CW ex
commands consist of a line address,
which can simply be a line number,
and a command.
You complete the command with a carriage return.
A line number by itself
is equivalent to a print command for that line.
So, for example,
if you type the numeral 1 at the prompt,
you will see the first line of the file:
.Ps
:1
Sometimes, to advance,
:
.Pe
.ix [ex] editor, range~of lines %key ex editor, range of lines
.LP
To print more than one line,
you can specify a range of lines.
Two line numbers are specified,
separated by commas, with no spaces in between them:
.Ps
:1,3
Sometimes, to advance,
you have to go backward.
Alcuin is a computer graphics tool
.Pe
.ix [ex] editor, current line %key ex editor, current line
.LP
The current line is the last line affected by a command.
For instance, before we issued the command
.CW 1,3 ,
line 1 was the current line;
after that command, line 3 became the current line.
It can be represented by a special symbol, a dot (\c
.CW . ).
.Ps
:.,+3
that lets you design and create hand-lettered, illuminated
manuscripts, such as were created in the Middle Ages.
.Pe
.LP
The previous command results in three more lines being printed,
starting with the current line.
A
.CW +
or
.CW -
specifies a positive or negative offset from the current line.
.ix [ex] editor, command mode %key ex editor, command mode
.ix [ex] editor, insert mode %key ex editor, insert mode
.PP
The
.CW ex
editor has a command mode and an insert mode.
To put text in a file,
you can enter the
.CW append
or
.CW a
command to place text on the line following the current line.
The
.CW insert
or
.CW i
command places text on the line above the current line.
Type in your text and when you are finished,
.ix [ex] editor, leaving insert mode %key ex editor, leaving insert mode
enter a dot (\c
.CW . )
on a line by itself:
.Ps
:a
Monks, skilled in calligraphy,
labored to make copies of ancient
documents and preserve in a
library the works of many Greek and
Roman authors.
\&.
:
.Pe
.LP
Entering the dot takes you out of insert mode
and puts you back in command mode.
.PP
A line editor does not have a cursor,
and you cannot move along a line of text to a particular word.
Apart from not seeing more of your file,
the lack of a cursor
(and therefore cursor motion keys)
is probably the most difficult thing to get used to.
After using a line editor,
you long to get back to using the
.CW cw
command in
.CW vi .
.PP
If you want to change a word,
you have to move to the line that contains the word,
tell the editor which word on the line you want to change,
and then provide its replacement.
You have to think this way to use the
.ix %begin [ex] editor, substitute command %key ex editor, substitute command
.CW substitute
or
.CW s
command.
It allows you to substitute one word for another.
.PP
We can change the last word on the first line from
.I tool
to
.I environment :
.Ps
:1
Alcuin is a computer graphics tool
:s/tool/environment/
Alcuin is a computer graphics environment
:
.Pe
.LP
The word you want to change and its replacement
are separated by slashes (\c
.CW / ).
As a result of the substitute command,
the line you changed is printed.
.PP
With a line editor,
the commands that you enter affect the current line.
Thus, we made sure that the first line was our current line.
We could also make the same change
by specifying the line number with the command:
.Ps
:1s/environment/tool/
Alcuin is a computer graphics tool
.Pe
If you specify an
.I address ,
such as a range of line numbers,
.ix [ex] editor, range~of lines %key ex editor, range of lines
then the command will affect the lines that you specify:
.Ps
    :1,20s/Alcuin/ALCUIN/
    ALCUIN is named after an English scholar
.Pe
.LP
The last line on which a substitution was made is printed.
.PP
Remember, when using a line editor,
you have to tell the editor which line
(or lines)
to work on as well as which command to execute.
.PP
Another reason that knowing
.CW ex
is useful is that sometimes when you are working in
.CW vi ,
.ig
	The original book has "... mode."  This is wrong.
	Fixed by: Heinz-Jürgen Oertel
..
you might unexpectedly find yourself using \(lqopen mode\(rq.
For instance,
if you press
.CW Q
while in
.CW vi ,
you will be dropped into the
.CW ex
editor.
You can switch to
.CW vi
by entering the command
.CW vi
at the colon prompt:
.Ps
:vi
.Pe
.PP
After you are in
.CW vi ,
you can execute any
.CW ex
command by first typing a
.CW :
(colon).
.ix [ex] editor, executing from [vi] %key ex editor, executing from [vi]
The colon appears on the bottom of the screen
and what you type will be echoed there.
Enter an
.CW ex
command and press
.I RETURN
to execute it.
.Ah "Using \f[CB]ex\fP Commands in \f[CB]vi\fP"
.ix [vi] editor, [ex] commands~in %key vi editor, [ex] commands in
.LP
Many
.CW ex
commands that perform normal editing operations
have equivalent
.CW vi
commands that do the job in a simpler manner.
Obviously, you will use
.CW dw
or
.CW dd
to delete a single word or line rather than using the
.CW delete
command in
.CW ex .
However, when you want to make changes that affect numerous lines,
you will find that the
.CW ex
commands are very useful.
They allow you to modify large blocks of text
with a single command.
.PP
Some of these commands and their abbreviations follow.
You can use the full command name or the abbreviation,
whichever is easier to remember.
.ix [ex] editor, copying lines %key ex editor, copying lines
.ix [ex] editor, deleting lines %key ex editor, deleting lines
.ix [ex] editor, moving lines %key ex editor, moving lines
.RS
.TS
lfCW lfCW l.
delete	d	Delete lines
move	m	Move lines
copy	co	Copy lines
substitute	s	Substitute one string for another
.TE
.RE
.LP
The substitute command best exemplifies the
.CW ex
editor's ability to make editing easier.
It gives you the ability to change any string of text
every place it occurs in the file.
To perform edits on a global replacement basis
requires a good deal of confidence in,
as well as full knowledge of,
.ig
	The original book has "... expressions."  This is wrong.
	Fixed by: Heinz-Jürgen Oertel
..
the use of pattern matching or \(lqregular expressions\(rq.
Although somewhat arcane,
learning to do global replacements
can be one of the most rewarding experiences
of working in the UNIX text-processing environment.
.PP
Other
.CW ex
commands give you additional editing capabilities.
For all practical purposes,
they can be seen as an integrated part of
.CW vi .
Examples of these capabilities
are the commands for editing multiple files
and executing UNIX commands.
We will look at these after we look at pattern-matching
and global replacements.
.ix %end [ex] editor, substitute command %key ex editor, substitute command
.Ah "Write Locally, Edit Globally
.ix search
.LP
Sometimes, halfway through a document or at the end of a draft,
you recognize inconsistencies in the way
that you refer to certain things.
Or, in a manual, some product that you called by name
is suddenly renamed (marketing!).
Often enough, you have to go back
and change what you've already written in several places.
.ix %begin [ex] editor, search~and~replace %key ex editor, search and~replace
.PP
The way to make these changes
is with the search and replace commands in
.CW ex .
You can automatically replace a word
(or string of characters)
wherever it occurs in the file.
You have already seen one example of this use of the substitute command,
when we replaced
.I Alcuin
with
.I ALCUIN .
.Ps
:1,20s/Alcuin/ALCUIN/
.Pe
.LP
There are really two steps in using a search and replace command.
The first step is to define the area in which a search will take place.
The search can be specified locally
to cover a block of text
or globally to cover the entire file.
The second step is to specify,
using the substitute command,
the text that will be removed and the text that will replace it.
.PP
At first, the syntax for specifying a search and replace command
may strike you as difficult to learn,
especially when we introduce pattern matching.
Try to keep in mind that this is a very powerful tool,
one that can save you a lot of drudgery.
Besides, you will congratulate yourself when you succeed,
and everyone else will think you are very clever.
.Bh "Searching Text Blocks
.ix [ex] editor, line addressing~in %key ex editor, line addressing in
.LP
To define a search area,
you need to be more familiar with how line addressing works in
.CW ex .
A line address simply indicates which line
or range of lines
an
.CW ex
command will operate on.
If you don't specify a line address,
the command only affects the current line.
You already know that you can indicate any individual line
by specifying its number.
What we want to look at now
are the various ways of indicating a block of text in a file.
.PP
You can use absolute or relative line numbers
to define a range of lines.
Identify the line number of the start of a block of text
and the line number of the end of the block.
In
.CW vi ,
you can use
.CW ^G
to find the current line number.
.PP
There are also special symbols for addressing particular places in the file:
.RS
.TS
lf(CW)w(10n) l.
\&.	Current line
$	Last line
%	All lines (same as \f(CW1,$\fP)
.TE
.RE
.LP
The following are examples that define the block of text
that the substitute command will act upon:
.RS
.TS
lfCW l.
:.,$s	Search from the current line to the end of the file
:20,.s	Search from line 20 through the current line
:.,.+20s	Search from the current line through the next 20 lines
:100,$s	Search from line 100 through the end of the file
:%s	Search all lines in the file
.TE
.RE
Within the search area,
as defined in these examples,
the substitute command will look for one string of text
and replace it with another string.
.PP
You can also use pattern matching
to specify a place in the text.
A pattern is delimited by a slash both
.I before
and
.I after
it.
.RS
.TS
lfCW lw(4.0i).
/\fIpattern1\fP/,/\fIpattern2\fP/\f(CWs\fP	T{
Search from the first line containing
.I pattern1
through the first line containing
.I pattern2
T}
:.,/\fIpattern\fP/\f(CWs\fP	T{
Search from the current line through the line containing
.I pattern
T}
.TE
.RE
.LP
It is important to note
that the action takes place
on the entire line containing the pattern,
not simply the text up to the pattern.
.Bh "Search and Replace
.LP
You've already seen the substitute command
used to replace one string with another one.
A slash is used as a delimiter separating the old string and the new.
By prefixing the
.CW s
command with an address,
you can extend its range beyond a single line:
.Ps
:1,20s/Alcuin/ALCUIN/
.Pe
.LP
Combined with a line address,
this command searches all the lines within the block of text.
But it only replaces the first occurrence of the pattern on each line.
For instance, if we specified a substitute command
replacing
.I roman
with
.I Roman
in the following line:
.Ps
after the roman hand.  In teaching the roman script
.Pe
.LP
only the first, not the second, occurrence of the word would be changed.
.PP
To specify each occurrence on the line,
you have to add a
.CW g
at the end of the command:
.Ps
:s/roman/Roman/g
.Pe
.LP
This command changes
.I every
occurrence of
.I roman
to
.I Roman
on the current line.
.PP
Using search and replace
is much faster than finding each instance of a string
and replacing it individually.
It has many applications, especially if you are a poor speller.
.PP
So far, we have replaced one word with another word.
Usually, it's not that easy.
A word may have a prefix or suffix that throws things off.
In a while, we will look at pattern matching.
This will really expand what you are able to do.
But first, we want to look
at how to specify
that a search and replace take place globally in a file.
.Bh "Confirming Substitutions
.ix [ex] editor, confirming replacements %key ex editor, confirming replacements
.LP
It is understandable
if you are over-careful when using a search and replace command.
It does happen that what you get is not what you expected.
You can undo any search and replacement command by entering
.CW u .
But you don't always catch undesired changes
until it is too late to undo them.
Another way to protect your edited file
is to save the file with
.CW :w
before performing a replacement.
Then, at least you can quit the file
without saving your edits
and go back to where you were before the change was made.
You can also use
.CW :e!
to read in the previous version of the buffer.
.PP
It may be best to be cautious
and know exactly what is going to be changed in your file.
If you'd like to see what the search turns up
and confirm each replacement before it is made,
add a
.CW c
at the end of the substitute command:
.Ps
:1,30s/his/the/gc
.Pe
It will display the entire line
where the string has been located
.ig
	The original book has ^^^ in Roman font. This is wrong.
	Fixed by: Heinz-Jürgen Oertel
..
and the string itself will be marked by a series of carets (\c
.CW ^^^ ).
.Ps
copyists at his school
            ^^^
.Pe
.LP
If you want to make the replacement,
you must enter
.CW y
and press
.I RETURN .
.PP
If you don't want to make a change,
simply press
.I RETURN .
.Ps
this can be used for invitations, signs, and menus.
 ^^^
.Pe
.LP
The combination of the
.CW vi
commands
.ig
	The original book has // in Roman font.  This is wrong.
	Fixed by: Heinz-Jürgen Oertel
..
.CW //
(repeat last search) and
.CW \&.
(repeat last command)
is also an extraordinarily useful
(and quick)
way to page through a file
and make repetitive changes
that require a judgment call rather than an absolute global replacement.
.ix %end [ex] editor, search~and~replace %key ex editor, search and~replace
.Bh "Global Search and Replace
.ix [ex] editor, global search~and~replace %key ex editor, global search and~replace
.LP
When we looked at line addressing symbols,
the percent symbol,
.CW % ,
was introduced.
If you specify it with the substitute command,
the search and replace command will affect all lines in the file:
.Ps
:%s/Alcuin/ALCUIN/g
.Pe
.LP
This command searches all lines
and replaces each occurrence on a line.
.PP
There is another way to do this,
which is slightly more complex but has other benefits.
The pattern is specified as part of the address,
preceded by a
.CW g
indicating that the search is global:
.Ps
:g/Alcuin/s//ALCUIN/g
.Pe
It selects all lines containing the pattern
.I Alcuin
and replaces every occurrence of that pattern with
.I ALCUIN .
Because the search pattern is the same as the word you want to change,
you don't have to repeat it in the
.CW substitute
command.
.PP
The extra benefit that this gives
is the ability to search for a pattern
and then make a different substitution.
We call this context-sensitive replacement.
.PP
The gist of this command is globally search for a pattern:
.Ps
:g/\fIpattern\fP/
.Pe
Replace it:
.Ps
:g/\fIpattern\fP/s//
.Pe
or replace another string on that line:
.Ps
:g/\fIpattern\fP/s/\fIstring\fP/
.Pe
with a new string:
.Ps
:g/\fIpattern\fP/s/\fIstring\fP/\fInew\fP/
.Pe
and do this for every occurrence on the line.
.Ps
:g/\fIpattern\fP/s/\fIstring\fP/\fInew\fP/g
.Pe
For example, we use the macro
.CW \&.BX
to draw a box around the name of a special key.
To show an
.I ESCAPE
key in a manual, we enter:
.Ps
\&.BX Esc
.Pe
Suppose we had to change
.I Esc
to
.I ESC ,
but we didn't want to change any references to
.I Escape
in the text.
We could use the following command to make the change:
.Ps
:g/BX/s/Esc/ESC/
.Pe
This command might be phrased:
\(lqGlobally search for each instance of
.CW BX
and on those lines substitute the
.CW Esc
with
.CW ESC \(rq.
We didn't specify
.CW g
at the end of the command
because we would not expect more than one occurrence per line.
.PP
Actually, after you get used to this syntax,
and admit that it is a little awkward,
you may begin to like it.
.Ah "Pattern Matching
.ix %begin regular expressions
.ix [ex] editor, pattern~matching %key ex editor, pattern matching
.LP
If you are familiar with
.CW grep ,
then you know something about regular expressions.
In making global replacements,
you can search not just for fixed strings of characters,
but also for patterns of words,
referred to as
.I "regular expressions" .
.PP
When you specify a literal string of characters,
the search might turn up other occurrences that you didn't want to match.
The problem with searching for words in a file
is that a word can be used in many different ways.
Regular expressions help you
conduct a search for words in context.
.PP
Regular expressions are made up by combining normal characters
with a number of special characters.
The special characters and their use follow.*
.FS
*
.CW \e(
and
.CW \e) ,
and
.CW \e{\fIn\fP,\fIm\fP\e}
are not supported in all versions of
.CW vi .
.CW \e< ,
.CW \e> ,
.CW \eu ,
.CW \eU ,
.CW \el ,
and
.CW \eL
are supported
only in
.CW vi/ex ,
and not in other programs using regular expressions.
.FE
.RS
.TS
lfCW lw(4.5i).
\&.	T{
Matches any single character except newline.
T}
.sp 4p
*	T{
Matches any number
(including 0)
of the single character
(including a character specified by a regular expression)
that immediately precedes it.
For example, because
.CW \&.
(dot)
means any character,
.CW \&.*
means
match any number of any character.
T}
.sp 4p
[...]	T{
Matches any one of the characters enclosed between the brackets.
For example, [\c
.I AB ]
matches either
.I A
or
.I B .
A range of consecutive characters can be specified
by separating the first and last characters in the range
with a hyphen.
For example,
.CW [A-Z]
will match any uppercase letter from
.I A
to
.I Z
and
.CW [0-9]
will match any digit from
.I 0
to
.I 9 .
T}
.sp 4p
\e{\fIn\fP,\fIm\fP}\e	T{
Matches a range of occurrences of the single character
(including a character specified by a regular expression)
that immediately precedes it.
The
.I n
and
.I m
are integers between 0 and 256
that specify how many occurrences to match.
.CW \e{\fIn\fP\e}
will match exactly
.I n
occurrences,
.CW \e{\fIn\fP,\e}
will match at least
.I n
occurrences,
and
.CW \e{\fIn\fP,\fIm\fP\e}
will match any number of occurrences between
.I n
and
.I m .
For example,
.CW A\e{2,3\e}
will match either
.I AA
.ig
	The original book has ) at the wrong place.
	Fixed by: Heinz-Jürgen Oertel
..
(as in
.I AARDVARK )
or
.I AAA
but will not match
the single letter
.I A .
T}
.sp 4p
^	T{
Requires that the following regular expression
be found at the beginning of the line.
T}
.sp 4p
$	T{
Requires that the preceding regular expression
be found at the end of the line.
T}
.sp 4p
\\	T{
Treats the following special character
as an ordinary character.
For example,
.CW \e.
stands for a period
and
.CW \e*
for an asterisk.
T}
.sp 4p
\e(	T{
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
T}
.sp 4p
\e\fIn\fP	T{
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
.ig
We have an inconsistency here: it says n is 0-9,
and in the previous row it says 1-9. I'm not sure
which way it should be so I'll leave it for now. --LK
..
T}
.sp 4p
\e< \e>	T{
Matches characters at the beginning (\c
.CW \e< )
or at the end  (\c
.CW \e> )
of a word.
The expression
.CW \e<ac
would only match words that begin
with
.I ac ,
such as
.I action
but not
.I react .
T}
.sp 4p
&	T{
Prints the entire search pattern when used in a replacement string.
T}
.sp 4p
\eu	T{
Converts the first character of the replacement string to uppercase.
T}
.sp 4p
\eU	T{
Converts the replacement string to uppercase as in
.CW ":/Unix/\eU&/" .
T}
.sp 4p
\el	T{
Converts the first character of the replacement string to lowercase,
as in
.br
.CW ":s/ Act/\el&/" .
T}
.sp 4p
\eL	T{
Converts the replacement string to lowercase.
T}
.TE
.RE
.LP
Unless you are already familiar with UNIX's wildcard characters,
this list of special characters probably looks complex.
A few examples should make things clearer.
In the examples that follow,
a square (\(sq) is used to mark a blank space.
.PP
Let's follow how you might use some special characters in a replacement.
Suppose you have a long file
and you want to substitute the word
.I balls
for the word
.I ball
throughout that file.
You first save the edited buffer with
.CW :w ,
then try the global replacement:
.ix [ex] editor, global search~and~replace %key ex editor, global search and~replace
.Ps
:g/ball/s//balls/g
.Pe
.LP
When you continue editing,
you notice occurrences of words such as
.I ballsoon ,
.I globallsy ,
and
.I ballss .
Returning to the last saved buffer with
.CW :e! ,
you now try specifying a space after
.I ball
to limit the search:
.Ps
:g/ball\(sq/s//balls\(sq/g
.Pe
.LP
But this command misses the occurrences
.I ball. ,
.I ball, ,
.I ball: ,
and so on.
.Ps
:g/\e<ball\e>/s//balls/g
.Pe
.ix [ex] editor, limiting search~to~complete words %key ex editor, limiting search to~complete words
.LP
By surrounding the search pattern with
.CW \e<
and
.CW \e> ,
we specify that the pattern should only match entire words,
with or without a subsequent punctuation mark.
Thus, it does not match the word
.I balls
if it already exists.
.PP
Because the
.CW \e<
and
.CW \e>
are only available in
.CW ex
(and thus
.CW vi ),
you may have occasions to use a longer form:
.Ps
:g/ball\e([\(sq,.;:!?]\e)/s//balls\\1/g
.Pe
.LP
This searches for and replaces
.I ball
followed by either a space (indicated by
.CW \(sq )
or any one of the punctuation characters
.CW " , . ; : ! ?" .
Additionally, the character that is matched
is saved using
.CW \e(
and
.CW \e)
and restored on the right-hand side with
.CW \e1 .
The syntax may seem complicated,
but this command sequence can save you a lot of work
in a similar replacement situation.
.Bh "Search for General Classes of Words
.ix [ex] editor, search~for general classes~of words %key ex editor, search for general classes~of words
.LP
The special character
.CW &
is used in the replacement portion of a substitution command
to represent the pattern that was matched.
It can be useful in searching for
and changing similar but different words and phrases.
.PP
For instance,
a manufacturer decides to make a minor change
to the names of their computer models,
necessitating a change in a marketing brochure.
The
.I HX5000
model has been renamed the
.I "Series HX5000" ,
along with the
.I HX6000
and
.I HX8500
models.
Here's a way to do this using the
.CW &
character:
.Ps
:g/HX[568][05]00/s//Series &/g
.Pe
.LP
This changes
.I HX8500
to
.I "Series HX8500" .
The
.CW &
character is useful
when you want to replay the entire search pattern and add to it.
If you want to capture only part of the search pattern,
you must use
.CW \e(
and
.CW \e)
and replay the saved pattern with
.ig
	The original book finishes the sentence with ".)"  This is wrong.
	Fixed by: Heinz-Jürgen Oertel
..
.CW "\e1 ... \e\fIn\fP" .
.PP
For instance,
the same computer manufacturer decides to drop the
.I HX
from the model numbers
and place
.I Series
after that number.
We could make the change using the following command:
.Ps
:g/\e(Series\e) HX\e([568])[05]00\e)/s//\e2 \e1/g
.Pe
.LP
This command replaces
.I "Series HX8500"
with
.I "8500 Series" .
.PP
Suppose you have subroutine names
beginning with the prefixes
.CW mgi ,
.CW mgr ,
and
.CW mga .
.Ps
mgibox routine
mgrbox routine
mgabox routine
.Pe
.LP
If you want to save the prefixes,
but want to change the name
.I box
to
.I square ,
either of the following replacement commands will do the trick:
.Ps
.ig
	The original printed book had the following line as:
	":g/mg([iar])box/s//mg\1square/" which is wrong.
	It should read: "\([iar]\)".  Found and fixed by Heinz.
	--Michael Hobgood
..
:g/mg\e([iar]\e)box/s//mg\e1square/
.Pe
.LP
The global replacement keeps track of
whether an
.CW i ,
.CW a ,
or
.CW r
is saved, so that only
.I box
is changed to
.I square .
This has the same effect as the previous command:
.Ps
:g/mg[iar]box/s/box/square/g
.Pe
The result is:
.Ps
mgisquare routine
mgrsquare routine
mgasquare routine
.Pe
.Bh "Block Move by Patterns
.ix [ex] editor, moving text~blocks~by patterns %key ex editor, moving text blocks~by patterns
.LP
You can edit blocks of text delimited by patterns.
For example,
assume you have a 150 page reference manual.
.ig
	The original printed book had the following line as:
	"references pages".  This is wrong. Fixed.
	--Michael Hobgood
..
All reference pages are organized in the same way:
a paragraph with the heading
.I SYNTAX ,
followed by
.I DESCRIPTION ,
followed by
.I PARAMETERS .
A sample of one reference page follows:
.Ps
\&.Rh 0 "Get status of named file" "STAT"
\&.Rh "SYNTAX"
\&.nf
integer*4 stat, retval
integer*4 status(11)
character*123 filename
\&...
retval = stat (filename, status)
\&.fi
\&.Rh "DESCRIPTION"
Writes the fields of a system data structure into the
status array.  These fields contain (among other
things) information about the file's location, access
privileges, owner, and time of last modification.
\&.Rh "PARAMETERS"
\&.IP "filename" 15n
.ix [ex] editor, pattern~matching %key ex editor, pattern matching
A character string variable or constant containing
the UNIX pathname for the file whose status you want
to retrieve.  You can give the...
.Pe
.LP
Suppose that you decide to move
.I DESCRIPTION
above the
.I SYNTAX
paragraph.
With pattern matching,
you can move blocks of text on all 150 pages with one command!
.Ps
:g/SYNTAX/,/DESCRIPTION/-1,mo/PARAMETERS/-1
.Pe
.LP
This command moves the block of text
between the line containing the word
.I SYNTAX
and the line just before the word
.I DESCRIPTION
(\c
.CW /DESCRIPTION/-1 )
to the line just before
.I PARAMETERS .
In a case like this, one command literally saves hours of work.
.PP
This applies equally well to other
.CW ex
commands.
For example,
if you wanted to delete all
.I DESCRIPTION
paragraphs in the reference chapter,
you could enter:
.ig
	The original book has:
.\"        :g/SYNTAX/,/DESCRIPTION/-1,d
	This is wrong.
	Fixed by: Heinz-Jürgen Oertel
..
.Ps
:g/DESCRIPTION/,/PARAMETERS/-1,d
.Pe
.LP
This very powerful kind of change
is implicit in the
.CW ex
editor's line addressing syntax,
but is not readily apparent.
For this reason, whenever you are faced with a complex,
repetitive editing task,
take the time to analyze the problem
and find out if you can apply pattern-matching tools to do the job.
.Bh "More Examples
.LP
Because the best way to learn pattern matching is by example,
the following section gives a list of examples
with brief explanations.
Study the syntax carefully,
so that you understand the principles at work.
You should then be able to adapt them to your situation.
.RS
.TS
c lw(5i).
1.	T{
Delete all blank lines:
.Ps
:g/^$/d
.Pe
What you are matching is the beginning of the line followed by the end of
the line, with nothing in between.
T}
.sp 4p
2.	T{
Put
.CW troff
italic codes around the word
.I RETURN :
.Ps
:g/RETURN/s//\e\efIRETURN\e\efR/g
.Pe
Notice that two backslashes (\c
.CW \e\e )
are needed in the replacement,
because the backslash in the
.CW troff
italic code will be interpreted as a special character.
(\c
.CW \efI
alone would be interpreted as
.CW fI ;
it takes
.CW \e\efI
to get
.CW \efI ).
T}
.sp 4p
3.	T{
Modify a list of pathnames in a file:
.Ps
:g/\e/usr\e/tim/s//\e/usr\e/linda/g
.Pe
A slash (used as a delimiter in the global replacement
sequence)
must be escaped with a backslash
when it is part of the pattern or replacement;
use
.CW \e/
to get
.CW / .
Another way to achieve this same effect
is to use a different
character as the pattern delimiter.
For example, you could make the previous replacement
as follows:
.Ps
:g:/usr/tim:s::/usr/linda:g
.Pe
T}
.sp 4p
4.	T{
Change all periods to semicolons in lines 1 to 10:
.Ps
:1,10g/\e./s//;/g
.Pe
A period is a special character and must be escaped
with a backslash.
T}
.sp 4p
5.	T{
Reverse the order of all hyphen-separated items in a list:
.Ps
:g/\e(.*\e)\(sq-\(sq\e(.*\e)/s//\e2\(sq-\(sq\e1/
.Pe
The effect of this command on several items is:
.ig
	The original book has
	more-display files becomes display files-more
	lp-print files becomes print files-lp
	Fixed by: Heinz-Jürgen Oertel

	Added some highlighting to make the example
	more clear. --LK
..
.Ps
\f(CWmore - display files\fP becomes \f(CWdisplay files - more\fP
\f(CWlp - print files\fP becomes \f(CWprint files - lp\fP
.Pe
T}
.sp 4p
6.	T{
Standardize various uses of a word or heading:
.Ps
:g/^Example[\(sqs:]/s//Examples:\(sq/g
.Pe
Note that the brackets enclose three characters:
a space (represented in the example by
.CW \(sq) ,
a colon, and the letter
.CW s .
Therefore, this command searches for
.I Example\(sq ,
.I Examples ,
or
.I Example:
at the beginning of a line
and replaces it with
.I Examples: .
(If you don't include the space,
.I Examples
would be replaced with
.I Exampless: ).
.sp
As another similar example,
change all occurrences of the word
.I help
(or
.I Help )
to
.I HELP :
.Ps
:g/[Hh]elp/s//HELP/g
.Pe
T}
.sp 4p
7.	T{
Replace
.I "one or more"
spaces with a single space:
.Ps
:g/\(sq\(sq*/s//\(sq/g
.Pe
Make sure you understand how the asterisk works as a special character.
An asterisk following any character
(or any regular expression that matches a single character,
such as
.CW .
or
.CW [a-z] )
matches
.I "zero or more"
instances of that character.
Therefore, you must specify
.I two
spaces followed by an asterisk
to match one or more spaces (one plus zero or more).
T}
.sp 4p
8.	T{
Replace one or more spaces following a colon with two spaces:
.Ps
:g/:\(sq\(sq*/s//:\(sq\(sq/g
.Pe
T}
.sp 4p
9.	T{
Replace one or more spaces following a period
.I or
a colon
with two spaces:
.Ps
:g/\e([:.]\e)\(sq\(sq*/s//\e1\(sq\(sq/g
.Pe
Either of the two characters within brackets can be matched.
This character is saved, using parentheses,
and restored on the right-hand side as
.CW 1 .
Note that a special character
such as a period does not need to be escaped within brackets.
T}
.sp 4p
10.	T{
Delete all leading blanks on a line:
.Ps
:g/^\(sq\(sq*\e(.*\e)/s//\e1/g
.Pe
Search for one or more blanks at the beginning of a line;
save the rest of the line and replace it without any leading blanks.
T}
.sp 4p
11.	T{
Delete all trailing blanks:
.Ps
:g/\(sq\(sq*$/s///
.Pe
T}
.sp 4p
12.	T{
Remove manual numbering from section headings
(e.g.,
.I "1.1 Introduction)"
in a document:
.Ps
:g/[1-9]\e.[1-9]*\e(.*\e)/s//\e1/g
.Pe
A hyphen-separated pair of letters or digits
enclosed in square brackets
.ig
	Original has e.g, should be e.g.,
	--Michael Hobgood
..
(e.g.,
.CW [1-9] )
specifies a range of characters.
T}
.sp 4p
13.	T{
Change manually numbered section heads
(e.g.,
.I 1.1 ,
.I 1.2 )
to a
.CW troff
macro (e.g.,
.CW \&.Ah
for an
.I "A-level heading" ):
.Ps
:g/^[1-9]\e.[1-9]/s//\e.Ah/
.Pe
T}
.sp 4p
14.	T{
Show macros in the output by protecting them from interpretation.
Putting
.CW \e&
in front of a macro prevents
.CW troff
from expanding them.
This command was used frequently throughout this book
to print an example that contained macros.
Three backslashes are needed in the replacement pattern:
two to print a backslash
and one to have the first ampersand interpreted literally:
.ig
	Above sentence had a period at the end in the original.
	To be consistent with the other 13 items, it should have
	a :
	Of course, the verbage for the explanation should be
	under the example command, not above it.
	--Michael Hobgood
..
.Ps
:g/^\e./s//\e\e\e&&/
.Pe
T}
.TE
.RE
.ix %end regular expressions
.Ah "Writing and Quitting Files
.ix [ex] editor, exiting %key ex editor, exiting
.ix [ex] editor, saving files %key ex editor, saving files
.LP
You have learned the
.CW vi
command
.CW ZZ
to quit and write (save) your file.
But you will usually want to exit a file using
.CW ex
commands, because these commands give you greater control.
.RS
.IP \f(CW:w 10
Writes (saves) the buffer to the file but does not exit.
You can use
.CW :w
throughout your editing session to protect your edits against system failure
or a major editing error.
.IP \f(CW:q 10
Quits the file (and returns to the UNIX prompt).
.IP \f(CW:wq 10
Both writes and quits the file.
.RE
.PP
The
.CW vi
editor protects existing files and your edits in the buffer.
For example,
if you want to write your buffer to an existing file,
.CW vi
will give you a warning,
because this would delete the original file.
Likewise, if you have invoked
.CW vi
on a file, made
edits, and want to quit
.I without
saving the edits,
.CW vi
will give you an error message such as:
.Ps
No write since last change.
.Pe
.LP
These warnings can prevent costly mistakes,
but sometimes you want to proceed with the command anyway.
An exclamation mark (\c
.CW ! )
after your command overrides this warning:
.Ps
:w! \fIfilename\fP
:q!
.Pe
.LP
The
.CW :q!
.ix [ex] editor, quitting~without saving edits %key ex editor, quitting without saving edits
command is an essential editing command
that allows you to quit without affecting the original file,
regardless of any changes you made in the session.
The contents of the buffer are discarded.
.Bh "Renaming the Buffer
.ix [ex] editor, renaming~the buffer %key ex editor, renaming the buffer
.LP
You can also use
.CW :w
to save the entire buffer
(the copy of the file you are editing)
under a new filename.
.PP
Suppose that you have a file
.CW letter
that contains 600 lines.
You call in a copy and make extensive edits.
You want to quit and save
.I both
the old version of
.CW letter
and your new edits for comparison.
To rename your buffer
.CW letter.new ,
give the command:
.Ps
:wq letter.new
.Pe
.Bh "Saving Part of a File
.ix [ex] editor, saving part~of~a file %key ex editor, saving part of~a file
.LP
In an editing session,
you will sometimes want to save just part of your file
as a separate, new file.
For example,
you might have entered formatting codes and text
that you want to use as a header for several files.
.PP
You can combine
.CW ex
line addressing with the write command,
.CW w ,
to save part of a file.
For example,
if you are in the file
.CW letter
and want to save part of
.CW letter
as the file
.CW newfile ,
you could enter:
.Ps
:230,$w newfile
.Pe
.LP
which saves from line 230 to the end of the file, or:
.Ps
:.,600w newfile
.Pe
.LP
which saves from the current line to line 600 in
.CW newfile .
.Bh "Appending to a Saved File
.ix [ex] editor, appending~to existing file %key ex editor, appending to existing file
.LP
You can use the UNIX redirect and append operator (>>) with
.CW w
to append the contents of the buffer to an existing file.
For example:
.Ps
:1,10w newfile
:340,$w>>newfile
.Pe
.LP
The existing file,
.CW newfile ,
will contain lines 1 through 10,
and from line 340 to the end of the buffer.
.Ah "Reading In a File
.ix [ex] editor, reading~in~a file %key ex editor, reading in~a file
.LP
Sometimes you want to copy text or data
already entered on the system into the file you are editing.
In
.CW vi ,
you can read in the contents of another file with the
.CW ex
command:
.Ps
:read \fIfilename\fP
.Pe
.LP
or:
.Ps
:r \fIfilename\fP
.Pe
.LP
This reads in the contents of
.I filename
on the line after the cursor position in the file.
.PP
Let's suppose that you are editing the file
.CW letter ,
and want to read in data from a file in another directory
called
.CW /work/alcuin/ch01 .
Position the cursor
just above the line where you want the new data inserted, and enter:
.Ps
:r /work/alcuin/ch01
.Pe
.LP
The entire contents of
.CW /work/alcuin/ch01
are read into
.CW letter ,
beginning below your cursor position.
.Ah "Executing UNIX Commands
.ix [ex] editor, executing~UNIX~commands~from %key ex editor, executing UNIX~commands~from
.LP
You can also display or read in the results of any UNIX command
while you are editing in
.CW vi .
An exclamation mark (\c
.CW ! )
tells
.CW ex
to create a shell and regard what follows as a UNIX command.
.Ps
:!\fIcommand\fP
.Pe
.LP
So, if you are editing
and want to check the time or date without exiting
.CW vi ,
you can enter:
.Ps
:!date
.Pe
.LP
The time and date will appear on your screen;
press
.I RETURN
to continue editing at the same place in your file.
If you want to give several UNIX commands in a row,
without returning to
.CW vi
in between,
you can create a shell with the
.CW ex
command:
.Ps
:sh
.Pe
.ix [ex] editor, creating~a subshell %key ex editor, creating a subshell
.LP
When you want to exit the shell and return to
.CW vi ,
press
.CW ^D .
.PP
You can combine
.CW :read
with a call to UNIX,
to read the results of a UNIX command
.ix [ex] editor, reading~in result~of UNIX~command %key ex editor, reading in result~of UNIX~command
into your file.
As a very simple example:
.Ps
:r !date
.Pe
.LP
This will read in the system's date information
into the text of your file.
.PP
Suppose that you are editing a file,
and want to read in four phone numbers from a file called
.CW phone ,
but in alphabetical order.
The
.CW phone
file is in the following order:
.Ps
Willing, Sue  333-4444
Walsh, Linda  555-6666
Quercia, Valerie  777-8888
Dougherty, Nancy  999-0000
.Pe
.LP
The command:
.Ps
:r !sort phone
.Pe
.LP
reads in the contents of
.CW phone
after they have been passed through the
.CW sort
filter:
.Ps
Dougherty, Nancy  999-0000
Quercia, Valerie  777-8888
Walsh, Linda  555-6666
Willing, Sue  333-4444
.Pe
.LP
Suppose that you are editing a file
and want to insert text from another file in the directory,
but you can't remember the new file's name.
.PP
You
.I could
perform this task the long way:
exit your file,
give the
.CW ls
command, note the correct filename,
reenter your file, and search for your place.
.PP
Or, you could do the task in fewer steps.
The command
.CW :!ls
will display a list of files in the directory.
Note the correct filename.
Press
.I RETURN
to continue editing.
.Ps
file1
file2
letter
newfile
.Pe
.LP
The command:
.Ps
:r newfile
.Pe
.LP
will read in the new file:
.Ps
"newfile" 35 lines, 949 characters
.Pe
.Bh "Filtering Text through a Command
.ix [ex] editor, filtering~text~through~a UNIX~command %key ex editor, filtering text~through~a UNIX~command
.LP
You can also send a block of text as standard input to a UNIX command.
The output from this command replaces the block of text in the buffer.
Filtering text through a command can be done either from
.CW ex
or
.CW vi .
The main difference between the two methods is
that the block of text is indicated with line addresses in
.CW ex
and with text objects in
.CW vi .
.PP
The first example demonstrates how to do this with
.CW ex .
Assume that instead of being contained in a separate file
called
.CW phone ,
the list of names in the preceding example
was already contained in the current file, on lines 96 to 99.
.PP
You simply type the addresses of the lines you want affected,
followed by an exclamation mark
and the UNIX command line to be executed.
For example, the command:
.Ps
:96,99!sort
.Pe
.LP
will pass lines 96 to 99 through the
.CW sort
filter, and replace those lines with the output of
.CW sort .
.PP
In
.CW vi ,
.ix [vi] editor, filtering~text~through~a UNIX~command %key vi editor, filtering text~through~a UNIX~command
this sequence is invoked
by typing an exclamation mark
followed by any
.CW vi
objects that indicate a block of text,
and then the UNIX command line to be executed.
For example:
.Ps
!)\fIcommand\fP
.Pe
.LP
will pass the next sentence through
.I command .
.PP
There are some unusual features about how
.CW vi
acts when you use this feature.
First, the exclamation mark that you type is not echoed right away.
When you type the symbol for the text object to be affected,
the exclamation mark appears at the bottom of the screen,
.I
but the symbol you type to reference the object does not.
.R
.PP
Second, only objects that refer to more than one line of text
(\c
.CW G ,
.CW {} ,
.CW () ,
.CW [] )
can be used.
A number may precede either
the exclamation mark
or the object
to repeat the effect.
Objects such as
.CW w
.ig
	The original book has "not not"  This is wrong.
	Fixed by: Heinz-Jürgen Oertel
..
do not work unless enough of them are specified
so as to exceed a single line.
A slash (/) followed by a pattern and a
.I RETURN
can also be specified,
taking the text up to the pattern as input to the command.
.PP
Third, there is a special object
that is used only with this command syntax.
The current line can be specified
by entering a second exclamation mark:
.Ps
!!\fIcommand\fP
.Pe
.LP
Either the entire sequence or the text object
can be preceded by a number
to repeat the effect.
For instance, to change the same lines as in the previous example,
you could position the cursor on line 96, and enter:
.Ps
4!!sort
.Pe
.LP
or:
.Ps
!4!sort
.Pe
.PP
As another example,
assume you have a portion of text
in a file that you want to change from lowercase to uppercase letters.
You could process that portion with the
.CW tr
command.
In these examples,
the second sentence is the block of text
that will be filtered to the command.
An exclamation mark appears on the last line
to prompt you for the UNIX command:
.sp .7v
.X1
of the product.
\zI_ confess to being
amazed by Alcuin.
Some people around


.X2
.CW !)
!appears on
last line
.X3
of the product.
\zI_ confess to being
amazed by Alcuin.
Some people around
!_

.X4
.sp 1v
.LP 0
Enter the UNIX command and press
.I RETURN .
The input is replaced by the output.
.sp .7v
.ig
	In the .X2 section below, the original book
	had `[a-z]' and `[A-Z]'
	This is wrong, and should have single quotes
	around both sides of each:
	'[a-z]' and '[A-Z]'
	Fixed by: Heinz-Jürgen Oertel
..
.ne 10
.X1
of the product.
\zI_ confess to being
amazed by Alcuin.
Some people around


.X2
.CW tr'[a-z]'
.CW '[A-Z]'
input replaced
by output
.X3
of the product.
\zI_ CONFESS TO BEING
AMAZED BY ALCUIN.
Some people around


.X4
.sp 1v
.LP 0
To repeat the previous command, the syntax is:
.Ps
!\fIblock\fP!
.Pe
.LP
It is sometimes useful to send sections of a coded document to
.CW nroff
to be replaced by formatted output.
However, remember that the \(lqoriginal\(rq input is replaced by the output.
.PP
If there is a mistake,
such as an error message being sent instead of the expected output,
you can undo the command and restore the lines.
.Ah "Editing Multiple Files
.ix [ex] editor, editing multiple files %key ex editor, editing multiple files
.ix [vi] editor, editing multiple files %key vi editor, editing multiple files
.ix files, editing multiple
.LP
The
.CW ex
commands enable you to edit multiple files.
The advantage to editing multiple files is speed.
When you are sharing the system with other users,
it takes time to exit and reenter
.CW vi
for each file you want to edit.
Staying in the same editing session and traveling between files
is not only faster in access time:  you save abbreviations and
command sequences you have defined
and keep named buffers so that you can copy text from one file to another.
.Bh "Invoking \f[CB]vi\fP on Multiple Files
.LP
When you first invoke
.CW vi ,
you can name more than one file to edit files sequentially,
and then use
.CW ex
commands to travel between the files.
The following:
.Ps
$ \f(CBvi\fP \fIfile1 file2\fP
.Pe
.LP
invokes
.I file1
first.
After you have finished editing the first file,
the
.CW ex
command
.CW :w
writes (saves)
.I file1 ,
and
.CW :n
.ix [ex] editor, switching files %key ex editor, switching files
calls in the next file (\c
.I file2 ).
.PP
Suppose that you know you want to edit two files,
.CW letter
and
.CW note .
Open the two files by typing:
.Ps
$ \f[CB]vi letter note\fP
.Pe
.LP
The message:
.Ps
Two files to edit
.Pe
.LP
appears on the screen.
The first named file,
.CW letter ,
appears.
Perform your edits to
.CW letter ,
and then save it with the
.CW ex
command
.CW :w .
Call in the next file,
.CW note ,
with the
.CW ex
command
.CW :n
and press
.I RETURN .
Perform any edits and use
.CW :wq
to quit the editing session.
.PP
There is no practical limit
to the number of files you can invoke
.CW vi
on at one time.
You can use any of the shell's pattern-matching characters,
or even more complex constructions.
Suppose you were writing a program,
and wanted to change the name of a function call,
for example,
.CW getcursor .
The command:
.Ps
$ \f[CB]vi `grep -l getcursor *`\fP
.Pe
.LP
would invoke
.CW vi
on all of the files in the current directory
containing the string
.CW getcursor .
The command:
.Ps
$ \f[CB]grep -l\fP
.Pe
.LP
prints the names of all files containing a string;
using a command enclosed in backquotes (\`\`)
as an argument to another command
causes the shell to use the
.I output
of the command in backquotes
as the argument list for the first command.
.PP
The
.CW vi
editor will print a message similar to:
.Ps
5 files to edit
.Pe
.LP
before displaying the first file.
.PP
If you try to quit without editing all of the files,
.CW vi
will issue a warning message:
.Ps
4 more files to edit
.Pe
.LP
You must type
.CW :q!
if you want to exit without editing all of the files.
.Bh "Calling In New Files
.LP
You don't have to call in multiple files
at the beginning of your editing session.
Any time in
.CW vi ,
you can switch to another file with the
.CW ex
command
.CW :e .
If you want to edit another file within
.CW vi ,
first save your current file (\c
.CW :w ),
then give the command:
.Ps
:e \fIfilename\fP
.Pe
.LP
Suppose that you are editing the file
.CW letter ,
and want to edit the file
.CW note
and then return to
.CW letter .
.PP
Save
.CW letter
with
.CW w
and press
.I RETURN .
The file
.CW letter
is saved and remains on the screen.
You can now switch to another file,
because your edits are saved.
Call in the file
.ig
	The original book had letter in the next line.
	I believe it should be note, since the example is
	about changing files.  This goes along with the
	next paragraph about switching between two files.
	I've changed it to read note.  If this is wrong,
	it will need corrected.
	--Michael Hobgood
..
.CW note
with
.CW :e
and press
.I RETURN .
.PP
The
.CW vi
.ix [ex] editor, using current~and~alternate filenames %key ex editor, using current and~alternate filenames
.ix [vi] editor, current~and~alternate filenames %key vi editor, current and~alternate filenames
editor \(lqremembers\(rq two filenames at a time
as the current and alternate filenames.
These can be referred to by the symbols
.CW %
(current filename)
and
.CW #
(alternate filename).
The
.CW #
symbol is particularly useful with
.CW :e ,
because it allows you to switch easily back and forth between files.
In the example just given,
you could return to the first file,
.CW letter ,
by typing the command
.CW :e# .
.PP
If you have not first saved the current file,
.CW vi
will not allow you to switch files with
.CW :e
or
.CW :n
unless you tell it imperatively to do so
by adding an exclamation mark after the command.
For example,
if after making some edits to
.CW note ,
you wanted to discard the edits and return to
.CW letter ,
you could type
.CW :e!# .
.PP
The command:
.Ps
e!
.Pe
.LP
is also useful.
It discards your edits
and returns to the last saved version of the current file.
The
.CW %
symbol, by contrast,
is useful mainly when writing out the contents of the buffer to a new file.
For example,
a few pages earlier we showed
how to save a second version of the file
.CW letter
with the command:
.Ps
:w letter.new
.Pe
.LP
This could also have been typed:
.Ps
:w %.new
.Pe
.LP
.Bh "Edits between Files
.ix [ex] editor, yanking~text~from~one~file~to~another %key ex editor, yanking text~from~one~file~to~another
.LP
Named buffers provide one convenient way
to move text from one file to another.
Named buffers are not cleared when a new file is loaded into the
.CW vi
buffer with the
.CW :e
command.
Thus, by yanking text in one file
(into multiple named buffers if necessary),
reading in a new file with
.CW :e ,
and putting the named buffer into the new file,
material can be transferred selectively between files.
.PP
The following example illustrates transferring text
from one file to another.
.sp .7v
.ne 10
.X1
\zI_n our conversation
last Thursday, we
discussed a
documentation project
that would produce a
user's manual on the...


.X2
.CW \[dq]f6yy
yank 6 lines
to buffer \fIf\fP
.X3
\zI_n our conversation
last Thursday, we
discussed a
documentation project
that would produce a
user's manual on the...

6 lines yanked
.X4
.sp 1v
.LP 0
Save the file with the
.CW :w
command.
Enter the file
.CW note
with
.CW :e ,
and move the cursor to where the copied text will be placed.
.ig
	The original book has wrong text in the right window.
	Fixed by: Heinz-Jürgen Oertel
..
.sp .7v
.ne 10
.X1
\zD_ear Mr. Caslon,
Thank you...







.X2
.CW \[dq]fp
put yanked text
below cursor
.X3
Dear Mr. Caslon,
\zI_n our conversation
last Thursday, we
discussed a
documentation project
that would produce a
user's manual on the...
Thank you...

.X4
.sp 1v
.Ah "Word Abbreviation
.ix [ex] editor, abbreviating recurring phrases %key ex editor, abbreviating recurring phrases
.ix [vi] editor, abbreviations %key vi editor, abbreviations
.LP
Often, you will type the same long phrases over and over in a file.
You can define abbreviations that
.CW vi
will automatically expand into the full text
whenever you type the abbreviation in insert mode.
To define an abbreviation, use the
.CW ex
command:
.Ps
:ab \fIabbr phrase\fP
.Pe
.LP
Where
.I abbr
is an abbreviation for the specified
.I phrase .
The sequence of characters that make up the abbreviation
will be expanded in insert mode
only if you type it as a full word;
.I abbr
will not be expanded within a word.
.PP
Suppose that in the file
.CW letter
you want to enter text that contains a frequently recurring phrase,
such as a difficult product or company name.
The command:
.Ps
:ab IMRC International Materials Research Center
.Pe
.LP
abbreviates
.I "International Materials Research Center"
to the initials IMRC.
.PP
Now when you type IMRC in insert mode:
.Ps
i the IMRC
.Pe
.LP
IMRC expands to the full text:
.Ps
the International Materials Research Center
.Pe
.LP
When you are choosing abbreviations,
select combinations of characters that don't ordinarily occur
while you are typing text.
.Ah "Saving Commands with \f[CB]map\fP
.ix [ex] editor, mapping commands~to keys %key ex editor, mapping commands to keys
.ix [vi] editor, mapping command~sequences %key vi editor, mapping command sequences
.LP
While you are editing,
you may use a particular command sequence frequently,
or you may occasionally use a very complex command sequence.
To save keystrokes,
or the time that it takes to remember the sequence,
you can assign the sequence to an unused key.
.PP
The
.CW map
command acts a lot like
.CW ab
except that you define a macro for command mode
instead of insert mode.
.RS
.TS
lfCW l.
:map \fIx sequence\fP	Define character \fIx\fP as a \fIsequence\fP of editing commands
:unmap x	Disable the \fIsequence\fP defined for \fIx\fP
:map	List the characters that are currently mapped
.TE
.RE
.LP
Before you can start creating your own maps,
you need to know the keys not used in command mode
that are available for user-defined commands:
.Ps
^A     g     K    ^K
^O     q    ^T     v
 V    ^W    ^X    ^Z
 *     \e     _  (underscore)
.Pe
.LP
Depending on your terminal,
you may also be able to associate map sequences
with special function keys.
With maps, you can create simple or complex command sequences.
As a simple example,
you could define a command to reverse the order of words.
In
.CW vi ,
with the cursor as shown:
.Ps
you can \zt_he scroll page
.Pe
the sequence to put
.I the
after
.I scroll
would be
.CW dwelp :
delete word,
.CW dw ;
move to the end of next word,
.CW e ;
move one space to the right,
.CW l ;
put the deleted word there,
.CW p .
Saving this sequence:
.Ps
:map v dwelp
.Pe
.LP
enables you to reverse the order of two words
anytime in the editing session
with the single keystroke
.CW v .
.PP
Note that when defining a map,
you cannot simply type certain keys,
such as
.I RETURN ,
.I ESC ,
.I TAB ,
.I BACKSPACE ,
and
.I DELETE ,
as part of the
.CW map
command.
If you want to include one of these keys
as part of the command sequence,
preface that key with a
.CW ^V .
The keystroke
.CW ^V
appears in the map as the
.CW ^
character.
Characters following the
.CW ^V
also do not appear as you expect.
For example, a carriage return appears as
.CW ^M ,
escape as
.CW ^[ ,
tab as
.CW ^I ,
and so on.
.PP
You can undo the effect of any
.CW map
sequence with the
.CW u
command.
Fortunately, the undo restores the file
as it was before you executed the
.CW map
sequence, treating the series of commands
as though it were a single
.CW vi
command.
.PP
Unless you use
.CW unmap
to remove a mapped key,
its special meaning is in effect for as long as your current session,
even if you move between files.
It can therefore be a convenient way
of making the same edits in a number of files.
.PP
All the
.CW vi
and
.CW ex
commands can be used in
.CW map
sequences, with the exception that the
.CW p
or
.CW put
command cannot be used to replace entire lines
yanked in the same mapping.
If you try to yank and then put back a deleted line within a
.CW map ,
you will get the error message:
.Ps
Cannot put inside global macro.
.Pe
.ig
	Which is now possible at least with Elvis
	Remark by: Heinz-Jürgen Oertel
..
.LP
If you want to move lines from one place to another
within a mapping,
you can usually get around this restriction using the
.CW ex
editor's
.CW copy
or
.CW co
command.
.Bh "Complex Mapping Example
.ix [ex] editor, mapping commands~to keys %key ex editor, mapping commands to keys
.LP
Assume that you have a glossary with entries like this:
.Ps
map - an ex command that allows you to associate
a complex command sequence with a single key.
.Pe
.LP
You would like to convert this glossary list to
.CW nroff
format, so that it looks like this:
.Ps
\&.IP "map" 10n
An ex command...
.Pe
.LP
The best way to do this
is to perform the edit on one of the entries
and write down the sequence of commands.
You want to:
.RS
.Ls
.Li
Insert the macro for an indented paragraph at the beginning of the line.
.Li
Press
.I ESC
to terminate insert mode.
.Li
Move to the end of the word and add the size of the indent.
.Li
Press
.I RETURN
to insert a new line.
.Li
Press
.I ESC
to terminate insert mode.
.Li
Remove the hyphen and capitalize the next word.
.Le
.RE
.LP
That's quite an editing chore if you have to repeat it more than a few times!
With
.CW :map ,
you can save the entire sequence
so that it can be re-executed with a single key-stroke.
.Ps
.ig
	in Elvis it should be:
	:map z I.IP "^[ea" 10n^M^[2x~
	I don't know if the UTP example was correct
	Remark by: Heinz-Jürgen Oertel
..
:map z I.IP "^[ea" 10n^M^[3x\(ap
.Pe
.LP
The sequence
.CW ^[
appears when you type
.CW ^V
followed by
.I ESC .
The sequence
.CW ^M
is shown when you type
.CW ^V
.I RETURN .
.PP
Now, simply typing
.CW z
will perform the entire series of edits.
On a slow terminal, you can actually see the edits happening individually.
On a fast terminal,
it will seem to happen by magic.
.PP
Don't be discouraged if your first attempt at key mapping fails.
A small error in defining the
.CW map
can give you very different results than you expect.
Simply type
.CW u
to undo the edit, and try again.
.PP
Remember, the best way to define a complex
.CW map
is to do the edit once manually,
writing down each keystroke that you must type.
.Bh "Mapping Keys for Insert Mode
.ix function keys, mapping
.ix mapping function keys
.LP
Normally, maps apply only to command mode\(emafter all,
in insert mode,
keys stand for themselves, and shouldn't be mapped as commands.
.PP
However, by adding an exclamation mark (\c
.CW ! )
to the
.CW map
command, you can force it to override the ordinary meaning of a key
and produce the map in insert mode.
You may find this feature appropriate
for tying character strings to special keys
that you wouldn't otherwise use.
It is especially useful with programmable function keys,
as we'll see in a minute.
Many terminals have programmable function keys.
You can
usually set up these keys
to print whatever character or characters you want
using a special setup mode on the terminal.
But this will limit you to a particular terminal,
and may limit the actions of programs
that want to set up those function keys themselves.
.PP
The
.CW ex
editor allows you to
map
function keys by number, using the syntax:
.Ps
:map #1 \fIcommands\fP
.Pe
.LP
for function key number 1, and so on.
(It can do this
because the editor has access to the entry for that terminal
found in either the
.CW termcap
or
.CW terminfo
database and knows the escape sequence normally
output by the function key).
.PP
As with other keys,
maps apply by default to command mode,
but by using the
.CW map!
commands as well,
you can define two separate values for a function
key\(emone to use in command mode,
the other in insert mode.
For example, if you are a
.CW troff
user, you might want to put font-switch codes on function keys.
For example:
.ig
	Text describes both keys with the same code
	Fixed by: Heinz-Jürgen Oertel
..
.Ps
:map #1 i\efI^[
:map! #1 \efI
.Pe
.LP
If you are in command mode,
the first function key will enter insert mode,
type in the three characters
.CW \efI ,
and return to command mode.
If you are already in insert mode,
the key will simply type the three-character
.CW troff
code.
.PP
Note: If function keys have been redefined in the terminal's setup mode,
the
.CW # \c
.I n
syntax might not work
because the function keys no longer put out the expected control
or escape sequence as described in the terminal database entry.
You will need to examine the
.CW termcap
entry (or
.CW terminfo
source) for your terminal
and check the definitions for the function keys.
The terminal capabilities
.CW k1 ,
.CW k2
through
.CW k9 ,
.CW k0
describe the first ten function keys.
The capabilities
.CW l1 ,
.CW l2
through
.CW l9 ,
.CW l0
describe the remaining function keys.
Using your terminal's setup mode,
you can change the control or escape sequence
output by the function key
to correspond with the
.CW termcap
or
.CW terminfo
entry.
(If the sequence contains
.CW ^M ,
which is a carriage return,
press
.CW ^M ,
not the
.I RETURN
key.)
.\" Complete sentence is in () so the period also goes inside.
For instance, to have function key 1 available for mapping,
the terminal database entry for your terminal
must have a definition of
.CW k1 ,
such as
.CW k1=^A@ .
In turn, the definition
.CW ^A@
must be what is output when you press that key.
To test what the function key puts out,
press the key at the UNIX prompt,
followed by a
.I RETURN
if necessary.
The shell should display the sequence
output by the function key
after trying unsuccessfully to execute it as a command.
.Bh "\f[CB]@\fP Functions
.ix [ex] editor, \@~functions %key ex editor, \@ functions
.LP
Named buffers provide yet another way
to create macros\(emcomplex command sequences that you can repeat
with only a few keystrokes.
.PP
If you type a command line in your text
(either a
.CW vi
sequence or an
.CW ex
command
.I "preceded by a colon" ),
then yank or delete it into a named buffer,
you can execute the contents of that buffer with the
.CW @
command.
It works in the same way as a
.CW map
sequence, except that you enter the command line in the file
instead of at the colon prompt;
this is helpful if the command sequence is long
and might need editing to work properly.
Let's look at a simple but not very useful example
of an
.CW @
function.
In your file, enter this key sequence:
.Ps
cw\efIgadfly\efR^V\fIESC\fP
.Pe
.LP
This will appear on your screen as:
.Ps
cw\efIgadfly\efR^[
.Pe
.LP
Then delete your command line into buffer
.CW g
by typing
.CW \[dq]gdd .
Now, whenever you place the cursor at the beginning of a word
and type
.CW @g ,
that word in your text will be changed to
.I gadfly .
Because
.CW @
is interpreted as a
.CW vi
command, . will repeat the entire sequence,
even if it is an
.CW ex
command.
The command
.CW @@
repeats the last
.CW @ ,
and
.CW u
or
.CW U
can be used to undo the effect of
.CW @ .
The
.CW @
function is useful because you can create very specific commands.
It is especially useful
when you are making specific editing commands
between files,
because you can store the commands in named buffers
and access them in any file you edit.
.ix %end [ex] editor %key ex editor
.ix %end [vi] editor %key vi editor

