.ig
	ch02.t
	Typed by: Stewart Russell.
	Marked up by: Michael Hobgood
	Proofed on: 2 Oct 2002
..
.so utp.mac
.utp
.Se 2 "UNIX Fundamentals" "Chapter" 1
.page 12
.ix UNIX, system fundamentals
.LP
In this chapter, we review a set of basic concepts
for users working in the UNIX environment.
As we mentioned in the preface,
this book does not replace a general introduction to UNIX.
A complete overview is essential to anyone not familiar with the
file system, input and output redirection, pipes and filters,
and many basic utilities.
In addition, there are different versions of UNIX,
and not all commands are identical in each version.
In writing this book, the original authors
used System V Release 2
.ix UNIX, version~used~for~this~book
on a Convergent Technologies' Miniframe.
This rewrite uses MacOS X Catalina (10.15.8)
on a late-2013 iMac
and Kubuntu Linux Resolute Raccoon (26.04 LTS)
on a Lenovo ThinkPad T450.\" xxx confirm model number
.PP
Disclaimers aside, if it has been a while since you
tackled a general introduction to UNIX,
this chapter should help refresh your memory.
If you are already familiar with UNIX,
you can skip or skim this chapter.
.PP
The UNIX operating system is a collection of programs
that controls and organizes the resources and activities
of a computer.
Resources consist of hardware such as
the computer's memory,
various peripherals such as
keyboards, mice, printers, and disk drives,
and software utilities for specific tasks.
.PP
UNIX is a multiuser,
multitasking operating system that allows the computer
to perform a variety of functions for many users.
It provides users with
both GUI and terminal environments
where they can access
the computer's resources and utilities.
Both GUI and terminal environments
have several different ways to interact with users.
In the terminal environment,
our primary focus in this book, the
.I shell
is how you interact.
In this book, we focus primarily on the terminal environment.
As you start working, you should find ways
to incorporate the GUI environment into your work.
Learning to work in both environments,
using the strengths of each,
makes you a more productive writer.
.PP
As we explain these basic concepts,
using a tutorial approach,
we demonstrate the broad capabilities of UNIX
as an environment for text-processing.
What you learn about UNIX in general
can be applied to performing specific tasks
related to text-processing.
.
.Ah "The UNIX Shell"
.LP
In the terminal environment,
UNIX provides a command interpreter called a
.I shell .
The shell accepts typed commands,
performs specific tasks as requested,
and handles the output or results,
normally directing output to the terminal's video display screen.
.page 13
.PP
UNIX commands may be simple one-word entries like the
.CW date
.ix [date] command %key date command
command:
.Ps
$ \f[CB]date\fP
Tue Apr 8 13:23:41 EST 1987
.Pe
Commands may be more complex,
requiring you to specify options and arguments,
such as file names.
Although some commands have a peculiar syntax,
most UNIX commands follow this general form:
.ix UNIX, syntax~of commands
.Ps
\f[I]command option(s) argument(s)\fP
.Pe
.PP
A
.I command
identifies a software program or utility.
Commands are entered in lowercase letters.
One typical command,
.CW ls ,
.ix [ls] command %key ls command
lists the files that are available
in your immediate storage area, or
.I directory .
.PP
An
.I option
.ix options~to UNIX~commands
modifies the way in which a command works.
Options use a hyphen followed by a single letter,
or two hyphens followed by a longer name.
For example,
.CW "ls -l"
displays detailed information about files in your directory,
and
.CW "ls -CF --color"
displays a compact, multi-column listing
of your files
that uses color and special characters
to highlight special characteristics.
The available options are particular to each command,
and you may regularly only use a few options.
If you want to modify a command
to perform in a special manner,
consult the manual page (manpage) for that command
and examine the available options.
.PP
An
.I argument
.ix arguments, to~UNIX~commands
can specify an expression or the name of a file
on which the command is to act.
Arguments may be required
when you specify certain options.
You can specify more than one filename using special
.I metacharacters
(such as
.CW *
and
.CW ? )
to represent the filenames.
.ix files, metacharacters
For instance,
.CW "ls -l ch*"
will display information about all files that have
names beginning with
.CW ch .
.PP
The UNIX shell is itself a program,
invoked as part of the login process.
When you have properly identified yourself
by logging in,
the shell prompt appears on your terminal screen.
.PP
The prompt that appears on your screen
may be different from the prompt shown
in the examples in this book.
There are several widely used shells:
the Bourne-Again shell (bash), the C\~shell (csh),
and the Z\~shell (zsh).
.ix %begin Bourne shell
.ix %begin C shell
Traditionally,
the Bourne shell uses a dollar sign (\c
.CW $ )
.ix Bourne shell, prompt
as a prompt, and
the C\~shell and Z\~shell use a percent sign (\c
.CW % ).
The shells differ in the features they provide
and in the syntax of their programming constructs.
But in general use, they are similar.
In this book, we use the Bourne shell,
an earlier version of the Bourne-Again shell.
.PP
Your prompt may be different
from these traditional prompts.
This is because you can customize the UNIX environment,
and each UNIX version may extend the prompt.
For example, on MacOS\~X Catalina,
the prompt looks like:
.Ps
larry@Kahuna src %
.Pe
This shows the current user name
and the name of the computer,
followed by the directory name.
Whatever the prompt looks like, when it appears,
the system is ready for you to enter a command.
.PP
When you type a command from the keyboard,
the shell echos typed characters onto the screen.
The shell does not interpret the command
until you press the
.I RETURN
key.
This means that you can use the
.I "erase character"
(usually the
.I DEL
or
.I BACKSPACE
key) to correct typing mistakes.
After you have entered a command line,
the shell tries to identify and locate
the program specified on the command line.
If the program name that you entered is not valid,
the shell returns an error message.
.PP
When the shell launches a program,
the program sends its output to your screen,
unless otherwise directed.
To interrupt and cancel a program
before it has completed,
.ix Bourne shell, cancelling commands
.ix commands, cancelling
.ix Bourne shell, interrupting commands
.ix commands, interrupting
you can press the
.I "interrupt character"
(usually
.I CTRL-C
or the
.I DEL
key).
If the output of a command scrolls by the screen too fast,
you can suspend the output by pressing the
.I "suspend character"
(usually
.I CTRL-S )
and resume it by pressing the
.I "resume character"
(usually
.I CTRL-Q ).
.ix Bourne shell, resuming commands
.ix commands, resuming
.PP
Some commands invoke utilities
that offer their own environment\c
\(em\c
with a command interpreter and a set of special
\(lqinternal\(rq commands.
A text editor is one such utility,
and the mail program is another.
In both instances, you enter commands
while you are
.I inside
the program.
In these programs,
use a command to exit and return to the shell prompt.
.PP
The shell prompt
signals that a command is finished
and you can enter another command.
Familiarity with the power and flexibility of the UNIX shell
is essential to working productively in the UNIX environment.
.ix %end Bourne shell
.ix %end C shell
.
.Ah "Output Redirection"
.ix %begin output redirection
.LP
Some programs do their work in silence,
but most produce some kind of result, or output.
There are generally two types of output:
.Ls B
.Li
the expected result (\c
.I "standard output" )
.Li
error messages (\c
.I "standard error" )
.Le
.ix standard output
.ix standard error
.ix errors, messages~from UNIX~commands
The shell normally sends both types of output
to the screen, with no distinction between them.
They can be manipulated separately\c
\(em\c
a feature we will later put to good use.
.PP
Let's look at some examples.
The
.CW echo
.ix [echo] command %key echo command
command displays its arguments on the screen.
.Ps
$ \f[CB]echo my name\fP
my name
.Pe
The shell starts the
.CW echo
command, and passes the rest of the input line (\c)
.CW "my name" )
to the command.
The command processes the input, and its output is
.CW "my name" .
.PP
Let's replace
.CW echo
with a different command called
.CW cat :
.ix %begin [cat] command %key cat command
.Ps
$ \f[CB]cat my name\fP
cat: Cannot open my
cat: Cannot open name
.Pe
The
.CW cat
program expects its arguments to be the names of files.
If these files existed,
.CW cat
would display their content on the terminal.
Because the arguments were not filenames in this example,
it printed an error message instead.
.PP
You can send output from a command
to a file instead of the screen
using the output redirection operator (\c
.CW > ).
In the next example, we redirect the output of the
.CW echo
command to a file named
.CW reminders .
.Ps
$ \f[CB]echo Call home at 3:00 > reminders\fP
$
.Pe
No output is sent to the screen,
and the UNIX prompt returns
when the program finishes.
Now the
.CW cat
command should work because we have created a file.
.Ps
$ \f[CB]cat reminders\fP
Call home at 3:00
.Pe
The
.CW cat
command displays the contents of the file named
.CW reminders
on the screen.
.PP
If we redirect again to the same filename,
we overwrite its previous contents:
.page 15
.Ps
$ \f[CB]echo Pick up expense voucher > reminders\fP
$ \f[CB]cat reminders\fP
Pick up expense voucher
.Pe
We can append another line to the file,
but we have to use a different redirect operator to append (\c
.CW >> )
the new line at the end of the file:
.ix appending to~a file
.Ps
$ \f[CB]echo Call home at 3:00 > reminders\fP
$ \f[CB]echo Pick up expense voucher >> reminders\fP
$ \f[CB]cat reminders\fP
Call home at 3:00
Pick up expense voucher
.Pe
The
.CW cat
command is useful
not only for printing a file on the screen,
but for con\c
.I cat \c
enating existing files
(printing them one after the other).
For example:
.Ps
$ \f[CB]cat reminders todolist\fP
Call home at 3:00
Pick up expense voucher
Proofread Chapter 2
Discuss output redirection
.Pe
You can redirect the combined output:
.Ps
$ \f[CB]cat reminders todolist > do_now\fP
.Pe
This command combines the contents of both
.CW reminders
and
.CW todolist
into
.CW do_now .
The original files remain intact.
.PP
If one of the files does not exist,
the shell prints an error message,
even though it redirects standard output:
.Ps
$ \f[CB]rm todolist\fP
$ \f[CB]cat reminders todolist > do_now\fP
cat: todolist: not found
.Pe
.ix %end [cat] command %key cat command
.ix %end output redirection
The files we created are stored in our
.I "current working directory" .
.
.Bh "Files and Directories"
.LP
The UNIX file system consists of files and directories.
.ix file~system
Because the file system can contain thousands of files,
directories perform the same function as file drawers
in a paper file system:
they organize files into more manageable groupings.
The file system is hierarchical.
A file system can be represented as an
inverted tree structure, with the
.I "root directory"
at the top.
.ix root directory
.ix directories, root
The root directory contains other directories
that in turn contain other directories.\**
.ix subdirectory
.ix directories, sub-
.FS
*In addition to subdirectories,
the root directory can contain other file systems.
A file system is the skeletal structure of a directory tree,
which is built on a hard drive,
CD, DVD, or flash drive
before any files or directories are stored on it.
A UNIX computer containing more than one disk,
or a disk divided into several partitions,
has multiple file systems.
This is generally invisible to the user,
because the secondary file systems are
.I mounted
on the root directory,
creating the illusion of a single file system.
.FE
.page 16
.PP
On many UNIX systems, users store their files in the
.CW /home
file system.
As disk storage has become cheaper and larger,
the placement of user directories is no longer standard
(for example, MacOS\~X uses
.CW /Users
for the same purpose).
.PP
Fred's
.I "home directory"
is
.CW /home/fred .
It is the location of Fred's account on the system.
.ix home directory
.ix directories, home
When he logs in, his home directory
is his current working directory.
Your working directory is where you are currently located
and changes as you move up and down the file system.
.PP
A
.I pathname
.ix directories, home
specifies the location of a directory or file.
An
.I "absolute pathname"
specifies where a file or directory
is located off the root file system.
A
.I "relative pathname"
specifies the location of a file or directory in
relation to the current working directory.
.PP
To find out the pathname of our current directory, enter
.CW pwd .
.ix [pwd] command %key pwd command
.ix directories, printing current
.Ps
$ \f[CB]pwd\fP
/home/fred
.Pe
The absolute pathname of the current working directory is
.CW /home/fred .
The
.CW ls
.ix [ls] command %key ls command
.ix directories, listing contents~of
command lists the contents of the current directory.
Let's list the files and subdirectories in
.CW /home/fred
by entering the
.CW ls
command with the
.CW -F
option.
This option prints a slash (\c
.CW / )
following the names of subdirectories.
In the following example,
.CW oldstuff
is a directory, and
.CW notes
and
.CW reminders
are files.
.Ps
$ \f[CB]ls -F\fP
reminders
notes
oldstuff/
.Pe
.PP
When you specify a filename with the
.CW ls
command, it prints the name of the file, if the file exists.
When you specify the name of a directory,
it prints the names of the files
and subdirectories in that directory.
.Ps
$ \f[CB]ls reminders\fP
reminders
$ \f[CB]ls oldstuff\fP
ch01_draft
letter.212
memo
.Pe
In this example,
.CW oldstuff
is a relative pathname.
That is, its location is specified in relation to
the current directory,
.CW /home/fred .
You could enter an
absolute pathname, as in the following example:
.Ps
$ \f[CB]ls /home/fred/oldstuff\fP
ch01_draft
letter.212
memo
.Pe
Similarly, you can use an absolute or relative pathname
to change directories using the
.CW cd
command.
.ix [cd] command %key cd command
.ix directories, changing
To move from
.CW /home/fred
to
.CW /home/fred/oldstuff ,
you can enter a relative pathname:
.page 17
.Ps
$ \f[CB]cd oldstuff\fP
$ \f[CB]pwd\fP
/home/fred/oldstuff
.Pe
The directory
.CW /home/fred/oldstuff
becomes the current working directory.
.PP
The
.CW cd
command without an argument returns you to your home directory.
.Ps
$ \f[CB]cd\fP
.Pe
When you log in, you are positioned in your home directory,
which is thus your current working directory.
The shell stores the name of your home directory
in a variable that you can access
by prefacing the name of the variable (\c
.CW HOME )
.ix Bourne shell, [HOME] variable %key Bourne shell, HOME variable
.ix [HOME] variable %key HOME variable
.ix environment variables, [HOME] %key environment variables, HOME
with a dollar sign
(\c
.CW $ ).
Thus:
.Ps
$ \f[CB]echo $HOME\fP
/home/fred
.Pe
You could also use this variable in pathnames
to specify a file or directory in your home directory.
.ix Bourne shell, variable~substitution
.Ps
$ \f[CB]ls $HOME/oldstuff/memo\fP
/home/fred/oldstuff/memo
.Pe
In this tutorial,
.CW /home/fred
is our home directory.
.PP
The command to create a directory is
.ix [mkdir] command %key mkdir command
.ix directories, creating
.CW mkdir .
An absolute or relative pathname can be specified:
.Ps
$ \f[CB]mkdir /home/fred/reports\fP
$ \f[CB]mkdir reports/monthly\fP
.Pe
Using directories
is a convenient method
of organizing your work.
For instance, in writing this book,
the original authors set up a directory
.CW /work/textp
and, under that, subdirectories for
each chapter in the book (\c
.CW /work/textp/ch01 ,
.CW /work/textp/ch02 ,
etc.).
Each of those subdirectories contained
files to divide the chapter into sections (\c
.CW sect1 ,
.CW sect2 ,
etc.).
Another subdirectory held old versions
or drafts of these sections.
This was a logical way to organize a book
when several people worked together on a single computer.
.PP
Now, a GitHub repository contains the source,
and anyone working on the book
has their own copy in their own computer.
So Fred might store his copy of the book in
.CW /home/fred/Documents/utp ,
and Dianne has her copy in
.CW /Users/dianne/Projects/utp .
When they update their work,
it becomes available to everyone
who has access to the repository.
Anyone needing an older version
can extract it from the repository,
or compare current and former versions.
.
.Bh "Copying and Moving Files"
.LP
You can copy, move, and rename files
within your current working directory or
(by specifying the full pathname)
within other directories on the file system.
The
.CW cp
.ix files, copying
command makes a copy of a file and the
.CW mv
.ix [mv] command %key mv command
.ix files, moving
command moves a file to a new directory
or renames it.
.ix files, renaming
If you give the name
of a new or existing file as the last argument to
.CW cp
or
.CW mv ,
the file named in the first argument is copied,
and the copy given the new name.
If the target file already exists,
the copy overwrites it.
If you give the name of a directory
as the last argument to
.CW cp
or
.CW mv ,
it copies or moves the file or files named first to that directory,
and keeps their original names.
.PP
Look at the following sequence of commands:
.Ps
$ \f[CB]pwd\fP                  \f[I]Print working directory\fP
/home/fred
.page 18
$ \f[CB]ls -F\fP                \f[I]List contents of current directory\fP
meeting
oldstuff/
notes
reports/
$ \f[CB]mv notes oldstuff\fP     \f[I]Move\fP notes \f[I]to the\fP oldstuff \f[I]directory\fP
$ \f[CB]ls -F\fP                 \f[I]List contents of current directory\fP
meeting
oldstuff/
reports/
$ \f[CB]mv meeting meet.306\fP   \f[I]Rename\fP meeting
$ \f[CB]ls oldstuff\fP           \f[I]List contents of\fP oldstuff \f[I]subdirectory\fP
ch01_draft
letter.212
memo
notes
.Pe
In this example, the
.CW mv
command renamed the file
.CW meeting
and moved the file
.CW notes
from
.CW /home/fred
to
.CW /home/fred/oldstuff .
You can also use the
.CW mv
command to rename a directory.
.
.Bh "Permissions"
.ix %begin files, permissions
.LP
Access to UNIX files is governed by ownership and permissions.
If you create a file,
you are the owner of the file
and can set the permissions for that file
to give or deny access to other users of the system.
There are three different levels of permission:
.RS
.TS
tab (#);
l l.
r#Read permission: allows users to read a file or make a copy of it.
w#Write permission: allows users to make changes to that file.
x#T{
Execute permission: signifies a program file;
users can execute (run) this program.
T}
.TE
.RE
.LP
File permissions can be set for three different levels of ownership:
.RS
.TS
tab (#);
l lw (4i).
owner#The user who created the file is its owner.
group#T{
A group to which you are assigned,
usually consisting of users engaged in similar activities
and who need to share files among themselves.
T}
other#All other users on the system, the public.
.TE
.RE
.PP
Thus, you can set read, write, and execute permissions
for the three levels of ownership.
This can be represented as:
.ig
Michael Hobgood & I made an executive decision to
tbl-ize this display. The problem is, groff 1.18
fixed a bug in groff 1.17.2 in which leading spaces
(like '    \fIfoo bar baz\fP') were getting rendered
in Times Italic rather than Courier. Given that there
may be a lot of people who won't or can't upgrade for
a while (OSX & Cygwin both use 1.17.2), we needed a
way to make sure the display rendered properly for
both versions. This, in our opinion, looks better
than the original did and is immune to indent issues.
(I considered the following:
.ta (u;(\w'\fIowner group other\fP'/2)-5n)C
	rwxrwxrwx
	 /  |  \e
	\fIowner group other\fP
Which works, but would break or at least kink up
if one were to change the default indent for Ps/Pe.)
TMTOWTDI. :-)  -- Larry Kollar
..
.Ps
.TS
rf(CW)0 cf(CW)0 lf(CW)
r0 c0 l
ri0 ci0 li .
rwx	rwx	rwx
/\0	|	\0\e
owner\0	group	\0other
.TE
.Pe
.page 19
When you enter the command
.CW "ls -l" ,
it displays information about the status of the file.
You can see the file permissions,
who owns the file,
and with what group the file is associated.
.Ps
$ \f[CB]ls -l meet.306\fP
-rw-rw-r-- 1 fred  techpubs  126  March 6  10:32  meet.306
.Pe
This file has read and write permissions set for the user
.CW fred
and the group
.CW techpubs .
All others can read the file, but they cannot modify it.
Because
.CW fred
is the owner of the file,
he can change the permissions,
making it available to others
or denying them access to it.
The
.CW chmod
.ix [chmod] command %key chmod command
command sets permissions.
If Fred wanted to make the file
writeable by everyone, he would enter:
.Ps
$ \f[CB]chmod o+w meet.306\fP
$ \f[CB]ls -l meet.306\fP
-rw-rw-rw- 1 fred  techpubs  126  March 6  10:32  meet.306
.Pe
This translates to \(lqadd write permission (\c
.CW +w )
to others
(\c
.CW o ).\(rq
If Fred wanted to remove write permission from a file,
keeping anyone but himself
from accidentally modifying a finished document,
he would enter:
.Ps
$ \f[CB]chmod go-w meet.306\fP
$ \f[CB]ls -l meet.306\fP
-rw-r--r-- 1 fred  techpubs  126  March 6  10:32  meet.306
.Pe
This command removes write permission (\c
.CW -w )
from group (\c
.CW g )
and other (\c
.CW o ).
.PP
File permissions are important in UNIX,
especially when you use a text editor
to create and modify files.
They can be used to protect information you have on the computer.
.ix %end files, permissions
.
.Ah "Special Characters"
.LP
As part of the shell environment,
a few special characters (metacharacters)
make working in UNIX easier.
.ix files, metacharacters
We won't review all the special characters,
but enough of them to make sure you see how useful they are.
.PP
The
.I asterisk
(\c
.CW * )
and the
.I "question mark"
(\c
.CW ? )
are filename generation metacharacters.
The asterisk matches any or all characters in a string.
By itself, the asterisk expands to
all the names in the specified directory.
.Ps
$ \f[CB]echo *\fP
meet.306  oldstuff reports
.Pe
In this example, the
.CW echo
command displays in a row
the names of all the files and directories in the current directory.
The asterisk can also be used
as a shorthand notation for specifying one or more files.
.Ps
$ \f[CB]ls meet*\fP
meet.306
$ \f[CB]ls /work/textp/ch*\fP
/work/textp/ch01
/work/textp/ch02
.page 20
/work/textp/ch03
/work/textp/chapter_make
.Pe
The question mark matches any single character.
.Ps
$ \f[CB]ls /work/textp/ch01/sect?\fP
/work/textp/ch01/sectl
/work/textp/ch01/sect2
/work/textp/ch01/sect3
.Pe
Besides filename metacharacters,
some other characters
have special meaning
when placed in a command line.
The
.I semicolon
(\c
.CW ; )
separates multiple commands on the same command line.
Each command is executed in sequence from left to right,
one before the other.
.Ps
$ \f[CB]cd oldstuff;pwd;ls\fP
/home/fred/oldstuff
ch01_draft
letter.212
memo
notes
.Pe
Another special character is the
.I ampersand
(\c
.CW & ).
The ampersand signifies that a command
should be processed in the background,
.ix Bourne shell, background processing
.ix background processing
meaning that the shell does not wait for the program
to finish before returning a shell prompt.
When a program takes a significant amount of processing time,
you can run it in the background
so you can do other work in the meantime.
We will demonstrate background processing in
Chapter 4 when we look at the
.CW nroff/troff
text formatter.
.
.Ah "Environment Variables"
.ix %begin environment variables, setting
.ig
XXX Important: Modern UNIX makes a distinction
between environment variables and shell variables.
Use set to display all variables and env to
display only environment variables. This section needs
to make that distinction as well.

x=foo is a shell variable
set x foo is a shell variable

export x=foo is an environment variable
set -a x foo is an environment variable

export -n x removes x from the environment

local x=foo makes a local variable (in a function, scoped to that function)

readonly x=foo makes a constant (can't be changed or unset)
..
.LP
The shell stores useful information about who you are
and what you are doing in
.I "environment variables" .
Entering the
.CW set
.ix [set] command %key set command
command displays a list of environment variables
currently defined in your account.
.Ps
$ \f[CB]set\fP
PATH  .:bin:/usr/bin:/usr/local/bin:/etc
argv  ()
cwd   /work/textp/ch03
home  /home/fred
shell /bin/bash
status0
TERM  xterm-256color
\&...
.Pe
You can access these variables from the command line
by prefacing their name with a dollar sign:
.Ps
$ \f[CB]echo $TERM\fP
xterm-256color
.Pe
The
.CW TERM
.ix [TERM] variable %key TERM variable
.ix environment variables, [TERM] %key environment variables, TERM
variable identifies what kind of terminal you are using.
.ix terminal~type
You must correctly define the
.CW TERM
environment variable, because
.page 21
screen editors and other full-screen programs use it.
You can reassign shell variables from the command line.
Some variables, such as
.CW TERM ,
need to be
.I exported
if you reassign them, to make them available
to all shell processes.
.Ps
$ \f[CB]TERM=vt102; export TERM\fP  \f[I]Tell UNIX I'm using a VT102\fP
.Pe
.PP
You can also define your own environment variables
for use in commands.
.Ps
$ \f[CB]friends="alice ed ralph"\fP
$ \f[CB]echo $friends\fP
alice ed ralph
.Pe
You could use this variable when sending mail.
.Ps
$ \f[CB]mail $friends\fP
A message to friends
<CTRL-D>
.Pe
.ix [mail] command %key mail command
This command sends the mail message to three people whose names
are defined in the
.CW friends
environment variable.
You can also assign pathnames to environment variables,
shortening the amount of typing:
.Ps
$ \f[CB]pwd\fP
/home/fred
$ \f[CB]book="/work/textp"\fP
$ \f[CB]cd $book\fP
$ \f[CB]pwd\fP
/work/textp
.Pe
.ix %end environment variables, setting
.
.Ah "Pipes and Filters"
.ix %begin filters
.ix %begin pipes
.LP
Earlier, we demonstrated how you can redirect the output
of a command to a file.
.ix output redirection
Normally, the shell takes command input from the keyboard
and displays command output on the terminal.
A program can be thought of
as processing a stream of input
and producing a stream of output.
.ix standard input
.ix standard output
As we have seen, this stream can be redirected to a file.
In addition, it can originate from or be passed to another command.
.PP
When you send the output of one command
to the input of the next command,
you create a
.I pipe .
For example:
.Ps
$ \f[CB]ls | wc\fP
.Pe
might produce:
.Ps
10     10     72
.Pe
The
.CW |
character specifies a pipe\c
\[em]\c
the output of the first command
is the input of the next command.
.ft
.RE
.fi
.PP
In this example, the
.CW ls
command lists the contents of the working directory,
and the pipe provides that list as input to
.CW wc .
The
.CW wc
.ix [wc] command %key wc command
command counts the number of lines, words, and characters.
.ix files, counting~characters~in
.PP
Any program that takes its input from another program,
performs some operation on that input,
and writes the result to the standard output is called a
.I filter .
Most UNIX programs work as filters.
This is one reason UNIX programs
do not print \(lqfriendly\(rq prompts
or other extraneous information to the user.
.page 22
Because all programs expect\c
\(em\c
and produce\c
\(em\c
a data stream,
other programs can process that data stream in sequence.
.PP
One of the most common uses of filters
is to process output from a command.
Usually, this entails rearranging it
or reducing the amount of information it displays.
For example:
.ix [who] command %key who command
.Ps
$ \f[CB]who\fP                     \f[I]List who is logged in, and at which terminal\fP
peter       tty001       Mar  6 17:12
walter      tty003       Mar  6 13:51
chris       tty004       Mar  6 15:53
val         tty020       Mar  6 15:48
tim         tty005       Mar  4 17:23
ruth        tty006       Mar  6 17:02
fred        tty000       Mar  6 10:34
dale        tty008       Mar  6 15:26
$ \f[CB]who | sort\fP              \f[I]List the same information by user name\fP
chris       tty004       Mar  6 15:53
dale        tty008       Mar  6 15:26
fred        ttY000       Mar  6 10:34
peter       tty001       Mar  6 17:12
ruth        tty006       Mar  6 17:02
tim         tty005       Mar  4 17:23
val         tty020       Mar  6 15:48
walter      tty003       Mar  6 13:51
$
.Pe
The
.CW sort
.ix [sort] command %key sort command
program arranges lines of input
in alphabetic or numeric order.
It sorts lines alphabetically by default.
Another frequently used filter,
especially in text-processing environments, is
.CW grep ,
perhaps UNIX's most renowned program.
The
.CW grep
.ix [grep] command %key grep command
program selects lines containing a pattern:
.ix search
.Ps
$ \f[CB]who | grep tty001\fP      \f[I]Find out who is on terminal 1\fP
peter      tty001       Mar  6 17:12
.Pe
One of the beauties of UNIX is that
you can use almost any program
to filter the output of any other.
The pipe is the master key to building command sequences
that go beyond the capabilities provided by a single program
and allow users to create
\(lqcustom\(rq
programs of their own to meet specific needs.
.PP
.ix Bourne shell, long command~lines
If a command line gets too long to fit on a single screen line,
type a backslash followed by a carriage return,
or (if a pipe symbol comes at the appropriate place)
a pipe symbol followed by a carriage return.
Instead of executing the command,
the shell gives you a secondary prompt (usually
.CW > )
.ix Bourne shell, secondary prompt
so you can continue the line:
.Ps
$ \f[CB]echo This is a long line shown here as a demonstration |
>  wc\fP
      1      10     49
.Pe
This feature works in the Bourne shell and Z shell.
.ix %end filters
.ix %end pipes
.
.page 23
.Ah "Shell Scripts"
.ix shell~scripts
.LP
A
.I "shell script"
is a file that contains a sequence of UNIX commands.
Part of the flexibility of UNIX
is that anything you enter from the terminal
can be put in a file and executed.
To give a simple example,
we'll assume that the last command example (\c
.CW grep )
was stored in a file called
.CW whoison :
.Ps
$ \f[CB]cat whoison\fP
who | grep tty001
.Pe
.PP
You have to change the permissions on this file to make it executable.
After making a file executable,
you can enter its name as a command.
.ix [chmod] command %key chmod command
.Ps
$ \f[CB]chmod +x whoison\fP
$ \f[CB]ls -l whoison\fP
-rwxrwxr-x    1 fred     doc          123 Mar  6 17:34 whois
$ \f[CB]whoison\fP
peter      tty001        Mar  6 17:12
.Pe
Shell scripts can do more than
function as a batch command facility.
The shell provides the basic constructs
of a programming language,
allowing users to perform a variety of complicated tasks
with relatively simple programs.
.PP
The simple shell script shown above is too specific.
Instead of specifying the name of a single terminal line in the file,
we can read the terminal name as an argument on the command line.
.ix arguments, in~shell~scripts
.ix shell~scripts, arguments~to
In a shell script,
.CW $1
represents the first argument on the command line.
.Ps
$ \f[CB]cat whoison\fP
who | grep $1
.Pe
Now we can find who is logged on to any terminal:
.Ps
$ \f[CB]whoison tty004\fP
chris      tty004        Mar  6 15:53
.Pe
Later in this book, we look at shell scripts in detail.
They are an important part of the writer's toolbox,
because they provide the
the mechanism that makes all the other tools work together.
