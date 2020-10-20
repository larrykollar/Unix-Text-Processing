.ig
	Converted from .pbm to text and marked up
	by
	Manas Laha <mlaha@aero.iitkgp.ernet.in>
	Proofed on: 2 Nov 2002
..
.so utp.mac
.utp
.chapter 11 "A Miscellany of UNIX Commands" "Chapter" 1
.ix	miscellaneous UNIX~commands
.page 293
.LP
In this chapter, we present a miscellany of UNIX programs with
text-processing applications.
In addition, we introduce several UNIX utilities for
communications and for reading and writing to tapes and
floppy disks.
These utilities are not specifically designed for text
processing, but we have found them necessary for working in
the UNIX environment.
Although you can find more detailed information on these
utilities in books aimed at a general audience, we've included
brief discussions of them to encourage you to learn them.
.PP
UNIX has many standard programs, as a run-down of the table
of contents for the
.I "UNIX Reference Manual"
will demonstrate.
The challenge of UNIX is knowing which programs are appropriate
for a specific situation.
No one learns all the commands, but becoming familiar with a
great number of them can be helpful.
It is rather like those of us who collect far more books on
our shelves than are \(lqneeded,\(rq knowing the reward of finding
the right book for the right occasion.
.PP
At times, you will be surprised when you discover a program with
rather unusual or specialized capabilities; at other times,
you may be frustrated by a demanding program or confused by
inconsistencies from one program to the next.
These qualities seem to originate from the open design of UNIX,
and serve to distinguish this text processing environment from
the closed systems of most word processors.
.PP
In some ways, what we are trying to do in this chapter is to
address problems that arise in typical documentation projects
and show how one or more UNIX programs can be applied as
solutions to these problems.
The emphasis is on the interactive use of these programs,
although many of them can be used effectively in shell scripts
or as parts of other programs.
(In the next chapter, we go into more detail about shell
scripts).
The commands are presented in sections, grouped by function.
.Ah "Managing Your Files"
.LP
One of the realities of using a computer is that you begin
to think of a document in terms of files, rather than chapters
or sections.
You edit and print files; create and copy
.page 294
files; delete files accidentally and lose your edits; and look
through files to find the information that is contained in them.
Increasingly, files contain the goods that you trade.
You exchange not only printed copies of documents, but using
floppy disks, tapes, or modems, you take files off one system
and put them on another system.
Learning to organize and maintain files is essential to working
.ix	files, organizing
on a computer.
.Bh "Using the File System to Your Advantage"
One obvious feature of UNIX that makes it easy to handle
large numbers of files is the hierarchical file system.
With carefully named files and directories, the pathname,
which specifies a file's unique place in the file system
hierarchy, can tell a lot about not only how to get at the
file, but its contents as well.
For example, on our system,
we keep all source files for various books in progress on a
file system called
.CW /work ;
work for a given client is kept in
a directory named for the client, with a subdirectory for
each separate manual.
Within each manual's subdirectory,
individual chapters are named consistently,
.CW ch01 ,
.CW ch02 ,
and so on.
As a result, it is easy both to locate a file (Chapter I
of the FORTRAN manual for ABC Corp.
can predictably be found in
.CW /work/abc/fortran/ch01 )
and to guess its contents.
.PP
If you are using the C shell, you can create an alias that
.ix	C shell
.ix	[alias] command %key alias command
provides a shorthand way of entering a command.
In the following example, the alias allows you to think in
terms of manuals instead of directories.
.Ps
% \f[CB]alias fortran "cd /work/abc/fortran; pwd"\fP
% \f[CB]pwd\fP
  /work/fred
% \f[CB]fortran\fP
  /work/abc/fortran
.Pe
You can place an
.CW alias
definition in your
.CW ".cshrc"
.ix	[.cshrc] file %key cshrc file
file so that it becomes part of your environment.
.PP
In the Bourne shell, you achieve a similar result by using an
environment variable called
.CW CDPATH
.ix	Bourne shell, [CDPATH] environment~variable %key Bourne shell, CDPATH environment variable
.ix	[CDPATH] environment~variable %key CDPATH environment variable
to define a search path for the
.CW cd
command.
For example:
.Ps
$ \f(CBCDPATH=/work/abc:/work/textp:/usr\f(CW
$ \f(CBcd fortran\f(CW
/work/abc/fortran
$ \f(CBcd jane\f(CW
/usr/jane
$ \f(CBcd ch03\f(CW
/work/textp/ch03
.Pe
When you issue a
.CW cd
command, the shell searches for a subdirectory with that name
under any of the directories in the path, changes to it, and
prints the full directory name.
.PP
The search directories in
.CW CDPATH
are specified between colons.
Directories listed in
.CW CDPATH
are searched in order from left to right.
.page 295
.Bh "Shell Filename Metacharacters"
.ix	files, metacharacters
.LP
Even with files organized into directories, you can still
accumulate a lot of files.
Developing some consistent naming conventions that take
advantage of shell metacharacters (wildcards) can save you
a lot of trouble.
Most users are familiar with metacharacters but many don't
make full use of them.
.PP
In UNIX, you can match any part of a filename with a wildcard.
Remember that
.CW *
matches
.I zero
or more characters.
This gives you more power to select a specific group of files
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
$ \f(CBrm *lock*\f(CW
.Pe
Because
.CW *
can match zero characters,
.CW *lock*
will match
.CW lock
as well as
.CW filelocks .
.PP
The shell interprets the pattern-matching character
.CW ?
to match any single character,
and the construct
.I m-n ] [
to match a range of consecutive characters.
.PP
If you name your files consistently, you can use these
characters to select groups of files.
For example, in a directory containing a BASIC manual, you
might have the following list of files:
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
As usual in any directory, there are a number of auxiliary
files.
Some of these files apply to the work on this project, but
they are not actually part of the book.
If you've carefully chosen the names of related files, you
can use metacharacters to select only the files in a particular
group.
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
If you had entered
.CW ch0* ,
miscellaneous files such as
.CW ch01.old
would have been included.
(Note that whenever you use numbers in filenames, as shown here,
to consistently name a group of related files, you should begin
the numbering sequence with 01, 02 .\|.\|. rather than 1, 2 .\|.\|.
This will cause
.CW ls
to list the files in proper alphabetical order.
Otherwise,
.CW ls
will list
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
Metacharacters have broader applications than for simply listing
files.
Look at this example of running
.CW spell
.ix	[spell] command %key spell command
on an entire book:
.Ps
$ \f(CBspell ch0? app? > spell.out\f(CW
.Pe
(We'll be looking at the
.CW spell
command later in the section \(lqProofing Documents.\(rq)
This command is run on the seven files that match one of the two
patterns specified on the command line.
.PP
Metacharacters are also useful in moving and copying files from
one directory to another:
.Ps
$ \f(CBcp basic/ch0? /work/backup\f(CW
.Pe
.Bh "Locating Files"
.LP
Although a hierarchical file system with consistent naming
conventions helps a lot, it is still easy to lose track of files,
or just to have difficulty specifying the ones you want to
manipulate.
The number of files contained on even a small hard disk can be
enormous, and complex directory hierarchies can be difficult to
work with.
.PP
It is possible to lose a file on the file system when you have
forgotten in which directory you put it.
To look through an
entire file system or a large directory hierarchy, you need a
utility called
.CW find .
.ix	%begin [find] command %key find command
The
.CW find
utility looks at the external characteristics of a file\(emwho
created it, when it was last accessed, its name, and so on.
.PP
The
.CW find
utility probably wins top honors for having the most
cumbersome command-line syntax in UNIX.
It's not that
.CW find
is a difficult command; its syntax is simply difficult to recall.
You might expect that all you have to enter is
.CW find
and the name of the file that you want to look for.
This is not the way it works, however, which is a nuisance to
new users.
The
.CW find
command requires repeated trips to the
.I "UNIX Reference Manual"
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
you have to specify the
.CW -print
condition as well (\c
.CW -name
must precede
.CW -print ).
.PP
If you wanted to find any file named
.CW notes
on the
.CW /work
file system, here's the command to enter:
.Ps
$ \f(CBfind /work -name notes -print\f(CW
/work/alcuin/notes
/work/textp/ch02/notes
.Pe
The output is the pathname (starting with the specified file
system or directory) of each file that is found.
More than one pathname can be supplied.
A slash
.CW / ) (
represents the root directory and thus is used if you want to
search the entire file system.
Note that the search can take some time, and that if you do not
have read permissions to a directory you will get a message
saying that it cannot be opened.
.PP
In the next example, we add another condition,
.CW -user ,
and limit the search to files named
.CW memo
that are owned by the user
.CW fred .
This is helpful when you are searching for a file that has a
.ix	files, searching~for
.ix	files, locating
fairly common name and might exist in several users' accounts.
Filename metacharacters can be used but they must be protected
from the shell using backslashes or single quotation marks.
(If you don't do this, the metacharacters will be interpreted
by the shell as referring to files in the current directory,
and will not be passed to the
.CW find
command.)
.Ps
$ \f(CBfind /work /usr -name 'memo*' -user fred -print\f(CW
/usr/fred/alcuin/memo
/work/alcuin/memo.523
/work/caslon/memo.214
.Pe
Two directory hierarchies are searched,
.CW /work
and
.CW /usr .
If you did not specify the
.CW -name
condition, this command would locate all the files owned by
.CW fred
in these two file systems.
.PP
Many
.CW find
conditions have uses for other tasks besides locating files.
For instance, it can be useful to descend a directory hierarchy,
using
.CW find
to print the complete pathname of each file, as in the following
example:
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
that will list all files under a given directory, not just those
at the current directory level.
As you'll see, this becomes very useful when it comes time to
back up your files.
.page 298
.PP
The longer you work with a UNIX system, the more you will come
to appreciate
.CW find .
Don't be put off by its awkward syntax and many options.
The time you spend studying this command will be well repaid.
.Bh "File Characteristics"
.LP
Most of us are concerned only with the contents of a file.
However, to look at files from UNIX's point of view, files are
labeled containers that are retrieved from storage and soon put
back in the same place.
It might be said that the operating system reads (and writes)
the label but doesn't really care to look inside the container.
The label describes a set of physical or external characteristics
.ix	files, characteristics
for each file.
This information is displayed when the
.CW ls
command produces a long listing.
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
The operating system keeps track of the file
permissions
.ix	files, permissions
.CW -rw-rw-r-- ) (
for the owner, group, and other
users\(emdetermining who
can read, write, or execute the file.
.PP
All of these characteristics can be modified either by use of
the file or by commands such as
.CW chmod
.ix	[chmod] command %key chmod command
(change permissions) and
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
For instance, if you had recently made some changes to a set of
files, but couldn't remember which ones, you could use the
.CW -t
option to sort a list of files with the most recently modified
files first.
The
.CW -r
option reverses that order, so that
.CW "ls -rt"
produces a list with the oldest files first.
.PP
In addition,
.CW find
.ix	%end [find] command %key find command
has a number of options that make use of external file
characteristics.
As we've seen, you can look for files that belong to a
particular user.
You can also look for files that are larger than a particular
size, or have been modified more recently than a certain date.
.PP
Don't get stuck thinking that the only handle you can pick a
file up with is the file's name.
.Ah "Viewing the Contents of a File"
.LP
You are probably familiar with a number of UNIX commands that
let you view the contents of a file.
.ix	files, viewing contents
The
.CW cat
.ix	[cat] command %key cat command
command streams a file to the screen at a rate that is usually
too swift.
The
.CW pg
.ix	%begin [pg] command %key pg command
and
.CW more
.ix	[more] command %key more command
commands display a file one page at a time.
They are frequently used as
.I filters ,
.ix	filters
for instance, to supply paging for
.CW nroff
output.
.page 299
.Ps
$ \f(CBnroff -mm ch01 | pg\f(CW
.Pe
You can also use these commands to examine unformatted files,
proofing formatting codes as well as text.
Although these are frequently used commands, not everyone is
aware that they have interactive subcommands, too.
You can search for a pattern;
execute a UNIX command;
move to another file specified on the command line;
or go to the end of the file.
.PP
You can list these subcommands by entering
.CW h
when the program pauses at the bottom of a page.
Here's the help screen
.ix	[pg] command, help~screens %key pg command, help screens
.CW pg
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
h                help
q or Q           quit
<blank> or \\n    next page
l                next line
d or ^D          display half a page more
\&.  or ^L         redisplay current page
f                skip the next page forward
n                next file
p                previous file
$                last page
w or z           set window size and display next page
s savefile       save current file in savefile
/pattern/        search forward for pattern
?pattern? or
^pattern^        search backward for pattern
!command         execute command
Most commands can be preceded by a number, as in:
+1\\n  (next page);  -1\\n  (previous page);  1\\n  (page 1).
See the manual page for more detail.
.Pe
.PS
line 5.25i dashed
.PE
.rn oldPS PS
.rn oldPE PE
.LP
One advantage of
.CW pg
.ix	%end [pg] command %key pg command
is that you can move backward as well as forward when going
through a file.
A special feature of
.CW more
is the ability to invoke
.CW vi
at the current point in the file.
When you quit
.CW vi ,
.CW more
resumes paging through the rest of the file.
.PP
Another command used for examining a file is
.CW pr .
.ix	[pr] command %key pr command
Its most common use is to perform minor page formatting for a
file on the way to a line printer.
It breaks the input file into
pages (66 lines to a page) and supplies a header that contains
the date, the name of the file, and the current page number.
Top, bottom, and side margins are also added.
.PP
The
.CW pr
command also has many options that can be used to perform some
oddball tasks.
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
If you are printing to a terminal, the
.CW -p
option specifies a pause at the beginning of each page.
You can also display an input file in
.I -n
columns.
.PP
The
.CW -m
option simultaneously merges two or more files and prints
each of them, one per column:
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
The
.CW test*
file specification is expanded to four filenames:
.CW test ,
.CW test1 ,
.CW test2 ,
and
.CW test3 .
The
.CW -t
option suppresses the heading and does not print linefeeds to
fill a page, which is especially useful when you are sending
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
The following shell script implements this process so that it
can be invoked as a single command.
.Ps
$ \f(CBnroff -mm -rO0 examples/$1 | -pr -e -t\f(CW
.Pe
The
.CW pr
command works as a filter for
.CW nroff .
The
.CW -r
option is used with
.CW nroff
to set register
.CW O
(page offset or left margin) to zero.
.PP
Sometimes it can be useful to examine just the beginning or the
end of a file.
Two commands,
.CW head
.ix	[head] command %key head command
and
.CW tail ,
.ix	[tail] command %key tail command
print the first or last ten lines of a file.
The
.CW head
command can be used to look at the initial settings of number
registers and strings that are often set at the top of a file.
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
This output could be redirected to a file as a way of starting
.ix	output redirection
a new chapter.
The
.CW tail
command has the same syntax; it can save time when you want to
check the end of a large file.
.Ah "Searching for Information in a File"
.ix	files, searching within
.LP
The many benefits provided by
.CW grep
.ix	%begin [grep] command %key grep command
to the user who doesn't
remember what his or her files contain are well known.
Even users of non-UNIX systems who make fun of its obscure name
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
.CW fgrep .
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
macros, the following command will list top-level and
second-level headings:
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
In effect, it produces a quick outline of the contents of these
files.
When more than one file is specified, the name of the file
appears with each line.
Note that we use brackets
.page 302
as metacharacters both in the regular expression and when
specifying the filename.
Because metacharacters (and spaces) have meaning to the shell,
they will be interpreted as such unless the regular expression
is placed within quotation marks.
.PP
There are several options commonly used with
.CW grep .
The
.CW -i
option specifies that the search ignore the distinction between
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
This can be used to prepare a list of files for another command.
.PP
The shell construct
.I command1
.I command2 ` `
causes the output of
.I command2
to be used as an argument to
.I command1 .
For example, assume that you wanted to edit any file that has a
reference to a function call named
.CW getcursor .
The command:
.Ps
$ \f(CBvi `grep -l getcursor *`\f(CW
.Pe
would invoke
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
to
look for all files in the specified directory hierarchy and
passes the resulting names to
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
condition allows you to specify a command that is executed
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
In this case, it would be preferable to write:
.Ps
$ \f(CBgrep "[aA]lcuin" `find /work/docbook -print`\f(CW
.Pe
Because
.CW grep
.ix	%end [grep] command %key grep command
is invoked only once, this command will run much faster.
.page 303
.PP
There is a potential danger in this approach.
If the list of files is long, you may exceed the total allowable
length of a command line.
The best approach uses a command we haven't shown yet\(em\c
.CW xargs .
.ix	[xargs] command %key xargs command
This command provides an extended version of the same function
the shell provides with backquotes.
It converts its input into
a form that can be used as an argument list by another command.
The command to which the argument list is passed is specified
as the first argument to
.CW xargs .
So, you would write:
.Ps
$ \f(CBfind /work/docbook -print | xargs grep "[aA]lcuin"\f(CW
.Pe
Or you could generalize this useful tool and save it as the
following shell script, which could be called
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
.CW grep )*
.FS *
Despite what the documentation says,
.CW egrep
.ix	[egrep] command %key egrep command
is usually the fastest of the three
.CW grep
programs.
.FE
command performs the same function as
.CW grep ,
except it searches for a fixed string rather than a regular
expression.
Because it doesn't interpret metacharacters, it often does a
search faster than
.CW grep .
For interactive use, you may not find enough difference to
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
occurrences of the regular expression;
a
.CW ?
matches zero or one occurrences.
In addition, regular expressions can be nested within
parentheses.
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
Lines matching either expression are printed, as in the next
example:
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
Remember to put the expression inside quotation marks to
protect the vertical bar from being interpreted by the shell
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
.Ah "Proofing Documents"
.LP
There are no computer tools that completely replace the close
examination of final printed copy by the human eye.
However, UNIX does include a number of proofing aids, ranging
from a simple spelling checker to programs for checking style
and diction, and even sexist usage.
.PP
We'll look at some of these programs in this section.
Not all of the programs we'll discuss are available on all UNIX
systems.
Keep in mind, though, that
.CW grep
is also a very powerful proofing aid, which you can use to check
for consistent usage of words and phrases.
.Bh "Looking For Spelling Errors"
.LP
The
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
Even if you do build that script, you can use
.CW spell
on its own if you are unsure about which of two possible
spellings is right.
Type the name of the command, followed by a
.I RETURN ,
then type the alternative spellings you are considering.
Press
.CW ^D
(on a line by itself) to end the list.
The
.CW spell
command will echo back the word(s) in the list that it considers
to be in error.
.Ps
$ \f(CBspell\f(CW
misspelling
mispelling
^D
mispelling
.Pe
You can invoke
.CW spell
in this way from within
.CW vi ,
by typing the
.CW ex
colon prompt, an exclamation point, and the name of the
.CW spell
command.
.page 305
.PP
When you run
.CW spell
on a file, the list of words it produces usually includes a
number of legitimate words or terms that the program does not
recognize.
You must cull out the proper nouns and other words
.CW spell
doesn't know about to arrive at a list of true misspellings.
For instance, look at the results on this sample sentence:
.Ps
$ \f(CBcat sample\f(CW
Alcuin uses TranScript to convert ditroff into
PostScript output for the LaserWriter printerr.
$ \f(CBspell sample\f(CW
Alcuin
ditroff
printerr
LaserWriter
PostScript
TranScript
.Pe
Only one word in this list is actually misspelled.
.PP
On many UNIX systems, you can supply a local dictionary file so
that spell recognizes special words and terms specific to your
site or application.
After you have run
.CW spell
and looked through the word list, you can create a file
containing the words that were not actual misspellings.
The
.CW spell
command will check this list after it has gone through its own
dictionary.
.PP
If you added the special terms in a file named
.CW dict ,
you could specify that file on the command line using the
.CW +
option:
.Ps
$ \f(CBspell +dict sample\f(CW
printerr
.Pe
The output is reduced to the single misspelling.
.PP
The
.CW spell
command will also miss words specified as arguments to
.CW nroff
or
.CW troff
macros, and, like any spelling checker, will make some errors
based on incorrect derivation of spellings from the root words
contained in its dictionary.
If you understand how
.CW spell
works, you may be less surprised by some of these errors.
.PP
The directory
.CW /usr/lib/spell
contains the main program invoked by the
.CW spell
command along with auxiliary programs and data files.
.Ps
$ \f(CBls -l /usr/lib/spell\f(CW
total 604
-rwxr-xr-x   1 bin    bin    20176 Mar  9  1985 hashcheck
-rwxr-xr-x   1 bin    bin    14352 Mar  9  1985 hashmake
-rw-r--r--   1 bin    bin    53872 Mar  9  1985 hlista
-rw-r--r--   1 bin    bin    53840 Mar  9  1985 hlistb
-rw-r--r--   1 bin    bin     6328 Mar  9  1985 hstop
-rw-rw-rw-   1 root   root  102892 Jul 12 16:10 spellhist
-rwxr-xr-x   1 bin    bin    23498 Mar  9  1985 spellin
-rwxr-xr-x   1 bin    bin    27064 Mar  9  1985 spellprog
.Pe
The
.CW spell
command pipes its input through
.CW "deroff -w"
and
.CW "sort -u"
to remove formatting codes and prepare a sorted word list,
one word per line.
(The
.CW deroff
and
.CW sort
commands are discussed later in this chapter.)
Two separate
.page 306
spelling lists are maintained, one for American usage and one
for British usage (invoked with the
.CW -b
option to
.CW spell ).
These lists,
.CW hlista
and
.CW hlistb ,
cannot be read or updated directly.
They are compressed files, compiled from a list of words
represented as nine-digit hash codes.
(Hash-coding is a special technique for quick search of
information.)
.PP
The main program invoked by
.CW spell
is
.CW spellprog .
It loads the list of hash codes from either
.CW hlista
or
.CW hlistb
into a table, and looks for the hash code corresponding to each
word on the sorted word list.
This eliminates all words (or hash codes) actually found in the
spelling list.
For the remaining words,
.CW spellprog
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
The new words created as a result of these manipulations will be
checked once more against the spell table.
However, before the stem-derivative rules are applied, the
remaining words are checked against a table of hash codes built
from the file
.CW hstop .
The
.CW stop
list contains typical misspellings that stem-derivative
operations might allow to pass.
For instance, the misspelled word
.I thier
would be converted into
.I thy
using the suffix rule -y+ier.
The
.CW hstop
file accounts for as many cases of this type of error as
possible.
.PP
The final output consists of words not found in the spell list,
even after the program tried to search for their stems, and words
that were found in the stop list.
.PP
You can get a better sense of these rules in action by using the
.CW -v
or
.CW -x
option.
.PP
The
.CW -v
option eliminates the last lookup in the table, and produces a
list of words that are not actually in the spelling list along
with possible derivatives.
It allows you to see which words were found as a result of
stem-derivative operations, and prints the rule used.
.Ps
$ \f(CBspell -v sample\f(CW
Alcuin
ditroff
LaserWriter
PostScript
printerr
TranScript
+out  output
+s    uses
.Pe
The
.CW -x
option makes
.CW spell
begin at the stem-derivative stage, and prints the various
attempts it makes to find the word stem of each word.
.page 307
.Ps
$ \f(CBspell -x sample\f(CW
\&...
=into
=LaserWriter
=LaserWrite
=LaserWrit
=laserWriter
=laserWrite
=laserWrit
=output
=put
\&...
LaserWriter
\&...
.Pe
The stem is preceded by an equals sign.
At the end of the output are the words whose stem does not
appear in the spell list.
.PP
One other file you should know about is
.CW spellhist .
Each time you run
.CW spell ,
the output is appended through a command called
.CW tee
into
.CW spellhist ,
in effect creating a list of all the misspelled or unrecognized
words for your site.
The
.CW spellhist
file is something of a \(lqgarbage\(rq file that keeps on growing.
You will want to reduce it or remove it periodically.
To extract useful information from this
.CW spellhist ,
you might use the
.CW sort
and
.CW "uniq -c"
commands shown later in this chapter to compile a list of
misspelled words or special terms that occur most frequently.
It is possible to add these words back into the basic spelling
dictionary, but this is too complex a process to describe here.
.Bh "Checking Hyphenation"
.LP
The
.CW hyphen
.ix	[hyphen] command %key hyphen command
command is used on
.CW nroff -\c
formatted files to print a list of words that
have been hyphenated at the end of a line.
You can check that
.CW nroff
has correctly hyphenated words.
.Ps
$ \f(CBhyphen ch03.out\f(CW
ch03.out:
applica-tion
pro-gram
charac-ter
.Pe
If you disagree with the hyphenation of a word, you can go
back into your source file and use either the
.CW \&.hw
request to specify hyphenation points or the
.CW \&.nh
request to inhibit hyphenation of the word.
If you don't have the
.CW hyphen
command on your system, you can print the lines ending in hyphens
using grep:
.Ps
$ \f(CBgrep '-$' ch03.out\f(CW
.Pe
This will not display the second half of the hyphenated word on
the following line, but it should give you enough of an idea.
Alternatively, you could use
.CW awk
or
.CW sed ,
.page 308
described in the next chapter, to create a version of this
command that would print both lines.
.Bh "Counting Words"
.LP
In the past, writers were paid by the word.
The
.CW wc
command will count words for
you.
.Ps
$ \f(CBwc ch01\f(CW
180   1529   9496 ch01
.Pe
The three numbers printed represent the number of lines, words,
and characters, respectively.
(The presence of formatting commands in the input file will
make this measurement somewhat inaccurate).
.Bh "Writer's Workbench"
.ix	Writer's~Workbench
.PP
No book on UNIX text processing can avoid some discussion
of Writer's Workbench (WWB), a collection of programs for
the analysis of writing style.
.PP
Unfortunately, unlike most of the programs described in this
book, the Writer's Workbench is not available on all UNIX
systems.
It was originally developed for internal use at Bell Labs,
and was available in early releases of UNIX to the academic
community.
But it was made into a separate product when UNIX was
commercially released.
.PP
The three original programs,
.CW style ,
.CW diction ,
and
.CW explain ,
are available in Berkeley UNIX systems and in Xenix, but not
in System V.
.PP
AT&T has released a greatly improved and expanded version,
including additional programs for proofreading, that is
controlled from a master program called
.CW wwb .
However, this version is only available as a separately priced
package for 3B2 and 3B5 computers.
The unfortunate result is that one of UNIX's most unusual
contributions to text processing is not officially part of UNIX
and has never been ported to many UNIX systems.
.PP
In this section, we'll describe the original
.CW style
and
.CW diction
programs, with a brief discussion of
.CW wwb .
.PP
The
.CW style
.ix	Writer's~Workbench, analyze style/readability ([style]) %key Writer's Workbench, analyze style/readability (style)
program analyzes a document's style
and computes readability indexes based on several algorithms
widely accepted in the academic community.
For example, when run on a draft of this section,
.CW style
gave the following report:
.Ps
readability grades:
      (Kincaid) 11.1  (auto) 11.6  (Coleman-Liau) 11.0
      (Flesch) 11.5 (52.7)
sentence info:
      no. sent 53 no. wds 1110
      av sent leng 20.9 av word leng 4.79
      no. questions 0 no. imperatives 0
      no. nonfunc wds 624  56.2%   av leng 6.25
      short sent (<16 ) 34%  (18)  long sent (>31)  17% (9)
      longest sent 46 wds at sent 4;
.page 309
      shortest sent 5 wds at sent 47
sentence types:
      simple  32% (17)  complex  47% (25)
      compound   4% (2)  compound-complex  17% (9)
word usage:
      verb types as % of total verbs
      tobe  29% (33)  aux  28% (32)  inf 15% (17)
      passives as % of non-inf verbs   9% (9)
      types as % of total
      prep 12.0% (133)  conj 3.6% (40)  adv 5.0% (56)
      noun 26.8% (298)  adj 15.5% (172)  pron 7.3% (81)
      nominalizations   3%  (30)
sentence beginnings:
      subject opener: noun (22)  pron (5)  pos (1)  adj (2)
                        art  (4 )  tot  64%
      prep 17% (9)  adv 9% (5)
      verb  0% (0)  sub_conj 6% (3)  conj 0% (0)
      expletives  4% (2)
.Pe
Even if you aren't an English teacher and don't know the
Kincaid algorithm from the Flesch, this report can be very
useful.
.PP
First, regardless of the differences between the algorithms,
they all give you a general idea of the required reading level
for what you have written.
It is up to you to adjust your style according to the audience
level you want to reach.
This may not be a trivial task; however, it may be a vital one
if you are writing a book for a specific audience.
For example, if you were writing an instruction manual for
heavy equipment to be used by people reading at the sixth-grade
level, a
.CW style
report like the one shown would be a dire warning that the manual
would not be successful.
.PP
In general, to lower the reading level of a document, use
shorter sentences and simpler constructions.
(Incidentally, most writing in newspapers and general circulation
magazines is at the sixth-grade level.
But you shouldn't get the impression that text written for a
lower reading level is better.
Writing can be clear and effective at any level of complexity.
At the same time, each of us must recognize, and adjust for, the
skills of our intended reader.)
.PP
The analysis of reading level is only a small part of what
.CW style
offers.
The detailed analysis of sentence length and type, word usage,
and sentence beginnings can give you considerable insight into
your writing.
If you take the time to read the report carefully at the same
time as you reread your text, you will begin to see patterns and
can make intelligent decisions about editorial changes.
.PP
As an exercise, run
.CW style
on a short passage you have written, read the report carefully,
then rewrite your work based on the report.
See what difference this makes to the
.CW style
report.
You will eventually get a feel for what the program provides.
.PP
In some cases,
.CW diction ,
the other major program in the Writer's Workbench, can also
help you find areas to change.
.PP
The
.CW diction
.ix	Writer's~Workbench, search~for poor phrasing ([diction]) %key Writer's Workbench, search~for poor phrasing (diction)
program relies on a library of frequently misused words and
phrases.
It relentlessly searches out these words and flags them as
inappropriate by enclosing them in brackets.
For example, when run on a previous draft of this section,
.CW diction
made the following recommendations:
.page 310
.Ps
wwb
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
The
.CW diction
program lists \(lqproblem\(rq sentences from
your source file, with words or
phrases it has taken exception to enclosed in brackets.
You can redirect this output
.page 311
to a file, or page through it on the screen.
Punctuation and macros are first stripped by the
.CW deroff
program, which explains the odd appearance of the text.
.PP
We find that we ignore
.CW diction 's
advice much of the time\(emthe exception list is applied across
the board, without regard for context.
For example, you'll notice that it flagged the phrase
.I "number of"
several times, though that was exactly what we meant in
all but one case.
However, the twenty percent of its recommendations that we agree
with are worth the effort of running the program.
.PP
If you don't understand why
.CW diction
complains about a phrase, you can use
.CW explain
.ix	Writer's~Workbench, explain [diction] errors ([explain]) %key Writer's Workbench, explain diction errors (explain)
to ask for help.
For example:
.Ps
$ \f(CBexplain\f(CW
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
.PP
The official release of WWB for 3B computers contains improved
versions of
.CW style
and
.CW diction ,
as well as many additional programs.
.ix	Writer's~Workbench, miscellaneous~programs
These programs include
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
program will run just about everything.
The
.CW proofr
program will run those programs that help you proofread (such as
.CW spell ,
.CW double ,
.CW punct ,
and
.CW diction ).
The
.CW prose
program will run those that analyze style (such as
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
the
.CW SCCS
system, which lets you keep a compact history of
differences between files, so that you can go back and
reconstruct any previous version
.Li
the
.CW make
program, which keeps track of a predefined list of dependencies
between files
.Le
.RE
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
on these files, the following output is produced:
.Ps
$ \f(CBdiff test1 test2\f(CW
3c3
< walnuts
---
> grapes
.Pe
The
.CW diff
command displays the only line that differs between the two
files.
To understand the report, remember that
.CW diff
is prescriptive, describing what changes need to made to the
first file to make it the same as the second file.
This report specifies that only the third line is affected,
exchanging walnuts for grapes.
This is more apparent if you use the
.CW -e
option, which produces an editing script that can be submitted
to
.CW ed ,
the UNIX line editor.
(You must redirect standard output to capture this script in
a file.)
.Ps
$ \f(CBdiff -e test1 test2\f(CW
3c
grapes
\&.
.Pe
This script, if run on
.CW test1 ,
will bring
.CW test1
into agreement with
.CW test2 .
(Later in this section, we'll look at how to get
.CW ed
to execute this script.)
If you compare the first and third files, you find more
differences:
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
Again, this can be seen more clearly in the editing script
produced by the
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
followed by l, 2, or 3, indicating which file is different;
if no number is specified, then all three files differ.
Then, using
.CW ed -like
notation, the differences are described for each file.
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
To bring these files into agreement, you would have to add apples
at the beginning of the third file;
change line 3 of the second file to line 3 of the first file;
and change lines 2 and 3 of the third file, effectively dropping
the last line.
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
script that ends with the commands that save the edited version
of the file;
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
In a gutter between the two columns, the program displays a
.CW <
if the line is unique to the first file, a
.CW >
if the line is unique to the second file, and a
.CW |
if the line is different in both files.
Because the default line length of this program (130
characters) is too wide for most terminals, it is best to use
the
.CW -w
option to specify a smaller width.
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
command only shows the differences between the two files.
Identical lines are suppressed.
One of the most powerful uses of
.CW sdiff
is interactive, building an output file by choosing between
different versions of two files.
You have to specify the
.CW -o
option and the name of an output file to be created.
The
.CW sdiff
command then displays a
.CW %
prompt after each set of differences.
You can compare the different versions and select the one that
will be sent to the output file.
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
let's now consider some practical applications for comparing
documents.
.PP
When working on a document, it is not an uncommon practice to
make a copy of a file and edit the copy rather than the original.
This might be done, for example, if someone other than the writer
is inputting edits from a written copy.
The
.CW diff
.ix	%begin [diff] command %key diff command
command can be used to compare the two versions of a document.
A writer could use it to proof an edited copy against the
original.
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
As another example, suppose a company has a number of text files
that comprise its help facility.
These files are shipped with the
product and maintained online by the customer.
When there is a documentation update, these files also need to
be updated.
One way to accomplish this is to replace each text file in its
entirety, but that involves distributing a lot of material that
remains unchanged.
Another way is to use
.CW diff
and simply send a record of changes between the old and the new.
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
To save the changes, a
.CW w
command is submitted through echo.
(In fact, if you have any concern about sparing the original file,
you could change the
.CW w
to
.CW 1,$p ,
which will cause the edited contents to be printed to standard
output, but not saved in the file.
Redirect standard output to a new file to keep both copies.)
.PP
As a further example, let's take the instance where two people
have made copies of a file and made changes to their own copies,
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
You often find that one version has some things right and another
version has other things right.
What if you wanted to compile a single version of this document
that reflects the changes made to each copy?
You want to select which version is correct for each set of
differences.
One effective way to do this would be to use
.CW sdiff .
.ix	%begin [sdiff] command %key sdiff command
.PP
We'll use the
.CW -s
option to suppress the printing of identical lines.
To make the example fit on the printed page, we specify a
45-character line length.
(You would generally use an 80-character line length for the
screen.)
Because the total line length is limited to 45 characters,
.CW sdiff
will be able to display only the first 15 or so characters of
the line for each file;
the rest of the line will be truncated.
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
contains the portions of each file that were selected along with
all the lines that both files have in common.
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
.Bh "SCCS"
.ix	SCCS (Source~Code~Control~System)
.LP
We've shown an example using
.CW diff
to produce a file that described the changes made to a text file
for a help facility.
It allowed the distribution of a smaller file
describing changes instead of a wholly new version of the file.
This indicates a potential application for
.CW diff ,
which is fully realized in the Source Code Control System
or SCCS.
SCCS is a facility for keeping track of the changes to
.ix	files, tracking changes to (SCCS)
files that take place at different stages of a software
development or documentation project.
.PP
Suppose you have a first draft of a manual.
(This is referred
to as a
.I delta
when it
is saved in a special SCCS format.)
The second draft, of course, is based on changes to the first
draft.
.PP
When you make the delta for the second draft, SCCS, instead of
keeping a separate copy for each draft, uses
.CW diff
to record the changes to the first draft that resulted in the
second draft.
Only the changes, and the instructions for having an editor
make them, need to be maintained.
SCCS allows you to regenerate earlier drafts, which saves disk
space.
.PP
SCCS is quite complex\(emtoo complex to describe here\(embut
we seriously suggest that you investigate it if you are working
on a large, frequently-revised or multiple author writing project.
.page 320
.Bh "Using \f(CBmake\fP"
.ix	%begin [make] command %key make command
.LP
The
.CW make
program is a UNIX facility for describing dependencies among a
group of related files, usually ones that are part of the same
project.
This facility has enjoyed widespread use in software development
projects.
Programmers use
.CW make
to describe how to \(lqmake\(rq a program\(emwhat source files
need to be compiled, what libraries must be included,
and which object files need to be linked.
By keeping track of these relationships in a single place,
individual members of a software development team can make
changes to a single module, run
.CW make ,
and be assured that the program reflects the latest changes made
by others on the team.
.PP
We group
.CW make
with the other commands for keeping track of differences
between files only by a leap of the imagination.
However, although it does not compare two versions of the same
source file, it can be used to compare versions such as a
source file and the formatted output.
.PP
Part of what makes UNIX a productive environment for text
processing is discovering other uses for standard programs.
The
.CW make
utility has many possible applications for a documentation
project.
One such use is to maintain up-to-date copies of formatted
files that make up a single manual and provide users with a
way of obtaining a printed copy of the entire manual without
having to know which preprocessors or
.CW nroff/troff
options need to be invoked.
.PP
The basic operation that
.CW make
performs is to compare two sets of files, for example,
formatted files and unformatted files, and determine if any
members of one set, the unformatted files, are more recent than
their counterpart in the other set, the formatted files.
This is
accomplished by simply comparing the date or time stamp of pairs
of files.
If the unformatted source file has been modified since the
formatted file was made,
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
.CW makefile
specifies a hierarchy of dependencies among individual files,
called
.I components .
At the top of this hierarchy is a
.I target .
For our purposes, you can think of the target as a printed copy
of a book;
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
This hierarchy can be represented in a diagram:
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
.CW manual
and it is made up of three formatted files whose names appear
after the colon.
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
the end result is that the three formatted files are spooled to
the printer.
However, a sequence of operations is performed before this final
action.
The dependency line for each component is evaluated, determining
if the coded file has been modified since the last time the
formatted file was made.
The formatting command will be executed only if the coded file
is more recent.
After all the components are made, the
.CW lp
command is executed.
.PP
As an example of this process, we'll assume that all the
formatted files are up-to-date.
Then by editing the source file
.CW ch03a ,
we change the modification time.
When you execute the
.CW make
command, any output files dependent on
.CW ch03a
are reformatted.
.Ps
$ \f(CBmake\f(CW
  nroff -mm ch03? > ch03.fmt
  lp ch0[1-3].fmt
.Pe
Only
.CW ch03.fmt
needs to be remade.
As soon as that formatting command finishes, the command
underneath the target
.CW manual
is executed, spooling the files to the printer.
.PP
Although this example has actually made only limited use of
.CW make 's
facilities, we hope it suggests more ways to use
.CW make
in a documentation project.
You can keep your
.CW makefiles
just this simple, or you can go on to learn additional notation,
such as internal macros and suffixes, in an effort to generalize
the description file for increased usefulness.
We'll return to
.CW make
in Chapter 18.
.ix	%end [make] command %key make command
.page 322
.Ah "Manipulating Data"
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
Miscellany UNIX Commands
In this chapter, we present a miscellany of UNIX programs
with text-processing applications.
In addition, we introduce several UNIX utilities
.Pe
Special rules are applied to text specified as arguments to a
macro so that they are not passed through
.CW deroff .
A word in a macro call must contain at least three letters.
Thus,
.I A
and
.I of
are omitted.
.PP
The
.CW deroff
.CW -w
command is used by
.CW spell
to remove
.CW troff
requests and place each word on a separate line.
You can use
.CW deroff
in a similar manner to prepare a word list.
.Ps
$ \f(CBderoff -w temp\f(CW
Miscellany
UNIX
.ig
	Again, I really doubt deroff changed Commands to Programs
..
Commands
In
this
chapter
we
present
miscellany
of
UNIX
programs
with
text
processing
applications
In
addition
.Pe
Again, not all \(lqwords\(rq are recognized as words.
The
.CW deroff
command requires that a word consist of at least two characters,
which may be letters, numerals,
.page 323
ampersands, or apostrophes.
(As mentioned above, it applies slightly different rules to
text specified as an argument to a macro.)
.PP
We had hoped
.CW deroff
might be useful for our clients who wanted online copies of a
document but used a word processor.
Because
.CW deroff
.ix	%end [deroff] command %key deroff command
drops words, it was not practical for stripping out
.CW troff "-specific"
constructs.
Perhaps the best way to do this is to use
.CW nroff
to process the file, and then use a combination of terminal
filters to strip out tabs, backspaces (overstrikes), and reverse
linefeeds.
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
Normally, it is used to order the contents of files containing
data such as names, addresses, and phone numbers.
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
\&.XX "BASIC statements,  BEGIN CASE"
.Pe
The
.CW -f
option folds uppercase and lowercase words together
(that is, it ignores case when performing the sort).
The
.CW -d
option sorts in dictionary order, ignoring any special characters.
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
.PP
You wouldn't expect
.CW sort
to be useful on a document containing long lines of text.
However, if you bothered to start sentences on a new line
when creating the input file (as we recommended in Chapter 3),
scanning a sorted file can produce some interesting things.
The following command sorts the contents of
.CW ch03
and pipes the output through
.CW pg :
.Ps
$ \f(CBsort -u ch03 | pg\f(CW
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
$ \f(CBderoff -w ch03 | sort -fd | uniq -c\f(CW
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
   2 Add
   7 add
\&...
  68 you
   3 Your
.page 325
  13 your
   2 zero
.Pe
.PP
In the next example, we repeat the previous command, this time
adding another sort
at the end to order the words by frequency.
The
.CW -r
option is used to
.I reverse
the comparison, putting the greatest
number first.
.Ps
$ \f(CBderoff -w ch03 | sort -fd | uniq -c | sort -rfd\f(CW
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
You will find other examples of
.CW sort
.ix	[sort] command %key sort command
in the next section, where we look at sorting particular fields.
Be sure to read the UNIX command pages for
.CW sort
and
.CW uniq
.ix	[uniq] command %key uniq command
and experiment using different options.
.Bh "The \f(CBjoin\fP Command"
.LP
The
.CW join
.ix	%begin [join] command %key join command
command compares lines contained in separate files and joins
lines that have the same key.
(When you use
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
However, there are options that allow you to change the key
field.)
The file must be sorted in ascending ASCII sequence before being
processed by
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
After the data is joined in this manner, it can be sorted by
field.
Fields are separated by blank spaces or tabs.
The sort can be performed on specific fields, using
.CW +
to indicate
the first sort field and
.CW -
to indicate the last sort field.
The first field is
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
Commands found only on systems running Berkeley 4.2 are in the
left-hand column, and those found only on AT&T System V.2 are
in the center column.
Commands found in both versions are listed in the right-hand
column.
.PP
You can also suppress the display of one or more columns.
For instance, if you wanted to display only the commands that
were found on both systems, you'd enter.
.Ps
$ \f(CBcomm -l2 bsd4.2 attV.2\f(CW
.Pe
Only the third column would be shown.
.PP
By specifying
.CW -
instead of a filename, you can also use standard input.
In the next example, we produce a listing of filenames from two
directories on the system, sort them, and compare them against
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
Parentheses are used to group a series of commands, combining
their output into a single stream;
we want a list of command names without pathnames from
several directories.
Because a new shell is created to execute these commands,
notice that we do not change our current working directory
when the commands in parentheses have finished executing.
.ix	%end [comm] command %key comm command
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
For our examples, we'll make use of a portion of a table of
ASCII characters that specifies their decimal and hexadecimal
values.
(This example is probably unnecessarily complex; you can use
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
the
.CW -d
option can be used to change it.
The
.CW -c
option allows you to specify character positions or ranges.
The command
.CW "cut -c6-80"
would print characters beginning at position 6 through 80,
truncating the first five characters.
The
.CW -f
option is used to specify one or more fields that are passed
to standard output.
(Given the name of the command, one might reasonably think
you'd specify the fields or column position you wanted
.I cut
out, but ...)
.PP
In the next example we extract the third field, which contains
the ASCII names.
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
is what we really want for our next feat.
We are going to reorder the table so that it can be referenced
by the ASCII name rather than by decimal number.
All of this can be done from the command line, with only a
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
option) and replaces the newline with a tab in all but the last
file.
This gives us four columns.
(Yes, it doubled the
.CW tbl
specifications, but we have an editor.)
Now, all we have to do is extract the first three columns from
the output.
Only
.CW "cut -f1,2,3"
has been added to the previous command, and the output is
redirected to a file.
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
The
.CW paste
.ix	[paste] command %key paste command
command can be used in several interesting ways.
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
option is used when only a single file is specified.
It tells
.CW paste
to merge subsequent lines in the same file rather than to merge
one line at a time from several files.
In this example, the first line's newline is replaced by a tab
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
You would probably want to go to this much trouble for a large
table (or many small tables) rather than the small examples
shown here.
A more practical example that uses
.CW paste
alone would be to construct a multi-column table from a single
long list
.page 332
of words.
Simply split the list into equal-sized chunks, then paste them
together side by side.
.Bh "The \f(CBtr\fP Command"
.ix	[tr] command %key tr command
.LP
The
.CW tr
command is a character translation filter, reading standard input
and either deleting specific characters or substituting one
character for another.
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
will convert all uppercase characters in
.I file
to the equivalent lowercase characters.
The result is printed on standard output.
.PP
As described in Chapter 7, this translation (and the reverse)
can be useful from within
.CW vi
for changing the case of a string.
You can also delete specific characters.
The
.CW -d
option deletes from the input each occurrence of one or more
characters specified in a string (special characters should be
placed within quotation marks to protect them from the shell).
For instance, the following command passes to standard output
the contents of
.I file
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
will print on standard output a copy of
.I file
in which multiple spaces in sequence have been replaced with a
single space.
.PP
We've also found
.CW tr
useful when converting documents created on other systems for
use under UNIX.
For example, one of our writers created some files using an
IBM PC word processor.
When we uploaded the files to our system, and tried to edit
them with
.CW vi ,
we got the message:
.Ps
Not an ascii file
.Pe
and a blank screen.
The
.CW vi
editor could not read the file.
However, using a programming utility that lists the actual binary
values that make up the contents of a file (\c
.CW od ,
or
.I "octal dump" ),
we were able to determine that the word processor used nulls
(octal 000) instead of newlines (octal 012) to terminate each
line.
.PP
The
.CW tr
command allows you to specify characters as octal values by
preceding the value with a backslash, so the command:
.Ps
$ \f(CBtr '\\000'  '\\012'\f(CW
.Pe
was what we needed to convert the file into a form that could be
edited with
.CW vi .
.page 333
.Bh "Splitting Large Files"
.LP
Splitting a single large file into smaller files can be done out
of necessity\(emwhen you come across a program that can't handle
a large file\(emor as a matter of preference\(emwhen you find it
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
command offers an alternative, allowing you to break a file in
context.
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
The pattern is enclosed within double quotation marks because it
contains a space.
(If you use the C shell, you must protect the braces from being
interpreted by placing them in double quotation marks as well.)
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
.Bh Encryption
.LP
The cloak-and-dagger set and the security conscious will find
uses for the encryption facilities of UNIX.
(These facilities are not available on UNIX systems sold
outside the United States.)
The
.CW crypt
.ix	[crypt] command %key crypt command
command reads a file from standard input, asks you to supply
a key for encoding the file, and passes to standard output an
encrypted version of the file.
You should redirect standard output to a new file because the
encrypted file is not readable text.
.Ps
$ \f(CBcat message | crypt > encrypted.msg\f(CW

Enter key:\f[CB]alabaster\fP
.Pe
Just as when you enter a password, the key does not appear on
the screen as you enter it.
If you prefer, you can enter the key as an argument to
.CW crypt .
To decode an encrypted file, you simply
.CW cat
the file to
.CW crypt
and supply the key.
.PP
The UNIX editors
.CW ed ,
.CW ex ,
and
.CW vi ,
can be invoked with the
.CW -x
option to read or edit an encrypted file.
(Some versions of these programs recognize this option but do
not support the encryption feature.)
Of course, you have to supply the correct key.
.page 336
.Ah "Cleaning Up and Backing Up"
.ix	%begin backing~up files
.LP
In this section, we show some procedures for backing up active
files to some other medium such as tape or floppy disk.
At many sites, backups are the responsibility of one person,
who performs these tasks on a regular basis to ensure that
users can recover much of their data in case there is a serious
system crash.
At other sites, individual users might be responsible for doing
their own backups, especially if there are only a few users on
the system.
Whoever does it must ensure that backups of important files
are made periodically.
.PP
A second reason for learning a backup procedure is to enable
you to store files on an off-line medium.
For users of PCs, this is the standard method of operation (and
therefore much simpler to do), but all UNIX systems have hard
disks as the primary storage medium.
No matter how large a disk drive is, sooner or later, users
will fill it to capacity.
Frequently, there are useless files that can be deleted.
Other inactive files, such as an early draft of a document,
might be removed from the system after you have made a copy
on floppy disk or tape.
After a project is finished, you probably want to make several
copies of all important files.
At a later time, should you need files that have been stored
off-line, you can easily restore them to the system.
.PP
We are going to describe how to use the
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
Ask an expert user at your site about backup procedures and go
through it once or twice.
Apart from learning about
.CW cpio ,
you will need:
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
This list identifies the files that will be backed up.
For practical purposes, this involves doing an
.CW ls
command on the directory you want backed up and piping the
results to
.CW cpio .
.PP
You need to know the UNIX filename for the backup device.
This name is site specific, so you need to check with a
knowledgeable user.
At our site, we have a floppy  disk  drive  named
.CW /dev/rfp021 .
A  tape  drive  might  be  named
.CW /dev/mt0 .
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
.Ah "Compressing Files"
You can conserve the amount of disk space that text files take
up by storing some of your files in a compressed form.
The
.CW pack
.ix	[pack] command %key pack command
command can be used to compress a file.
It generally reduces a text file by 25 to 40 percent.
.Ps
$ \f(CBls -l ch04/sect1\f(CW
-rw-rw-rw-   1 fred   doc   29350 Jun 10 15:22 ch04/sect1
$ \f(CBpack ch04/sect1\f(CW
pack: ch04/sect1: 39.9% Compression
.Pe
The original file is replaced by a packed file with a
.CW \&.z
appended to the original filename.
.Ps
$ \f(CBls -l ch04/sect1.z\f(CW
-rw-rw-rw-   1 fred   doc   17648 Jun 10 15:29 ch04/sect1.z
.Pe
The
.CW pack
command reduced the size of this file from 29K to 17K bytes.
If used system-wide, it could save a significant amount of
disk space, although the amount of compression will vary from
file to file.
Obviously, there is less benefit in packing small files.
.PP
To expand a packed file, use the
.CW unpack
.ix	[unpack] command %key unpack command
command.
You can specify the name of the file with or without the
.CW \&.z
suffix.
.Ps
$ \f(CBunpack ch04/sect1\f(CW
unpack:  ch04/sect1: unpacked
.Pe
.page 339
Another way to temporarily
unpack
a file is to use a special version of
.CW cat
for packed files, called
.CW pcat .
.ix	[pcat] command %key pcat command
Use this command to view a packed file (pipe it through
.CW more
or
.CW pg )
or send it as input to another command, as in the following
example:
.Ps
$ \f(CBpcat ch04/sect1 | nroff -mm\f(CW
.Pe
.Ah Communications
.LP
More and more, we find that our projects require us to work on
several different computer systems, some of them UNIX systems,
some not.
Given this situation, the ability to work remotely on other
systems and to transfer files has been essential.
Fortunately, a number of useful communications programs are
part of the standard UNIX shipment.
.PP
Two basic types of connections between computer systems are a
.I dial-up
.ix	dial-up line
line, using a modem to communicate across phone lines, and a
.ix	modem
.I direct
line, when two computer systems are in close proximity and can
be connected by a single cable.
The
.CW uucp
.ix	[uucp] command %key uucp command
and
.CW cu
.ix	[cu] command %key cu command
commands establish communication links using both types of
connections.
The
.CW cu
command (Berkeley's version is called
.CW tip )
.ix	[tip] command %key tip command
is a UNIX program for conducting a login session on a remote
computer system.
UUCP (UNIX-to-UNIX copy) is a series of related programs for
transforming files between UNIX systems.
Its main program is called
.CW uucp .
.PP
We cannot provide full descriptions of these facilities here.
A good way to learn is to ask an expert user to help you
transfer files or begin a remote login session.
Keep notes on the procedure and when following it, if things
don't work as expected, get more help.
.PP
The UUCP programs are quite straightforward and easy to use
after you are accustomed to the conventions.
Each system on the UUCP network has a file that describes the
other systems linked to it and what types of links are available.
This file is created by the system administrator of each system.
You can find out the names of these remote systems by entering
the
.CW uuname
.ix	[uuname] command %key uuname command
command.
If your system is properly configured and you have a login on a
remote system, such as
.CW boston ,
you can begin a remote session by entering:
.Ps
$ \f(CBcu boston\f(CW
.Pe
After you are connected to the remote system, you should get
a login message.
To quit a remote session, log out and then enter
.CW ~.
(tilde dot) to return to your own machine.
.PP
There are a number of commands you can enter while under the
control of
.CW cu ,
permitting, for instance, the execution of commands on the
local system while you are still logged in to the remote system.
Check the reference page in your UNIX documentation.
.PP
You can also
.I "dial direct"
to a non-UNIX system by specifying a
telephone number on the command line (providing, of course,
that the files accessed by these communications programs have
been properly configured by the system administrator).
.page 340
.PP
You can send mail to users on these remote systems and transfer
files.
.ix	files, transferring~to other systems
Generally, file transfers take place between
.I "public directories"
.ix	directories, public
on both systems, usually
.CW /usr/spool/uucppublic .
File transfers between other directories will contend with file
and directory access permissions as well as
.CW uucp
permissions set by the system administrator.
The character
.CW ~
serves as a shorthand for the public directory.
.PP
For instance, when working on site for a client, we often create
files that we want to send to our own system.
If we are logged in on their system, we can send the file
.CW outline
to our system named
.CW ora
by entering:
.Ps
$ \f(CBuucp -m outline ora!~/fred/\f(CW
.Pe
The UUCP facility is batch oriented, accepting requests and
acting upon them in the order in which they are received.
Although it may execute your request immediately, if
it is busy or encounters difficulty making the connection, UUCP
will carry out the request at a later time.
.PP
The
.CW -m
option is used so that we are sent mail when the copy is
actually completed.
The system name is followed by an exclamation mark (if you use
the C shell, escape ! with a backslash).
Then you specify a tilde (~) followed by the user's name.
Putting a slash after the user name (\c
.CW fred )
ensures that the user name will be interpreted as a directory
(or a directory will be created if one does not exist).
.PP
Occasionally, you will need to transfer a large number of files
or, perhaps, an entire directory hierarchy.
There are some simple tricks you can use to combine multiple
files into a single file, making it easier to transmit to
another system.
They are especially helpful when you transfer between public
directories.
.PP
You must first create a list of the files to be included.
(You can do this either manually or with a command like
.CW ls
or
.CW find .)
Then use
.CW cpio
.ix	[cpio] command %key cpio command
to create what we can call a file
.I archive
on standard output rather than on a backup device.
Redirect standard output to a file, then use UUCP to send the
archive.
Use the same backup program on the target system to restore the
archive.
For example, if you had a book made up of files
.CW ch01 ,
.CW ch02 ,
etc., you could \(lqpackage\(rq that book for transfer to another
system using
.CW cpio.
.Ps
boston$ \f[CB]cd /usr/proj/book\fP
boston$ \f[CB]find . -name 'ch0?' -print | cpio -oc > book.archive\fP
.Pe
or using a manually generated list of filenames:
.Ps
boston$ \f[CB]ls ch0? > filelist\fP
boston$ \f[CB]cpio -oc < filelist > book.archive\fP
.Pe
Then, after transferring
.CW book.archive
(instead of numerous individual files) to the
remote system with UUCP, a user can restore the archive:
.Ps
calif$ \f[CB]mkdir /usr/proj/book\fP
calif$ \f[CB]mv /usr/spool/uucppublic/book.archive /usr/proj/book\fP
calif$ \f[CB]cd /usr/proj/book\fP
calif$ \f[CB]cpio -icd < book.archive\fP
.Pe
(The
.CW -c
option of
.CW cpio
writes header information in ASCII for portability;
.CW -d
tells
.CW cpio
to create directories if needed when doing the restore.)
.page 341
.PP
(On Berkeley UNIX systems, you can do something similar with
.CW tar .
.ix	[tar] command %key tar command
See your UNIX manual for details.)
.Ah "Scripts of UNIX Sessions"
.LP
Throughout this chapter, we have provided examples of UNIX
commands.
These examples were made using a command called
.CW script
.ix	[script] command %key script command
(which is not a standard System V command).
The
.CW script
command allows you to make a file copy of a UNIX session.
Without this facility, we'd have to simulate the examples by
hand.
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
After we make a script, we simply read the file into our text
using
.CW vi .
.PP
Keeping a script of a procedure is also a good start for
building a shell script that performs a routine task
automatically.


