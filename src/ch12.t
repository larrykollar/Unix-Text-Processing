.ig
	Typed / scanned by: Larry Kollar
	Marked up by: Larry Kollar
	Proofed on: 3 Nov 2002
..
.so utp.mac
.utp
.chapter 12 "Let the Computer Do the Dirty Work" "Chapter" 1
.LP
.page 342
Computers are very good at doing the same thing repeatedly, or
doing a series of very similar things one after another.
These are just the kinds of things that people hate to do, so it
makes sense to learn how to let the computer do the dirty work.
.PP
As we discussed in Chapter 7, you can save
.CW ex
.ix [ex] editor %key ex editor
commands in a
.I script ,
.ix [ex] editor, scripts %key ex editor, scripts
and execute the script from within
.CW vi
with the
.CW :so
command.
It is also possible to apply such a script to a file
from the outside\(emwithout opening the file with
.CW vi .
As you
can imagine, when you apply the same series of edits to many
different files, you can work very quickly using a script.
.PP
In addition, there is a special UNIX editor, called
.CW sed
.ix [sed] editor %key sed editor
.I "stream editor" ), (
that
.I only
works with scripts.
Although
.CW sed
can be
used to edit files (and we will show many useful applications
in this chapter), it has a unique place in the UNIX editing
pantheon not as a file editor, but as a filter that performs
editing operations on the fly, while data is passed from one
program to another through a pipe.
.PP
The
.CW sed
.ix [sed] editor, syntax~of commands %key sed editor, syntax of commands
editor uses an editing syntax that is similar to that
used by
.CW ex ,
so it should not be difficult to learn the basics.
.PP
The
.CW awk
.ix [awk] %key awk
program, which is discussed in the next chapter, is
yet another text-processing program.
It is similar to
.CW sed ,
in that it works from the outside and can be used as a filter,
but there the resemblance ends.
It is really not an editor at all, but a database
manipulation program that can be turned into an editor.
Its syntax goes beyond the global substitution/regular
expression syntax we've already seen, and so
.CW awk
may be the
last thing that many writers learn.
Nonetheless, it has some
important capabilities that you may want to be familiar with.
.PP
Finally, to make best use of these tools, you need to know
a bit about shell programming.
.ix %begin shell~scripts
In fact, because the shell
provides a framework that you can use to put all these other
tools together, we need to discuss it first.
.PP
If you are
a programmer, and have already worked with the shell, this
discussion may be too elementary; however, we are assuming that
many of our readers are writers with only minimal exposure to
programming.
They, like us when we started working with UNIX,
need encouragement to branch out into these untried waters
that have so little apparent connection to the task at hand.
.page 343
.PP
This chapter is different from those in the first part of the
book in that it not only
teaches the basics of some new programs, but also
puts them to work building some useful text-processing
tools.
At times, material is organized according to
what is needed to build the tools, rather than as a
comprehensive attempt to teach the program itself.
As a result, the material presented on
.CW sed,
for example, is less complete than our earlier treatment of
.CW vi.
We cover the most important points, but in many ways
this chapter is suggestive.
If you come away with a
sense of possibility, it has done its job.
.Ah "Shell Programming
.LP
A shell script, or shell program, can be no more than a sequence
of stored commands,
.ix shell~scripts, definition~of
entered in a file just as you would type them yourself
to the shell.
.PP
There are two shells in common use in the UNIX system, the
Bourne shell
.ix %begin Bourne shell
.CW sh ), (
.ix [sh] command %key sh command
championed by AT&T, and the C shell
.ix C shell
.CW csh ), (
.ix [csh] command %key csh command
developed at the University of California at Berkeley.
Although the
C shell has many features that make it preferable for
interactive use, the Bourne shell is much faster, so it
is the tool of choice for writing shell scripts.
(Even
if you use the C shell, scripts written using Bourne
shell syntax will be executed in the Bourne shell).
.PP
We discuss the Bourne shell exclusively in this chapter,
although we make reference to differences from the C shell on
occasion.
This should pose no problem to C
shell users, however, because the basic method of
issuing commands is identical.
The differences lie
in more advanced programming constructs, which we
will not introduce in detail here.
.Bh "Stored Commands
.LP
The
.CW .profile
.ix [.profile] %key profile
(or
.CW .login
.ix [.login] file %key login file
if you use the C shell) file in
your home directory is a good example of a shell program
consisting only of stored commands.
A simple
.CW .profile
might look like this:
.Ps
stty erase '^H' echoe kill '^X' intr '^C'
PATH=/bin:/usr/bin:/usr/local/bin:.; export PATH
umask 2
date
mail
.Pe
.LP
This file does some automatic housekeeping to set up your
account environment every time you log in.
Even if you aren't familiar with the commands
it contains, you can get the basic idea.
The commands are executed one line at a time; it is a
tremendous time saving to be able to type one command instead
of five.
.PP
You can probably think of many other repetitive sequences
of commands that you'd rather not type one at a time.
For
example, let's suppose you were accustomed to working on an
MS-DOS system, and wanted to create a
.CW dir
command that would
print out the current directory and the names and sizes of all
of your files, rather than just the names.
You could save the following two commands in a file called
.CW dir :
.page 344
.Ps
pwd
ls -l
.Pe
.LP
To execute the commands saved in a file, you can simply give
its name as an argument to the
.CW sh
command.
For example:
.Ps
$ \f(CBsh dir\fP
/work/docbook/ch13
total 21
-rw-rw-r--   3 fred     doc     263 Apr 12 09:17 abbrevs
-rw-rw-r--   1 fred     doc      10 May  1 14:01 dir
-rw-rw-r--   1 fred     doc    6430 Apr 12 15:00 sect1
-rw-rw-r--   1 fred     doc   14509 Apr 15 16:29 sect2
-rw-rw-r--   1 fred     doc    1024 Apr 28 10:35 stuff
-rw-rw-r--   1 fred     doc    1758 Apr 28 10:00 tmp
.Pe
.LP
Or you can make a file
.I executable
.ix shell~scripts, making~executable
by changing its file permissions with the
.CW chmod
command:
.Ps
$ \f(CBls -l dir\fP
-rw-rw-r--   1 fred     doc      10 May  1 14:01 dir
$ \f(CBchmod +x dir\fP
$ \f(CBls -l dir\fP
-rwxrwxr-x   1 fred     doc     10 May  1 14:01 dir
.Pe
.LP
After a file has executable permission, all you need to do to
execute the commands it contains is to type the file's name:
.Ps
$ \f(CBdir\fP
/work/docbook/ch13
total 21
-rw-rw-r--   3 fred     doc     263 Apr 12 09:17 abbrevs
-rwxrwxr-x   1 fred     doc      10 May  1 14:01 dir
-rw-rw-r--   1 fred     doc    6430 Apr 12 15:00 sect1
-rw-rw-r--   1 fred     doc   14509 Apr 15 16:29 sect2
-rw-rw-r--   1 fred     doc    1024 Apr 28 10:35 stuff
-rw-rw-r--   1 fred     doc    1758 Apr 28 10:00 tmp
.Pe
.LP
The next step is to make the shell script accessible from
whatever directory you happen to be working in.
.ix shell~scripts, putting~in~path
The Bourne shell maintains a variable called
.CW PATH ,
.ix Bourne shell, [PATH] variable %key Bourne shell, PATH variable
.ix [PATH] variable %key PATH variable 
.ix environment variables, [PATH] %key environment variables, PATH
which is set up during
the login process, and contains a list of directories in which
the shell should look for executable commands.
This list is
usually referred to as your
.I "search path" .
.ix search path
.PP
To use the value of
a variable, simply precede its name with a dollar sign ($).
This makes it easy to check the value of a variable like
.CW PATH
\(em simply use the
.CW echo
command:
.Ps
$ \f(CBecho $PATH\fP
/bin:/usr/bin:/usr/local/bin:.
.Pe
.LP
The Bourne shell expects the list of directory names contained
in the
.CW PATH
variable to be separated by colons.
If your search
path is defined as shown, the following directories will be
searched, in order, whenever you type the name of a command:
.page 345
.Ps
/bin
/usr/bin
/usr/local/bin
\&. \fR(shorthand for the current directory)\fP
.Pe
.LP
The allocation of system commands to the three
.CW bin
directories is historical and
somewhat arbitrary, although
.CW /usr/local/bin
tends to contain commands that are local to a specific
implementation of UNIX.
It is sometimes called
.CW /usr/lbin
or some other name.
.PP
To ensure that any shell scripts you create are automatically
found whenever you
type their names, you can do one of two things:
.RS
.Ls N
.Li
You can add shell scripts to one of the directories
already in your search path.
However, in most cases, these directories are only
writable by the super-user, so this option is not available
to all users.
.Li
You can create a special \(lqtools\(rq directory of your own,
and add the name
of that directory to your search path.
This directory might
be a subdirectory of your own home directory, or could be
a more globally available directory used by a group of people.
.Le
.RE
.LP
For example, you could put the following line in your
.CW .profile :
.Ps
PATH=/usr/fred/tools:.:/bin:/usr/bin:/usr/local/bin:
.Pe
.LP
The
.CW /usr/fred/tools
directory would be searched before any
of the standard search directories.
(This means that you can define
an alternate command with the same name as an existing
command.
The version found first in the search path is
executed, and the search is stopped at that point.
You should not put local directories before the standard
directories if you are concerned at all with system
security, because doing so creates a loophole that
can be exploited by an intruder).
.PP
If you are using the C shell, the search path is stored in a
variable called
.CW path ,
.ix environment variables, [path] %key environment variables, path
.ix shell~scripts, C~shell search~path
and has a different format; see your UNIX documentation
for details.
In addition, you must use the
.CW rehash
command whenever you add a command to one of the
search directories.
.Bh "Passing Arguments to Shell Scripts
.ix %begin shell~scripts, passing~arguments~to
.LP
The previous example is very simple; the commands it used took
no arguments.
In contrast, consider a case in which you want
to save a single complex command line in a file.
For example, if you use
.CW tbl
and
.CW eqn
with
.CW nroff ,
your typical command line might look like this:
.Ps
$ \f[CB]tbl \fP\f[I]file\fP\f[CB] | eqn | nroff -ms | col | lp\fP
.Pe
.LP
How much easier it would be to save that whole line
in a single file called
.CW format ,
and simply type:
.page 346
.Ps
$ format \f[I]file\fP
.Pe
.LP
The question then becomes:
how do you tell your
.CW format
script where in the command line to insert the
.I file
argument?
.PP
Because all of the programs in the script are designed to read
standard input as well as take a filename argument, we could
avoid the problem by writing the script thus:
.Ps
tbl | eqn | nroff -ms | col | lp
.Pe
.LP
and using it like this:
.Ps
$ \f(CBcat \fP\f[I]file\fP\f[CB] | format\fP
.Pe
.LP
or like this:
.Ps
$ \f(CBformat < \fP\f[I]file\fP
.Pe
.LP
But this still begs the question of how to pass an argument
to a shell script.
.PP
Up to nine arguments can be represented by positional
notation.
The first argument is represented in the shell script
by the symbol
.CW $1,
the second by
.CW $2 ,
and so on.
.PP
So, for example, we could write our script:
.Ps
tbl $1 | eqn | nroff -ms | col | lp
.Pe
.LP
When specified as an argument to the
.CW format
command:
.Ps
$ \f(CBformat\fP ch01
.Pe
.LP
the filename would be substituted in the script for the
symbol
.CW $1 .
.PP
But what if you want to specify several files at once?
The symbol
.CW $*
means \(lquse all arguments,\(rq so the script:
.Ps
tbl $*  |  eqn  |  nroff -ms  |  col  |  lp
.Pe
.LP
will allow us to write:
.Ps
$ \f(CBformat\fP \f[I]file1 file2\fP ...
.Pe
.PP
Now consider the slightly more complex case in which you'd
like to support either the
.CW ms
or the
.CW mm
macros.
You could write the script like this:
.Ps
tbl $2 | eqn | nroff $1 | col | lp
.Pe
.LP
The first argument will now follow the invocation of
.CW nroff ,
and the second will represent the filename:
.Ps
$ \f(CBformat -ms\fP \fIfile\fP
.Pe
.LP
However, at this point we have lost the ability to specify \(lqall
arguments,\(rq because the first argument is used differently than
all the rest.
There are several ways to handle this situation,
but we need to learn a few things first.
.ix %end shell~scripts
.ix %end shell~scripts, passing~arguments~to
.page 347
.Bh "Conditional Execution
.ix %begin Bourne shell, conditional execution
.ix %begin conditional execution, in~shell~scripts
.ix %begin shell~scripts, conditional execution 
.LP
Commands in a shell script can be executed conditionally
using either the
.CW if...then...else
.ix %begin [if] shell~command %key if shell command
or
.CW case
.ix %begin [case] shell~command %key case shell command
command built into the shell.
However, any conditional commands require
the ability to test a value and make a choice based
on the result.
As its name might suggest, the
.CW test
.ix %begin [test] command %key test command 
.ix %begin shell~scripts, [test]~command~in %key shell scripts, test~command~in
command does the trick.
.PP
There are different kinds of things you can test, using various
options to the command.
The general form of the command is:
.Ps
$ \f(CBtest\fP \f[I]condition\fP
.Pe
.LP
.I Condition
is constructed from one or more options; some of
the most useful are listed in Table 12-1.
.	\" NOTE: put .ne 10 here to force table to stay with
.	\" the table heading.
.br
.ne 10
.Ts "Useful \f(CBtest\fP Options
.ix Bourne shell, [test] options %key Bourne shell, test options
.TS
center box;
l c
l l .
Option	Meaning
_
\f[CW]-d\fP \f[I]file\fP	True if \fIfile\fP exists and is a directory
\f[CW]-f\fP \f[I]file\fP	True if \fIfile\fP exists and is a regular file
\f[CW]-n\fP \f[I]s1\fP	True if the length of string \fIs1\fP is nonzero
\f[CW]-r\fP \f[I]file\fP	True if \fIfile\fP exists and is readable
\f[CW]-s\fP \f[I]file\fP	True if \fIfile\fP exists and has a size greater than zero
\f[CW]-w\fP \f[I]file\fP	True if \fIfile\fP exists and is writable
\f[CW]-x\fP \f[I]file\fP	True if \fIfile\fP exists and is executable
\f[CW]-z\fP \f[I]s1\fP	True if the length of string \fIs1\fP is zero
\f[I]str1\fP \f[CW]=\fP \f[I]str2\fP	True if strings \fIstr1\fP and \fIstr2\fP are identical
\f[I]str1\fP \f[CW]!=\fP \f[I]str2\fP	True if strings \fIstr1\fP and \fIstr2\fP are not identical
\f[I]str1\fP	True if string \fIstr1\fP is not the null string
\f[I]n1\fP \f[CW]-eq \fP \f[I]n2\fP	T{
True if the integers
.I n1
and
.I n2
are algebraically equal (any of the comparisons
.CW -ne ,
.CW -gt ,
.CW -ge ,
.CW -lt ,
and
.CW -le
may be used in place of
.CW -eq )
T}
.TE
.PP
The
.CW test
command has a special form just for use in shell scripts.
Instead of using the word
.I test ,
you can simply enclose
.I condition
in square brackets.
The expression must be separated
from the enclosing brackets by spaces.
.PP
So, for example, to return to our
.CW format
script, we could write:
.Ps
if [ "$1" = "-mm" ]
then
   tbl $2 | eqn | nroff -mm | col | lp
else
   tbl $2 | eqn | nroff -ms | col | lp
fi
.Pe
.LP
We've simply used the
.CW test
command to compare the value of two strings\(emthe first
argument, and the string
.CW "-mm" \(dq\(emand \(dq
executed the appropriate command line as a result.
If the strings are equal,
the first command line is executed;
if they are not equal, the second line is executed instead.
(Notice that there are spaces surrounding
the equals sign in the test).
.page 348
.PP
The syntax of
.CW if...then...else
clauses can get confusing.
One trick is to think of each keyword
.CW if , (
.CW then ,
and
.CW else )
as a separate command that can take other commands
as its argument.
The
.CW else
clause is optional.
(That is, you can say,
\(lqif the condition is met, do this,\(rq
and give no alternatives.
If the condition is not met, the script will
simply go on to the next line, or exit if there is no next
line).
The entire sequence is terminated with the
.CW fi
keyword.
.PP
After you realize that each part of the sequence is really just
a separate command, like other UNIX commands, the abbreviated
form, which uses semicolons rather than newlines to separate
the commands, will also make sense:
.Ps
if \fIcondition\fP; then \fIcommand\fP; fi
.Pe
.PP
An
.CW if...then...else
clause allows you to make a choice
between at most two options.
There is also an
.CW elif
.ix [elif] shell command %key elif shell command
statement that allows you to create a sequence of
.CW if
clauses to deal with more conditions.
For example, suppose your system supports
a third macro package\(emone you've written yourself, and
called
.CW mS
because it's a superset of
.CW ms .
(More on this in Chapter 17!)
You could write the script like this:
.Ps
if [ "$1" = "-mm"  ]
then tbl $2 | eqn | nroff -mm | col | lp
elif [ "$1" = "-ms"  ]
then tbl $2 | eqn | nroff -ms | col | lp
elif [ "$1" = "-mS"  ]
then tbl $2 | eqn | nroff -mS | col | lp
fi
.Pe
.LP
This syntax can get awkward for more than a few conditions.
Fortunately, the shell provides a more compact way to handle
multiple conditions: the
.CW case
statement.
The syntax of this statement looks complex (even in the slightly
simplified form given here):
.Ps
case \fIvalue\fP in
\fIpattern\fP) \fIcommand\fP;;
\&..
\fIpattern\fP) \fIcommand\fP;;
esac
.Pe
.LP
In fact, the statement is quite easy to use, and is most
easily shown by example.
We could rewrite the previous script as follows:
.Ps
  case $1 in
     -mm)  tbl $2 | eqn | nroff -mm | col | lp;;
     -ms)  tbl $2 | eqn | nroff -ms | col | lp;;
     -mS)  tbl $2 | eqn | nroff -mS | col | lp;;
  esac
.Pe
.LP
This form is considerably more compact, especially as the
number of conditions grows.
(Be sure to note the
.CW ;;
at the end of each line.
This is an important part of the syntax).
.page 349
.PP
Here's how the
.CW case
statement works.
Each
.I value
in turn is compared (using
standard shell metacharacters like * and ?, if present)
against the
.I pattern
before the close parenthesis at the start of each line.
If the pattern matches, the line is executed.
If not, the script tries again with the next line in the
.CW case
statement.
After the value
has been compared against each case, the process
starts over with the next value (if more than one
has been specified).
.ix %end Bourne shell, conditional execution
.ix %end [case] shell~command %key case shell command
.ix %end [if] shell~command %key if shell command
.ix %end [test] command %key test command
.ix %end conditional execution, in~shell~scripts
.ix %end shell~scripts, [test]~command~in %key shell scripts, test~command~in
.ix %end shell~scripts, conditional execution
.Bh "Discarding Used Arguments
.ix Bourne shell, discarding~and~shifting arguments
.ix shell~scripts, discarding~and~shifting arguments
.LP
All of the conditions we've tested for so far are mutually
exclusive.
What if you want
to include more than one potentially true condition in
your script? The trick to dealing with this situation
requires two more shell commands:
.CW while
and
.CW shift .
.ix [shift] shell command %key shift shell command
.PP
Consider the following example.
You realize that it is inefficient to pass your files through
.CW eqn
every time you use
.CW format .
In addition, you sometimes use
.CW pic .
You want to add
options to your
.CW format
shell script to handle these cases as well.
.PP
You could decree that the macro package will always be the
first argument to
your script, the name of the preprocessor the second,
and the file to be formatted the third.
To delay execution of the command until all of
the options have been assembled, you can use the
.CW case
statement to set shell variables, which are evaluated
later to make up the actual command line.
Here's a script that makes these assumptions:
.Ps
case $1 in
  -mm) macros="-mm";;
  -ms) macros="-ms";;
  -mS) macros="-mS";;
esac
case $2 in
  -E) pre="| eqn"
  -P) pre="| pic"
esac
tbl $3 $pre | nroff $macros | col | lp
.Pe
.LP
But what if you don't want either preprocessor, or want both
.CW eqn
and
.CW pic ?
The whole system breaks down.
We need a more general approach.
.PP
There are several ways to deal with this.
For example, there is a program called
.CW getopt
.ix [getopt] command %key getopt command
that can be used for interpreting command-line options.
However, we will use another technique\(emdiscarding
an argument after it is used, and
.I shifting
the remaining arguments.
This is the function of the
.CW shift
command.
.PP
This command finds its most elementary use when
a command needs to take more than nine arguments.
There is no
.CW $10 ,
so a script to echo ten arguments might be written:
.Ps
echo The first nine arguments: $1 $2 $3 $4 $5 $6 $7 $8 $9
shift
echo The tenth argument: $9
.Pe
.page 350
.LP
After the
.CW shift
command, the old
.CW $1
has disappeared, as
far as the shell is concerned, and the remaining arguments
are all shifted one position to the left.
(The old
.CW $2
is the current
.CW $1 ,
and so on).
Take a moment to experiment with this if you want.
.PP
Shifting works well with conditional statements, because it
allows you to test for a condition, discard the first argument,
and go on to test the next argument, without requiring the
arguments to be in a specific order.
However, we still can't
quite get the job done, because we have to establish a
.I loop ,
and repeat the
.CW case
statement until all of the arguments are used up.
.Bh "Repetitive Execution
.ix Bourne shell, repetitive execution
.ix shell~scripts, repetitive execution
.LP
As we suggested at the start of this chapter, the real secret
of programming is to get the computer to do all the repetitive,
boring tasks.
The basic mechanism for doing this is the loop\(eman
instruction or series of instructions that cause a
program to do the same thing over and over again as long as
some condition is true.
.PP
The
.CW while
.ix [while] shell command %key while shell command
command is used like this:
.Ps
while \fIcondition\fP
do
\fIcommands\fP
done
.Pe
.LP
In the script we're trying to write, we want to repeatedly test
for command-line arguments
.I "as long as there are arguments" ,
build up a command line using shell variables, and then go
ahead and issue the command.
Here's how:
.Ps
while [ $# -gt 0 ]
do
   case $1 in
     -E) eqn="| eqn";;
     -P) pic="| pic";;
     -*) options="$options $1";;
     *)  files="$files $1";;
   esac
   shift
done
tbl $files $eqn $pic | nroff $options | col | lp
.Pe
.LP
The special shell variable
.CW $#
.ix shell~scripts, number~of arguments ([$#]) %key shell scripts, number~of arguments ($#)
always contains the number of arguments given to a command.
What this script is saying in English is:
As long as there is at least one argument
.RS
.Ls B
.Li
test the first argument against the following list of
possibilities; if there
is a match, set the variable as instructed;
.Li
throw away the argument now that you've used it, and
shift the remaining arguments over one place;
.page 351
.Li
decrement the shell variable
.CW $# ,
which contains the number of arguments;
.Li
go back to the first line following the
.CW do
statement, and start over.
.Le
.RE
.LP
The loop will continue as long as the condition specified in the
.CW while
statement is met\(emthat is, until all the arguments have been
used up and shifted out of existence.
.PP
As you've no doubt noticed, to make this work, we had to
account for
.I all
of the arguments.
We couldn't leave any to be interpreted
in the command line because we had to use them all up
to satisfy the
.CW while
statement.
That meant we needed
to think about what other kinds of arguments there
might be and include them in the
.CW case
statement.
We came up with two possibilities:
additional
.CW nroff
options and files.
.PP
In addition, because of the pattern-matching flexibility in the
.CW case
statement,
we don't need to call out each of the macro packages
separately, but can just treat them as part of a
more general case.
Any argument beginning with a minus sign is simply assumed to be an
.CW nroff
option.
.PP
You'll notice that we used a somewhat different syntax for
assigning these last
two potential groups of arguments to variables:
.Ps
\fIvariable\fP="$\fIvariable\fP \fIadditional_value\fP"
.Pe
.LP
Or, as shown in the script:
.Ps
options="$options $1"
files="$files $1"
.Pe
.LP
This syntax is used to
.I add
a value to a variable.
We know that we can expect at least
one option to
.CW nroff ,
so we simply add any other options to the same variable.
Similarly, there may be more
than one filename argument.
The
.CW *)
case can be
executed any number of times, each time adding one
more filename to the variable.
.PP
If you want to become more familiar with how this works,
you can simulate it on the command line:
.Ps
$ \f(CBfiles=sect1\fP
$ \f(CBfiles="$files sect2"\fP
$ \f(CBecho $files\fP
sect1 sect2
.Pe
.PP
As you've seen, in the script we used the standard shell
metacharacter
.CW * ,
which means \(lqany number of any characters,\(rq right in the
pattern-matching part of the
.CW case
statement.
You can use any of the shell metacharacters
that you can type on the command line equally well
in a shell script.
However, be sure you realize that
when you do this, you're making
.I assumptions \(em\c
that any option not explicitly tested for in the
.CW case
statement is an
.CW nroff
option, and that any argument
not beginning with a minus sign is a filename.
.PP
This last assumption may not be a safe one\(emfor
example, one of the filenames
may be mistyped, or you may not be in the directory
you expect, and the file will not be found.
We may
therefore want to do a little defensive programming,
using another of the capabilities provided by the
.CW test
command:
.page 352
.Ps
 *) if [ -f $1 ]
    then
    files="$files $1"
    else echo "format: $1: file not found"; exit
    fi;;
.Pe
.LP
The
.CW [-f]
test checks to see whether the argument is the
name of an existing file.
If it is not, the script prints an
informative message and exits.
(The
.CW exit
.ix [exit] shell command %key exit shell command
command is used to break out of a script.
.ix Bourne shell, breaking out~of~a script ([exit]) %key Bourne shell, breaking out of~a script exit
.ix shell~scripts, breaking out~of
After this error occurs, we don't want
to continue with the loop, or go on to execute any commands).
.PP
This example is also instructive in that it shows how each
element in the
.CW case
statement's condition list does not need
to be on a single line.
A line can contain a complex sequence
of commands, separated by semicolons or newlines or both,
and is not terminated till the concluding
.CW ;;
is encountered.
.Bh "Setting Default Values
.LP
We've considered the case where multiple values are stored
in the same variable.
What about the other extreme, where
no value is stored?
.PP
If an option, such as
.CW -E
for
.CW eqn ,
is not specified on the command line, the variable will
not be defined.
That is, the variable will have no value,
and the variable substitution
.CW $eqn
on the final line of the
script will have no effect\(emit is as if it isn't there at all.
.PP
On the other hand, it is possible to
.CW export
.ix Bourne shell, [export] command %key Bourne shell, export command
.ix shell~scripts, [export] command %key shell scripts, export command
a variable, so that
it will be recognized not just in the shell that created it,
but in any subshell.
This means that the commands:
.Ps
$ \f[CB]eqn="| eqn"; export eqn\fP
$ \f[CB]format -ms myfile\fP
.Pe
.LP
will have the same effect as:
.Ps
$ \f[CB]format -ms -E myfile\fP
.Pe
.LP
Although there are occasions where you might want to do this
sort of thing, you don't want it to happen unexpectedly.
For this reason, it is considered good programming practice to
.I initialize
.ix shell~scripts, initializing variables
.ix shell~scripts, setting default values
your variables\(emthat is, to set them to a predefined
value (or in many cases, a null value) to minimize random
effects due to interaction with other programs.
.PP
To set a shell variable to a null value, simply equate it to a
pair of quotation marks with nothing in between.
For example, it would be a good idea to start off the
format
script with the line:
.Ps
eqn="";pic="";options=""
.Pe
.LP
In addition to setting arguments to null values, we can also
set them to
.I "default values" \(em\c
that is, we can give them values
that will be used unless the user explicitly requests otherwise.
Let's suppose that we want the script to invoke
.CW troff
by default, but also provide an option to select
.CW nroff .
We could rewrite the entire script like this:
.page 353
.Ps
eqn=""; pic=""; roff="ditroff -Tps"; post="| devps"
lp="lp -dlaser"
while [ $# -gt 0 ]
do
  case $1 in
   -E) eqn="| eqn";;
   -P) pic="| pic";;
   -N) roff="nroff"; post="| col"; lp="lp -dline";;
   -*) options="$options $1";;
    *) if [ -f $1 ]; then
       files="$files $1"
       else echo "format: $1: file not found"; exit
       fi;;
  esac
  shift
done
eval "tbl $files $eqn $pic | $roff $options $post | $lp"
.Pe
.LP
The
.CW troff
output needs to be passed through a postprocessor
before it can be sent to a printer.
(We use
.CW devps ,
but there are almost as
many different postprocessors as there are possible
output devices).
The
.CW nroff
output, for some printers,
needs to be passed through
.CW col ,
which is a special filter used to remove reverse linefeeds.
Likewise, the
.CW lp
command will need a \(lqdestination\(rq option.
We're assuming that the system has a printer called
.CW laser
for
.CW troff
output, and one called
.CW line
for line printer output from
.CW nroff .
The default case
.CW troff ) (
for both the postprocessor and
destination printer is set in the variables at the
start of the file.
The
.CW -N
option resets them to alternate values if
.CW nroff
is being used.
The
.CW eval
command is necessary in order for the pipes to be
evaluated correctly inside a variable substitution.
.Bh "What We've Accomplished
.LP
You might wonder if this script really saved you any time.
After all, it took a while to
write, and it seems almost as complex to use as
just typing the appropriate command line.
After all,
was it worth all that work, just so that we can type:
.Ps
$ \f[CB]format -ms -E -P -N myfile\fP
.Pe
.LP
instead of:
.Ps
$ \f[CB]tbl myfile | eqn | pic | nroff -ms | lp\fP
.Pe
.LP
There are two answers to that question.
First, many of the programs used to format a
file may take options of their own\(emoptions
that are always the same, but always need to be
specified\(emand, especially if you're using
.CW troff,
a postprocessor may also be involved.
So your actual
command line might work out to be something like this:
.Ps
$\f[CB] tbl myfile | eqn | pic -T720 -D | ditroff -ms -Tps |\fP
> \f[CB]devps | lp\fP
.Pe
.page 354
.LP
That's considerably more to type!
You could just save your
most frequently used combinations of commands into individual
shell scripts.
.ix shell~scripts
But if you build a general tool, you'll find
that it gives you a base to build from, and opens up additional
possibilities as you go on.
For example, later in this book
we'll show how to incorporate some fairly complex indexing
scripts into
.CW format \(em\c
something that would be very difficult to
do from the command line.
That is the far more important second
reason for taking the time to build a solid shell script when
the occasion warrants.
.PP
As this chapter goes on, we'll show you many other useful
tools you can build for yourself using shell scripts.
Many of
them will use the features of the shell we introduced in this
section, although a few will rely on additional features we've
yet to learn.
.ix %end Bourne shell
.Ah "\f[CB]ex\fP Scripts
.ix %begin [ex] scripts %key ex scripts
.ix %begin [ex] editor, scripts %key ex editor, scripts
.LP
We've discussed
.CW ex
already in Chapter 7.
As we pointed out, any command, or sequence
of commands, that you can type at
.CW ex 's
colon prompt can also be saved in a file and executed with
.CW ex 's
.CW :so
.ix [ex] scripts, executing~with [:so] %key ex scripts, executing with [:so]
command.
.PP
This section discusses a further extension of this concept\(emhow
to execute
.CW ex
scripts from outside a file and on multiple files.
There are certain
.CW ex
commands that you might save in
scripts for use from within
.CW vi
that will be of no use from the outside\(emmaps,
abbreviations, and so on.
For the most part,
you'll be using substitute commands in external scripts.
.PP
A very useful application of editing scripts for a writer
is to ensure consistency of terminology\(emor even of
spelling\(emacross a document set.
For the sake of example,
let's assume that you've run
.CW spell ,
and it has printed out the following list of misspellings:
.Ps
$ \f[CB]spell sect1 sect2\fP
chmod
ditroff
myfile
thier
writeable
.Pe
.LP
As is often the case,
.CW spell
has flagged a few technical
terms and special cases it doesn't recognize, but it has also
identified two genuine spelling errors.
.PP
Because we checked two files at once, we don't know which
files the errors occurred in, or where in the files they
are.
Although there are ways to find this out, and the job
wouldn't be too hard for only two errors in two files, you
can easily imagine how the job could grow time consuming for
a poor speller or typist proofing many files at once.
.PP
We can write an
.CW ex
script containing the following commands:
.Ps
g/thier/s//their/g
g/writeable/s//writable/g
wq
.Pe
.LP
Then we can edit the files as follows:
.page 355
.Ps
$ \f[CB]ex - sect1 < exscript\fP
$ \f[CB]ex - sect2 < exscript\fP
.Pe
.LP
(The minus sign following the invocation of
.CW ex
tells it to accept its commands from standard input).
.PP
If the script were longer than the one in our simple example,
we would already have saved a fair amount of time.
However, given our earlier remarks about letting the computer do
the dirty work, you might wonder if there isn't some
way to avoid repeating the process for each file to be edited.
Sure enough, we can write a shell script
that includes the invocation of
.CW ex ,
but generalizes it, so that it can
be used on any number of files.
.ix %end [ex] scripts %key ex scripts
.Bh "Looping in a Shell Script
.ix Bourne shell, repetitive execution
.ix shell~scripts, looping
.ix shell~scripts, repetitive execution
.LP
One piece of shell programming we haven't discussed yet is the
.CW for
.ix [for] shell~command %key for shell command
loop.
This command sequence allows you to apply a sequence
of commands for each argument given
to the script.
(And, even though we aren't introducing
it until this late in the game, it is probably the
single most useful piece of shell programming for
beginners.
You will want to remember it even if you
don't write any other shell programs).
.PP
Here's the syntax of a
.CW for
loop:
.Ps
for \f[I]variable\fP in \f[I]list\fP
do
\f[I]commands\fP
done
.Pe
.LP
For example:
.Ps
for file in $*
  do
    ex - $file < exscript
done
.Pe
.LP
(The command doesn't need to be indented; we indented
for clarity).
Now (assuming this shell script is saved in a file called
.CW correct ),
we can simply type:
.Ps
$ \f[CB]correct sect1 sect2\fP
.Pe
.LP
The
.CW for
loop in
.CW correct
will assign each argument (each
.CW file
in
.CW $*)
to the variable
.CW file
and execute the
.CW ex
script on the contents of that variable.
.PP
It may be easier to grasp how the
.CW for
loop works with an example whose output is more visible.
Let's look at a script to rename files:
.Ps
for file in $*
do
  mv $file $file.x
done
.Pe
.LP
Assuming this script is in an executable file called
.CW move ,
here's what we can do:
.page 356
.Ps
$ \f[CB]ls\fP
ch01	  ch02	  ch03	  move
$ \f[CB]move ch??\fP
$ \f[CB]ls\fP
ch01.x    ch02.x    ch03.x   move
.Pe
.LP
With a little creativity, you could rewrite the script to
rename the files more specifically:
.Ps
for nn in $*
do
  mv ch$nn sect$nn
done
.Pe
.LP
With the script written this way, you'd specify numbers instead
of filenames on the command line:
.Ps
$ \f[CB]ls\fP
ch01	  ch02	  ch03	  move
$ \f[CB]move 01 02 03\fP
$ \f[CB]ls\fP
sect01    sect02    sect03 	move
.Pe
.LP
The
.CW for
loop need not take
.CW $*
(all arguments) as the list of values to be substituted.
You can specify an explicit list
as well, or substitute the output of a command.
For example:
.Ps
for variable in a b c d
.Pe
.LP
will assign
.CW variable
to
.CW a ,
.CW b ,
.CW c ,
and
.CW d
in turn.
And:
.Ps
for variable in `grep -l "Alcuin"`
.Pe
.LP
will assign
.CW variable
in turn to the name of each file in which
.CW grep
finds the string
.I Alcuin .
.PP
If no list is specified:
.Ps
for variable
.Pe
.LP
the variable will be assigned to each command-line argument in
turn, much as it was in our initial example.
This is actually not equivalent to
.CW "for variable in $*"
but to
.CW "for variable in $@" ,
which has a slightly different meaning.
The symbols
.CW $*
expand to
.CW $1 ,
.CW $2 ,
.CW $3 ,
etc., but
.CW $@
expands to
.CW \(dq$1\(dq ,
.CW \(dq$2\(dq ,
.CW \(dq$3\(dq ,
etc.
Quotation marks prevent further interpretation of
special characters.
.PP
Let's return to our main point, and our original script:
.Ps
for file in $*
do
  ex - $file < exscript
done
.Pe
.page 357
.LP
It may seem a little inelegant to have
to use two scripts\(emthe shell script and the
.CW ex
script.
And in fact, the shell does provide a way to
include an editing script directly into a shell script.
.Bh "Here Documents
.ix here documents
.LP
The operator
.CW <<
means to take the following lines, up to a
specified string, as input to a command.
(This is often called a
.I "here document" ).
Using this syntax, we could include our
editing commands in
.CW correct
like this:
.Ps
for file in $*
do
ex - $file << end-of-script
g/thier/s//their/g
g/writeable/s//writable/g
wq
end-of-script
done
.Pe
.LP
The string
.CW end-of-script
is entirely arbitrary\(emit just
needs to be a string that
won't otherwise appear in the input and can be used
by the shell to recognize when the here document is finished.
By convention, many users specify the end
of a here document with the string EOF, or E-O-F,
to indicate
.I "end of file" .
.PP
There are advantages and disadvantages to each approach shown.
If you want to
make a one-time series of edits and don't mind rewriting
the script each time, the here document provides an
effective way to do the job.
.PP
However, writing the editing commands in a separate file from
the shell script is
more general.
For example, you could establish the
convention that you will always put editing commands
in a file called
.CW exscript .
Then, you only need to write the
.CW correct
script once.
You can store it away
in your personal \(lqtools\(rq directory (which you've added
to your search path), and use it whenever you like.
.ix [ex] editor %key ex editor
.ix %end [ex] editor, scripts %key ex editor, scripts
.Bh "\f(CBex\fP Scripts Built by \f(CBdiff\fP
.ix [ex] scripts, built~by diff %key ex scripts, built by diff
.LP
A further example of the use of
.CW ex
scripts is built into a
program we've already looked at\(em\c
.CW diff .
.ix [diff] command %key diff command
The
.CW -e
option to
.CW diff
produces an editing script usable with either
.CW ed
or
.CW ex,
instead of the usual output.
This script consists of a sequence of
.CW a
(add),
.CW c
(change), and
.CW d
(delete) commands necessary
to recreate
.I file1
from
.I file2
(the first and second files specified on the
.CW diff
command line).
.PP
Obviously, there is no need to completely recreate the first
file from the second,
because you could do that easily with
.CW cp .
However,
by editing the script produced by
.CW diff ,
you can come
up with some desired combination of the two versions.
.PP
It might take you a moment to think of a case in which you
might have use for this feature.
Consider this one:
two people have
unknowingly made edits to different copies of a file,
and you need the two versions merged.
(This can happen
especially easily in a networked environment, in which
people copy files between machines.
Poor coordination
can easily result in this kind of problem).
.page 358
.PP
To make this situation concrete, let's take a look at two
versions of the same paragraph, which we want to combine:
.Ps
.I "Version 1" :
The Book of Kells, now one of the treasures of the Trinity
College Library in Dublin, was found in the ancient
monastery at Ceannanus Mor, now called Kells.  It is a
beautifully illustrated manuscript of the Latin Gospels,
and also contains notes on local history.
It was written in the eighth century.
The manuscript is generally regarded as the finest example
of Celtic illumination.
.sp 1v
.I "Version 2" :
The Book of Kells was found in the ancient
monastery at Ceannanus Mor, now called Kells.  It is a
beautifully illustrated manuscript of the Latin Gospels,
and also contains notes on local history.
It is believed to have been written in the eighth century.
The manuscript is generally regarded as the finest example
of Celtic illumination.
.Pe
.LP
As you can see, there is one additional phrase in each of
the two files.
We would like to merge them into one file that
incorporates both edits.
.PP
Typing:
.Ps
$ \f[CB]diff -e version1 version2 > exscript\fP
.Pe
.LP
will yield the following output in the file
.CW exscript :
.Ps
6c
It is believed to have been written in the eighth century.
\&.
1, 2c
The Book of Kells was found in the ancient
\&.
.Pe
.LP
You'll notice that the script appears in reverse order, with the
changes later in the file appearing first.
This is essential
whenever you're making changes based on line numbers; otherwise,
changes made earlier in the file may change the numbering,
rendering the later parts of the script ineffective.
.PP
You'll also notice that, as mentioned, this script will simply
recreate version 1, which is not what we want.
We want the change to line 5,
but not the change to lines 1 and 2.
We want to edit the script so that it looks like this:
.Ps
6c
It is believed to have been written in the eighth century.
\&.
w
.Pe
.page 359
.LP
(Notice that we had to add the
.CW w
command to write
the results of the edit back into the file).
Now we can type:
.Ps
$ \f[CB]ex - version1 < exscript\fP
.Pe
.LP
to get the resulting merged file:
.Ps
The Book of Kells, now one of the treasures of the Trinity
College Library in Dublin, was found in the ancient
monastery at Ceannanus Mor, now called Kells.  It is a
beautifully illustrated manuscript of the Latin Gospels,
and also contains notes on local history.
It is believed to have been written in the eighth century.
The manuscript is generally regarded as the finest example
of Celtic illumination.
.Pe
.LP
Using
.CW diff
like this can get confusing, especially when there
are many changes.
It is very easy to get the direction of changes confused,
or to make the wrong edits.
Just remember to do
the following:
.RS
.Ls B
.Li
Specify the file that is closest in content to your eventual
target as the first file on the
.CW diff
command line.
This will minimize the size of the
editing script that is produced.
.Li
After you have corrected the editing script so that it
makes only the changes
that you want, apply it to that same file (the first file).
.Le
.RE
.LP
Nonetheless, because there is so much room for error, it is
better not to have your script
write the changes back directly into one of your
source files.
Instead of adding a
.CW w
command at the
end of the script, add the command
.CW 1,$p
to write the results to standard output.
This is almost always
preferable when you are using a complex editing script.
.PP
If we use this command in the editing script, the command line
to actually make
the edits would look like this:
.Ps
$ \f[CB]ex - version1 < exscript > version3\fP
.Pe
.LP
The
.CW diff
manual page also points out another application of
this feature of the program.
Often, as a writer, you find
yourself making extensive changes, and then wishing
you could go back and recover some part of an earlier
version.
Obviously, frequent backups will help.
However, if backup storage space is at a premium,
it is possible (though a little awkward) to save
only some older version of a file, and then keep
incremental
.CW "diff -e"
scripts to mark the differences
between each successive version.
.PP
To apply multiple scripts to a single file, you can simply
pipe them to
.CW ex
rather than redirecting input:
.Ps
cat script1 script2 script3 | ex - oldfile
.Pe
.LP
But wait!
How do you get your
.CW w
(or
.CW 1,$p )
command into the pipeline?
You could edit the last script to include one of these
commands.
But, there's another trick that we ought to
look at because it illustrates another useful feature
of the shell that many people are unaware of.
.page 360
.PP
If you enclose a semicolon-separated list of commands in
parentheses, the standard output of all of the commands
are combined, and can be redirected together.
The immediate
application is that, if you type:
.Ps
cat script1 script2 script3; echo '1,$p' | ex - oldfile
.Pe
.LP
the results of the
.CW cat
command will be sent, as usual, to
standard output, and only the results of
.CW echo
will be piped to
.CW ex .
However, if you type:
.Ps
(cat script1 script2 script3; echo '1,$p') | ex - oldfile
.Pe
.LP
the output of the entire sequence will make it into the
pipeline, which is what we want.
.Ah "Stream Editing
.ix %begin [sed] editor %key sed editor
.LP
We haven't seen the
.CW sed
program yet.
Not only is it a line
editor rather than a screen editor, but it takes the process
one step further:
it is a \(lqnoninteractive\(rq line editor.
It can only be used with editing scripts.
It was developed in 1978 as an extension to
.CW ed
for three specific cases (according to
the original documentation):
.RS
.Ls B
.Li
to edit files too large for comfortable interactive editing
.Li
to edit any size file when the sequence of editing commands
is too complicated
to be comfortably typed in interactive mode
.Li
to perform multiple \(lqglobal\(rq editing functions efficiently
in one pass through the input
.Le
.RE
.LP
All of these are still good reasons for using
.CW sed .
But these
cases can be solved by the scripting ability of
.CW ex
that we have already looked at.
Why learn yet another editor?
.PP
One answer lies in the third point.
Because it was specifically
designed to work with scripts,
.CW sed
is considerably faster than
.CW ex
when used with a comparable script.
.PP
The other answer lies in
.CW sed 's
unique capability to be used as an editing
.I filter \(em\c
.ix filters
a program that makes edits on the fly as data
is being passed through a pipe on its way to other programs.
.PP
The
.CW sed
program uses a syntax that is very similar to that used by
.ix [sed] editor, command syntax %key sed editor, command syntax
.CW ex ,
so it is not very difficult to learn.
However, there are some critical differences,
which make it inadvisable for an experienced
.CW ed
or
.CW ex
user to just blindly jump in.
.PP
We're going to take a close look at
.CW sed ,
not as a general-purpose editor,
but as a tool to accomplish specific tasks.
As a result, we won't cover every command, but only
those that differ significantly from their
.CW ex
equivalents or
offer specific benefits that we want to utilize.
.PP
First, a brief note on usage.
.ix %begin [sed] editor, invoking %key sed editor, invoking
The
.CW sed
command has two forms:
.Ps
sed -e \fIcommand editfiles\fP
sed -f \fIscriptfile editfiles\fP
.Pe
.LP
The first form, using
.CW -e ,
allows you to specify an editing
command right on the command line.
Multiple
.CW -e
options can be specified on the same line.
.page 361
.PP
The second form, using
.CW -f ,
takes the name of a script containing editing commands.
We prefer this form for using
.CW sed.
.PP
In addition, you can specify an entire multiline editing script
as an argument to
.CW sed ,
like this:
.Ps
sed '
      \fIEditing script begins here\fP
           .
           .
           .
      \f[I]Editing script ends here' editfiles\fP
.Pe
.LP
This last form is especially useful in shell scripts, as we
shall see shortly.
However, it can also be used interactively.
The Bourne shell will prompt for continuation lines
after it sees the first single quotation mark.
.ix %end [sed] editor, invoking %key sed editor, invoking
.PP
You can also combine several commands on the same line,
separating them with semicolons:
.Ps
sed -e '\fIcommand1; command2;\fP ...' \f[I]editfiles\fP
.Pe
.PP
One last point: when using
.CW "sed -e" ,
you should enclose the expression in quotation marks.
Although this is not absolutely essential,
it can save you from serious trouble later.
.PP
Consider the following example:
.Ps
$ sed -e s/thier/their own/g myfile
.Pe
.LP
The expression
.CW "s/thier/their own/g"
will work correctly in a
.CW sed
script used
with the
.CW -f
option.
But from the command line it will result in the
message \(lqCommand garbled,\(rq because the shell interprets the
space as a separator between arguments,
and will parse the command expression as
.CW s/thier/their
and treat the remainder of the line as two filenames,
.CW own/g
and
.CW myfile .
Lacking a closing
.CW /
for the
.CW s
command,
.CW sed
will complain and quit.
.Bh "Differences between \f[CB]ex\fP and \f[CB]sed\fP"
.ix [ex] editor, differences~from [sed] %key ex editor, differences from sed
.ix [sed] editor, differences~from [ex] %key sed editor, differences from ex
.LP
The first difference between
.CW sed
and interactive line editors
like
.CW ed
and
.CW ex
is the way lines are addressed.
.ix %begin [sed] editor, addressing %key sed editor, addressing
In
.CW ex ,
the default is to affect only a specifically addressed line;
therefore, commands like
.CW g
exist to address multiple lines.
The
.CW sed
program, on the other hand, works by default
on all lines, so it needs commands that allow it to
bypass selected lines.
The
.CW sed
program is implicitly global.
In
.CW ex,
the default is to edit the current line,
and you must explicitly request global edits,
or address particular lines that you want to have edited.
In
.CW sed,
the default is to edit every line,
and line addresses are used to restrict the operation
of the edit.
.PP
For example, consider the difference between
.CW ex
and
.CW sed
in how they interpret a command of the form:
.Ps
\f[I]/pattern/\fPs\f[I]/oldstring/newstring/\fP
.Pe
.page 362
.LP
In
.CW ex ,
this means to locate the first line matching
.I pattern
and, on that line, perform the specified substitution.
In
.CW sed ,
the same command matches every line containing
.I pattern ,
and makes the specified edits.
In other words, this command in
.CW sed
works the same as
.CW ex 's
global flag:
.Ps
g/\fIpattern\fP/s/\fIoldstring\fP/\fInewstring\fP/
.Pe
.LP
In both
.CW sed
and
.CW ex ,
a command of the form:
.Ps
/\fIpattern1\fP/,/\fIpattern2\fP/\fIcommand\fP
.Pe
.LP
means to make the specified edits on all lines between
.I pattern1
and
.I pattern2 .
.PP
Although you can use absolute line number addresses in
.CW sed
scripts, you have to remember that
.CW sed
has the capability to
edit multiple files at once in a stream.
And in such cases,
line numbers are consecutive throughout the entire stream,
rather than restarted with each new file.
.ix %end [sed] editor, addressing %key sed editor, addressing
.PP
Besides its addressing peculiarities, you also need to get
used to the fact that
.CW sed
automatically writes to standard output.
You don't need to issue any special commands to make
it print the results of its edits; in fact, you need to use
a command-line option to make it stop.
.PP
To make this point clear, let's consider the following
admittedly artificial example.
Your file contains the following three lines:
.Ps
The files were writeable by thier owner, not by all.
The files were writeable by thier owner, not by all.
The files were writeable by thier owner, not by all.
.Pe
.LP
You use the following editing script (in a file called
.CW edscript ):
.Ps
/thier/s//their/
/writeable/s//writable/
1,$p
.Pe
.LP
Here are the very different results with
.CW ex
and
.CW sed :
.Ps
$ \f(CBex - junk < edscript\fP
The files were writeable by their owner, not by all.
The files were writable by thier owner, not by all.
The files were writeable by thier owner, not by all.
.sp 1v
$ \f(CBsed -f edscript junk\fP
The files were writable by their owner, not by all.
The files were writable by their owner, not by all.
The files were writable by their owner, not by all.
The files were writable by their owner, not by all.
The files were writable by their owner, not by all.
The files were writable by their owner, not by all.
.Pe
.LP
The
.CW ex
command, lacking the
.CW g
prefix to make the edits global,
applies the first line in the script to the first line in the
file, and then goes to the second line, to which it applies
the second line in the script.
No edits are performed on the third line.
.page 363
The contents of the buffer are printed to standard output by
the final line in the script.
This is
analogous to what would happen if you issued the same
commands manually in
.CW ex .
.PP
The
.CW sed
command, in contrast, applies each line in the script
to every line in the
file, and then sends the results to standard output.
A second copy of the input is printed to standard output
by the final line in the script.
.PP
Although the same script almost works for
.CW ex
and
.CW sed ,
the
.CW sed
script can be written more simply as:
.Ps
s/thier/their/
s/writeable/writable/
.Pe
.LP
Because edits are applied by default to every line, we can
skip the initial pattern address and simply give the
.CW s
.ix [sed] editor, substitute command %key sed editor, substitute command
command.
And we want to omit the print command,
which gave us the annoying second copy of the input.
.PP
There are also some special added commands that support
.CW sed 's
noninteractive operation.
We will get to these commands in due course.
However, in some ways, the special commands are
easier to learn than the familiar ones.
The cautionary example shown was intended to underline the fact that
there is a potential for confusion when commands that
look identical produce very different results.
.Bh "Some Shell Scripts Using \f[CB]sed\fP"
.LP
The
.CW sed
command you are most likely to start with is
.CW s
(or substitute) because you
can put it to work without knowing anything about
.CW sed 's
advanced control structures.
Even if you learn no other
.CW sed
commands, you should read this section, because this
command is easy to learn and will greatly extend your
editing power.
.PP
Within the constraints just outlined, the
.CW s
command works similarly to its
.CW ex
equivalent.
Let's look at several shell scripts that
use
.CW sed .
.PP
First, because speed is definitely a factor when you're making
large edits to a lot of files, we might want to rewrite the
.CW correct
script shown previously with
.CW ex
as follows:
.ix [sed] editor, used~in~[for]~loop %key sed editor, used in~[for]~loop
.Ps
for file in $*
do
    sed -f sedscr $file > $file.tmp
    mv $file.tmp $file
done
.Pe
.LP
This script will always look for a local editing script called
.CW sedscr ,
and will apply its edits to each file in the argument
list given to
.CW correct .
Because
.CW sed
sends the result of its
work to standard output, we capture that output in a temporary
file, then move it back to the original file.
.PP
As it turns out, there is a real danger in this approach!
If there is an error in the
.CW sed
script,
.CW sed
will abort without producing any output.
As a result, the temporary file will
be empty and, when copied back onto the original file,
will effectively delete the original.
.PP
To avoid this problem, we need to include a test in the
.CW correct
shell script:
.page 364
.Ps
for file in $*
do
    sed -f sedscr $file > $file.tmp
    if [ -s $file.tmp ]
    then
       mv $file.tmp $file
    else
       echo "Sed produced an empty file."
    fi
done
.Pe
.LP
The
.CW -s ] [
test checks to see whether or not a file is empty\(ema
very useful thing indeed when you are using editing scripts.
.PP
You might want to create another simple shell script that uses
.CW sed
to correct simple errors.
We'll call this one
.CW change :
.Ps
sed -e "s/$1/$2/g" $3 > $3.tmp
if [ -s $3.tmp ]
then
    mv $3.tmp $3
else
    echo "Possible error using regular expression syntax."
.Pe
.LP
This script will simply change the first argument to the second
in the file specified by the third argument.
.Ps
$ \f(CBchange mispeling misspelling myfile\fP
.Pe
.LP
(Because we control the actual editing script, the most likely
errors could come from faulty regular expression syntax in
one of the first two arguments; thus, we changed the wording
of the error message).
.Bh "Integrating \f(CBsed\fP into \f[CB]format\fP"
.ix %begin [format] shell~script %key format shell script
.ix [sed] editor, in~[format]~script %key sed editor, in [format]~script
.LP
Let's consider a brief application that shows
.CW sed
in its role
as a true stream editor, making edits in a pipeline\(emedits
that are never written back into a file.
.PP
To set the stage for this script, we need to turn back briefly
to typesetting.
On a typewriter-like device (including a CRT),
an em dash is typically typed as a pair of hyphens (--).
.ix em dash
In typesetting, it is printed as a single, long dash (\(em).
The
.CW troff
program provides a special character name for the em dash,
but it is inconvenient to type
.CW \e(em
in your file whenever you want an em dash.
.PP
Suppose we create a
.CW sed
script like this:
.Ps
s/--/\\\\(em/g
.Pe
.LP
and incorporate it directly into our
.CW format
script?
We would never need to worry about em dashes\(em\c
.CW sed
would automatically insert them for us.
(Note that we need to double the backslash
in the string
.CW \e(em
because the backslash has meaning to
.CW sed
.\" original: as well at to
as well as to
.CW troff ,
and will be stripped off by
.CW sed ).
.page 365
.PP
The
.CW format
script might now look like this:
.Ps
eqn=""; pic=""; macros="ms"; col=""; roff="ditroff -Tlj"
sed="| sed -e 's/--/\\\\(em/g'"
while [ $# -gt 0 ]
do
	case $1 in
      -E) eqn="| eqn";;
      -P) pic="| pic";;
      -N) roff="nroff"; col="| col"; sed="";;
      -*) options="$options $1";;
       *) if [ -f $1 ]; then
          files="$files $1"
          else echo "format: $1: file not found"; exit
          fi;;
	esac
	shift
done
eval "cat $files $sed | tbl $eqn $pic | $roff $options $col | lp"
.Pe
.LP
(Notice that we've set up the
.CW -N
option for
.CW nroff
so that it sets the
.CW sed
variable to null, because we only
want to make this change if we are using
.CW troff ).
.ix %end [format] shell~script %key format shell script
.Bh "Excluding Lines from Editing
.ix %begin [sed] editor, excluding~lines~from editing %key sed editor, excluding lines~from editing
.LP
Before we go any further, let's take a moment to be sure the
script is complete.
.PP
What about the case in which someone is using hyphens to draw
a horizontal line?
We want to exclude from the edit any lines
containing three or more hyphens together.
To do this, we use the
.CW !
.I don't! ) (
command:
.Ps
/---/!s/--/\\(em/g
.Pe
.LP
It may take a moment to understand this syntax.
It says, simply,
\(lqIf you find a line containing three hyphens together,
don't make the edit.\(rq
The
.CW sed
program will treat all other lines as fair game.
(It's important to realize that the
.CW !
command applies to the pattern match, not to the
.CW s
command itself.
Although, in this case, the effect might seem to be
the same whether you read the command as
\(lqDon't match a line containing
.CW --- \(rq
or \(lqMatch a line containing
.CW --- ,
and don't substitute it,\(rq
there are other cases in which it will be very confusing
if you don't read the line the same way that
.CW sed
does).
.PP
We might also take the opportunity to improve the aesthetics
even further, by putting in a very small space between the
ends of the dash and the preceding and following words, using
the
.CW troff
construct
.CW \e^ ,
which produces a 1/12-em space:
.Ps
/---/!s/--/\\\\^\\\\(em\\\\^/g
.Pe
.LP
As it turns out, changing hyphens to em dashes is not
the only \(lqprettying up\(rq edit we might want to make when
typesetting.
For example, some laser printers do not have a
true typeset quotation mark
(\(lq and \(rq as opposed to " and ").
If you are using an output device with this limitation,
you could use sed to change each double quotation mark
.page 366
character to a pair of single open or close quotation marks
(depending on context), which, when typeset, will produce the
appearance of a proper double quotation mark.
.PP
This is a considerably more difficult edit to make because
there are many separate
cases that we need to account for using regular expression
syntax.
Our script might need to look like this:
.Ps
s/^"/``/
s/"$/''/
s/"? /''? /g
s/"?$/''?/g
s/ "/ ``/g
s/" /'' /g
s/|\(em\(em|"/|\(em\(em|``/g
s/"|\(em\(em|/''|\(em\(em|/g
s/")/'')/g
s/"]/'']/g
s/("/(``/g
s/\\["/\\[``/g
s/";/'';/g
s/":/'':/g
s/,"/,''/g
s/",/'',/g
s/\\."/.\\\\\\&''/g
s/"\\./''.\\\\\\&/g
s/"\\\\^\\\\(em/''\\\\(em/g
s/\\\\(em\\\\^"/\\\\(em``/g
s/"\\\\(em/''\\\\(em/g
s/\\\\(em"/\\\\(em``/g
.Pe
.LP
(This list could be shortened by judicious application of
.CW "\e([...]\e)"
regular expression syntax, but it is shown in its
long form for effect.
Note that the symbol
.CW |\(em\(em|
represents a tab).
.ix %end [sed] editor, excluding~lines~from editing %key sed editor, excluding lines~from editing
.Bh "Branching to Selective Parts of a Script
.ix [sed] editor, branching~to parts~of script %key sed editor, branching to parts~of script
.LP
In technical books like this, it is usually desirable to
show examples in a constant-width font that clearly shows
each character as it actually appears.
A pair of single
quotation marks in a constant-width font will not appear at
all similar to a proper typeset double quotation mark in a
variable-width font.
In short, it is not always desirable to
make the substitutions shown previously.
.PP
However, we can assume that examples will be set off by some
sort of macro pair (in this book, we used
.CW .ES
and
.CW .EE ,
for
.I "example start"
and
.I "example end" ),
and we can use those as the basis for exclusion.
There are two ways to do this:
.page 367
.RS
.Ls B
.Li
Use the ! command, as we did before.
.Li
Use the
.CW b
.I branch ) (
command to skip portions of the editing script.
.Le
.RE
.LP
Let's look at how we'd use the
.CW !
command first.
.PP
We could apply the
.CW !
command to each individual line:
.Ps
/^\\.ES/,/^\\.EE/!s/^"/``/
/^\\.ES/,/^\\.EE/!s/"$/''/
/^\\.ES/,/^\\.EE/!s/"? /''? /g
\&		.
\&		.
\&		.
.Pe
.LP
But there has to be a better way, and there is.
The
.CW sed
program supports the flow
control symbols
.CW {
and
.CW }
for grouping commands.
So we simply need to write:
.Ps
/^\\.ES/,/^\\.EE/!{
s/^"/``/
s/"$/''/
s/"? /''? /g
\&	.
\&	.
\&	.
s/\\\\(em\\\\^"/\\\\(em``/g
s/"\\\\(em/''\\\\(em/g
s/\\\\(em"/\\\\(em``/g
}
.Pe
.LP
All commands enclosed in braces will be subject to the initial
pattern address.
.PP
There is another way we can do the same thing.
The
.CW sed
program's
.CW b
.I branch ) (
command allows you to transfer control to another
line in the script that is marked with an optional label.
Using this feature, we could write the previous script like this:
.Ps
/^\\.ES/,/^\\.EE/bend
s/^"/``/
s/"$/''/
s/"? /''? /g
\&	.
\&	.
\&	.
s/\\\\(em\\\\^"/\\\\(em``/g
s/"\\\\(em/''\\\\(em/g
s/\\\\(em"/\\\\(em``/g
:end
.Pe
.LP
A label consists of a colon, followed by up to eight characters.
If the label is missing, the
.CW b
command branches to the end of the script.
(Because we don't have anything
.page 368
past this point at the moment, we don't actually need the
label in this case.
That is the form we will use from now on).
.PP
The
.CW b
command is designed for flow control within the script.
It allows you to create subscripts that will only be applied
to lines matching certain patterns and will not be applied
elsewhere.
However, as in this case, it also gives you a
powerful way to exempt part of the text from the action of a
single-level script.
.PP
The advantage of
.CW b
over
.CW !
for our application is that we
can more easily specify multiple conditions to avoid.
The
.CW !
symbol can apply to a single command, or can apply to a set
of commands enclosed in braces that immediately follows.
The
.CW b
command, on the other hand, gives you almost unlimited control
over movement around the script.
.PP
For example, if we are using multiple macro packages, there
may be other macro pairs besides
.CW .ES
and
.CW .EE
that enclose text that we don't want to apply the
.CW sed
script to.
So, for example, we can write:
.Ps
/^.ES/,/^.EE/b
/^.PS/,/^.PE/b
/^.G1/,/^.G2/b
.Pe
.LP
In addition, the quotation mark is used as part of
.CW troff 's
own comment syntax
.CW \e" "" (
begins a comment), so we don't want to
change quotation marks on lines beginning with either a
.CW .
or a
.CW ' :
.Ps
/^[.']/b
.Pe
.LP
It may be a little difficult to grasp how these branches work
unless you keep in mind how
.CW sed
does its work:
.RS
.Ls N
.Li
It reads each line in the file into its buffer one
line at a time.
.Li
It then applies all commands in the script to that one
line, then goes to the next line.
.Le
.RE
.LP
When a branch dependent on a pattern match is encountered,
it means that if a line that matches the pattern is read into
the buffer, the branch command will cause the relevant portion
of the script to be skipped
.I "for that line" .
If a label is used,
the script will continue at the label; if no label is used,
the script is effectively finished for that line.
The next
line is read into the buffer, and the script starts over.
.PP
The previous example shows how to exempt a small, clearly
delineated portion of a file from the action of a
.CW sed
script.
To achieve the opposite effect\(emthat is, to make a
.CW sed
script affect only a small part of a file
and ignore the rest\(emwe can simply anchor
the desired edits to the enclosing pattern.
.PP
For example, if there were some edits we wanted to make
only within the confines of our
.CW .ES
and
.CW .EE
macros, and not elsewhere, we could do it like this:
.Ps
/^\\.ES/,/^\\.EE/{
.I "Editing commands here"
}
.Pe
.page 369
.LP
If the script is sufficiently complex that you'd rather have
a more global method of exclusion, you can reverse the sense
of a branch by combining it with
.CW ! :
.Ps
/^\\.ES/,/^\\.EE/!b
.Pe
.LP
When the first line in the script is applied to each line in
the input, it says:
\(lqDoes the line match the pattern?
No? Branch to the end of the script.
.ix [sed] editor, branching~to parts~of script %key sed editor, branching to parts~of script
(That is, start over on the next line of the input).
Yes? Go on to the next line in the script,
and make the edits.\(rq
.Bh "Back to \f[CB]format\fP"
.ix [format] shell~script %key format shell script
.LP
The edits we've shown using
.CW sed
are very useful, so we
want to be sure to properly integrate them with
.CW format .
Because we are now making a large series of edits rather than
just one, we need to use
.CW sed
with a script file rather than a single-line script using
.CW -e .
As a result, we'll change the variable assignment in
.CW format
to:
.Ps
sed="| sed -f /usr/local/cleanup.sed"
.Pe
.LP
where
.CW cleanup.sed
is the name of the script containing
the editing commands, and
.CW /usr/local
could be any generally accessible directory.
We'll add additional
formatting cleanup commands to this file later.
.Bh "Inserting Lines of Text
.ix [sed] editor, inserting lines~of text %key sed editor, inserting lines of text
.LP
The
.CW sed
program, like
.CW ex
and
.CW vi ,
has commands for inserting new lines of text.
The
.CW i
(insert) command adds text before the current line;
.CW a
(append) adds text
.I after
the current line.
In
.CW ex ,
after you enter insert mode, you can type as long as you
like, breaking lines with carriage returns.*
Insert mode is terminated by typing a period at the start of
a line, followed immediately by a carriage return.
In
.CW sed ,
you must instead type a backslash at the end of each inserted
line.
Insert mode is terminated by the first newline that
is not \(lqescaped\(rq with a backslash in this way.
For example, the
.CW sed
script:
.FS
*The terms \(lqcarriage return\(rq and \(lqnewline\(rq are
used somewhat loosely here.
They are actually distinct characters in the
ASCII character set\(emequivalent to
\f[CW]^\fP\f[I]M\fP
(carriage return) and
\f[CW]^\fP\f[I]J\fP
(linefeed).
The confusion arises because UNIX changes
the carriage return
(\f[CW]^\fP\f[I]M\fP)
generated by the carriage return key to a linefeed
(\f[CW]^\fP\f[I]J\fP)
on input.
(That is, when you type a
carriage return when editing a file, what is actually stored
is a linefeed).
On output, the linefeed is mapped to both
characters\(emthat is, a
\f[CW]^\fP\f[I]J\fP
in a file actually is output to
the terminal as a carriage return/linefeed pair
(\f[CW]^\fP\f[I]M\fP\f[CW]^\fP\f[I]J\fP).
.FE
.Ps
1a\\
The backslash is a ubiquitous escape character used by\\
many UNIX programs. Perhaps its most confusing appearance\\
is at the end of a line, when it is used to "hide a\\
newline." It appears to stand alone, when in fact it is\\
followed by a nonprinting character-a newline.
.Pe
.page 370
.LP
will append the five lines shown in the example following
line\ 1 in the file to which the
.CW sed
script is applied.
The insert ends on the fifth line, when
.CW sed
encounters a newline that is
not preceded by a backslash.
.Bh "A \f(CBsed\fP Script For Extracting Information From a File
.ix [sed] editor, script~for extracting~information~from~a file %key sed editor, script for extracting~information~from~a file
.LP
The
.CW -n
option to
.CW sed
suppresses normal output and causes
.CW sed
to print only the output you explicitly ask for using the
.CW p
.ix [sed] editor, print command %key sed editor, print command
command.
.PP
There are two forms of the
.CW p
command:
.RS
.Ls B
.Li
As an absolute print command.
For example:
.Ps
.ti +11n
/\f[I]pattern\fP/p
.Pe
will always print the line(s) matched by pattern.
.Li
In combination with a substitute command,
in which case the line will only be
printed if a substitution is actually made.
For example:
.Ps
.ti +11n
/\f[I]pattern\fP/s/\f[I]oldstring\fP/\f[I]newstring\fP/gp
.Pe
will not be printed if a line containing
.I pattern
is found but
.I oldstring
was not replaced with
.I newstring .
.Le
.RE
.LP
This becomes much clearer if you realize that a line of
the form:
.Ps
s/\fIoldstring\fP/\fInewstring\fP/p
.Pe
.LP
is unrestricted\(emit matches every line in
the file\(embut you only
want to print the result of successful substitutions.
.PP
Using
.CW "sed -n"
with the
.CW p
command gives you a
.CW grep -like
facility with the ability to select not
just single lines but larger blocks of text.
.PP
For example, you could create a simple online
quick-reference document, in which topics are delineated by
an initial heading and a distinct terminating string, as in
the following abbreviated example:
.Ps
$ \f(CBcat alcuin_online\fP
\&	.
\&	.
\&	.
Output Devices

Alcuin requires the use of a graphics device with at least
300 dpi resolution, and the ability to store at least
one-half page of graphics at that resolution ...
%%%%
\&	.
\&	.
\&	.
Type Styles
.page 371

There are a number of ornamental type styles available on
many typesetters.  For example, many have an Old English
font.  But no typesetter currently on the market has the
capability of Alcuin to create unique characters in the
style of medieval illuminated manuscripts.
%%%%
	.
	.
	.
$
.Pe
.LP
A shell program like the following is all you need to display
entries from this \(lqfull text database\(rq:
.Ps
pattern=$*
sed -n "/$pattern/,/%%%%/p" alcuin_online
.Pe
.LP
(The entire argument list supplied to the command
.CW $* ) (
is assigned to the variable
.CW pattern ,
so that the user can type a
string including spaces without having to type quotation marks).
.PP
We'll give an example that is perhaps a bit more realistic.
Consider that when you are developing macros for
use with an existing package, you may often need to consult
macros in the package you are either using or worried about
affecting.
Of course, you can simply read in the entire file
with the editor.
However, to make things easier, you can use a
simple shell script that uses
.CW sed
to print out the definition of the desired macro.
We use a version of this script on our
own system, where we call it
.CW getmac :
.Ps
mac="$2"
case $1 in
 -ms) file="/usr/lib/macros/tmac.s";;
 -mm) file="/usr/lib/macros/mmt";;
 -man) file="/usr/lib/macros/an";;
esac
sed -n -e "/^\\.de *$mac/,/^\\.\\.$/p" $file
done
.Pe
.LP
There are a couple of things about this script that bear
mention.
First, the name of a macro does not need to be
separated from the
.CW .de
request by a space.
.\" XXX Not true for groff... need to fix for "revisited" phase
The
.CW ms
package uses a space, but
.CW mm
and
.CW man
do not.
This is the reason
the search pattern includes a space followed by an asterisk
(this pattern matches zero or more spaces).
.PP
Second, we use the
.CW -n
option of
.CW sed
to keep it from printing out the entire file.
It will now print out only the lines that match:
the lines from the start of the specified macro
definition
.CW ".de *$mac" ) (
to the
.CW ..
that ends the definition.
.PP
(If you are new to regular expressions, it may be a little
difficult to separate the regular expression syntax from
.CW troff
and shell special characters, but do make the effort,
because this is a good application of
.CW sed
and you should add it to your repertoire).
.page 372
.PP
The script prints the result on standard output, but it can
easily be redirected into a file, where it can become the basis
for your own redefinition.
We'll find good use for this script in later chapters.
.PP
Yet another example of how we can use
.CW sed
to extract (and
manipulate) information from a file is provided by the following
script, which we use to check the structure of documents we
are writing.
.PP
The script assumes that
.CW troff
macros (in this case, the macros
used to format this book) are used to delineate sections, and
prints out the headings.
To make the structure more apparent,
the script removes the section macros themselves, and prints
the headings in an indented outline format.
.PP
There are three things that
.CW sed
must accomplish:
.RS
.Ls
.Li
Find lines that begin with the macro for chapter
.CW .CH ) (
or section headings (\c
.CW .H1
or
.CW .H2 ).
.Li
Make substitutions on those lines,
replacing macros with text.
.Li
Print only those lines.
.Le
.RE
.LP
The
.CW sed
command,
.CW do.outline ,
operates on all files specified on the command line
.CW $* ). (
It prints the result to standard output
(without making any changes within the files themselves).
.Ps
sed -n '/^\\.[CH][H12]/ {
	s/"//g
	s/^\\.CH /\\
CHAPTER  /
	s/^\\.H1/    A. /
	s/^\\.H2/        B. /
	p
}' $*
.Pe
.LP
The
.CW sed
command is invoked with the
.CW -n
option, which suppresses the automatic printing of lines.
Then we specify a
pattern that selects the lines we want to operate on, followed
by an opening brace
.CW { ). (
This signifies that the group of
commands up to the closing brace
.CW } ) (
are applied only to lines matching the pattern.
This construct isn't as unfamiliar as it may look.
The global regular expression of
.CW ex
could work here if we only wanted to make one substitution
.CW g/^\\\\.[CH][H12]/s/"//g ). (
The
.CW sed
command performs several operations:
.RS
.Ls
.Li
It removes double quotation marks.
.Li
It replaces the macro for chapter headings with a newline
(to create a blank line) followed by the word
.I CHAPTER .
.Li
It replaces the section heading with an appropriate
letter and tabbed indent.
.Li
It prints the line.
.Le
.RE
.page 373
.LP
The result of
.CW do.outline
is as follows:
.Ps
$ \f(CBdo.outline ch13/sect1\fP

CHAPTER  13 Let the Computer Do the Dirty Work
	A.  Shell Programming
		B.  Stored Commands
		B.  Passing Arguments to Shell Scripts
		B.  Conditional Execution
		B.  Discarding Used Arguments
		B.  Repetitive Execution
		B.  Setting Default Values
		B.  What We've Accomplished
.Pe
.LP
Because the command can be run on a series of files or
\(lqchapters,\(rq an outline for an entire book can be produced in
a matter of seconds.
We could easily adapt this script for
.CW ms
or
.CW mm
section heading macros, or to include a C-level heading.
.Bh "The \f(CBQuit\fP Command
.LP
The
.CW q
.ix [sed] editor, quit command %key sed editor, quit command
command causes
.CW sed
to stop reading new input lines
(and to stop sending them to the output).
So, for example, if
you only want some initial portion of your file to be edited,
you can select a pattern that uniquely matches the last line
you want affected, and include the following command as the
last line of your script:
.Ps
/\fIpattern\fP/q
.Pe
.LP
After the line matching
.I pattern
is reached, the script will be terminated.*
.FS
*You need to be very careful not to use
.CW q
in any program that
writes its edits back to the original file (like our
.CW correct
shell script shown previously).
After
.CW q
is executed, no further output is produced.
It should not be used in any case where
you want to edit the front of the file and pass the remainder
through unchanged.
Using
.CW q
in this case is a very dangerous beginner's mistake.
.FE
.PP
This command is not really useful for
protecting portions of a file.
But, when used with a complex
.CW sed
script, it is useful for improving the performance of the script.
Even though
.CW sed
is quite fast, in an application like
.CW getmac
there is some
inefficiency in continuing to scan through a large file after
.CW sed
has found what it is looking for.
.PP
So, for example, we could rewrite
.CW getmac
as follows:
.Ps
mac="$2"
case $1 in
 -ms) file="/usr/lib/macros/tmac.s";;
 -mm) file="/usr/lib/macros/mmt";;
 -man) file="/usr/lib/macros/an";;
esac
shift
sed -n "
/^\\.de *$mac/,/^\\.\\./{
.page 374
p
/^\\.\\./q
}" $file
done
.Pe
.LP
The grouping of commands keeps the line:
.Ps
/^\\.\\./q
.Pe
.LP
from being executed until
.CW sed
reaches the end of the macro we're looking for.
(This line by itself would terminate the
script at the conclusion of the first macro definition).
The
.CW sed
program quits on the spot, and doesn't continue
through the rest of the file looking for other possible matches.
.PP
Because the macro definition files are not that long, and the
script itself not that complex, the actual time saved from
this version of the script is negligible.
However, with a very
large file, or a complex, multiline script that needs to be
applied to only a small part of the file, this script could
be a significant timesaver.
.PP
For example, the following simple shell program uses
.CW sed
to print out the top ten lines of a file
(much like the standard UNIX
.CW head
program):
.Ps
for file
do
sed 10q $file
done
.Pe
.LP
This example shows a dramatic performance gain over the same
script written as follows:
.Ps
for file
do
sed -n 1,10p $file
done
.Pe
.Bh "Matching Patterns across Two Lines
.ix %begin [sed] editor, matching patterns~across two~lines %key sed editor, matching patterns across two~lines
.LP
One of the great weaknesses of line-oriented editors is their
helplessness in the face of global changes in which the pattern
to be affected crosses more than one line.
.PP
Let me give you an example from a recent manual one of
our writers was working on.
He was using the
.CW ms
.CW .BX
macro (incorrectly, it turns out) to box the first letter in a
menu item, thus graphically highlighting the sequence of menu
selections a user would select to reach a given command.
For example:
.LP
.in 5n
.BX "\s-2M\s0"\c
ain menu
.in +5n
.BX "\s-2P\s0"\c
ortfolio commands
.in +5n
.BX "\s-2E\s0"\c
valuate portfolios
.in +5n
.BX "\s-2S\s0"\c
hock factors
.in 0
.PP
He had created a menu reference divided into numerous files,
with hundreds of commands coded like this:
.page 375
.Ps
\&.in 5n
\&.BX "\es-2M\es0"\ec
ain menu
\&.in +5n
\&.BX "\es-2P\es0"\ec
ortfolio commands
\&.in +5n
\&.BX "\es-2E\es0"\ec
valuate portfolios
\&.in +5n
\&.BX "\es-2S\es0"\ec
hock factors
\&.in 0
.Pe
.LP
Suddenly, the writer realized that the
.I M
in
.I "Main Menu"
should not be boxed because the
user did not need to press this key.
He needed a way to remove the box around the
.I M
if\(emand only if\(emthe next line contained the string
.I "ain menu" .
.PP
(A
.CW troff
aside: The
.CW \ec
escape sequence brings text from the
following line onto the current line.
You would use this,
for example, when you don't want the argument to a macro to
be separated from the first word on the next line by the space
that would normally be introduced by the process of filling.
The fact that the
.CW .BX
macro already makes provision for this case,
and allows you to supply continued text in a second optional
argument, is somewhat irrelevant to this example.
The files had
been coded as shown here, the mistake had been made, and there
were hundreds, perhaps thousands, of instances to correct).
.PP
The
.CW N
command allows you to deal with this kind of problem using
.CW sed .
This command temporarily \(lqjoins\(rq the current line
with the next for purposes of a pattern match.
The position
of the newline in the combined line can be indicated by the
escape sequence
.CW \en .
In this case, then, we could solve the
problem with the following two-line
.CW sed
script:
.Ps
/.BX "\es-2M\es0"/N
s/.BX "\es-2M\es0"\ec\enain Menu/Main Menu/
.Pe
.LP
We search for a particular pattern and, after we find it,
\(lqadd on\(rq the next line using
.CW N .
The next substitution will
now apply to the combined line.
.PP
Useful as this solution was, the number of cases in which
you know exactly where in the input a newline will fall
are limited.
Fortunately,
.CW sed
goes even further, providing
commands that allow you to manipulate multiline patterns in
which the newline may occur at any point.
Let's take a look at these commands.
.Bh "The Hold Space and the Pattern Space
.ix %begin [sed] editor, hold space %key sed editor, hold space 
.ix %begin [sed] editor, pattern space %key sed editor, pattern space
.LP
The next set of commands\(em
hold (\f(CWh\fP or \f(CWH\fP),
get (\f(CWg\fP or \f(CWG\fP),
and exchange (\f(CWx\fP)\(em
can be difficult to understand, especially if you
have read the obscure documentation provided with most UNIX
systems.
It may help to provide an analogy that reviews some
of the points we've already made about how
.CW sed
works.
.page 376
.PP
The operations of
.CW sed
can be explained, somewhat fancifully,
in terms of an extremely deliberate scrivener or amanuensis
toiling to make a copy of a manuscript.
His work is bound
by several spacial restrictions:
the original manuscript is
displayed in one room; the set of instructions for copying
the manuscript are stored in a middle room; and the quill,
ink, and folio are set up in yet another room.
The original
manuscript as well as the set of instructions are written
in stone and cannot be moved about.
The dutiful scrivener,
being sounder of body than mind, is able to make a copy by
going from room to room, working on only one line at a time.
Entering the room where the original manuscript is, he removes
from his robe a scrap of paper to take down the first line of
the manuscript.
Then he moves to the room containing the list
of editing instructions.
He reads each instruction to see if
it applies to the single line he has scribbled down.
.PP
Each instruction, written in special notation, consists of two
parts: a
.I pattern
and a
.I procedure .
The scrivener reads the first
instruction and checks the pattern against his line.
If there
is no match, he doesn't have to worry about the procedure,
so he goes to the next instruction.
If he finds a match,
then the scrivener follows the action or actions specified in
the
.I procedure .
.PP
He makes the edit on his piece of paper before trying to match
the pattern in the next instruction.
Remember, the scrivener
has to read through a series of instructions, and he reads
all of them, not just the first instruction that matches the
pattern.
Because he makes his edits as he goes, he is always
trying to match the latest version against the next pattern;
he doesn't remember the original line.
.PP
When he gets to the bottom of the list of instructions, and
has made any edits that were necessary on his piece of paper,
he goes into the next room to copy out the line.
(He doesn't need to be told to print out the line).
After that is done,
he returns to the first room and takes down the next line on a
new scrap of paper.
When he goes to the second room, once again
he reads every instruction from first to last before leaving.
.PP
This is what he normally does, that is, unless he is told
otherwise.
For instance, before he starts, he can be told
.I not
to write out every line (the
.CW -n
option).
In this case, he must wait for an
instruction that tells him to print
.CW p ). (
If he does not get that instruction,
he throws away his piece of paper and starts over.
By the way, regardless of whether or
not he is told to write out the line, he always gets to the
last instruction on the list.
.PP
Let's look at other kinds of instructions the scrivener has
to interpret.
First of all, an instruction can have zero, one,
or two patterns specified:
.RS
.Ls B
.Li
If no pattern is specified, then the same procedure is
followed for each line.
.Li
If there is only one pattern, he will follow the procedure
for any line matching the pattern.
.Li
If a pattern is followed by a
.CW ! ,
then the procedure is followed for all lines that
do
.I not
match the pattern.
.Li
If two patterns are specified, the actions described in
the procedure are performed on the first matching line and
all succeeding lines until a line matches
the second pattern.
.Le
.RE
.page 377
.LP
The scrivener can work only one line at a time, so you might
wonder how he handles a range of lines.
Each time he goes
through the instructions, he only tries to match the first
of two patterns.
Now, after he has found a line that matches
the first pattern, each time through with a new line he tries
to match the second pattern.
He interprets the second pattern
as pattern!, so that the procedure is followed only if there
is no match.
When the second pattern is matched, he starts
looking again for the first pattern.
.PP
Each procedure contains one or more commands or
.I actions .
Remember, if a pattern is specified with a procedure,
the pattern must be matched before the procedure is executed.
We have already shown many of the usual commands that are
similar to other editing commands.
However, there are several highly unusual commands.
.PP
For instance, the
.CW N
command tells the scrivener to go, right
now, and get another line, adding it to the same piece of
paper.
The scrivener can be instructed to \(lqhold\(rq onto a single
piece of scrap paper.
The
.CW h
command tells him to make a copy of
the line on another piece of paper and put it in his pocket.
The
.CW x
command tells him to exchange the extra piece of paper in
his pocket with the one in his hand.
The
.CW g
command tells him to throw out the paper
in his hand and replace it with the one in his pocket.
The
.CW G
command tells him to append the line he
is holding to the paper in front of him.
If he encounters a
.CW d
command, he throws out the scrap of paper and begins again at
the top of the list of instructions.
A
.CW D
command has effect
when he has been instructed to append two lines on his piece
of paper.
The
.CW D
command tells him to delete the first of those lines.
.PP
If you want the analogy converted back to computers, the first
and last rooms in this medieval manor are standard input and
standard output.
Thus, the original file is never changed.
The line on the scrivener's piece of scrap paper is in the
.I "pattern space" ;
the line on the piece of paper that he holds in his
pocket is in the
.I "hold space" .
The hold space allows you to
retain a duplicate of a line while you change the original
in the pattern space.
Let's look at a practical application, a
.CW sed
program that searches for a particular phrase that
might be split across two lines.
.PP
As powerful as regular expressions are, there is a limitation:
a phrase split across two lines will not be matched.
As we've shown, even though you can specify a newline,
you have to know
between which two words the newline might be found.
Using
.CW sed ,
we can write instructions for general-purpose pattern matching
across two lines.
.Ps
N
h
s/ *\\n/ /
/pattern-matching syntax/{
g
p
d
}
g
D
.Pe
.LP
This
.CW sed
script will recognize the phrase
.I "pattern-matching syntax"
even when it's in the input file on two lines.
Let's see how the pattern space and hold space
allow this to be done.
.page 378
.PP
At the start, there is one line in the pattern space.
The first action
.CW N ) (
is to get another line and append it to the first.
This gives us two lines to examine, but there is an
embedded newline that we have to remove (otherwise we'd have
to know where the newline would fall in the pattern).
Before that, we copy
.CW h ) (
the contents of the pattern space into
the hold space so that we can have a copy that retains the
newline.
Then we replace the embedded newline
.CW \en ), (
and any blank spaces that might precede it,
with a single blank.
(The
.CW sed
command does not remove a newline when it terminates the
line in the pattern space).
Now we try to match the phrase
against the contents of the pattern space.
If there is a
match, the duplicate copy that still contains the newline is
retrieved from the hold space
.CW g ) (
and printed
.CW p ). (
The
.CW d
command
sends control back to the top of the list of instructions so
that another line is read into the pattern space, because no
further editing is attempted \(lqon the corpse of a deleted line\(rq
(to use the phrasing of the original
.CW sed
documentation).
If, on the other hand, there is no match,
then the contents of the hold buffer are replaced
.CW g ) (
with the contents of the pattern space.
Now we have our original two lines in the pattern space,
separated by a newline.
We want to discard the first of these lines,
and retain the second in order to pair it up with the next line.
The
.CW D
command deletes the pattern space up to the
newline and sends us back to the top to append the next line.
.PP
This script demonstrates the limits of flow control in
.CW sed .
After the first line of input is read, the action
.CW N
is responsible for all input.
And, using
.CW d
and
.CW D
to avoid
ever reaching the bottom of the instruction list,
.CW sed
does not print the line automatically or clear the pattern space
(regardless of the
.CW -n
option).
To return to our analogy,
after the scrivener enters the second room, an instruction
is always telling him which room to go to next and whether to
get another line or to write it out, for as long as there are
lines to be read from the manuscript.
.PP
As we have emphasized, you can always refine a script,
perfecting the way it behaves or adding features.
There are three problems with the way this script works.
First and most important,
it is not general enough because it has been set up
to search for a specific string.
Building a shell script around this
.CW sed
program will take care of that.
Second, the program does not \(lqgo with the flow\(rq of
.CW sed.
We can rewrite it, using the
.CW b
.I branch ) (
command, to make use of sed's default action
when it reaches the bottom of its instruction list.
Last, this program always prints matching lines
in pairs, even when the search string is found
in its entirety on a single line of input.
We need to match the pattern before each new line
of input is paired with the previous line.
.PP
Here's a generalized version of this
.CW sed
script, called
.CW phrase ,
which allows you to specify the search string as a quoted first
argument.
Additional command-line arguments represent filenames.
.Ps
search=$1
shift
for file
do
	sed '
	/'"$search"'/b
	N
	h
	s/.*\\n//
.page 379
	/'"$search"'/b
	g
	s/ *\\n/ /
	/'"$search"'/ {
	g
	b
	}
	g
	D' $file
done
.Pe
.LP
A shell variable defines the search string as the first argument
on the command line.
Now the
.CW sed
program tries to match the
search string at three different points.
If the search string
is found in a new line read from standard input, that line is
printed.
We use the
.CW b
command to drop to the bottom of the list;
.CW sed
prints the line and clears the pattern space.
If the single line does not contain the pattern,
the next input line is appended to the pattern space.
Now it is possible that this line, by itself,
matches the search string.
We test this
(after copying the pattern space to the hold space) by removing
the previous line up to the embedded newline.
If we find a match, control drops to the
bottom of the list and the line is printed.
If no match is made, then we get a copy of the
duplicate that was put in the hold space.
Now, just as in the earlier version, we remove
the embedded newline and test for the pattern.
If the match is made, we want to print the pair of lines.
So we get another copy of the duplicate because it has
the newline, and control passes to the bottom of the script.
If no match is found, we also retrieve the duplicate
and remove the first portion of it.
The delete action causes
control to be passed back to the top, where the N command
causes the next line to be appended to the previous line.
.PP
Here's the result when the program is run on this section:
.Ps
$ \f(CBphrase "the procedure is followed" sect3\fP
If a pattern is followed by a \\f(CW!\\fP, then the procedure
is followed for all lines that do \\fInot\\fP match the
so that the procedure is followed only if there is
.Pe
.ix %end [sed] editor, hold space %key sed editor, hold space
.ix %end [sed] editor, matching patterns~across two~lines %key sed editor, matching patterns across two~lines
.ix %end [sed] editor, pattern space %key sed editor, pattern space
.Bh "In Conclusion
.LP
The examples given here only begin to touch on the power of
.CW sed 's
advanced commands.
For example, a variant of the hold
command
.CW H ) (
appends matched lines to the hold space, rather than
overwriting the initial contents of the hold space.
Likewise, the
.CW G
variant of the get command appends the contents of the
hold space to the current line, instead of replacing it.
The
.CW X
command swaps the contents of the pattern space with the
contents of the hold space.
As you can imagine, these commands
give you a great deal of power to make complex edits.
.PP
However, it's important to remember that you don't need to
understand everything about
.CW sed
to use it.
As we've shown, it
is a versatile editor, fast enough to recommend to beginners
for making simple global edits to a large set of files,
yet complex enough to tackle tasks that you'd never think to
accomplish with an editor.
.page 380
.PP
Although the syntax is convoluted even for experienced
computer users,
.CW sed
does have flow control mechanisms that,
given some thought and experimentation, allow you to devise
editing programs.
It is easy to imagine (though more difficult
to execute) a
.CW sed
script that contains editing \(lqsubroutines,\(rq
branched to by label, that perform different actions on parts
of a file and quit when some condition has been met.
.PP
Few of us will go that far, but it is important to understand
the scope of the tool.
You never know when, faced with
some thorny task that would take endless repetitive hours
to accomplish, you'll find yourself saying:
\(lqWait!
I bet I could do that with
.CW sed .\(rq*
.FS
*The preceding sections have not covered all
.CW sed
commands.
See
.pdfhref L -D AppendixA -- Appendix A
for a complete list of
.CW sed
commands.
.FE
.ix %end [sed] editor %key sed editor
.Ah "A Proofreading Tool You Can Build
.ix %begin [proof] shell~script %key proof shell script
.ix %begin proofreading, shell~script~for
.ix shell~scripts, proofreading script
.LP
Now let's look at a more complex script that makes minimal
use of
.CW sed
but extensive use of shell programming.
It is
the first example of a full-fledged tool built with the shell
that offers significantly greater functionality than any of
the individual tools that make it up.
.PP
We call this script
.CW proof .
It uses
.CW spell
.ix [spell] command %key spell command
to check for misspelled words in a file,
shows the offending lines in context, and then uses
.CW sed
to make the corrections.
Because many documents contain technical terms, proper names,
and so on that will be flagged as errors, the script also
creates and maintains a local dictionary file of exceptions
that should not be flagged as spelling errors.
.PP
This script was originally published with the name
.CW spellproofer
in Rebecca Thomas's column in the June 1985 issue of
.I "UNIX World" ,
to which it was submitted by Mike Elola.
The script
as originally published contained several errors, for which we
submitted corrections.
The following script, which incorporates
those corrections, was published in the January 1986 issue,
and is reprinted with permission of
.I "UNIX World" .
(Actually, we've added a few further refinements since
then, so the script is not exactly as published).
.PP
Because the contents of the script will become clearer after you
see it in action, let's work backward this time, and show you
the results of the script before we look at what it contains.
The following example shows a sample run on an early draft of
Chapter 2.
In this example,
.CW <CR>
indicates that the user has
typed a carriage return in response to a prompt.
.Ps
$ \f(CBproof sect1\fP
Do you want to use a local dictionary?  If so, enter
the name or press RETURN for the default dictionary: \f(CB<CR>\fP
.sp 1v
Using local dictionary file dict
working ...
.page 381
The word Calisthentics appears to be misspelled.
Do you want to see it in context (y or n)?
\f(CBn\fP
.sp 1v
Press RETURN for no change or replace "Calisthentics" with:
Calisthenics
.sp 1v
\&.H1 "UNIX Calisthenics"
Save corrections in "sect1" file (y or n)?
\f(CBy\fP
.sp 1v
The word metachacters appears to be misspelled.
Do you want to see it in context (y or n)?
\f(CBn\fP
.sp 1v
Press RETURN for no change or replace "metachacters" with:
metacharacters
.sp 1v
generation metacharacters. The asterisk matches any or all
Save corrections in "sect1" file (y or n)?
\f(CBy\fP
.sp 1v
The word textp appears to be misspelled.
Do you want to see it in context (y or n)?
\f(CBy\fP
a directory "/work/textp" and under that directories for
each of the chapters in the book, "/work/textp/ch01",
$ cp notes /work/textp/ch01
name in the directory /work/textp/ch01.
$ ls /work/textp/ch*
$ ls /work/textp/ch01/sect?
cwd   /work/textp/ch03
$ book="/work/textp"
/work/textp
.sp 1v
Press RETURN for no change or replace 'textp' with: \f[CB]<CR>\fP
.sp 1v
You left the following words unchanged
textp
.sp 1v
Do you wish to have any of the above words entered
into a local dictionary file (y/n)?
\f(CBy\fP
Append to dict (y/n)?
\f(CBy\fP
.page 382
Do you wish to be selective (y/n)?
\f(CBy\fP
Include textp (y/n)?
\f(CBy\fP
.sp 1v
Done.
$
.Pe
.LP
Now let's look at the script.
Because it is more complex than
anything we have looked at so far,
we have printed line numbers in the margin.
These numbers are not part of the script but
are used as a reference in the commentary that follows.
You will find that the indentation of nested loops and so forth
will make the program much easier to read.
.Ps
.ig
	Larry, the .SM makes this way to small to read.
	I've changed it to use the default Ps/Pe print environment
	values.  Also, using .SM/.NL kills the regular Ps/Pe
	environment, which made the code example for lines
	10-14 unreadable.  This points up to the hazards of
	using -ms macros within the Ps/Pe pairs
	--Michael Hobgood
..
 1  echo "Do you want to use a local dictionary? If so, enter"
 2  echo "the name or press RETURN for the default dictionary: "
 3  read localfile
 4  if [ -z "$localfile" ]; then
 5    localfile=dict
 6    echo Using local dictionary file $localfile
 7  fi
 8  echo "working ..."
 9  touch $localfile
10  filelist="$*"; excused=""
11  if [ -z "$filelist" ]; then
12    echo 'Usage: proof file...'
13    exit 1
14  fi
15  for word in `spell $filelist`
16  do
17    found=`grep "^$word$" $localfile
18    if [ -z "$found" ] ; then
19      echo
20      echo "The word $word appears to be misspelled."
21      echo "Do you want to see it in context (y or n)? "
22      read context
23      if [ "$context" = y ]; then
24        grep $word $filelist
25      fi
26      echo
27      echo "Press RETURN for no change or replace \\"$word\\" with:"
28      read correction
29      if [ -n "$correction" ]; then
30        hitlist="`grep -l $word $filelist`"
31        for file in $hitlist
32        do
33          echo
.page 383
34          sed -n -e "s/$word/$correction/gp" <$file
35          echo "Save corrections in \\"$file\\" file  (y or n)? "
36          read response
37          if [ "$response" = y ]; then
38            sed -e "s/$word/$correction/g" <$file>/usr/tmp/$file
39            if test -s /usr/tmp/$file; then
40              mv /usr/tmp/$file $file
41            fi
42          fi
43        done
44      else
45        excused="$excused $word"
46      fi
47    fi
48  done
49  echo;echo;echo
50  if [ -n "$excused" ]; then
51    echo "You left the following words unchanged"
52    echo $excused | tr "\\ " "\\012" | pr -5 -t
53    echo
54    echo "Do you wish to have any of the above words entered"
55    echo "into a local dictionary file (y/n)? "
56    read response
57    if [ "$response" = "y" ]; then
58      if [ -n "$localfile" ]; then
59        echo "Append to $localfile (y/n)? "
60        read response
61        if [ "$response" != y ]; then
62        echo "Enter new/alternate local dictionary file: "
63        read localfile
64        fi
65      fi
66      echo
67      echo "Do you wish to be selective (y/n)? "
68      read select
69      for word in $excused
70      do
71        if [ "$select" = y ]; then
72          echo "Include $word (y/n)? "
73          read response
74          if test "$response" = y; then
75            echo $word >>$localfile
76        fi
77      else
78        echo $word >>$localfile
79      fi
.page 384
80      done
81    fi
82  fi
83  echo
84  echo "Done."
.Pe
.IP 1-8 8n
The UNIX programming philosophy is to create small
programs as general-purpose tools that can be joined in
pipelines.
Because of this, programs generally don't do
prompting, or other \(lquser-friendly\(rq things that will limit the
program to interactive operation.
However, there are times,
even in UNIX (!), when this is appropriate.
.IP
The shell has commands to handle prompting and reading the
resulting responses into the file, as demonstrated here.
The
.CW echo
command prints the prompt, and
.CW read
assigns whatever is typed in response
(up to a carriage return) to a variable.
This variable can then be used in the script.
.IP
The lines shown here prompt for the name of the local dictionary
file, and, if none is supplied, use a default dictionary
in the current directory called
.CW dict .
In the sample run, we
simply typed a carriage return, so the variable
.CW localfile
is set to
.CW dict .
.IP 9
If this is the first time the script has been run,
there is probably no local dictionary file, and one must be
created.
The
.CW touch
command is a good way to do this because
if a file already exists, it will merely update the access
time that is associated with the file (as listed by
.CW "ls -l" ).
If the file does not exist, however, the
.CW touch
command will create one.
.IP
Although this line is included in the script as a sanity check,
so that the script will work correctly the first time, it is
preferable to create the local dictionary manually, at least
for large files.
The
.CW spell
program tends to flag as errors many
words that you want to use in your document.
The
.CW proof
script
handles the job of adding these words to a local dictionary,
but doing this interactively can be quite time-consuming.
It
is much quicker to create a base dictionary for a document by
redirecting the output of
.CW spell
to the dictionary, then editing
the dictionary to
.I remove
authentic spelling errors and leave
only the exception list.
The errors can then be corrected with
.CW proof
without the tedium of endlessly repeating
.CW n
for words that are really not errors.
.IP
If you use this script, you should run
.CW spell
rather than
.CW proof
on the first draft of a document, and create the dictionary
at that time.
Subsequent runs of
.CW proof
for later drafts will be short and to the point.
.IP 10-14
In these lines, the script sets up some variables,
in much the same way as we've seen before.
The lines:
.page 385
.Ps
	filelist="$*"
	if [ -z "$filelist" ]; then
		echo "Usage: proof file ..."
		exit 1
	fi
.Pe
.IP
have much the same effect as the test of the number of arguments
greater than zero that we used in earlier scripts.
If
.CW filelist
is a null string, no arguments have been specified, and so
it is time to display an error message and end the program,
using the shell's
.CW exit
command.
.IP 15
This line shows a feature of the shell we've seen before,
but it is still worthy of note because it may take a while
to remember.
The output of a command enclosed in backquotes
.CW `` ) (
can be substituted for the argument list of another
command.
That is what is happening here; the output of the
.CW spell
command is used as the pattern list of a
.CW for
loop.
.IP 17-18
You'll notice that
.CW spell
still flags all of the words it finds as errors.
But the
.CW for
loop then uses
.CW grep
to compare each word in the list generated by
.CW spell
with the contents of the dictionary.
Only those words
.I not
found in the dictionary are submitted for correction.
.IP
The pattern given to
.CW grep
is \(lqanchored\(rq by the special
pattern-matching characters
.CW ^
and
.CW $
(beginning and end of line,
respectively), so that only whole words in the dictionary
are matched.
Without these anchors, the presence of the word
.CW ditroff
in the list would prevent the discovery of misspellings like
.CW trof .
.IP 20-25
Sometimes it is difficult to tell beforehand whether an
apparent misspelling is really an error, or if it is correct
in context.
For example, in our sample run, the word
.CW textp
appeared to be an error, but was in fact part of a pathname,
and so correct.
Accordingly,
.CW proof
(again using
.CW grep )
gives
you the opportunity to look at each line containing the error
before you decide to change it or not.
.IP
As an aside, you'll notice a limitation of the script.
If, as is the case in our example, there are
multiple occurrences of a string, they must all
be changed or left alone as a set.
There is no provision for making individual edits.
.IP 26-48
After a word is offered as an error, you have the
option to correct it or leave it alone.
The script needs to
keep track of which words fall into each category, because words
that are not corrected may need to be added to the dictionary.
.IP
If you do want to make a correction, you type it in.
The variable
.CW correction
will now be nonzero and can be used as
the basis of a test
.CW "test -n" ). (
If you've typed in a correction,
.CW proof
first checks the files on the command line to see which
ones (there can be more than
.page 386
one) can be corrected.
.CW "grep -l" "" (
just gives the names of
files in which the string is found into the variable
.CW hitlist ,
and the script stores the names).
The edit is then applied to
each one of these files.
.IP 35
Just to be on the safe side, the script prints the
correction first, rather than making any edits.
(The
.CW -n
option causes
.CW sed
not to print the entire file on standard output, but
only to print lines that are explicitly requested for printing
with a
.CW p
command).
.ig
	The original had no closing ) in the paragraph above.
	So, I guessed at where one would be appropriate, and
	put it in.
	--Michael Hobgood
..
Used like this,
.CW sed
performs much the same
function as
.CW grep ,
only we are making an edit at the same time.
.IP 37-42
If the user approves the correction,
.CW sed
is used once again, this time to actually make the edit.
You should recognize this part of the script.
Remember, it is essential in this application to enclose
the expression used by
.CW sed
in quotation marks.
.IP 50-84
If you've understood the previous part of the shell
script, you should be able to decipher this part, which adds
words to the local dictionary.
The
.CW tr
command converts the spaces separating each word
in the
.CW excused
list into carriage returns.
They can then be printed in five tab-separated columns by
.CW pr .
Study this section of the program until you do,
because it is an excellent example of how UNIX programs that
appear to have a single, cut-and-dry function (or no clear
function at all to the uninitiated) can be used in unexpected
but effective ways.
.ix %end [proof] shell~script %key proof shell script
.ix %end proofreading, shell~script~for
.ix shell~scripts, proofreading script
