.ig
Ralph Corderoy's $Revision: 1.1 $.

	TROFF source proof read
	by
	Andreas Kähäri <andreas.kahari@unix.net>
..
.so utp.mac
.utp
.\" The following taken from Manas Laha's appendix B:
.nr iN 15   \" Spaces to indent .IP paragraph
.page 628
.chapter C "Shell Command Summary" Appendix 1
.ig
.\" Lines appears far longer in this version than in printed copy.
.\" Andreas 2002-10-02

	Not to worry: the original was printed on 7"x9" paper. --LK
..
.ix %begin Bourne shell, command~summary
.LP
This section describes the syntax of the Bourne Shell.
It lists special characters, variables, and built-in programming
commands used by the shell.
.Ch "Special Files
.IP "\f(CW$HOME/.profile\fP" \n(iN
Executed at shell startup.
.Ch "Special Characters for Filename Generation
.\" .Rn "Markup problem: how to indent these lists.
.\" Problem fixed by using number register .iN ?
.\" /Andreas 2002-10-02
.IP "\f(CW*\fP" \n(iN
Match any string of characters.
.IP "\f(CW?\fP" \n(iN
Match any single character.
.IP "\f(CW[\fP . . . \f(CW]\fP" \n(iN
Match any of the enclosed characters.
A pair of characters separated by a minus will match any character
lexically between the pair.
.Ch "Special Characters For Control Flow
.\" .Rn "Book errata: inconsistent over use of italics for file.
.\" Problem fixed by making filenames italic (first item only).
.\" /Andreas 2002-10-02
.IP "\f(CW|\fP" \n(iN
Perform pipeline (use output of preceding command as input of following
command, e.g., \f(CWcat\fP \fIfile\fP \f(CW|\fP \fPlpr\fP).
.IP "\f(CW;\fP" \n(iN
Separate sequential commands on the same line.
.IP "\f(CW&\fP" \n(iN
Run command in background (e.g.,
.CW lpr
.I file
.CW & ).
.IP "\f(CW&&\fP" \n(iN
Execute command if previous command was successful (e.g.,
.CW grep
.I "string file"
.CW &&
.CW lpr
.I file ).
.
.page 629
.
.IP "\f(CW||\fP" \n(iN
Execute command if previous command was unsuccessful (e.g.,
.CW grep
.I "string1 file"
.CW ||
.CW grep
.I "string2 file" ).
.IP "\f(CW( )\fP" \n(iN
Execute commands enclosed in
.CW "( )"
in a subshell;  output from the entire set can then be redirected as a
unit or placed in the background.
.ix Bourne shell, special~characters
.ix Bourne shell, variable substitution
.IP "\f(CW'\fP. . .\f(CW'\fP" \n(iN
Take all characters between single quotation marks literally.  (Don't
allow special character meaning.)
.IP "\f(CW\e\fP" \n(iN
Take following character literally.
.IP "\f(CW""\fP. . .\f(CW""\fP" \n(iN
Take enclosed characters literally but allow variable and command
substitution.
.\" The following is a deviation from the printed copy (error in
.\" UTP, not using backticks).  /Andreas 2002-10-02
.IP "\f(CW`\fP\fIcmd\fP\f(CW`\fP" \n(iN
Use output of
.I cmd
as argument to another command.
.IP "\f(CW#\fP" \n(iN
Begin a comment in a shell file.
.IP "\f(CW<\fIfile" \n(iN
Take input from
.I file .
.IP "\f(CW<<\fIstring" \n(iN
Read standard input up to a line identical to
.I string .
.IP "\f(CW>\fIfile" \n(iN
Redirect output to
.I file
(overwrite).
.IP "\f(CW>>\fIfile" \n(iN
Redirect output to end of
.I file
(append).
.\" .Rn "Book errata: >&digit explanation is plain wrong and example doesn't match.
.\" Problem fixed by changing the UTP text from "Duplicate
.\" standard input from digit" to "Redirect standard output
.\" to digit".  This is assuming that the description is
.\" wrong, rather than the label and the example.  Bug in UTP.
.\" /Andreas 2002-10-02
.IP "\f(CW>&\fIdigit" \n(iN
Redirect standard output to
.I digit
e.g.,
.CW 2>&1 .
.IP "\f(CW<&-" \n(iN
Close standard input.
.IP "\f(CW>&-" \n(iN
Close standard output.
.
.Ch "Variable Substitution
.\" .Rn "Book errata: I think are missing braces in the left hand column.
.\" We are indeed missing braces in the labels.  Fixing them.
.\" Bug in UTP.  /Andreas 2002-10-02
.IP "\fIvariable\f(CW=\fIvalue" \n(iN
Set
.I variable
to
.I value .
.IP "\f(CW$\fIvariable" \n(iN
Use value of
.I variable .
.\" .Rn "Markup problem: how to have two lines for the IP item.  Did the book use a table?
.\" Good question.  The table on page 623 ("Options" for "The
.\" pic Preprocessor") uses a table.  It's a bit too fiddly
.\" though I think.  The solution here is good enough.
.\" /Andreas 2002-10-02
.IP "\f(CW${\fIvariable\f(CW-\fIvalue\fP}" \n(iN
.IP "\f(CW${\fIvariable\fR[\f(CW:\fR]\f(CW-\fIvalue\fP}" \n(iN
Use
.I variable
if set;  otherwise set to
.I value .
For example:
.CW TERM=${1:-$TERM)
will set the
.CW TERM
variable to the value of the first argument to a shell script, if given,
or else to the existing (default) value of
.CW TERM .
.IP "\f(CW${\fIvariable\f(CW=\fIvalue\fP}" \n(iN
Use
.I variable
if not set;  otherwise set to
.I value .
.IP "\f(CW${\fIvariable\fR[\f(CW:\fR]\f(CW=\fIvalue\fP}" \n(iN
.IP "\f(CW${\fIvariable\f(CW?\fIvalue\fP}" \n(iN
Use
.I variable
if set;  otherwise print
.I value
then exit.
.IP "\f(CW${\fIvariable\fR[\f(CW:\fR]\f(CW?\fIvalue\fP}" \n(iN
.IP "\f(CW${\fIvariable\f(CW+\fIvalue\fP}" \n(iN
Use
.I value
if
variable
is set; otherwise nothing.
.IP "\f(CW${\fIvariable\fR[\f(CW:\fR]\f(CW+\fIvalue\fP}" \n(iN
.LP
If the colon
.CW : ) (
is included in these expressions, a test is performed to see if the
variable is non-null as well as set.
.
.page 630
.
.Ch "Shell Parameters Set by the Shell under Execution
.ix Bourne shell, shell functions
.ix Bourne shell, variables set~by [.profile] %key Bourne shell, variables set by .profile
.ix Bourne shell, variables~set~by~shell~under execution
.IP "\f(CW$#" \n(iN
Number of command-line arguments.
.IP "\f(CW$-" \n(iN
Options supplied in invocation or by the
.CW set
command.
.IP "\f(CW$?" \n(iN
Return value of last executed command.
.IP "\f(CW$$" \n(iN
Return process number of current process.
.IP "\f(CW$!" \n(iN
Return process number of last background command.
.
.Ch "Shell Variables Initially Set By \f(CBprofile
.IP \f(CW$HOME \n(iN
Default (home directory) value for the
.CW cd
command.
.IP \f(CW$IFS \n(iN
Internal field separators.
.IP \f(CW$MAIL \n(iN
Default mail file.
.IP \f(CW$PATH \n(iN
Default search path for commands.
.IP \f(CW$PS1 \n(iN
Prime prompt string; default is
.CW $ .
.IP \f(CW$PS2 \n(iN
Second prompt string; default is
.CW > .
.IP \f(CW$TERM \n(iN
Specifies the type of terminal.
.
.Ch "Shell Functions
.IP "\fIname\f(CW()\fP \fP{\fIcommand1\f(CW;\fP ...\f(CW;\fP commandn\f(CW}" \n(iN
Create a function called
.I name
that consists of the commands enclosed in braces.
The function can be invoked by name within the current script.
.
.Ch "Built-in Commands
.IP \fIfile \n(iN
.I file
.br
Execute contents of
.I file .
.IP \f(CWbreak \n(iN
.CW break [\fIn\fP]
.br
Exit from a
.CW for ,
.CW while ,
or
.CW until
loop in
.I n
levels.
.
.page 631
.
.IP \f(CWcase
'nf
\f(CWcase\fI value \f(CWin
  \fIpattern1\f(CW)\fP commands\fP;;
 \&.
 \&.
 \&.
  \fIpatternn\f(CW)\fP commands\fP;;
\f(CWesac\fR
.fi
For each item in
.I list
that matches
.I pattern ,
execute
.I command .
.IP \f(CWcd \n(iN
.CW cd
.I dir ] [
.br
Change current directory to
.I dir .
.IP \f(CWcontinue \n(iN
.CW continue
.I n ] [
.br
Resume
.I n th
iteration of a
.CW for ,
.CW while ,
or
.CW until
loop.
.IP \f(CWecho \n(iN
.CW echo
.I args
.br
Print
.I args
on standard output.
.IP \f(CWeval \n(iN
.CW eval
.I arg \& [
\&. . . ]
.br
Evaluate arguments, then execute results.
.IP \f(CWexec \n(iN
.CW exec
.I cmd ] [
.br
Execute
.I cmd
in place of current shell.
.IP \f(CWexit \n(iN
.CW exit
.I n ] [
.br
Exit the shell with exit status
.I n ,
e.g.,
.CW "exit 1" .
.IP \f(CWexport \n(iN
.CW export
.I var \& [
\&. . . ]
.br
Export variable
.I var
to environment.
.\" .Rn "Book errata: what's x?
.\" Yes, a bit confusing.  I changed that line from "For
.\" variable x (in optional lisy) do commands" (which honestly
.\" is just a repeat of what was just said), to the more verbose
.\" "Do commands for each variable taken from the optional list
.\" (if list is not explicitly givem, it will be made up from
.\" the command line arguments)".  /Andreas 2002-10-02
.IP \f(CWfor \n(iN
.CW for
.I variable
.CW in \& [
.I list
\&. . . ]
.br
.CW do
.br
.CW "  \fIcommands
.br
.CW done
.br
Do \fIcommands\fP for each \fIvariable\fP taken from the
optional \fIlist\fP (if \fIlist\fP is not explicitly given, it
will be made up from the command line arguments).
.IP \f(CWif \n(iN
.CW if
.I condition
.br
.in +\w'\f(CW  'u
.CW then
.I commands
.br
.CW elif \& [
.I condition2
.br
.CW then
.I commands2 ]
\&. . .
.br
.CW else \& [
.I commands3 ]
.br
.in
.CW fi
.br
If
.I condition
is met, do list of
.I commands ,
or else if
.I condition2
is met, do
.I commands2 ,
otherwise do
.I commands3 .
(See
.CW test
for a list of conditions.)
.IP \f(CWhash \n(iN
.CW hash
.I cmds
.br
Temporarily add
.I cmds
to search path.
.
.page 632
.
.IP \f(CWlogin \n(iN
.CW login
.I user \& [
\&. . . ]
.br
Log in as another user.
.IP \f(CWnewgrp \n(iN
.CW newgrp
.I group \& [
\&. . . ]
.br
Change your group ID to
.I group ;
if no argument, change back to your default group.
.IP \f(CWpwd \n(iN
.CW pwd
.br
Print current working directory.
.IP \f(CWread \n(iN
.CW read
.I var \& [
\&. . . ]
.br
Read value of
.I var
from standard input.
.IP \f(CWreadonly \n(iN
.CW readonly
.I var \& [
\&. . . ]
.br
Mark variable
.I var
as read only.
.IP \f(CWreturn \n(iN
.CW return
.br
Stop execution of current shell function and return to calling level.
.IP \f(CWset \n(iN
.CW set
.I t ] [
.CW options ] [
.I arg \& [
\&. . . ]
.br
With no arguments,
.CW set
prints the values of all variables known to the current shell.
The following options can be enabled (-option) or disabled (+option).
.\" .Rn "Markup problem: don't know -ms well enough to copy book.
.\" Fixed.  /Andreas 2002-10-02
.RS
.IP \f(CW--\fP \n(iN
.\" Typesetting error in paper copy: non-courier --
.\" /Andreas 2002-10-02
Don't treat subsequent arguments beginning with
\f(CW--\fP as options.
.br
.IP \f(CW-a\fP \n(iN
Automatically export all subsequently defined variables.
.br
.IP \f(CW-e\fP \n(iN
Exit shell if any command has a nonzero exit status.
.br
.IP \f(CW-k\fP \n(iN
Put keywords in an environment for a command.
.br
.IP \f(CW-n\fP \n(iN
Read but do not execute commands.
.br
.IP \f(CW-t\fP \n(iN
Exit after one command is executed.
.br
.IP \f(CW-u\fP \n(iN
Treat unset variables as an error.
.br
.IP \f(CW-v\fP \n(iN
Print commands as they are executed.
.br
.IP \f(CW-x\fP \n(iN
Turn on \f(CWtrace\fP
mode in current shell (echo commands in scripts as they are executed).
.br
.IP "\fIarg\fP \f(CW...\fP" \n(iN
Assigned in order to
.CW $1 ,
.CW $2 ,
\&. . .
.CW $9 .
.RE
.IP \f(CWshift \n(iN
.CW shift
.br
Perform a shift for arguments, e.g.,
.CW $2
becomes
.CW $1 .
.\" .Rn "Markup problem: don't know -ms well enough to copy book.
.\" Fixed.  /Andreas 2002-10-02
.IP \f(CWtest \n(iN\fP \n(iN
.CW test
.I exp
|
.CW [\fIexp\fP]
.br
Evaluate the expression
.I exp .
An alternate form of the command uses
.CW "[ ]
rather than the word
.I test .
The following primitives are used to construct
.I expression .
.RS
.IP "\f(CW-b\fP \fIfile\fP" \n(iN
True if
.I file
exists and is a block special file.
.IP "\f(CW-c\fP \fIfile\fP" \n(iN
True if
.I file
exists and is a character special file.
.
.page 633
.
.IP "\f(CW-d\fP \fIfile\fP" \n(iN
True if
.I file
exists and is a directory.
.IP "\f(CW-f\fP \fIfile\fP" \n(iN
True if
.I file
exists and is a regular file.
.IP "\f(CW-g\fP \fIfile\fP" \n(iN
True if
.I file
exists and its set-group-id bit is set.
.\" .Rn "Book errata: why s1 and not just s?  There is no s2
.\" here.  For consistency?  I don't know.  I'll change it to
.\" just 's'.  This affects the -n and -z labels, and last but
.\" second label (previously just 's1').  /Andreas 2002-10-02
.IP "\f(CW-k\fP \fIfile\fP" \n(iN
True if
.I file
exists and its sticky bit is set.
.IP "\f(CW-n\fP \fIs\fP" \n(iN
True if the length of string
.I s
is nonzero.
.IP "\f(CW-r\fP \fIfile\fP" \n(iN
True if
.I file
exists and is readable.
.IP "\f(CW-s\fP \fIfile\fP" \n(iN
True if
.I file
exists and has a size greater than zero.
.IP "\f(CW-t\fP [\fIn\fP]" \n(iN
True if the open file whose file descriptor number is
.I n
(default is 1) is associated with a terminal device.
.IP "\f(CW-u\fP \fIfile\fP" \n(iN
True if
.I file
exists and its set-user-id bit is set.
.IP "\f(CW-w\fP \fIfile\fP" \n(iN
True if
.I file
exists and is writable.
.IP "\f(CW-x\fP \fIfile\fP" \n(iN
True if
.I file
exists and is executable.
.IP "\f(CW-z\fP \fIs\fP" \n(iN
True if the length of string
.I s
is zero.
.IP "\fIs1 \f(CW=\fP s2\fR" \n(iN
True if strings
.I s1
and
.I s2
are identical.
.IP "\fIs1 \f(CW!=\fP s2\fR" \n(iN
True if strings
.I s1
and
.I s2
are not identical.
.IP \fIs\fP \n(iN
True if string
.I s
is not the null string.
.IP "\fIn1 \f(CW-eq\fP n2\fR" \n(iN
True if the integers
.I n1
and
.I n2
are algebraically
equal.
Any of the comparisons
.CW -ne ,
.CW -gt ,
.CW -ge ,
.CW -lt ,
and
.CW -le
may be used in place of
.CW -eq .
.RE
.IP \f(CWtimes \n(iN
.CW times
.br
Print accumulated process times.
.IP \f(CWtrap \n(iN
.CW trap
.I cmd ] [
.I n ] [
.br
Execute
.I cmd
if signal
.I n
is received.
Useful signals include:
.RS
.IP 0 \n(iN
Successful exit of command.
.IP 1 \n(iN
Hangup of terminal line.
.IP 2 \n(iN
Interrupt.
.IP 15 \n(iN
Process is killed.
.RE
.IP \f(CWtype \n(iN
.CW type
.I commands
.br
Print information about
.I commands .
.IP \f(CWuntil \n(iN
.CW until
.I condition
.br
.CW do \& "\f(CW  \fP["
.I commands ]
.br
.CW done
.br
Until
.I condition
is met, do
.I commands
(see
.CW test
for conditions).
.IP \f(CWulimit \n(iN
.CW ulimit
.I size ] [
.br
Set maximum size of file that can be created to
.I size ;
if no arguments, print current limit.
.IP \f(CWumask \n(iN
.CW umask
.I nnn ] [
.br
Set file creation mask to octal value
.I nnn .
.br
.
.page 634
.
.\" .Rn "Book errata: isn't there only one definition being removed?
.\" The printed copy should have plural in the description.  I
.\" changed this.  /Andreas 2002-10-02
.IP \f(CWunset \n(iN
.CW unset
.I vars
\&. . .
.br
Remove definitions for variables
.I vars .
.\" .Rn "Book errata: why put parenthesis around n?
.\" I modified this to be correct (mentioning background
.\" processes as well).  /Andreas 2002-10-0
.IP \f(CWwait \n(iN
.CW wait
.I n ] [
.br
Wait for specified background process with identification number
.I n
to terminate and report its status.
If \fIn\fP not given, waits until all backgroud processes have
terminated.
.IP \f(CWwhile \n(iN
.CW while
.I condition
.br
.CW do \& "\f(CW  \fP["
.I commands ]
.br
.CW done
.br
While
.I condition
is met, do
.I commands
(see
.CW test
for conditions).
.IP \f(CW \n(iN
.br
.IP \fIfilename \n(iN
.I filename
.br
Read and execute commands from executable file
.I filename .
.ix %end Bourne shell, command~summary
