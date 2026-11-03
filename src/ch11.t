.ig
	Converted from .pbm to text and marked up
	by
	Manas Laha <mlaha@aero.iitkgp.ernet.in>
	Proofed on: 2 Nov 2002

  This chapter needs/ed a few metric tonnes of work
  to bring it up to modern times, and not all the work
  is in the text here.
  Many of the commands described here are either lost
  (or the source was never released) and I've tried to
  either link to or create replacements. In some cases
  (especially with syntax checking), groff provides its
  own built-in diagnostics (warnings/backtracing). In
  other cases... well, check out my Writer's ScriptBench
  archive on GitHub:
  https://github.com/larrykollar/Writers-ScriptBench

  -- Larry Kollar, 6 Oct 2026
  (yes, I'm embarrassed that it's taken 24 years to
  get started on UTP Revisited)
..
.so utp.mac
.utp
.chapter 11 "A Miscellany of UNIX Commands" "Chapter" 1
.ix	miscellaneous UNIX~commands
.page 293
.LP
In this chapter, we present miscellaneous UNIX programs
with text-processing applications.
In addition, we introduce several UNIX utilities
for communications and for reading and writing to tapes and
floppy disks.
They may be useful for transferring
text and code from a legacy UNIX system to a modern one,
but most people now use Internet services
to transfer data from one system to another.
.PP
UNIX has many standard programs, as a run-down of the table
of contents for the
.I "UNIX Reference Manual"
demonstrates.
The challenge of UNIX is knowing which programs are appropriate
for a specific situation.
No one learns all the commands,
but becoming familiar with a number of them can be helpful.
It is rather like those of us who collect far more books on
our shelves than are \(lqneeded,\(rq knowing the reward of finding
the right book for the right occasion.
.PP
At times, you might discover a program
with unusual or specialized capabilities;
at other times, you may be frustrated by a demanding program
or confused by inconsistencies
from one program to the next.
These qualities originate from the open design of UNIX,
and serve to distinguish this text processing environment
from the closed systems of most word processors.
.PP
In some ways, the purpose of this chapter
is to address problems that arise in typical documentation projects
and show how you can apply
one or more UNIX programs
as solutions to these problems.
The emphasis is on the interactive use of these programs,
although many of them can be used effectively in shell scripts
or as parts of other programs.
In the next chapter, we go into more detail about shell
scripts.
We present the commands in sections, grouped by function.
.
.Ah "Managing Your Files"
.LP
One of the realities of using a computer
is that you begin to think of a document in terms of files,
rather than chapters or sections.
You edit and print files;
create and copy files;
delete files accidentally and lose your edits;
and look through files to find
the information that is contained in them.
Increasingly, files contain the goods that you trade.
You exchange not only printed copies of documents, but using
USB drives, CD or DVD discs, or the Internet,
you take files from one system
and copy them to another system.
Learning to organize and maintain files is essential to working
.ix	files, organizing
on a computer.
.
.Bh "Using the File System to Your Advantage"
One obvious feature of UNIX,
that made it easy to handle
large numbers of files,
is the hierarchical file system.
All modern operating systems
have a hierarchical file system,
adopting an obvious advantage for themselves.
.PP
With carefully named files and directories,
the pathname,
that specifies a file's unique place
in the file system hierarchy,
can tell a lot about not only how to get at the file,
but its contents as well.
For example, MacOS\~X and most Linux systems
provide a directory under each user's home directory called
.CW Documents .
Work for a given client can be kept in
a directory named for the client,
with a subdirectory for each separate manual.
Within each manual's subdirectory,
individual chapters are named consistently,
.CW ch01_intro ,
.CW ch02_install ,
and so on.
Thus, it is easy both to locate a file (Chapter I
of the FORTRAN manual for ABC Corp.
can predictably be found in
.CW ~/Documents/abc/fortran/ch01_intro )
and to guess its contents.
.PP
If you are using Bash (Bourne Again SHell) or the C shell,
you can create an alias that
.ix	C shell
.ix Bash shell
.ix	[alias] command %key alias command
provides a shorthand way of entering a command.
In the following example,
the alias lets you think in
terms of manuals instead of directories.
.Ps
% \f[CB]alias fortran "cd ~/Documents/abc/fortran; pwd"\fP
% \f[CB]pwd\fP
  /home/fred
% \f[CB]fortran\fP
  /home/fred/Documents/abc/fortran
.Pe
You can place an
.CW alias
definition in your
.CW ".cshrc"
.ix	[.cshrc] file %key cshrc file
(C\~shell) or
.CW ".bashrc"
(Bash shell)
file so that it becomes part of your environment.
When using Bash,
add an equals (=) sign between the command
and its definition.
.PP
In the Bourne or Bash shells,
you can achieve a similar result
by using an environment variable called
.CW CDPATH
.ix	Bourne shell, [CDPATH] environment~variable %key Bourne shell, CDPATH environment variable
.ix	[CDPATH] environment~variable %key CDPATH environment variable
to define a search path for the
.CW cd
command.
For example:
.Ps
$ \f(CBCDPATH=/home/fred/Documents/abc:\e
/home/fred/Documents/textp:/home\f(CW
$ \f(CBcd fortran\f(CW
/home/fred/Documents/abc/fortran
$ \f(CBcd jane\f(CW
/usr/jane
$ \f(CBcd ch03\f(CW
/home/fred/Documents/textp/ch03
.Pe
When you issue a
.CW cd
command, the shell searches for a subdirectory with that name
under any of the directories in the path, changes to it, and
prints the full directory name.
.PP
Specify the search directories in
.CW CDPATH
between colons.
Directories listed in
.CW CDPATH
are searched in order from left to right.
.PP
Another useful alias (Bash style):
.Ps
% \f[CB]alias l="ls -CF --color"\fP
.Pe
Now, typing
.CW l
and pressing
.B Enter
lists your directory in columns (\c
.CW -C
option), highlighting special files (\c
.CW -F
option), and using color to highlight directories
and other files.
.
.Bh "Shell Filename Metacharacters"
.ix	files, metacharacters
.LP
Even with files organized into directories,
you can still accumulate a lot of files.
Developing consistent naming conventions
that take advantage of shell metacharacters (wildcards)
can save you a lot of trouble.
Most users are familiar with metacharacters,
but many don't make full use of them.
.PP
In UNIX, you can match any part of a filename with a wildcard.
Remember that
.CW *
matches
.I zero
or more characters.
This lets you select a specific group of files
out of a directory.
In the following example, assume that you want to delete the files
.CW lock ,
.CW filelocks ,
and
.CW lock.release ,
but ignore the files
.CW filelist ,
.CW lecture ,
and
.CW stocks.c .
.Ps
$ \f(CBls\f(CW
filelist
filelocks
lecture
lock
lock.release
stocks.c
$ \f[CB]ls *lock*\f[CW]
filelocks
lock
lock.release
$ \f(CBrm *lock*\f(CW
.Pe
Because
.CW *
can match zero characters,
.CW *lock*
matches
.CW lock
as well as
.CW filelocks
and
.CW lock.release .
If you use
.CW ls
with your metacharacter construct first,
you can list the files that
.CW rm
deletes with the same arguments.
.PP
The shell interprets the pattern-matching character
.CW ?
to match any single character,
and the construct
.I m-n ] [
to match a range of consecutive characters.
.PP
If you name your files consistently,
you can use these characters
to select groups of files.
For example,
in a directory containing a BASIC manual,
you might have the following list of files:
.Ps
$ \f(CBls\f(CW
appa
appb
changes
ch01
ch01.old
ch02
ch03
ch03.examples
ch03.out
ch04
ch04.examples
ch05
letter.613
.Pe
.PP
As usual,
any directory can accumulate auxiliary files.
Some of these files apply to the work on this project,
but are not actually part of the book.
If you carefully choose the names of related files,
you can use metacharacters
to select only the files in a particular group.
For example:
.page 296
.Ps
$ \f(CBls ch0?\f(CW
ch01
ch02
ch03
ch04
ch05
.Pe
You could select a range of files, using brackets:
.Ps
$ \f(CBls ch0[3-5]\f(CW
ch03
ch04
ch05
.Pe
If you enter
.CW ch0* ,
.CW ls
includes miscellaneous files such as
.CW ch01.old .
Whenever you use numbers in filenames, as shown here,
to consistently name a group of related files,
begin the numbering sequence with 01, 02 .\|.\|.
rather than 1, 2 .\|.\|.
This helps
.CW ls
to list the files in proper alphabetical order.
Otherwise,
.CW ls
lists
.CW ch1 ,
then
.CW ch11 ,
.CW ch12
.CW \&...
.CW ch2 ,
.CW ch20
.CW \&...
and so on.)
.PP
Metacharacters have broader applications
than for listing files.
Look at this example of running
.CW spell
.\" XXX replace with aspell
.ix	[spell] command %key spell command
on an entire book:
.Ps
$ \f(CBspell ch0? app? > spell.out\f(CW
.Pe
(We'll look at the
.CW spell
command later in the section \(lqProofing Documents.\(rq)
This command is run on the seven files that match one of the two
patterns specified on the command line.
.\" XXX rewrite for aspell
.PP
Metacharacters are also useful
in moving and copying files
from one directory to another:
.Ps
$ \f(CBcp basic/ch0? /work/backup\f(CW
.Pe
.
.Bh "Locating Files"
.LP
Although a hierarchical file system
with consistent naming conventions helps a lot,
you can still lose track of files,
or finding the ones
you want to manipulate.
.PP
You can lose a file on the file system
when you forget its directory.
To look through an
entire file system or a large directory hierarchy,
most modern systems
have an indexed search facility
that can quickly find any files given a name.
On Mac\~OS\~X, Spotlight is available from the menu bar
(or using
.CW mdfind
from a Terminal).
On Windows, Windows Search is available in the Start menu
(or use
.CW "winget search"
from the Command Prompt).
.PP
Linux supports a number of different
optional indexed search facilities.
If none are installed on your system,
use a utility called
.CW find .
.ix	%begin [find] command %key find command
The
.CW find
utility looks at the external characteristics of a file\[em]who
created it, when it was last accessed, its name, and so on.
.PP
The
.CW find
utility probably wins top honors for having the most
cumbersome command-line syntax in UNIX.
It's not that
.CW find
is a difficult command;
its syntax is difficult to recall.
You might expect that all you have to enter is
.CW find
and the name of the file that you want to look for.
This is not the way it works, however,
which is a nuisance to new users.
The
.CW find
command requires repeated trips to the
.I "UNIX Reference Manual" ,
or its manual page,
before you grasp its atypical format.
.page 297
.PP
To use
.CW find ,
specify the pathnames of the directories that you want to search;
then place one or more conditions upon the search.
The name of a particular file that you want to search for is
considered one of these conditions.
It is expressed as:
.Ps
-name \fIfilename\fP
.Pe
To obtain a listing of the pathnames of files that are found,
specify the
.CW -print
condition (\c
.CW -name
must precede
.CW -print ).
.PP
If you want to find any file named
.CW notes
in your
.CW Documents
directory, enter the command:
.Ps
$ \f(CBfind ~/Documents -name notes -print\f(CW
/home/fred/Documents/alcuin/notes
/home/fred/Documents/textp/ch02/notes
.Pe
The output is the pathname
(starting with the specified file system or directory)
of each file that it finds.
You can supply more than one pathname.
A slash
.CW / ) (
represents the root directory;
use it if you want to
search the entire file system.
Note that the search can take some time,
and that if you do not have read permissions to a directory,
you get a message saying it cannot be opened.
.PP
In the next example, we add another condition,
.CW -user ,
and limit the search to files named
.CW memo
that are owned by the user
.CW fred .
This is helpful when you are searching
for a file that has a
.ix	files, searching~for
.ix	files, locating
fairly common name and might exist in several users' accounts.
You can use filename metacharacters,
but you must protect them from the shell
using backslashes or single quotation marks.
If you don't do this, the shell interprets metacharacters
as referring to files in the current directory,
and does not pass them to the
.CW find
command.
.Ps
$ \f(CBfind /work /home -name 'memo*' -user fred -print\f(CW
/home/fred/Documents/alcuin/memo
/work/alcuin/memo.523
/work/caslon/memo.214
.Pe
Two directory hierarchies are searched,
.CW /work
and
.CW /home .
If you did not specify the
.CW -name
condition, this command would locate all the files owned by
.CW fred
in these two file systems.
.PP
Many
.CW find
conditions have uses for other tasks besides locating files.
For instance, you can descend a directory hierarchy, using
.CW find
to print the complete pathname of each file,
as in the following example:
.Ps
$ \f(CBfind /work/alcuin -print\f(CW
/work/alcuin
/work/alcuin/ch01
/work/alcuin/ch01.old
/work/alcuin/commands/open
/work/alcuin/commands/stop
\& ...
.Pe
This usage provides a kind of super
.CW ls
that lists all files under a given directory,
not just those at the current directory level.
This becomes very useful when you want to
back up your files.
You could also use
.CW "ls -R" ,
but
.CW ls
does not prepend the file names with their paths.
.page 298
.PP
The longer you work with a UNIX system,
the more you appreciate
.CW find .
Don't be put off by its awkward syntax and many options.
The time you spend studying this command pays off.
.
.Bh "File Characteristics"
.LP
Most of us are concerned only with the contents of a file.
However, to look at files from UNIX's point of view,
files are labeled containers
that are retrieved from storage
and soon put back in the same place.
It might be said that the operating system reads (and writes)
the label, but doesn't really care to look inside the container.
The label describes a set of physical or external characteristics
.ix	files, characteristics
for each file.
The
.CW ls
command displays this information when it
produces a long listing.
.Ps
$ \f(CBls -l /work/textp/ch01\f(CW
total 20
-rw-rw-r--   1 fred   doc   9496 Jun 10 15:18 ch01
.Pe
To the operating system, the file
.CW ch01 ) (
contains a certain number of
.I bytes
.ix	files, size~in bytes
(9496),
each representing a character.
The date and time
.CW "Jun 10 15:18" ) (
refer to the last time the file was modified.
.ix	files, date~and~time last~modified
The file has an
.I owner
.CW fred ), (
who is usually the person who created the file.
The owner belongs to a
.I group
of users
.CW doc ) (
who can be given different permissions from all
.I other
users.
The operating system keeps track of the file permissions
.ix	files, permissions
.CW -rw-rw-r-- ) (
for the owner, group, and other
users\(emdetermining who
can read, write, or execute the file.
.PP
You can modify all of these characteristics
either by using the file,
or by commands such as
.CW chmod
.ix	[chmod] command %key chmod command
(change permissions) or
.CW chown
.ix	[chown] command %key chown command
(change owner).
You may need to become a super-user to change these
.ix	super-user
characteristics.
.PP
There are some options for
.CW ls
that allow you to make use of this information.
For instance, if you recently made some changes
to a set of files,
but couldn't remember which ones,
use the
.CW -t
option to sort a list of files
with the most recently modified files first.
The
.CW -r
option reverses that order, so that
.CW "ls -rt"
produces a list with the oldest files first.
.PP
In addition,
.CW find
.ix	%end [find] command %key find command
has a number of options
that make use of external file characteristics.
As we've seen,
you can look for files
that belong to a particular user.
You can also look for files
that are larger than a particular size,
or were modified more recently than a certain date.
.PP
Don't get stuck thinking
that the only handle you can pick a file up with
is the file's name.
.
.Ah "Viewing the Contents of a File"
.LP
You are probably familiar with a number of UNIX commands
that let you view the contents of a file.
.ix	files, viewing contents
The
.CW cat
.ix	[cat] command %key cat command
command streams a file to the screen
at a rate that is usually too swift.
The
.CW less
.ix	%begin [less] command %key less command
command displays a file one page at a time.
You can use it as a
.I filter ,
.ix	filter
for instance, to supply paging for
.CW nroff
output.
.page 299
.Ps
$ \f(CBnroff -mm ch01 | less\f(CW
.Pe
You can also use
.CW less
to examine unformatted files,
proofing formatting codes as well as text.
Although these are frequently used commands,
not everyone is aware
that they have interactive subcommands, too.
You can search for a pattern;
execute a UNIX command;
move to another file specified on the command line;
or go to the end of the file.
.PP
You can list these subcommands by entering
.CW h
when the program pauses at the bottom of a page.
Here's the help screen
.ix	[less] command, help~screens %key less command, help screens
.CW less
provides.
.rn PS oldPS
.rn PE oldPE
.de PS
.in 5n
..
.de PE
.in 0
..
.PS
line 5.25i dashed
.PE
.Ps
                   SUMMARY OF LESS COMMANDS

      Commands marked with * may be preceded by a number, N.
      Notes in parentheses indicate the behavior if N is given.
      A key preceded by a caret indicates the Ctrl key; thus ^K is ctrl-K.

  h  H                 Display this help.
  q  :q  Q  :Q  ZZ     Exit.
 ---------------------------------------------------------------------------

                           MOVING

  e  ^E  j  ^N  CR  *  Forward  one line   (or N lines).
  y  ^Y  k  ^K  ^P  *  Backward one line   (or N lines).
  f  ^F  ^V  SPACE  *  Forward  one window (or N lines).
  b  ^B  ESC-v      *  Backward one window (or N lines).
  z                 *  Forward  one window (and set window to N).
  w                 *  Backward one window (and set window to N).
  ESC-SPACE         *  Forward  one window, but don't stop at end-of-file.
  d  ^D             *  Forward  one half-window (and set half-window to N).
  u  ^U             *  Backward one half-window (and set half-window to N).
  ESC-)  RightArrow *  Right one half screen width (or N positions).
  ESC-(  LeftArrow  *  Left  one half screen width (or N positions).
  ESC-}  ^RightArrow   Right to last column displayed.
  ESC-{  ^LeftArrow    Left  to first column.
  F                    Forward forever; like "tail -f".
  ESC-F                Like F but stop when search pattern is found.
  r  ^R  ^L            Repaint screen.
  R                    Repaint screen, discarding buffered input.
        ---------------------------------------------------
        Default "window" is the screen height.
        Default "half-window" is half of the screen height.
.B "HELP -- Press RETURN for more, or q when done"
.Pe
.PS
line 5.25i dashed
.PE
.rn oldPS PS
.rn oldPE PE
.LP
The last line indicates that
.CW less
has more commands beyond what it shows at first.
Press the space bar to see the next page of commands,
.B Enter
to show one more line, or
.B q
to exit the help screen.
.PP
One advantage of
.CW less
is the ability to invoke
.CW vi
at the current point in the file.
When you quit
.CW vi ,
.CW less
resumes paging through the rest of the file.
.PP
Another command used for examining a file is
.CW pr .
.ix	[pr] command %key pr command
Its most common use is to perform minor page formatting
for a file on the way to a line printer.
It breaks the input file into pages
(66 lines to a page)
and supplies a header that contains
the date, the name of the file,
and the current page number.
It adds top, bottom, and side margins.
.PP
The
.CW pr
command also has many options
that you can be use to perform some oddball tasks.
For example, the
.CW -n
option adds line numbers:
.Ps
$ \f(CBpr -n test\f(CW
.Pe
The following is displayed:
.page 300
.Ps
Jul  4 14:27 1987  test Page 1

  1   apples
  2   oranges
  3   walnuts
  4   chestnuts
.Pe
You can adjust the page length using the
.CW -l
option.
If you output to a terminal, the
.CW -p
option specifies a pause at the beginning of each page.
You can also display an input file in
.I -n
columns.
.PP
The
.CW -m
option simultaneously merges two or more files
and prints each of them, one per column:
.Ps
$ \f(CBpr -m -t test*\f(CW
.Pe
In this example, we display four files side-by-side:
.Ps
apples       apples     apples      oranges
oranges      oranges    oranges     walnuts
walnuts      walnuts    grapes      chestnuts
chestnuts
.Pe
.PP
The shell expands the
.CW test*
file specification to four filenames:
.CW test ,
.CW test1 ,
.CW test2 ,
and
.CW test3 .
The
.CW -t
option suppresses the heading
and does not print linefeeds to fill a page,
which is especially useful when you are sending
the output of
.CW pr
to a file or the terminal.
.PP
We found a use for
.CW pr
when working on this book.
We wanted to include
.CW nroff -\c
formatted examples in the text.
We had difficulty because
.CW nroff
inserts tabs, instead of spaces, to optimize horizontal
positioning on printers.
To remove the tabs, we used
.CW pr
with the
.CW -e
option to expand the tabs to their equivalent in blank spaces.
The following shell script implements this process
so you can invoke it as a single command.
.Ps
$ \f(CBnroff -mm -rO0 examples/$1 | pr -e -t\f(CW
.Pe
The
.CW pr
command works as a filter for
.CW nroff .
Use the
.CW -r
option with
.CW nroff
to set register
.CW O
(page offset or left margin) to zero.
.PP
Sometimes, you want to examine
the beginning or the end of a file.
Two commands,
.CW head
.ix	[head] command %key head command
and
.CW tail ,
.ix	[tail] command %key tail command
print the first or last ten lines of a file.
Use the
.CW head
command to look at the initial settings
of number registers and strings
that are often set at the top of a file.
.Ps
$ \f(CBhead ch02\f(CW
\&.nr W 65
\&.nr P 3
\&.nr L 60
\&.so /usr/lib/tmac/tmac.m
\&.nr Pt 2
\&.ds Ux \\s-2UNIX\\s0
\&.ds HP 3321
.page 301
\&.H1 "Product Overview"
\&.ds HM 11A
\&.
.Pe
You can redirect this output
to a file as a way of starting
.ix	output redirection
a new chapter.
The
.CW tail
command has the same syntax;
it can save time when you want to
check the end of a large file.
.
.Ah "Searching for Information in a File"
.ix	files, searching within
.LP
The
.CW grep
.ix	%begin [grep] command %key grep command
program provides many benefits
to users who don't remember what their files contain.
Even users of non-UNIX systems
who make fun of its obscure name
wish they had a utility with its power to search through a set
.ix	search
of files for an arbitrary text pattern, known as a
.I "regular expression" .
.ix	search, regular~expression
We have already discussed regular expressions and their use in
search and replace commands in
.CW vi
(see Chapter 7).
In this section, we show some of the ways to perform
pattern-matching searches using
.CW grep
and its siblings,
.CW egrep
and
.CW fgrep \**.
.FS
GNU
.CW grep
merges the functionality of
.CW grep ,
.CW egrep ,
and
.CW fgrep .
.FE
.PP
The main function of
.CW grep
is to look for strings matching a regular expression
and print only those lines that are found.
Use
.CW grep
when you want to look at how a particular word is used in one
or more files.
.Ps
$ \f(CBgrep "run[- ]time" ch04\f(CW
This procedure avoids run-time errors for not-assigned
and a run-time error message is produced.
run-time error message is produced.
program aborts and a run-time error message is produced.
DIMENSION statement in  BASIC is executable at run time.
This means that arrays can be redimensioned at run time.
accessible or not open, the program aborts and a run-time
.Pe
This example lists the lines in the file
.CW ch04
that contain either
.CW run-time
or
.CW "run time" .
.PP
Another common use is to look for a specific macro in a file.
In a file coded with
.CW mm
macros, the following command lists
top-level and second-level headings
in the first two chapters:
.Ps
$ \f(CBgrep "^\\.H[12]" ch0[12]\f(CW
ch01:.H1 "Introduction"
ch01:.H1 "Windows, Screens, and Images"
ch01:.H2 "The Standard Screen-stdscr"
ch01:.H2 "Adding Characters"
\&...
ch02:.H1 "Introduction"
ch02:.H1 "What Is Terminal Independence?"
ch02:.H2 "Termcap"
ch02:.H2 "Terminfo"
.Pe
In effect, it produces a quick outline
of the contents of these files.
When you specify more than one file,
the name of the file
appears with each line.
Note that we use brackets
.page 302
as metacharacters both in the regular expression and when
specifying the filename.
Because metacharacters (and spaces) have meaning to the shell,
it interpretes them as such
unless you place the regular expression
within quotation marks.
.PP
The
.CW grep
program has several common options.
The
.CW -i
option ignores the distinction between
uppercase and lowercase.
The
.CW -c
option tells
.CW grep
to return only a count of the number of lines matched.
The
.CW -l
option returns only the name of the file when
.CW grep
finds a match.
You can use this to prepare a list of files for another command.
.PP
The shell construct
.I command1
.I command2 ` `
uses the output of
.I command2
as an argument to
.I command1 .
For example, assume that you wanted to edit any file that has a
reference to a function call named
.CW getcursor .
The command:
.Ps
$ \f(CBvi `grep -l getcursor *`\f(CW
.Pe
invokes
.CW vi
on all of the files in the current directory containing the
string
.CW getcursor .
Because the
.CW grep
command is enclosed in single backquotes
.CW "` `" ), (
its output becomes the list of files to be edited.
.PP
The
.CW grep
.ix	[grep] command, using~with~find %key grep command, using with~find
command can work on the results of a
.CW find
.ix	[find] command %key find command
command.
You can use
.CW find
to supply a list of filenames and
.CW grep
to search for a pattern in those files.
For example, consider the following command, which uses
.CW find
to look for all files in the specified directory hierarchy
and passes the resulting names to
.CW grep
to scan for a particular pattern:
.Ps
$ \f(CBfind /work/docbook -exec grep "[aA]lcuin" {} \\;\f(CW
Alcuin product. Yesterday, I received the product  demo
Alcuin.  Some people around here,  looking over my shoulder,
with Alcuin. One  person,  a  student  of  calligraphy,
presents different strategies for documenting the Alcuin
The development of Alcuin can be traced to our founder's
the installation file "alcuin.install"> and the font
configuration file "alcuin.ftables."
.Pe
The
.CW -exec
condition specifies a command to execute
upon each file that is found (\c
.CW {}
indicates the pathname of the file).
The command must end with an escaped semicolon.
.PP
Although this is a good way to introduce the very useful
.CW -exec
option to
.CW find ,
it is actually not the best way to solve the problem.
You'll notice that even though
.CW grep
is working on more than one file, the filenames are not
printed because the data is actually passed to
.CW grep
from a pipe.
The reason is that
.CW grep
is being invoked many times (once for each file that is found),
and is not really working on many files at once.
If you wanted to produce a list of the selected files,
you could use the
.CW -l
option with
.CW grep .
But more to the point, this is a very inefficient way to do
the job.
.PP
In this case, you can use:
.Ps
$ \f(CBgrep "[aA]lcuin" `find /work/docbook -print`\f(CW
.Pe
Because
.CW grep
.ix	%end [grep] command %key grep command
is invoked only once, this command runs much faster.
.page 303
.PP
There is a potential danger in this approach.
If the list of files is long,
you may exceed the total allowable length of a command line.
The best approach uses a command we haven't shown yet\(em\c
.CW xargs .
.ix	[xargs] command %key xargs command
This command provides an extended version of the same function
the shell provides with backquotes.
It converts its input into a form
that you can use as an argument list
by another command.
The command to which the argument list is passed
is specified as the first argument to
.CW xargs .
So, you would write:
.Ps
$ \f(CBfind /work/docbook -print | xargs grep "[aA]lcuin"\f(CW
.Pe
Or you could generalize this useful tool
and save it as the following shell script,
which could be called
.CW mfgrep
(\c
.I multifile
.CW grep ).
This script takes the pathname for
.CW find
as the first argument and the pattern for
.CW grep
as the second.
The list of files found is passed to
.CW grep
by
.CW xargs :
.Ps
find $1 | xargs grep "$2"
.Pe
The
.CW fgrep
.ix	[fgrep] command %key fgrep command
(\c
.I fast
.CW grep )\**
.FS
Despite what the documentation says,
.CW egrep
.ix	[egrep] command %key egrep command
is usually the fastest of the three
.CW grep
programs.
.FE
command performs the same function as
.CW grep ,
except it searches for a fixed string
rather than a regular expression.
Because it doesn't interpret metacharacters,
it often searches faster than
.CW grep .
For interactive use,
you may not find enough difference to
keep this command in your active repertoire.
However, it may be of more benefit inside shell scripts.
.PP
The
.CW egrep
command is yet another version of
.CW grep ,
one that extends the syntax of regular expressions.
A
.CW +
following a regular expression matches one or more
occurrences of the regular expression; a
.CW ?
matches zero or one occurrences.
In addition, you can nest regular expressions
within parentheses.
.Ps
$ \f(CBegrep "Lab(oratorie)?s" name.list\f(CW
AT&T Bell Laboratories
AT&T Bell Labs
.Pe
Parentheses surround a second regular expression and
.CW ?
modifies this expression.
The nesting helps to eliminate unwanted matches;
for instance, the word
.I Labors
or
.I oratories
would not be matched.
.PP
Another special feature of
.CW egrep
is the vertical bar
.CW | ), (
which serves as an
.I or
operator between two expressions.
Lines matching either expression are printed,
as in the next example:
.Ps
$ \f(CBegrep "stdscr|curscr" ch03\f(CW
into the stdscr, a character array.
When stdscr is refreshed, the
stdscr is refreshed.
curscr.
initscr() creates two windows: stdscr
and curscr.
.Pe
.page 304
Remember to put the expression inside quotation marks
to protect the vertical bar
from being interpreted by the shell
as a pipe symbol.
Look at the next example:
.Ps
$ \f(CBegrep "Alcuin (User|Programmer)('s)? Guide" docguide\f(CW
Alcuin Programmer's Guide is a thorough
refer to the Alcuin User Guide.
Alcuin User's Guide introduces new users to
.Pe
You can see the flexibility that
.CW egrep 's
syntax can give you, matching either
.I User
or
.I Programmer
and matching them if they had an
.I \&'s
or not.
.PP
Both
.CW egrep
and
.CW fgrep
can read search patterns from a file using the
.CW -f
option.
.
.Ah "Proofing Documents"
.LP
There are no computer tools
that completely replace the close examination
of final printed copy by the human eye.
However, UNIX does support a number of proofing aids,
ranging from spelling checkers
to optional programs for checking style and diction,
and even sexist usage.
.PP
We'll look at some of these programs in this section.
Not all of the programs we discuss
are available on all UNIX systems.
Keep in mind, though, that
.CW grep
is also a very powerful proofing aid,
which you can use to check
for consistent usage of words and phrases.
.
.Bh "Looking For Spelling Errors"
.LP
Using
.CW vim
or
.CW gvim ,
or programming editors like Brackets or VScodium,
you can take advantage of built-in spelling libraries
to flag spelling errors.
.PP
The traditional UNIX
.CW spell
.ix	[spell] command %key spell command
command reads one or more files and prints a list of words that
are possibly misspelled.
You can redirect the output to a file, then use
.CW grep
to locate each of the words, and
.CW vi
or
.CW ex
to make the edits.
The Free software community
has developed extended spell-checking programs,
.CW aspell ,
.CW ispell ,
and others.
In particular,
.CW aspell
and
.CW ispell
offer interactive spell-checking
and can work with unfiltered
.CW troff
files.
Since the original
.CW spell
utility is not readily available,
and more powerful replacements are pre-installed
on most modern UNIX systems,
we use
.CW aspell
in the following examples.
.ig
.\" I think we can remove proof because aspell does the heavy lifting. -LK
.PP
In the next chapter, though, we introduce a shell script named
.CW proof
.ix	[proof] shell~script %key proof shell script
for running
.CW spell
interactively and correcting spelling errors in place in a file.
You will probably prefer to use
.CW spell
in that manner rather than invoking it manually.
.PP
Even if you do build that script, 
..
.PP
You can use
.CW "aspell list"
if you are unsure about which of two possible
spellings is right.
Type the name of the command, followed by a
.I RETURN ,
then type the alternative spellings you are considering.
Press
.CW ^D
(on a line by itself) to end the list.
The
.CW aspell
command echos the word(s) in the list
that it considers to be in error.
.Ps
$ \f[CB]aspell list\fP
misspelling
mispelling
^D
mispelling
.Pe
If you just want to see a list of words that
.CW aspell
considers misspelled, like the original
.CW spell
behavior, use:
.Ps
$ \f[CB]deroff\fP \fIfile\fP | \f[CB]aspell list\fP
.Pe
The
.CW deroff
utility strips
.CW roff
markup from the file
(making it suitable for
.CW "aspell" ).
If you don't have
.CW deroff
on your system,
or it produces garbled output, try:
.Ps
$ \f[CB]nroff\fP \fI-macro file\fP | \f[CB]aspell list\fP
If hyphenation is enabled,
the output includes words split across two lines.
You can fix that by adding the line:
.Ps
\&.if n .hy 0
.Pe
to the beginning of your file.
.PP
To check a file, use
.CW "aspell -n check"
.I file .
The
.CW -n
option instructs it to ignore
.CW roff
markup.
It shows each flagged word in context.
Often, the words it flags are
legitimate words or terms that the program does not
recognize.
You must cull out the proper nouns and other words
.CW spell
doesn't know about to arrive at a list of true misspellings.
For instance, look at the results on this sample sentence:
.Ps
$ \f(CBcat sample\f(CW
Alcuin uses TranScript to convert ditroff into
PostScript output for the LaserWriter printerr.
.Pe
When you run
.CW "aspell check sample" ,
it displays the file and highlights
questioned words one at a time.\**
.FS
If
.CW aspell
does not find any words to flag,
it exits without displaying anything.
.FE
Below the display,
.CW aspell
shows a list of suggested replacements
and other actions:
.rn PS oldPS
.rn PE oldPE
.de PS
.in 5n
..
.de PE
.in 0
..
.PS
line 5.25i dashed
.PE
.Ps

Alcuin uses \fUTranScript\fP to convert ditroff into
PostScript output for the LaserWriter printerr.


                                                                                                              
1) Transcript                         6) Transcribed
2) Transcripts                        7) Transcribe
3) Tran Script                        8) Transept
4) Tran-Script                        9) Transcriber
5) Transcript's                       0) Manuscript
i) Ignore                             I) Ignore all
r) Replace                            R) Replace all
a) Add                                l) Add Lower
b) Abort                              x) Exit

.Pe
.PS
line 5.25i dashed
.PE
.rn oldPS PS
.rn oldPE PE
.LP
For each flagged word,
.CW aspell
displays up to ten suggested replacements,
and several actions:
.Ls B
.Li
.CW "i) Ignore" :
skip this word, but flag later instances.
.Li
.CW "I) Ignore all" :
skip all instances of this word,
without adding it to your dictionary.
.Li
.CW "r) Replace" :
replace this word
with one you specify yourself.
.CW aspell
records replacements in the file
.CW \&.aspell.en.prepl
in your home directory.
.Li
.CW "R) Replace all" :
replace all instances of this word
with one you specify yourself.
.Li
.CW "a) Add" :
Add this word to your dictionary, stored in the file
.CW \&.aspell.en.pws
in your home directory.
Future
.CW aspell
runs treat this word as valid.
.Li
.CW "l) Add Lower" :
Add this word to your dictionary, as lower case.
Future
.CW aspell
runs treat this word as valid.
.Li
.CW "b) Abort" :
Quit
.CW aspell
without saving changes.
.Li
.CW "x) Exit"
Quit
.CW aspell
and save any changes made to this point.
.Le
.LP
To supply a local dictionary file
of special words and terms
specific to your site or application,
you must first generate a word list
as described above.
Output the list to a temporary file,
then edit the file to keep only the words
you want
.CW aspell
to ignore.
Then, use the following command to create
a personal dictionary:
.Ps
\[CB]aspell\fP --lang=en create master ./\fIdictfile\fP < \fIwordlist\fP
.Pe
The
.CW \&./
in front of your dictionary file name is important, because
.CW aspell
would otherwise create the dictionary
in its default word list directory.
.PP
After creating the dictionary,
use the
.CW -p
option with the specified file name:
.Ps
aspell -n -p \fIdictfile\fP check \fIfile\fP
.Pe
The
.CW aspell
command checks this list
after it has gone through its own dictionary.
.PP
The
.CW aspell
command misses words specified as arguments to
.CW nroff
or
.CW troff
macros, and, like any spelling checker,
can make some errors
based on incorrect derivation of spellings
from the root words
contained in its dictionary.
If you understand how
.CW aspell
works, you may be less surprised by some of these errors.
.PP
By default,
.CW aspell
provides spelling lists for
American, British, Canadian, and Australian usage.
Lists for other languages are available
from the
.CW aspell
website and invoked with the
.CW -l
option to
.CW aspell .
You cannot read or update
these lists directly.
They are compressed files, compiled from a list of words
represented as hash codes.
(Hash-coding is a special technique for quick search of
information.)
.PP
When you start
.CW aspell ,
it loads the list of hash codes from
the chosen language file,
and looks for the hash code corresponding to each
word in the file.
This eliminates all words (or hash codes) actually found in the
spelling list.
For the remaining words,
.CW aspell
tries to see if it can derive a recognizable word by performing
various operations on the word stem, based on suffix and prefix
rules.
A few of these manipulations follow:
.Ps
-y+iness
+ness
-y+i+less
+less
-y+ies
-t+ce
-t+cy
.Pe
The
.CW aspell
program checks these new words,
created as a result of these manipulations,
against the spell table.
.PP
As
.CW aspell
finds a word not in the spell list,
it highlights the word and provides a menu
of actions and suggested replacements.
.
.Bh "Checking Hyphenation"
.LP
The
.CW hyphen
.ix	[hyphen] command %key hyphen command
command was meant for
.CW nroff -\c
formatted files to print a list of words that
have been hyphenated at the end of a line.
While the utility or its source is not generally available,
a very simple
.CW awk
script can duplicate its functionality.
Copy this code into a file called
.CW hyphen.awk :
.Ps
BEGIN {
  broken = 0 # true if previous line ended with a hyphen
  stem = ""  # keep the last word on the line if it ends with a hyphen
}

# If previous line had its last word hyphenated,
# join it and the first word & print.
broken > 0 {
  print stem $1
  broken = 0
}

# Keep and flag a hyphenated word at end of line.
# We're looking for "normal" and UTF-8 hyphens.
$NF ~ /[-‐]$/ {
  stem = $NF
  broken = 1
}
.Pe
Now you can check that
.CW nroff
has correctly hyphenated words.
.Ps
$ \f[CB]nroff ch03 | awk -f hyphen.awk\fP
sys-tem.
documenta-tion
indistin-guishable
ver-sions
de-scribed
.Pe
If you disagree with the hyphenation of a word,
go back into your source file and use either the
.CW \&.hw
request to specify hyphenation points or the
.CW \&.nh
request to inhibit hyphenation of the word
(or set
.CW \e%
at the beginning of the word to inhibit hyphenation
only on that instance).
.
.Bh "Counting Words"
.LP
In the past, writers were paid by the word.
The
.CW wc
command counts words for you.
.Ps
$ \f(CBwc ch01\f(CW
180   1529   9496 ch01
.Pe
The three numbers printed represent the number of lines, words,
and characters, respectively.
(The presence of formatting commands in the input file
can make this measurement somewhat inaccurate).
.
.Bh "Writer's Workbench"
.ix	Writer's~Workbench
.PP
No book on UNIX text processing can avoid some discussion
of Writer's Workbench (WWB), a collection of programs for
the analysis of writing style.
.PP
Unfortunately,
like most of the programs described in this chapter,
the Writer's Workbench is not available.
It was originally developed for internal use at Bell Labs,
and was available in early releases of UNIX
to the academic community.
But it was made into a separate product
when UNIX was commercially released.
.PP
The three original programs are
.CW style ,
.CW diction ,
and
.CW explain .
.PP
The GNU project has replacements for
.CW style
and
.CW diction .
.\" xxx https://www.gnu.org/software/diction/diction.html
The WWB versions automatically called
.CW deroff
to strip markup before performing the analysis;
the GNU versions require
you to manually use
.CW deroff
(or some other means).
This allows using
.CW style
and
.CW diction
with other documentation formats
including HTML, XML, and Markdown.
A word processing program's
.B "Save as text"
export allows using these utilities
on Word or other word processor documents.
.PP
The
.CW style
.ix	Writer's~Workbench, analyze style/readability ([style]) %key Writer's Workbench, analyze style/readability (style)
program analyzes a document's style
and computes readability indexes based on several algorithms
widely accepted in the academic community.
For example, when run on the updated Chapter 1,
.CW style
gave the following report:
.Ps
readability grades:
        Kincaid: 10.9
        ARI: 11.9
        Coleman-Liau: 10.2
        Flesch Index: 57.9/100
        Fog Index: 14.4
        Lix: 47.5 = school year 8
        SMOG-Grading: 12.5
sentence info:
        26798 characters
        5777 words, average length 4.64 characters = 1.48 syllables
        251 sentences, average length 23.0 words
        43% (109) short sentences (at most 18 words)
        15% (38) long sentences (at least 33 words)
        82 paragraphs, average length 3.1 sentences
        0% (1) questions
        67% (169) passive sentences
        longest sent 65 wds at sent 200; shortest sent 4 wds at sent 103
word usage:
        verb types:
        to be (248) auxiliary (83) 
        types as % of total:
        conjunctions 5% (296) pronouns 6% (356) prepositions 12% (685)
        nominalizations 2% (111)
sentence beginnings:
        pronoun (34) interrogative pronoun (6) article (41)
        subordinating conjunction (35) conjunction (4) preposition (25)
.Pe
Even if you aren't an English teacher and don't know the
Kincaid algorithm from the Flesch, this report can be useful.
The
.CW -p
option prints sentences that
.CW style
considers passive text.
.PP
Regardless of the differences between the algorithms,
they all give you a general idea of
the required reading level
for what you have written.
You should adjust your style
according to the audience level you want to reach.
This may not be a trivial task,
but it may be vital
if you are writing a book for a specific audience.
For example, if you are writing
an instruction manual for heavy equipment
to be used by people reading at the sixth-grade level, a
.CW style
report like the example
would warn you that the manual
would not be successful.
.PP
In general, to lower the reading level of a document,
use shorter sentences and simpler constructions.
Incidentally, most writing in newspapers
and general circulation magazines
is at the sixth-grade level.
But you shouldn't get the impression
that text written for a
lower reading level is better.
Writing can be clear and effective
at any level of complexity.
At the same time,
each of us must recognize,
and adjust for, the skills of our intended reader.
.PP
The analysis of reading level is only a small part of what
.CW style
offers.
The detailed analysis of sentence length and type, word usage,
and sentence beginnings can give you considerable insight into
your writing.
If you take the time to read the report carefully
as you reread your text, you can see patterns and
make intelligent decisions about editorial changes.
.PP
As an exercise, run
.CW style
on a short passage you have written, read the report carefully,
then rewrite your work based on the report.
See what difference this makes to the
.CW style
report.
You eventually get a feel for what the program provides.
.PP
In some cases,
.CW diction ,
the other major program in the Writer's Workbench,
can also help you find areas to change.
.PP
The
.CW diction
.ix	Writer's~Workbench, search~for poor phrasing ([diction]) %key Writer's Workbench, search~for poor phrasing (diction)
program relies on a library
of frequently misused words and phrases.
It searches out these words and flags them as
inappropriate by enclosing them in brackets.
For example, when run on a previous draft of this section,
.CW diction
made the following recommendations:
.page 310
.Ps
  style performs stylistic analysis of a document  and
  computes readability indexes based on a[ number of ]
  algorithms widely accepted in the academic community.

  this may not be a trivial  task  however it may be a
  [ vital ] one if you are writing a book  with a specific
  target audience.

  for example  if you were  writing an instruction manual
  for heavy equipment to be used by  people reading at the
  sixth grade level a style report like the one shown above
  would be a dire warning that the manual would not be
  [ very ]successful.

  [ in some cases ] diction  the other  major program in the
  writer's workbench can help you  to find possible areas to
  change.

  in the latest official release of wwb there are a
  [ number of ]  additional programs  including  .

  morestyle  which looks for abstract words as well as
  listing the  frequency with which each word is used
  and the word diversity the[ number of ]different words
  divided by the total[ number of ] words.

  morestyle also gives a count of the[ number of ]negative
  constructions contained in your writing.

  spellwwb  which lists possible spelling errors in a
  slightly more  usable format than the standard spell
  program  and spelladd   which allows you to build a local
  dictionary word of spelling  exceptions  words that spell
  regards as errors  but[ which ]you  know to be correct.

  you can run these programs individually  or using one of
  several  [ overall ]control programs.

  running wwb will run[ all of ]these programs.

  number of sentences 37 number of hits 10
.Pe
The best way to use
.CW diction
is to pipe the output of
.CW deroff
or
.CW nroff
into it.
You can redirect its output
.page 311
to a file, or page through it on the screen.
.PP
We find that we ignore
.CW diction 's
advice much of the time\(emthe exception list is applied across
the board, without regard for context.
For example, you'll notice that it flagged the phrase
.I "number of"
several times, though that was exactly what we meant in
all but one case.
However, the twenty percent of its recommendations
that we agree with
are worth the effort of running the program.
.PP
If you don't understand why
.CW diction
complains about a phrase,
use the
.CW -s
or
.CW --suggest
option
.ix	Writer's~Workbench, explain [diction] errors ([explain]) %key Writer's Workbench, explain diction errors (explain)
to ask for help.
For example:
.Ps
$ \f(CBdiction -s\f(CW
phrase?
which
use "that" when clause is restrictive for "which"
use "when" for "at which time"
phrase?
number of
use "many" for "a large number of"
use "several, many, some" for "a number of"
use "usually" for "except in a small number of cases"
use "some" for "in a number of cases"
use "enough" for "sufficient number of"
use "often" for "in a considerable number of cases"
phrase?
perform
use "do" for "perform"
use "measure" for "perform a measurement"
phrase?
^D
.Pe
.
.\" ignore these too, until we run down replacements
.PP
The official release of WWB for 3B computers contained improved
versions of
.CW style
and
.CW diction ,
as well as many additional programs.
.ix	Writer's~Workbench, miscellaneous~programs
These programs included
.RS
.Ls B
.Li
.CW abst ,
which evaluates the abstractness of your writing.
.Li
.CW acro ,
which looks for acronyms (any word printed in all capital
letters) so you can check that they have been properly defined.
.Li
.CW dictadd ,
which allows you to add to the dictionaries used by
.CW diction ,
.CW spell ,
and
.CW sexist.
.Li
.CW double ,
which looks for double words.
.Li
.CW findbe ,
which looks for syntax that may be difficult to understand.
.Li
.CW morestyle ,
which looks for abstract words and lists the frequency with
which each word is used and the word diversity (the number of
different words divided by the total number of words).
The
.CW morestyle
program also gives a count of the number of negative
constructions contained in your writing.
.page 312
.Li
.CW org ,
which prints the first and last sentence of each paragraph, so
you can analyze paragraph transitions and the flow of ideas
within your writing.
.Li
.CW punct ,
which checks punctuation (e.g., the placement of commas
and periods with quotation marks).
.Li
.CW sexist ,
which checks your writing against a dictionary of sexist words
and phrases.
.Li
.CW spellwwb ,
which lists possible spelling errors in a slightly more usable
format than the standard
.CW spell
program, and
.CW spelladd ,
which allows you to build a local dictionary of spelling
exceptions (words that
.CW spell
regards as errors, but that you know to be correct).
.Li
.CW splitrules ,
which finds split infinitives.
.Li
.CW syl ,
which prints the average number of syllables in the
words you use.
.Le
.RE
You can run these programs individually or use one of several
control programs.
The
.CW wwb
program runs just about everything.
The
.CW proofr
program runs those programs that help you proofread (such as
.CW spell ,
.CW double ,
.CW punct ,
and
.CW diction ).
The
.CW prose
program runs those that analyze style (such as
.CW style
and
.CW sexist ).
.PP
There is also an interactive version of
.CW proofr
called
.CW proofvi ,
which stores its output in a temporary file and then allows you
to edit your original, stepping through each flagged problem.
..
.
.Ah "Comparing Versions of the Same Document"
.LP
UNIX provides a number of useful programs for keeping track of
different versions of documents contained in two or more files:
.RS
.Ls B
.Li
the
.CW diff
.ix	%begin [diff] command %key diff command
family of programs, which print out lines that are different
between two or more files
.Li
source control systems,
which let you keep a compact history of
differences between files,
so that you can go back and
reconstruct any previous version.
.CW SCCS
was the original source control system,
but modern UNIX systems provide
.CW git .
.Li
the
.CW make
program, which keeps track of a predefined list of dependencies
between files
.Le
.RE
.
.Bh "Checking Differences"
.LP
The
.CW diff
command displays different versions of lines that are found when
comparing two files.
It prints a message that uses
.CW ed -like
notation (\c
.CW a
for append,
.CW c
for change, and
.CW d
for delete) to describe how a set of lines has changed.
This is followed by the lines themselves.
The
.CW <
character precedes lines from the first file and
.CW >
precedes lines from the second file.
.page 313
.PP
Let's create an example to explain the output produced by
.CW diff .
Look at the contents of three sample files:
.sp 1v
.Ps
 \s+2\fBTESTl\fP\s0          \s+2\fBTEST2\fP\s0          \s+2\fBTEST3\fP\s0
.sp 1v
apples          apples          oranges
oranges         oranges         walnuts
walnuts         grapes          chestnuts
.Pe
When you run
.CW diff
on these files, it produces the following output:
.Ps
$ \f(CBdiff test1 test2\f(CW
3c3
< walnuts
---
> grapes
.Pe
The
.CW diff
command displays the only line
that differs between the two files.
To understand the report, remember that
.CW diff
is prescriptive,
describing what changes you need to make to the
first file to make it the same as the second file.
This report specifies that only the third line is affected,
exchanging walnuts for grapes.
This is more apparent if you use the
.CW -e
option, which produces an editing script
that can be submitted to
.CW ed ,
the UNIX line editor
(you must redirect standard output
to capture this script in a file).
.Ps
$ \f(CBdiff -e test1 test2\f(CW
3c
grapes
\&.
.Pe
This script, if run on
.CW test1 ,
brings
.CW test1
into agreement with
.CW test2 .
(Later in this section, we'll look at how to get
.CW ed
to execute this script.)
If you compare the first and third files,
you find more differences:
.Ps
$ \f(CBdiff test1 test3\f(CW
1d0
< apples
3a3
> chestnuts
.Pe
To make
.CW test1
the same as
.CW test3 ,
you'd have to delete the first line (\c
.I apples )
and
append the third line from
.CW test3
after the third line in
.CW test1 .
Again, you can see this more clearly
in the editing script produced by the
.CW -e
option.
Notice that the script specifies editing lines in reverse order;
otherwise, changing the first line would alter all succeeding
line numbers.
.page 314
.Ps
$ \f(CBdiff -e test1 test3\f(CW
.ix	%end [diff] command %key diff command
3a
chestnuts
\&.
1d
.Pe
.PP
You can use the
.CW diff3
.ix	[diff3] command %key diff3 command
command to look at differences between three files.
For each set of differences, it displays a row of equals signs (\c
.CW ==== )
followed by 1, 2, or 3, indicating which file is different;
if no number is specified, then all three files differ.
Then, using
.CW ed -like
notation, it describes the differences for each file.
.Ps
$ \f(CBdiff3 test1 test2 test3\f(CW
====3
1:1c
2:1c
  apples
3:0a
====3
1:3c
2:3c
  grapes
3:2,3c
  walnuts
  chestnuts
.Pe
With the output of
.CW diff3 ,
it is easy to keep track of which file is which; however, the
prescription given is a little harder to decipher.
To bring these files into agreement,
you have to add apples at the beginning of the third file;
change line 3 of the second file to line 3 of the first file;
and change lines 2 and 3 of the third file,
effectively dropping the last line.
.PP
The
.CW diff3
command also has a
.CW -e
option for creating an editing script for
.CW ed .
It doesn't quite work the way you might think.
Basically, it creates a script for
building the first file from the second and third files.
.Ps
$ \f(CBdiff3 -e test1 test2 test3\f(CW
3c
walnuts
chestnuts
\&.
1c
\&.
w
q
.Pe
If you reverse the second and third files, a different script
is produced:
.Ps
$ \f(CBdiff3 -e test1 test3 test2\f(CW
3c
grapes
\&.
.page 315
w
q
.Pe
As you might guess, this is basically the same output as doing
a
.CW diff
on the first and third files.
(The only difference in the output is the result of a rather
errant inconsistency between
.CW diff
and
.CW diff3 .
The latter produces an
.CW ed
script that ends with the commands
that save the edited version of the file;
.CW diff
requires that you supply them.)
Another useful program is
.CW sdiff
.ix	[sdiff] command %key sdiff command
.ix	%begin [sdiff] command %key sdiff command
(\c
.I side-by-side
.CW diff ).
Its most straightforward use is to display two files in two
columns on the screen.
In a gutter between the two columns,
the program displays a
.CW <
if the line is unique to the first file, a
.CW >
if the line is unique to the second file, and a
.CW |
if the line is different in both files.
Because the default line length of this program
(130 characters) is too wide for most physical terminals,
you can use the
.CW -w
option to specify a smaller width.
Using a GUI system, you can stretch your terminal window
to 132 characters instead.
Here are the results of running
.CW sdiff
on two different pairs of files:
.Ps
$ \f(CBsdiff -w60 test1 test2\f(CW
apples                    apples
oranges                   oranges
walnuts                |  grapes
$ \f(CBsdiff -w60 test1 test3\f(CW
apples                 <
oranges                   oranges
walnuts                   walnuts
                       >  chestnuts
.Pe
The
.CW -s
option to the
.CW sdiff
command only shows the differences between the two files,
suppressing identical lines.
One of the most powerful uses of
.CW sdiff
is interactive,
building an output file by choosing between
different versions of two files.
You have to specify the
.CW -o
option and the name of an output file to be created.
The
.CW sdiff
command then displays a
.CW %
prompt after each set of differences.
You can compare the different versions
and select the one to send to the output file.
Some of the possible responses are
.CW l
to choose the left column,
.CW r
to choose the right column, and
.CW q
to exit the program.
.Ps
$ \f(CBsdiff -w60 -o test test1 test3\f(CW
apples                  <
% l
oranges                   oranges
walnuts                   walnuts
                        >  chestnuts
% r
$ \f(CBcat test\f(CW
apples
oranges
walnuts
chestnuts
.Pe
.ix	%end [sdiff] command %key sdiff command
.page 316
Having looked at these commands in simplified examples,
let's now consider some practical applications
for comparing documents.
.PP
When working on a document, you might
make a copy of a file
and edit the copy rather than the original.
You might do this, for example,
if you are inputting edits from a written copy
for another writer.
Use the
.CW diff
.ix	%begin [diff] command %key diff command
command to compare the two versions of a document.
You could use it to proof
your edited copy against the original.
.Ps
$ \f(CBdiff brochure brochure.edits\f(CW
49c43,44
< environment for program development and communications,
---
> environment for multiprocessing, program development
> and communications, programmers
56c51
< offering even more power and productivity for commericial
---
> offering even more power and productivity for commercial
76c69
< Languages such as FORTRAN, COBOL, Pascal, and C can be
---
> Additional languages such as FORTRAN, COBOL, Pascal, and
.Pe
Using
.CW diff
in this manner is a simple way for a writer to examine changes
without reading the entire document.
By capturing
.CW diff
output in a file, you can keep a record of changes made to any
document.
.PP
.\" XXX rewrite as files for a website/SSG
As another example, suppose a company has a number of text files
that comprise its help facility.
These files are shipped with the
product and maintained online by the customer.
When there is a documentation update,
the customer needs to update these files.
One way to accomplish this is to replace each text file in its
entirety, but that involves distributing a lot of material that
remains unchanged.
Another way is to use
.CW diff
to send a record of changes between the old and the new.
The
.CW -e
option creates an editing script for
.CW ed
that can be used to recreate the second file from the first.
.Ps
$ \f(CBdiff -e help.txt help.new > help.chgs\f(CW
$ \f(CBcat help.chgs\f(CW
153,199d
65c
$INCLUDE {filename} program.name
\&.
56a
\&.Rh 0 "" "$CHAIN Statement"
\&.Rh "Syntax"
\&.in 5n
\&.nf
$CHAIN {filename} program.name
\&.fi
\&.in 0
.page 317
\&.Rh "Description"
Use the $CHAIN statement to direct the compiler to read
source code from program.name and compile it along
\&....
.Pe
.ix	%end [diff] command %key diff command
The company could ship the file
.CW help.chgs
with instructions on how to input this editing script to
.CW ed .
You'd want to create a shell script to automate this process,
but that is really an extension of knowing how it might be done
from the command line.
The following command pipes the editing script to
.CW ed :
.Ps
$ \f(CB (cat help.chgs; echo 'w') | ed - help.txt\f(CW
.Pe
To save the changes, the script submits a
.CW w
command through
.CW echo .
(If you have any concern about sparing the original file,
you could change the
.CW w
to
.CW 1,$p ,
which prints the edited contents to standard output,
instead of saving the changes.
Redirect standard output to a new file to keep both copies.)
.\" XXX end rewrite section
.PP
A second example: two other writers copied of a file
and made changes to their copies,
and now you want to compare them both against the original.
In this example,
.CW ch01
is the original;
.CW ch01.tom
contains edits made by Tom; and
.CW ch01.ann
contains changes made by Ann.
.ix	%begin [diff3] command %key diff3 command
.Ps
$ \f(CBdiff3 ch01 ch01.ann ch01.tom\f(CW
====3
1:56a
2:56a
3:57,103c
\&  .mc |
\&  .Rh 0 "" "$CHAIN Statement"
\&  .XX "BASIC statements, $CHAIN"
\&  .XX "$CHAIN statement"
\&  .Rh "Syntax"
\&  .UN
\&  .in 5n
\&  .nf
  $CHAIN {file} program.name
\&  .fi
\&  .in 0
\&  .Rh "Description"
  Use the $CHAIN statement to direct the compiler to read
  source code from program.name and compile it along
\&  ....
====3
1:65c
2:65c
  $INCLUDE {file}
3:112c
  $INCLUDE {file} program.name
====2
1:136c
.page 318
2:136c
  Nesting of $INSERT statements is not permitted.
3:183c
  Nesting of $INSERT statements is permitted.
====
1:143,144c
  program.name is converted to a valid UNIX filename.
\&  .LP
2:143,152c
  program.name is converted to a valid UNIX filename using
  the following conversion rules:
\&  .TS
  center, tab(@);
  c l c.
  /@is converted to@?
  ?@is converted to@??
  Null@is converted to@?0
  An initial .@is converted to@?.
\&  .TE
3:190,191c
  program.name is converted to a valid UNIX filename using
  a set of conversion rules.
.Pe
.ix	%end [diff3] command %key diff3 command
You often find that one version has some things right
and another version has other things right.
What if you wanted to compile a single version of this document
that reflects the changes made to each copy?
You want to select which version is correct
for each set of differences.
One effective way to do this would be to use
.CW sdiff .
.ix	%begin [sdiff] command %key sdiff command
.PP
We'll use the
.CW -s
option to suppress printing identical lines.
To make the example fit on the printed page,
we specify a 45-character line length.
(An 80-character line length for the screen
is a long-standing standard, but modern UNIX systems
with graphic displays support much wider lines.)
Because the total line length is limited to 45 characters,
.CW sdiff
displays only the first 15 or so characters of
the line for each file;
it truncates the rest of the line.
.Ps
$ \f(CBsdiff -w45 -s -o ch01.new ch01.ann ch01.tom\f(CW
56a57,103
                        >  .Rh 0 "" "$CHAIN Statement"
                        >  .XX "BASIC statements, $CHAIN"
                        >  .XX "$CHAIN statement"
                        >  .Rh "Syntax"
                        >  .UN
                        >  .in 5n
                        >  .nf
                        >  $CHAIN {\\fIfile\\fP} \\fI
                        >  .fi
                        >  .in 0
                        >  .Rh "Description"
                        >  Use the $CHAIN statement to de
.page 319
                        >  code from \\fIprogram.name\\fP
\&                     .......
% r
65c112
$ INCLUDE {\\fIfile\\fP}   |  $INCLUDE {\\fIfile\\fP}
% r
% 143,152c190,191
\\fIprogram.name\\fP is    |  \\fIprogram.name\\fP is
following rules.         |  following rules.
\&.TS                      <
center, tab(@);          <
c l c.                   <
/@is converted to@?      <
?@is converted to@??     <
Null@is converted to@?0  <
An initial .@is converted<
\&.TE                      <
% l
.Pe
.ix	%end [sdiff] command %key sdiff command
The file
.CW ch01.new
contains the portions of each file
that were selected along with
all the lines that both files have in common.
.\" XXX candidate for deletion
.PP
Another program worth mentioning is
.CW bdiff
.ix	[bdiff] command %key bdiff command
(\c
.I "big file"
.CW diff ).
It is used on files too large for
.CW diff .
This program breaks up a large file into smaller segments
and then passes each one through
.CW diff .
It maintains line numbering as though
.CW diff
were operating on one large file.
.\" XXX end delete candidate
.
.Bh "Git"
.ix Git (source~code~control~system)
.LP
We've shown an example using
.CW diff
to produce a file
that described the changes made to a text file
for a help facility.
It allowed the distribution of
a smaller file describing changes
instead of a wholly new version of the file.
This indicates a potential application for
.CW diff ,
which is fully realized in source code control systems
such as Git.
Git keeps track of the changes to files
.ix	files, tracking changes to (Git)
that take place at different stages of a software
development or documentation project.
For example,
the revised versions of this book
(\[lq]UTP Revival\[rq] and
the current version, \[lq]UTP Revisited\[rq])
are maintained in an online Git server called GitHub.
.PP
Suppose your first draft of a manual is stored in Git.
The second draft, of course,
has changes to the first draft.
.PP
When you
.I commit
the second draft using the
.CW git\~commit
command, Git uses
.CW diff
to record the changes to the first draft
that resulted in the second draft.
This is called a
.I commit ;
you might create multiple commits
for several reasons.
Then, you
.I push
any outstanding commits using the
.CW git\~push
command to put them in the Git repository.
Only the changes, and the instructions for having an editor
make them, need to be maintained.
This provides several advantages:
.Ls B
.Li
You have a complete history of changes,
including when the changes were committed
and who made them
(and, if the writer includes it, why).
.Li
You can revert individual commits if needed,
or even regenerate earlier drafts.
.Li
Multiple writers can work within the same repository.
If Anne is working on the installation instructions,
you can update the API instructions
(assuming they are in different files)
without worrying about overwriting each other's work.
Even if you both end up modifying the same files,
Git has a conflict resolution procedure.
.Li
If you move to a new computer,
you can easily
.I clone
the repository to your new computer
and pick up where you left off.
.Le
To get started with Git, read the
.B gittutorial (7)
and
.B giteveryday (7)
manual pages.
.
.page 320
.Bh "Using \f(CBmake\fP"
.ix	%begin [make] command %key make command
.LP
The
.CW make
program is a UNIX facility
for describing dependencies
among a group of related files,
usually ones that are part of the same project.
This facility has enjoyed widespread use
in software development projects.
Programmers use
.CW make
to describe how to \(lqmake\(rq a program\(emwhat source files
need to be compiled, what libraries must be included,
and which object files need to be linked.
By keeping track of these relationships in a single place,
individual members of a software development team
can make changes to a single module, run
.CW make ,
and be assured that the program reflects the latest changes
made by others on the team.
.PP
We group
.CW make
with other commands for keeping track of differences
between files only by a leap of the imagination.
It does not compare two versions of the same source file,
but you can use it to compare versions
of a source file and the formatted output.
.PP
Part of what makes UNIX
a productive environment for text processing
is discovering other uses for standard programs.
The
.CW make
utility has many possible applications
for a documentation project.
One such use is to maintain up-to-date copies
of formatted files that make up a single manual
and provide users with a way
of obtaining a printed copy of the entire manual
without having to know which preprocessors or
.CW nroff/troff
options need to be invoked.
.PP
The basic operation that
.CW make
performs is to compare two sets of files.
It compares the date or time stamp of pairs of files.
If the unformatted source file was modified
since the formatted file was made,
.CW make
executes the specified command to \(lqremake\(rq the formatted file.
.PP
To use
.CW make ,
you have to write a description file, usually named
.CW makefile
(or
.CW Makefile ),
that resides in the working directory for the project.
The
.CW Makefile
specifies a hierarchy of dependencies
among individual files, called
.I components .
At the top of this hierarchy is a
.I target .
For our purposes, think of the target
as a printed copy of a book;
the components are formatted files generated by processing an
unformatted file with
.CW nroff .
.PP
Here's the
.CW makefile
that reflects these dependencies.
.Ps
manual: ch01.fmt ch02.fmt ch03.fmt
      lp ch0[1-3].fmt
ch01.fmt: ch01
      nroff -mm ch01 > ch01.fmt
ch02.fmt: ch02
.	\"Note: a typo in the original had the next line as:
.	\" tbl ch02 | nroff -mm > ch01.fmt
      tbl ch02 | nroff -mm > ch02.fmt
ch03.fmt: ch03a ch03b ch03c
      nroff -mm ch03? > ch03.fmt
.Pe
.PP
You can represent this hierarchy in a diagram:
.page 321
.\" fp 4 C
.PS
.ps 12
E1: ellipse "Manual"

B1: box wid 0.85i "\f(CBch01.fmt\fP" at E1.s - (1.8i,1.5i);
B2: box wid 0.85i "\f(CBch02.fmt\fP" at E1.s - (0.0i,1.5i);
B3: box wid 0.85i "\f(CBch03.fmt\fP" at E1.s - (-1.8i,1.5i);

line from E1.s to B1.n;
line from E1.s to B2.n;
line from E1.s to B3.n;

B4: box invis ht 0.3i "\f(CBnroff -mm\fP"       at E1.s - (1.8i,2.5i);
B5: box invis ht 0.3i "\f(CBtbl | nroff -mm\fP" at E1.s - (0.0i,2.5i);
B6: box invis ht 0.3i "\f(CBnroff -mm\fP"       at E1.s - (-1.8i,2.5i);

line <-> from B1.s to B4.n;
line <-> from B2.s to B5.n;
line <-> from B3.s to B6.n;

B7: box wid 0.4i ht 0.3i "ch01" at B4 - (0.0i, 1.0i)
B8: box wid 0.4i ht 0.3i "ch02" at B5 - (0.0i, 1.0i)

B9: box wid 0.4i ht 0.3i "ch03a" at B6 - (0.8i, 1.0i)
B10: box wid 0.4i ht 0.3i "ch03b" at B6 - (0.0i, 1.0i)
B11: box wid 0.4i ht 0.3i "ch03c" at B6 - (-0.8i, 1.0i)

line from B4.s to B7.n
line from B5.s to B8.n
line from B6.s - (0.2i, 0.0i) to B9.n
line from B6.s to B10.n
line from B6.s - (-0.2i, 0.0i) to B11.n
.PE
.\" fp 4 CB
The target is
.CW manual ,
and it is made up of three formatted files
whose names appear after the colon.
Each of these components has its own dependency line.
For instance,
.CW ch01.fmt
is dependent upon a coded file named
.CW ch01 .
Underneath the dependency line is the command that generates
.CW ch01.fmt .
Each command line
.I must
begin with a tab.
.PP
When you enter the command
.CW make ,
it spools the three formatted files to the printer.
However, it performs a sequence of operations
before this final action.
It evaluaes the dependency line for each component,
determining whether the coded file was modified
since the last time the formatted file was made.
The formatting command executes only
if the coded file is more recent.
After all the components are made,
it runs the
.CW lp
command.
.PP
As an example of this process, we'll assume that all the
formatted files are up-to-date.
Then by editing the source file
.CW ch03a ,
we change the modification time.
When you execute the
.CW make
command, it runs commands to reformat
any output files dependent on
.CW ch03a .
.Ps
$ \f(CBmake\f(CW
  nroff -mm ch03? > ch03.fmt
  lp ch0[1-3].fmt
.Pe
Only
.CW ch03.fmt
needs to be remade.
As soon as that formatting command finishes,
the command underneath the target
.CW manual
is executed, spooling the files to the printer.
.PP
Although this example shows limited use of
.CW make 's
facilities, we hope it suggests more ways to use
.CW make
in a documentation project.
You can keep your
.CW makefiles
this simple, or you can go on to learn additional notation,
such as internal macros and suffixes,
to generalize the description file for increased usefulness.
We'll return to
.CW make
in Chapter 18.
.ix	%end [make] command %key make command
.page 322
.
.Ah "Manipulating Data"
.
.Bh "Removing Formatting Codes"
.LP
The
.CW deroff
.ix	%begin [deroff] command %key deroff command
command removes
.CW nroff/troff
requests, macros, inline backslash sequences, and
.CW eqn
and
.CW tbl
specifications.
.Ps
$ \f(CBcat temp\f(CW
\&.CH 11 "A Miscellany of UNIX Commands"
In this chapter, we present a miscellany of \\s-2UNIX\\s0
programs with text-processing applications.
\&.P
In addition, we introduce several \\s-2UNIX\\s0 utilities
$ \f(CBderoff temp\f(CW
.ig
	I really doubt deroff would have changed:
	"Miscellany of UNIX Commands"
	to
	"Miscellany of UNIX Programs"
	so I'm considering this an error and changing the
	output to reflect "Commands"
	--Michael Hobgood
..
A Miscellany of UNIX Commands
In this chapter, we present a miscellany of UNIX programs
with text-processing applications.
In addition, we introduce several UNIX utilities
.Pe
The
.CW wordlist
command takes the output of
.CW deroff ,
strips punctuation,
translates each word to lower case,
then prints each word on one line.
You can use this to analyze word usage,
build lists of words for a local spell dictionary,
or other purposes.
.Ps
$ \f(CBderoff temp | wordlist\f(CW
a
miscellany
of
unix
.ig
	Again, I really doubt deroff changed Commands to Programs
..
commands
in
this
chapter
we
present
miscellany
of
unix
programs
with
text
processing
applications
in
addition
.Pe
One use for
.CW wordlist
is to count the number of times each word is used.
The following example shows partial output
from a draft of Chapter 1 of this book.
.Ps
$ \f[CB]deroff ch01.t | wordlist | sort | uniq -c | sort -nr\fP
    300 the
    234 a
    179 to
    158 of
    114 and
    110 is
     91 you
     78 in
     73 that
     68 are
     64 for
     61 it
     53 as
     52 text
     49 word
     49 on
     45 document
     43 with
     41 or
     39 by
     39 be
     36 unix
     34 can
\&...
.Pe
The second sort command,
.CW "sort -nr" ,
performs a numeric sort of its input
and reverses the output
so the most common words appear first.
The next section discusses the
.CW sort
and
.CW uniq
commands in more detail.
.page 323
.
.Bh "The \f(CBsort\fP and \f(CBuniq\fP Commands"
The
.CW sort
.ix	[sort] command %key sort command
command puts lines of a file in alphabetic or numeric order.
The
.CW uniq
.ix	[uniq] command %key uniq command
command eliminates duplicate lines in a file.
.PP
The
.CW sort
command works on each line of a text file.
Normally, you use it to order the contents of files
containing data such as names, addresses, and phone numbers.
In the following example, we use
.CW grep
to search for index entries, coded with the macro
.CW \&.XX
or
.CW \&.XN ,
and sort the output in alphabetic order.
.Ps
$ \f(CBgrep ".X[XN]" ch04 | sort -df\f(CW
\&.XX "ABORT statement"
\&.XX "ASSIGNMENT statement"
\&.XX "BASIC statements, ABORT"
\&.XX "BASIC statements, ASSIGNMENT"
\&.XX "BASIC statements, BEGIN CASE"
.Pe
The
.CW -f
option folds uppercase and lowercase words together
(that is, it ignores case when performing the sort).
The
.CW -d
option sorts in dictionary order, ignoring any special characters.
The
.CW -n
option sorts in numeric order
(in a dictionary or default alphabetic sort,
the number
.B 12
would be sorted as higher than
.B 100 ).
The
.CW -r
option reverses the sort order.
.PP
The
.CW uniq
command works only on sorted files, comparing each adjacent line.
The
.CW sort
command has a
.CW -u
option for removing all but one identical set of lines.
Usually this is sufficient, but
.CW uniq
does have several options,
which gives you additional flexibility.
For example, here's the sorted output of four files:
.Ps
$ \f(CBsort test*\f(CW
apples
apples
apples
chestnuts
chestnuts
grapes
oranges
oranges
oranges
oranges
walnuts
walnuts
walnuts
.Pe
The
.CW -d
option prints one line for each duplicate line, but does not
print lines that are unique.
.page 324
.Ps
$ \f(CBsort test* | uniq -d\f(CW
apples
chestnuts
oranges
walnuts
.Pe
In this example,
.I grapes
has been filtered out.
The
.CW -u
option prints only unique lines.
If we used the
.CW -u
option,
only
.I grapes
would appear.
The
.CW -c
option includes a count of each occurrence.
.Ps
$ \f(CBsort test* | uniq -c\f(CW
      3 apples
      2 chestnuts
      1 grapes
      4 oranges
      3 walnuts
.Pe
.PP
You wouldn't expect
.CW sort
to be useful on a document containing long lines of text.
However, if you start sentences on a new line
when creating the input file (as we recommended in Chapter 3),
scanning a sorted file can produce some interesting things.
The following command sorts the contents of
.CW ch03
and pipes the output through
.CW less :
.Ps
$ \f(CBsort -u ch03 | less\f(CW
.Pe
Looking at the results gives you a slightly turned about view
of your document.
For instance, you might notice inconsistencies among arguments
to formatter requests:
.Ps
\&.sp
\&.sp .2i
\&.sp .3v
\&.sp .5
.Pe
Or you could check the frequency with which sentences begin
in the same manner:
.Ps
It is dangerous to use mvcur()
It is designed so that each piece of code
It is possible that some programs
.Pe
.PP
In the next example, we use
.CW deroff
to create a word list.
Then we sort it and use
.CW uniq
to remove duplicates.
The
.CW -c
option with
.CW uniq
provides a count of the occurrences of identical lines.
(It overrides
.CW -u
and
.CW -d .)
.Ps
$ \f(CBderoff -w ch03 | wordlist | sort -fd | uniq -c\f(CW
   1 abort
   1 aborted
   3 about
   4 above
   1 absolute
   1 absorb
   1 accepting
   1 accomplishes
   1 active
   2 actual
   5 actually
   9 add
\&...
  68 you
.page 325
  16 your
   2 zero
.Pe
.PP
In the next example, we repeat the previous command,
this time adding another sort
at the end to order the words by frequency.
The
.CW -r
option
.I reverses
the comparison, putting the greatest
number first.
.Ps
$ \f(CBderoff ch03 | wordlist | sort -fd | uniq -c | sort -rfd\f(CW
  666 the
  234 to
  219 is
  158 window
  156 of
  148 and
  114 in
  111 screen
  105 that
   83 character
   76 are
\&...
    1 aborted
    1 abort
.Pe
We show other examples of
.CW sort
.ix	[sort] command %key sort command
in the next section, where we look at sorting particular fields.
Be sure to read the UNIX command pages for
.CW sort
and
.CW uniq
.ix	[uniq] command %key uniq command
and experiment using different options.
.
.Bh "The \f(CBjoin\fP Command"
.LP
The
.CW join
.ix	%begin [join] command %key join command
command compares lines contained in separate files
and joins lines that have the same key.
When you use
.CW sort
or
.CW join ,
each line is separated into
.I fields
by blanks or tabs.
Normally, the first field is the key field, on which the
.ix	%begin fields, in~[sort] %key fields, in sort
.CW sort
or
.CW join
is performed.
You can use options to change the key field.
You must sort the file in ascending ASCII sequence
before sending it to
.CW join.
.Ps
$ \f(CBcat 85\f(CW
jan   19
feb   05
mar   14
apr   15
may   15
jun   18
jul   19
aug   20
sep   19
nov   18
dec   18
$ \f(CBcat 86\f(CW
.page 326
jan   09
feb   15
mar   04
apr   06
may   14
jun   13
jul   13
aug   10
sep   14
nov   13
dec   12
$ \f(CBsort 85 > 85.temp; sort 86 > 86.temp\f(CW
.Pe
First we sort both of these files, creating temporary files.
Then we perform the
.CW join ,
followed by a
.CW sort
with the
.CW -M
option, to reorder them by month.
.Ps
$ \f(CBjoin 85.temp 86.temp | sort -M > joiner\f(CW
$ \f(CBcat joiner\f(CW
jan 19 09
feb 05 15
mar 14 04
apr 15 06
may 15 14
jun 18 13
jul 19 13
aug 20 10
sep 19 14
nov 18 13
dec 18 12
$
.Pe
.ix	%end [join] command %key join command
After joining the data, you can sort it by field.
White space (blank spaces or tabs) separate fields.
You can sort on specific fields, using
.CW +
to indicate
the first sort field and
.CW -
to indicate the last sort field.
The default first field is
.CW +0 .
To sort on the second field, use
.CW +1 .
.Ps
$ \f(CBsort +1 joiner\f(CW
feb 05 15
mar 14 04
apr 15 06
may 15 14
dec 18 12
jun 18 13
nov 18 13
jan 19 09
jul 19 13
sep 19 14
aug 20 10
.Pe
.ix	%end fields, in~[sort] %key fields, in sort
.page 327
.
.Bh "The \f(CBcomm\fP Command"
.LP
The
.CW comm
.ix	%begin [comm] command %key comm command
command reads the contents of two sorted files and produces
for output a three-column listing of lines that are found
.RS
.Ls B
.Li
only in the first file;
.Li
only in the second file;
.Li
in both the first and second files.
.Le
.RE
For example, let's suppose that we had generated a list of
UNIX commands found in Berkeley 4.2 and another list of commands
found in AT&T System V.2.
We can use
.CW comm
to produce a compact listing of commands found exclusively in
one version and commands common to both.
For obvious reasons, this example uses only the beginning
of the list.
.Ps
$ \f(CBcat bsd4.2\f(CW
adb
addbib
apply
apropos
ar
as
at
awk
.sp 1v
$ \f(CBcat attV.2\f(CW
adb
admin
ar
as
asa
at
awk
.Pe
Note that both files have already been sorted.
.Ps
$ \f(CBcomm bsd4.2 attV.2\f(CW
                    adb
addbib
          admin
apply
apropos
                    ar
                    as
          asa
                    at
                    awk
.Pe
.page 328
.LP
Commands found only on systems running Berkeley 4.2
are in the left-hand column,
and those found only on AT&T System V.2
are in the center column.
Commands found in both versions
are in the right-hand column.
.PP
You can suppress the display of one or more columns.
For instance, if you wanted to display only the commands
found on both systems, you'd enter:
.Ps
$ \f(CBcomm -l2 bsd4.2 attV.2\f(CW
.Pe
Only the third column would be shown.
.PP
By specifying
.CW -
instead of a filename, you can also use standard input.
In the next example,
we produce a listing of filenames from two
directories on the system,
sort them, and compare them against
the commands named in the
.CW bsd4.2
file.
This allows us to compare commands found on our system with
those on the list of Berkeley commands.
.Ps
$ \f(CB (cd /bin ; ls ; cd /usr/bin ; ls ) | sort | comm - bsd4.2\f(CW
acctcom
           adb
           addbib
admin
apnum
           apply
           apropos
                      ar
                      as
asa
           at
                      awk
.Pe
Use parentheses to group a series of commands,
combining their output into a single stream;
we want a list of command names without pathnames
from several directories.
Because UNIX creates a new shell to execute these commands,
we do not change our current working directory
when the commands in parentheses have finished executing.
.ix	%end [comm] command %key comm command
.
.Bh "The \f(CBcut\fP and \f(CBpaste\fP Commands"
.ix	[cut] command %key cut command
.ix	[paste] command %key paste command
.LP
The
.CW cut
and
.CW paste
commands modify a table or any other data in fields or
.ix	fields, in~[cut]~and~[paste] %key fields, in cut~and~[paste]
columns.
You can extract specific columns of data using
.CW cut ,
and join them horizontally using
.CW paste .
.PP
For our examples, we'll make use of
a portion of a table of ASCII characters
that specifies their decimal and hexadecimal values.
(This example is probably unnecessarily complex;
you can use
.CW cut
and
.CW paste
for much simpler jobs than this!)
Here's what the table looks like to begin with:
.Ps
$ \f(CBcat appc\f(CW
\&.TS
center, box;
cb cb cb
.page 329
n n l.
Decimal     Hexadecimal  ASCII
=
000   00    NUL
001   01    SO
002   02    STX
003   03    ETX
004   04    EOT
005   05    ENQ
006   06    ACK
007   07    BEL
008   08    BS
009   09    HT
\&.TE
.Pe
Each column is separated by a tab.
A tab is the default field delimiter for
.CW cut ;
use the
.CW -d
option to change it.
The
.CW -c
option allows you to specify character positions or ranges.
The command
.CW "cut -c6-80"
would print characters beginning at position 6 through 80,
truncating the first five characters.
Use the
.CW -f
option to specify one or more fields to pass
to standard output.
(Given the name of the command,
one might reasonably think you'd specify
the fields or column position you wanted
.I cut
out, but ...)
.PP
In the next example we extract the third field,
which contains the ASCII names.
.Ps
$ \f(CBcut -f3 -s appc\f(CW
ASCII
NUL
SO
STX
ETX
EOT
ENQ
ACK
BEL
BS
HT
.Pe
We use the
.CW -s
option to remove all lines that do not have any delimiters,
thus dropping the
.CW tbl
constructs from the output.
Normally,
.CW cut
passes lines without delimiters straight through, and that
is what we really want for our next example.
We are going to reorder the table to reference it
by the ASCII name rather than by decimal number.
We do all of this from the command line, with only a
brief entry into the editor at the end.
.PP
We'll look at this in stages.
First, we extract the third column and send it along to
.CW paste :
.page 330
.Ps
$ \f(CBcut -f3 appc | paste - appc\f(CW
\&.TS   .TS
center, box; center, box;
cb cb cb     cb cb cb
n n l. n n l.
ASCII  Decimal     Hexadecimal  ASCII
=      =
NUL   000   00    NUL
SO    001   01    SO
STX   002   02    STX
ETX   003   03    ETX
EOT   004   04    EOT
ENQ   005   05    ENQ
ACK   006   06    ACK
BEL   007   07    BEL
BS    008   08    BS
HT    009   09    HT
\&.TE   .TE
.Pe
The
.CW paste
command reads one or more files or standard input (the
.CW -
option) and replaces the newline with a tab
in all but the last file.
This gives us four columns.
(Yes, it doubled the
.CW tbl
specifications, but we have an editor.)
Now, all we have to do
is extract the first three columns from the output.
We add
.CW "cut -f1,2,3"
to the previous command,
and redirect the output to a file.
.Ps
$ \f(CBcut -f3 appc | paste - appc | cut -f1,2,3 > ascii.table\f(CW
$ \f(CBcat ascii.table\f(CW
\&.TS   .TS
center,  box; center, box;
cb cb cb    cb cb cb
n n l. n n l.
ASCII  Decimal     Hexadecimal
=      =
NUL    000   00
SO     001   01
STX    002   02
ETX    003   03
EOT    004   04
ENQ    005   05
ACK    006   06
BEL    007   07
BS     008   08
HT     009   09
\&.TE    .TE
.Pe
.ix	[cut] command %key cut command
This gives us three columns in the correct order.
We can go into
.CW vi
to rearrange the
.CW tbl
constructs and execute a
.CW sort
command on just the data portion of the table to bring it all
together.
.page 331
.Ps
$ \f(CBcat ascii.table\f(CW
\&.TS
center, box;
cb cb cb
n n l.
ASCII  Decimal     Hexadecimal
=
ACK   006   06
BEL   007   07
BS    008   08
ENQ   005   05
EOT   004   04
ETX   003   03
HT    009   09
NUL   000   00
SO    001   01
STX   002   02
\&.TE
.Pe
You can use the
.CW paste
.ix	[paste] command %key paste command
command in several interesting ways.
Normally, in order to merge two files,
.CW paste
replaces the newline in the first file with a tab.
The
.CW -d
option allows you to specify a substitute for the tab.
This can be any single character or a list of characters.
Special characters can be represented as follows: newline (\c
.CW \\\\n ),
tab (\c
.CW \\\\t ),
backslash (\c
.CW \\\\\\\\ ),
and empty string (\c
.CW \\\\0 ).
Each character in the list is assigned in sequence to replace
a newline, and the list is recycled as many times as necessary.
We can use
.CW paste
to present our three-column table in six columns:
.Ps
$ \f(CBpaste -s -d"\\t\\n" appci\f(CW
\&.TS   center, box;
cb cb cb    n n l.
Decimal     Hexadecimal  ASCII  =
000   00    NUL   001   01    SO
002   02    STX   003   03    ETX
004   04    EOT   005   05    ENQ
006   06    ACK   007   07    BEL
008   08    BS    009   09    HT
\&.TE
.Pe
The
.CW -s
option is used for a single file.
It tells
.CW paste
to merge subsequent lines in the same file
rather than to merge one line at a time
from several files.
In this example,
.CW paste
replaces the first line's newline by a tab,
while the second line retains the newline.
To get nine columns out of three-column input, you'd specify
.CW -d"\\\\t\\\\t\\\\n" .
.PP
A little work needs to be done to the
.CW tbl
specifications.
You could also execute the
.CW paste
command from within
.CW vi
so that it only affects the data portion.
.PP
You would probably want to go to this much trouble
for a large table (or many small tables)
rather than the small examples shown here.
A more practical example that uses
.CW paste
alone would be to construct a multi-column table from a single
long list
.page 332
of words.
Split the list into equal-sized chunks, then paste them
together side by side.
.
.Bh "The \f(CBtr\fP Command"
.ix	[tr] command %key tr command
.LP
The
.CW tr
command is a character translation filter,
reading standard input
and either deleting specific characters
or substituting one character for another.
.PP
The most common use of
.CW tr
is to change each character in one string to the corresponding
character in a second string.
(A string of consecutive ASCII characters can be represented as
a hyphen-separated range.)
.PP
For example, the command:
.Ps
$ \f(CBtr "A-Z" "a-z" < \fIfile\fP\f(CW
.Pe
converts all uppercase characters in
.I file
to the equivalent lowercase characters,
printing the result on standard output.
.PP
As described in Chapter 7,
this translation (and the reverse)
can be useful from within
.CW vi
for changing the case of a string.
You can also delete specific characters.
The
.CW -d
option deletes from the input each occurrence
of one or more characters specified in a string
(special characters should be placed within quotation marks
to protect them from the shell).
For instance, the following command
passes the contents of
.I file
to standard output
with all punctuation deleted:
.Ps
$ \f(CBcat \fIfile\fP | tr -d ",.!?;:"\f(CW
.Pe
The
.CW -s
.I squeeze ) (
option of
.CW tr
removes multiple consecutive occurrences of the same character.
For example, the command:
.Ps
$ \f(CBtr -s " " < \fIfile\fP\f(CW
.Pe
prints on standard output a copy of
.I file
in which multiple spaces in sequence have been replaced with a
single space.
.PP
We've also found
.CW tr
useful when converting documents
created on other systems for use under UNIX.
For example, one of our writers created some files using an
IBM PC word processor.
When we uploaded the files to our system,
and tried to edit them with
.CW vi ,
we got the message:
.Ps
Not an ascii file
.Pe
and a blank screen.
The
.CW vi
editor could not read the file.
However, using a programming utility
that lists the actual binary values
that make up the contents of a file (\c
.CW od ,
or
.I "octal dump" ),
we determined that the word processor used nulls
(octal 000) instead of newlines (octal 012)
to terminate each line.
.\" Make it produce hex: od -A x -t x1z -v
.PP
The
.CW tr
command allows you to specify characters as octal values by
preceding the value with a backslash, so the command:
.Ps
$ \f(CBtr '\\000'  '\\012'\f(CW
.Pe
converted the file into a form
that we could edit with
.CW vi .
.page 333
.
.Bh "Splitting Large Files"
.\" XXX rewrite, focusing on csplit
.LP
Splitting a single large file into smaller files can be done out
of necessity\[em]when you come across a program that can't handle
a large file\[em]or as a matter of preference, when you find it
easier to work with smaller files.
UNIX offers two different programs for breaking up files,
.CW split
.ix	[split] command %key split command
and
.CW csplit .
.ix	%begin [csplit] command %key csplit command
.PP
The
.CW split
command divides a file into chunks, consisting of the same number
of lines.
This is 1000 lines, unless specified differently.
In the following example of split, we break up a 1700-line file
into 500-line chunks.
The
.CW wc
command supplies a summary of the number of lines, words, and
characters in a text file.
.Ps
$ \f(CBwc ch03\f(CW
1708   8962  59815 ch03
$ \f(CBsplit -500 ch03\f(CW
$ \f(CBwc ch03*\f(CW
500   2462  16918 ch03aa
500   2501  16731 ch03ab
500   2976  19350 ch03ac
208   1023   6816 ch03ad
1708  8962  59815 ch03
.Pe
The
.CW split
command created four files.
It appended
.CW aa ,
.CW ab ,
.CW ac ,
etc. to the end of the original filename to create a unique
filename for each file.
You can also specify, as a third argument, a different filename
to be used instead of the original filename.
.PP
Look at the end of one of these files:
.Ps
$ \f(CBtail ch03ac\f(CW
\&.Bh "Miscellaneous Functions"
\&.in 5n
\&.TS
tab(@);
l l l.
.Pe
Unfortunately, the file breaks in the middle of a table.
The
.CW split
command pays no attention to content, making it inadequate for
breaking a file into manageable, but complete, sections.
.PP
The
.CW csplit
command offers an alternative,
breaking a file in context.
There are two ways to use it.
The first is to supply one or more line numbers.
You could enter the following command:
.Ps
$ \f(CBcsplit ch03 100 145 200\f(CW
.Pe
Four files would be created (0-99, 100-144, 145-199, 200-end).
The naming convention for files created by
.CW csplit
is different than
.CW split .
Files are named
.CW xx00 ,
.CW xx01 ,
.CW xx02
and so on.
If you want to specify a prefix that is different than
.CW xx ,
you can do so with the
.CW -f
option.
.PP
Because we do not know in advance which line numbers to specify,
we can use
.CW grep
to get this information.
The
.CW -n
option to
.CW grep
causes line numbers to be returned.
In this example, we specify a pattern to match the section
header macros,
.CW Ah
and
.CW Bh :
.page 334
.Ps
$ \f(CBgrep -n ".[AB]h" ch03\f(CW
.Pe
It produces the following listing:
.Ps
   5:.Ah "Introduction"
  30:.Ah "Using the Curses Library"
 175:.Ah "The Curses Functions"
 398:.Bh "Adding Characters to the Screen Image"
 638:.Bh "Standout Mode"
 702:.Bh "Getting Characters from the Terminal"
 777:.Bh "Input Modes"
 958:.Bh "Erasing and Clearing"
1133:.Bh "Creating and Removing Multiple Windows"
1255:.Bh "Window-Specific Functions"
1301:.Bh "Manipulating Multiple Windows"
1654:.Bh "Terminal Manipulation"
.Pe
From this listing, we select the appropriate places at which to
split the file and supply these numbers to split.
The
.CW -f
option is used to supply a filename prefix.
.Ps
$ \f(CBcsplit -f ch03. ch03 175 1133\f(CW
6803                \fINumber of bytes in each segment\fP
32544
20468
$ \f(CBls ch03.*\f(CW
ch03.00
ch03.01
ch03.02
.Pe
The
.CW csplit
command prints a character count for each of the three files it
created.
(This count can be suppressed using the
.CW -s
option.)
.PP
The second way to use
.CW csplit
is to supply a list of patterns.
For instance, if you had prepared an outline that you wanted to
break into files corresponding to sections I, II, and III, you
could specify:
.Ps
$ \f(CBcsplit -s -f sect. outline /I./ /II./ /III./\f(CW
S ls sect.*
sect.01
sect.02
sect.03
.Pe
.PP
You can also repeat a pattern.
In one project we were working on, one large file contained a
number of commands in reference page format.
We decided it would be easier if we put each command in its own
file.
The beginning of a reference header was marked by the macro
.CW ".Rh 0" .
First, we used
.CW grep
to determine the number of times this macro occurred.
.Ps
$ \f(CBgrep -c ".Rh 0" ch04\f(CW
43
.Pe
We reduce this number by 1 and surround it with braces:
.page 335
.Ps
$ \f(CBcsplit -s -f ch04. ch04 "/.Rh 0/" {42}\f(CW
.Pe
.ix	%end [csplit] command %key csplit command
The pattern is enclosed within double quotation marks
because it contains a space.
If you use the C shell, you must protect the braces from being
interpreted by placing them in double quotation marks as well.
This command creates 43 files:
.Ps
$ \f(CBls ch04*\f(CW
ch04
ch04.00
ch04.01
ch04.02
ch04.03
\&...
ch04.39
ch04.40
ch04.41
ch04.42
ch04.43
.Pe
The only task remaining is to rename the files, using the name
of the command listed as the first argument to the
.CW \&.Rh
macro.
(We'd have to write an
.CW awk
or
.CW shell
script to do this automatically.)
.PP
After you have divided a large file into a number of smaller
files, you might organize them in a subdirectory.
Let's look at a small example of this.
.Ps
$ \f(CBmkdir ch04.files\f(CW
$ \f(CBmv ch04.?? ch04.files\f(CW
.Pe
Again, the usefulness of filename metacharacters is apparent,
giving us the ability to move 43 files without typing 43
filenames.
.
.Bh "Analyzing for Reuse and Inconsistencies"
.LP
When you're editing a large document,
it's easy to lose track of how you introduce
elements like lists or examples.
Over time, especially if multiple writers
work on a document,
inconsistencies creep in.
Without a strict editing process,
and dedicated editors are an endangered species
in modern technical writing groups,
different people often have different ways
of saying the same thing.
.PP
One (related, as we soon show)
reason to break up a large file,
using a program like
.CW csplit ,
into component segments (or
.I topics )
is to
.I reuse
those topics in other documents.
.PP
In this example, we describe a set of documents
for a related set of products:
.Ls B
.Li
a cable modem\** (call it CB32)
.FS
Cable system equipment suppliers largely prefer
to provide printed or PDF documentation
to its customers, rather than distributing everything online,
making
.CW troff
a perfect match for those companies.
.FE
.Li
a cable modem with a Wi-Fi\[tm] router (CR32)
.Li
a cable modem with a telephone jack (CT32)
.Li
a cable modem with both Wi-Fi and telephone (CTR32)
.Le
A table can better illustrate
the features of each model:
.KS
.\" first time I ever used space as a tab in tbl...
.\" let's see what happens. --LK, 9 Oct 2026
.TS
allbox center tab( );
cb cb cb cb
l  c  c  c .
Model CM Wi-Fi Tel
_
CB32 X
CR32 X X   
CT32 X  X
CTR32 X X X
.TE
.KE
.LP
Let's assume that whoever
was responsible for the initial documentation
did their best to keep things consistent
between the four manuals;
but did not try reusing content
other than cutting and pasting
sections in a word processor.
Other writers may have made changes
based on bug reports or customer feedback,
without considering how changing one product
might not affect others.
So, over time,
each product's content might
.I drift
away from the others.
.PP
Looking at the table above,
you can see that all four products
use the cable modem content;
two use Wi-Fi content,
and two use telephone content.
So, in reuse terms, the cable modem content is the
.I base
for all four manuals.
You want that content to be consistent.
Likewise, you want the Wi-Fi content
and the telephone content
to be consistent across the manuals that use them.
.PP
We can use a technique called
.I "fuzzy matching"
to compare blocks of text.
Instead of a binary \[lq]0=false; 1=true\[rq]
kind of match, a fuzzy match returns
a floating point value between 0 and 1.0,
where 0 is no match at all
and 1.0 is an exact match.
Most match attempts fall somewhere in between,
and a value of 0.9 or greater
often suggests the two blocks
should be identical.
So a fuzzy match can both
identify inconsistencies
and suggest candidates for reuse.
.PP
You can download a simple fuzzy-match script from the
.pdfhref W -D https://github.com/larrykollar/reuse_analyzer \
Reuse analyzer repository.
This is an
.CW awk
script that compares blocks (paragraphs, list items, and the like)
to produce a report showing close matches.
Newlines separate blocks,
meaning each block is one (long) line.
This requires some special processing,
because you wouldn't want to join
thousands of individual lines
when another utility,
.CW Pandoc ,
can do it for you.\**
.FS
Download Pandoc from the
.pdfhref W -D https://pandoc.org Pandoc site.
Pre-compiled packages are available for
Linux, MacOS\~X, BSD, and Windows.
.PP
Now that we have our utilities,
we can prepare the document files for analysis.
For
.CW -mm
files, use a for-loop in the shell like this:
.Ps
$ for i in *.mm
> do
>   f=`basename $i .mm`
>   deroff -mm -s $i | pandoc -f markdown -t plain --wrap=none -o $f.txt
> done
.Pe
(We know that
.CW deroff
does not output Markdown,
but Pandoc defaults to Markdown input
and both
.CW deroff
output and Markdown put blank lines between blocks.)
.PP
We now have plain-text files
for each of the
.CW -mm
files in the directory.
For this example, we'll look only at
a group of simplified installation chapters.
.Ps
awk -f analyzer.awk -v minratio=0.9 \
cb32install.txt cr32install.txt ct32install.txt ctr32install.txt

Matches for ctr32install.txt block 11:
3.  Connect a coaxial cable between the Phone Router and the coaxial cable outlet. If a set‐top box or other devic
e is already connected, use a splitter.
        cr32install.txt block 11 (ratio 0.987097):
        3.  Connect a coaxial cable between the Cable Router and the coaxial cable outlet. If a set‐top box or oth
er device is already connected, use a splitter.
        cb32install.txt block 11 (ratio 0.97411):
        3.  Connect a coaxial cable between the Cable Modem and the coaxial cable outlet. If a set‐top box or othe
r device is already connected, use a splitter.
        ct32install.txt block 11 (ratio 0.987055):
        3.  Connect a coaxial cable between the Phone Modem and the coaxial cable outlet. If a set‐top box or othe
r device is already connected, use a splitter.

\&. . .
.Pe
For brevity, we show the first set of matches.
The actual list runs on for some length,
showing the differences between each file,
and the full listing has some duplication.
We can see that the primary difference in this step
is the name of each product.
If we replaced the product names with a string variable,
and a few conditional statements,
we could use the same file for all four products.
Now, if Marketing decides to change the product names,
we need only change a few variables and run
.CW make .
.PP
Note that fuzzy matching is processor-intensive,
so analyzing lots of files can take a while.
The README page says,
.QP
A small to mid-size document set
(about 2200 paragraphs)
takes just under 5 minutes to analyze on a late-2013 iMac.
You can compile the script, using
.I awka ,
for a performance boost
(the same document set takes 1-1/2 minutes
with the compiled version).
.LP
After adding string registers
and defining conditionals by feature,
the unified installation chapter looks like:
.Ps
\&.H 1 "Installing the \\*[Model] \\*[ProdName]"
\&.P
Use these instructions to install your new \\*[ProdName].
\&.AL
\&.LI
Find the location where you want to install
the \\*[ProdName].
\&.SP 0.5v
\&.ie r Phone \\{\\
The location should be close to
a coaxial cable outlet, a power outlet,
and a telephone jack.
.\\}
\&.el \\{\\
The location should be close to
a coaxial cable outlet and a power outlet.
\&.\\}
\&.LI
Orient the \\*[ProdName]
horizontally or vertically,
leaving at least 6 inches (16cm)
of space on the side with the vents.
\&.LI
Connect a coaxial cable
between the \\*[ProdName]
and the coaxial cable outlet.
\&.SP 0.5v
If a set-top box or other device
is already connected, use a splitter.
\&.LI
\&.if r Router (optional)
Connect the supplied Ethernet cable
between the \\*[ProdName] and
either your computer's Ethernet jack
or your home router's Network jack.
\&.if r Phone \\{\\
\&.LI
Connect a telephone cable
between the Phone Modem and
a nearby telephone jack.
\&.\\}
\&.LI
Connect the supplied power cable
to your \\*[ProdName], then the power outlet.
\&.SP 0.5v
The \\*[ProdName] displays its startup sequence
on the front panel LEDs.
\&.LI
Proceed to Chapter 2, \\[lq]Configuration.\\[rq]
.LE
.Pe
We can use a separate file to define
string variables and number registers,
and include it in each book file
(or define them in the Makefile and use one book file
for all four manuals).
For the CTR32, we might use:
.Ps
\&.ds Model CTR32
\&.ds ProdName Phone Router
\&.nr Phone 1
\&.nr Router 1
.Pe
And for the CT32:
\&.Ps
\&.ds Model CT32
\&.ds ProdName Phone Modem
\&.nr Phone 1
.Pe
Note that the CT32 definitions do not include the
.CW Router
register.
The construct
.CW "\&.if d Router"
is true if the
.CW Router
register was defined, regardless of its value.
The CB32 definition file
would define neither the
.CW Phone
nor
.CW Router
registers.
.PP
The time spent analyzing your source
and implementing reuse
can pay off in faster turnaround
and more consistent documentation.
.
.Bh Encryption
.LP
The cloak-and-dagger set and the security conscious have
uses for UNIX encryption utilities.
In the past, US regulations
prohibited general export of encryption utilities,
and many of those regulations still apply
to encryption software developed in the US.
For software developed elsewhere,
the picture is murkier.
If you live outside the US,
and want to use encryption software,
try downloading it.
.PP
The long-obsolete
.CW crypt
.ix	[crypt] command %key crypt command
command read a file from standard input,
asked you to supply a key for encoding the file,
and output an encrypted version of the file.
Although the old version is still available,
consider using the modern replacements
.CW ccrypt ,
.CW mcrypt ,
or
.CW gpg
(GNU Privacy Guard).
All are generally available for Linux and BSD.
.Ps
$ \f(CBcat message | ccenrypt > encrypted.msg\f(CW

Enter encryption key:\f[CB]alabaster\fP
Enter encryption key: (repeat) \f[CB]alabaster\fP
.Pe
Just as when you enter a password,
the key does not appear on
the screen as you enter it.
You can enter the key on the command line using the
.CW -K
option, but other users could see the key
by using the
.CW ps
command at the right moment.
To decode an encrypted file,
.CW ccat
the file and supply the key.
.PP
The original UNIX editors
.CW ed ,
.CW ex ,
and
.CW vi ,
could be invoked with the
.CW -x
option to read or edit an encrypted file.
Of course, you have to supply the correct key.
Some modern versions of these programs
recognize this option but do
not support the encryption feature;
others do not recognize it at all.
.page 336
.
.Ah "Cleaning Up and Backing Up"
.ix	%begin backing~up files
.LP
In this section, 
we show some procedures for backing up
active or older files.
.\" xxx USB flash drives, internet, etc
At many sites, backups are the responsibility of one person,
who performs these tasks on a regular basis to ensure that
users can recover their data in case there is a serious
system crash.
If you are using Github or some other
source control service,
the site administrators handle backups
(but it is always good to have your own copy in a safe place).
At other sites, individual users might be responsible for doing
their own backups, especially if there are only a few users on
the system.
Many modern computers can automatically
back up files several times a day, either to
a local hard drive or to a cloud server.
Whoever does it must ensure that backups of important files
are made periodically.
.PP
A second reason for learning a backup procedure
is to enable you to store files on an off-line medium.
All modern computers have
either hard disks or solid state drives (SSDs)
as the primary storage medium.
No matter how large a disk drive is, sooner or later,
users will obey Franklin's Law and fill it to capacity.
Frequently, there are useless files that can be deleted.
You can remove inactive files,
such as an early draft of a document,
after you have made a copy
to a flash drive or a cloud server.
After a project is finished,
you probably want to make several copies
of all important files.
At a later time, should you need files that have been stored
off-line, you can easily restore them to the system.
.PP
We are going to describe how to use the
.\" xxx rewrite for cp -R and tar
.\" use du -k to get a directory size in 1k blocks
.\" or du -m to get size in meg
.CW cpio
.ix	%begin [cpio] command %key cpio command
command for backing up one or more working directories.
There are other UNIX commands that might be used as well (\c
.CW tar
and
.CW dd ,
for instance).
At your site, you may even have simpler shell scripts that
prevent you from having to deal with
.CW cpio
directly.
Ask an expert user at your site about backup procedures
and go through it once or twice.
Apart from learning about
.CW cpio ,
you need:
.RS
.Ls
.Li
The UNIX filename of the device (\c
.CW /dev/ \fIxxxx\fP)
to which you are directing the output of the
.CW cpio
command.
.Li
Familiarity with operating the device, such as being able to
load a tape in the tape drive and knowing how to format a
floppy disk prior to use.
.\" XXX Sooooo obsolete
.Le
.RE
You can use
.CW cpio
in two basic ways, either to back up or to restore files.
You use
.CW cpio
with the
.CW -o
option and
.CW >
to redirect output to the device for backup, or with the
.CW -i
option and
.CW <
to redirect input from the device to restore files.
.PP
Unlike many of the commands we've looked at,
.CW cpio
depends exclusively on reading a list of filenames from
standard input.
This list identifies the files to back up.
For practical purposes, this involves doing an
.CW ls
command on the directory you want backed up and piping the
results to
.CW cpio .
.\" xxx Keep but modify this paragraph.
.\" Mac, PC, and many Linux systems can auto-mount USB drives.
.\" But in case you need to know...
.PP
You need to know the UNIX filename for the backup device.
This name is site specific, so you need to check with a
knowledgeable user.
At our site, we have a floppy disk drive named
.CW /dev/rfp021 .
A tape drive might be named
.CW /dev/mt0 .
.\" xxx Also drag and drop an entire directory from GUI
.PP
After you have loaded the tape in the tape drive or placed
the floppy disk in the disk drive, you can perform the backup
using your own version of this command:
.page 337
.Ps
$ \f(CBls /work/docbook/ch13 | cpio -ov > /dev/rfp021\f(CW
sect3
dict
shellstuff
\&...
384 blocks
.Pe
The
.CW -v
.I verbose ) (
option prints a list of filenames on the screen.
.PP
The
.CW -i
option to
.CW cpio
reads or restores files from a tape or floppy disk device.
Sometimes, before you actually restore files, you want to list
the contents of the tape or disk.
The
.CW -t
option prints a table of contents but does not actually read
these files onto the system.
.Ps
$ \f(CBcpio -it < /dev/rfp021\f(CW
384 blocks
sect3
dict
shellstuff
\&...
.Pe
Using the
.CW -v
option along with the
.CW -t
option produces a long (verbose) listing of files, as if you had
entered
.CW "ls -l" .
.PP
You don't have to extract all the files from disk or tape.
You can specify certain files, using filename metacharacters to
specify a pattern.
.Ps
$ \f(CBcpio -iv "sect?" < /dev/rfp021\f(CW
No match.
.Pe
Remember to refer to the full pathname if the files were saved
using a complete pathname, and to put pathnames that include
metacharacters within double quotation marks.
.Ps
$ \f(CBcpio -i "/work/docbook/ch13/sect?" < /dev/rfp021\f(CW
384 blocks
sect3
sect2
sectl
.Pe
Before restoring a file,
.CW cpio
checks to see that it won't overwrite an existing file of
the same name that has been modified more recently than the
file being read.
.PP
You can also use the
.CW find
.ix	%begin [cpio] command, using~with [find] %key cpio command, using with [find]
.ix	%begin [find] command, using~with [cpio] %key find command, using with [cpio]
command with the
.CW -cpio
condition to do a back up.
The advantage of using
.CW find
is that it descends all the way down a directory hierarchy.
.Ps
$ \f(CBfind /work/docbook/ch13 -cpio /dev/rfp021\f(CW
.Pe
To restore a directory hierarchy, use the
.CW -d
option to
.CW cpio .
Administrators frequently use
.CW find
to generate a list of files that have been modified within a
certain time period.
The conditions
.CW -mtime
(\c
.I "modification time" )
and
.CW -atime
(\c
.I "access time" )
can be followed by a number indicating a number of days.
This number can be preceded by a plus sign, indicating
.I "more than"
that number of days, or a minus sign, indicating
.I "less than"
that many days.
If there is no sign, the condition indicates exactly that
number of days.
.page 338
.PP
This example uses
.CW find
to produce a list of files that have been modified within
the last seven days.
These active files are good candidates for backups.
.Ps
$ \f(CBfind /work/docbook -mtime -7 -print\f(CW
/work/docbook
/work/docbook/oshell
/work/docbook/ch01
\&...
.Pe
Don't forget you have to specify
.CW -print
to see the results of a
.CW find
command.
.PP
You could work up your own version of this command to look
for your own files that have not been accessed in the last 21
days.
Add the option
.CW -atime
with an argument of
.CW +21
to list the files and directories that have not been accessed
in over 21 days.
Add the
.CW -user
option to look only for your own files, the
.CW -cpio
option to backup these files, and the
.CW -ok
option to execute an
.CW rm
command to delete them from the system after they've been
backed up.
.Ps
$ \f(CBfind /work -atime +21 -user -cpio /dev/rfp021 -ok rm {} \\;\f(CW
.Pe
The
.CW -ok
option is the same as the
.CW -exec
option; however, instead of executing the command specified
within parentheses on all files selected by
.CW find ,
it prompts you first to approve the command for each file.
.ix	%end [cpio] command %key cpio command
.ix	%end [cpio] command, using~with [find] %key cpio command, using with [find]
.ix	%end [find] command, using~with [cpio] %key find command, using with [cpio]
.ix	%end backing~up files
.
.Ah "Compressing Files"
You can conserve the amount of disk space
that text files take up
by storing some of your files
in a compressed form.
Use the
.CW gzip
.ix	[gzip] command %key gzip command
command to compress a file.
It generally reduces a text file by 70 to 90 percent.
.Ps
$ \f(CBls -l ch04.t\f(CW
-rw-rw-rw-   1 fred   doc  124878 Jun 10 15:22 ch04.t
$ \f(CBgzip -v ch04.t\f(CW
ch04.t:  68.3% -- replaced with ch04.t.gz
.Pe
The original file is replaced by a compressed file with a
.CW \&.gz
appended to the original filename.
.Ps
$ \f(CBls -l ch04.t.gz\f(CW
-rw-rw-rw-   1 fred   doc   39653 Jun 10 15:29 ch04.t.gz
.Pe
The
.CW gzip
command reduced the size of this file
from nearly 125K to less than 40K bytes.
If used system-wide,
it could save a significant amount
of disk space,
although the amount of compression
varies from file to file.
Obviously, there is less benefit in packing small files.
.PP
To expand a compressed file, use the
.CW gunzip
.ix	[gunzip] command %key gunzip command
command.
You can specify the name of the file with or without the
.CW \&.gz
suffix.
.Ps
$ \f[CB]gunzip ch04.t\f(CW
.Pe
.page 339
To work with a compressed file,
without decompressing it,
use the
.CW "gunzip -c"
option.
This decompresses a file to standard output
(pipe it through
.CW less
or send it as input to another command),
as in the following example:
.Ps
$ \f(CBgunzip -c ch04.t | nroff -mm\f(CW
.Pe
.
.Ah Communications
.LP
Despite well-publicized
Return To Office (RTO) initiatives,
A great deal of writing work
still happens over the Internet.
Fortunately, a number of useful communications programs are
part of the standard UNIX shipment.
.PP
Two basic types of connections
between computer systems are a
.I LAN
.ix	LAN
.ix local area network
(Local Area Network),
connecting closely-located computers, and a
.I WAN
.ix WAN
.ix wide area network
(Wide Area Network),
otherwise known as an Internet connection.
Internet
.I protocols ,
the rules that govern data routing and transmission,
control nearly everything related to communicating
with another computer:
website access, email, file servers, chat,
remote login, source code control servers, and more.
These apply to connections over both LANs and WANs.
.PP
We cannot provide full descriptions of these facilities here.
A good way to learn is to ask an expert user to help you
transfer files or begin a remote login session.
Keep notes on the procedure and when following it, if things
don't work as expected, get more help.
.PP
Often,
.I "client software"
handles not only the communications
with a server, but all the steps that come after.
For example, on Linux systems,
you may find yourself using a utility called
.CW dpkg
or
.CW rpm ,
depending on what distribution you use.
These utilities handle all the issues
related to installing a new software package
on your computer:
.Ls B
.Li
Locating and downloading not only
the correct package file,
but any other packages required
to use the software.
.Li
Installing packages in the correct order.
.Le
.LP
When downloading a software source package,
the package is often a gzip'ped
.CW tar
file, often called a
.I tarball .
To unpack a tarball,
find its location
(usually
.CW Downloads
on most modern operating systems),
move to the directory where you want to unpack it
(you could create a
.CW Software
or
.CW Projects
sub-directory under your home directory),
then unpack it.
Assuming the tarball is in your
.CW Downloads
directory:
.Ps
$ tar zxf ~/Downloads/duzitall-1.4.tar.gz
.Pe
In most cases, this creates a sub-directory
.CW duzitall-1.4
under your current directory.
Some older packages,
including some relevant to this book,
expect you to create the directory.
If you have any doubt, try
.Ps
$ tar ztvf ~/Downloads/duzitall-1.4.tar.gz
.Pe
to verify whether the tarball
creates its own directory or not.
.PP
Other clients, like
.CW git ,
provide connections to source code control.
Instead of manually downloading or uploading files
to the server,
.CW git
keeps track of which server
each project uses,
what has changed, and merges your changes.
.
.Ah "Scripts of UNIX Sessions"
.LP
Throughout this chapter,
we provided examples of UNIX commands.
These examples were made using a command called
.CW script
.ix	[script] command %key script command
(which is installed or available on Linux systems).
The
.CW script
command makes a file copy of a UNIX session.
Without this facility,
we'd have to simulate the examples by hand.
.PP
After you invoke
.CW script ,
your input and output is copied to a file.
By default,
the name of this file is
.CW typescript ,
but you can supply a different name on the command line.
.Ps
$ \f(CBscript\f(CW
Script started on Thu Jul 10 12:49:57 1987
$ \f(CBecho hello\f(CW
hello
$
.Pe
To quit, you enter
.I \s-2CTRL-D\s0 .
.Ps
$ \f(CBcat typescript\f(CW
Script started on Thu Jul 10 12:49:57 1987
$ echo hello
hello
$
script done on Thu Jul 10 12:50:11 1987
.Pe
After we make a script,
we read the file into our text using
.CW vi .
.PP
Keeping a script of a procedure
is also a good start for building a shell script
that performs a routine task automatically.
