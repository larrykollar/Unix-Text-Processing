.ig
	Typed up by: Michael Hobgood
	Marked up by: Michael Hobgood
	Proofed on: 28 Oct 2002
..
.ig
	Three macros, used only to produce the example index
	for this chapter.  They merely kick in another
	environment to process the index within, and draw
	a nice tophat around the example output.  Matches
	closely the original book.
	--Michael Hobgood
..
.de ch18@start
.br
.ev ch16
.ll 6i
.po 1i
.in 0
.ps 10
.vs 12
.ft R
.fi
..
.de ch18@end
.br
.fc
.ta T 5n
.ev
..
.de TOPHAT
.br
\\L'\\$1p'\\v'-(\\$1p-2.5p)'\\l'1i'\\h'4i'\\l'1i'\\v'-2.5p'\\L'\\$1p'
..
.so utp.mac
.utp
.page 542
.Se 18 "Putting It All Together" "Chapter" 1
.ix [format] shell~script %key format shell script
Before returning to the topic of table of contents and
index processing, using shell tools that we will build,
let's review what we've covered so far.
.PP
We started with a promise to show you how the UNIX environment
could support and enhance the writing process.
To do that, we've had to delve into many details and
may have lost the big picture.
.PP
Let's return to that big picture here.
First, UNIX provides what any computer with even
rudimentary word-processing capabilities provides: the
ability to save and edit text.
Few of us write it perfectly the first time, so the
ability to rewrite the parts of a document we don't like
without retyping the parts we want to keep is a major step
forward.
.PP
However, no one will argue that UNIX offers better tools
at this simple level than those available in other
environments.
The
.CW vi
editor is a good editor, but it is not the easiest to learn
and lacks many standard word-processing capabilities.
.PP
Where UNIX's editing tools excel is in performing complex
or repetitive edits.
A beginner may have little use for pattern matching, but
an advanced user cannot do without it.
Few, if any, microcomputer-based or standalone word
processors can boast the sophisticated capabilities for
global changes that UNIX provides in even its most
primitive editors.
.PP
When you go beyond
.CW vi ,
and begin to use programs such as
.CW ex ,
.CW sed ,
and
.CW awk ,
you have unmatched text-editing capabilities\(empower,
if you will, at the expense of user friendliness.
.PP
Second, UNIX's hierarchical file system, multiuser
capabilities, and ample disk storage capacity make it
easy to organize large and complex writing jobs\(emespecially
ones involving the efforts of more than one
person.
This can be a major advantage of UNIX over
microcomputer-based or dedicated word processors.
.PP
Anyone who has tried to write a multiauthor work on a
floppy-based system knows how easy it is to lose track
of the latest version of a file, and to get lost among a
multitude of disks.
UNIX makes it easy to share files, and to set up a
consistent framework for managing them.
.page 543
.PP
In addition to storing multiple versions of documents on line,
you can use the file system to set up specific environments
for writing.
For example, a separate
.CW .exrc
file in each directory can define abbreviations and
command maps specific to a book or section.
.PP
Third, UNIX provides a wide range of formatting tools.
Using
.CW troff ,
.CW pic ,
.CW tbl ,
and
.CW eqn ,
you can easily typeset books.
This is not as unique and powerful a capability as it was
even two or three years ago.
The advent of low-cost laser printers and
.I wysiwyg
\(lqdesktop publishing\(rq
tools like Microsoft WORD, MacWrite,
and Aldus Pagemaker allow PC users to do typesetting
as well.
.PP
However, despite the glamour of desktop publishing, and the
easy-to-use appeal of products for the Macintosh, the
UNIX typesetting facilities offer many advantages.
Chief among these advantages is the very feature in which
.CW troff
at first seems much weaker than its low-end competitors,
namely, the use of embedded codes to control formatting.
.PP
.I Wysiwyg
systems are easy for beginners to use, and they are very
satisfying because you can immediately see what you are
going to get on the printed page.
But have you ever tried to make a global font change
in MacWrite?
Or had to make a change to a document after it was
\(lqpasted up\(rq
with Pagemaker?
Or had to wait endlessly while Microsoft WORD reformats
an entire document after you change the margins?
.PP
Because
.CW troff
codes can be edited, just like any other text in a file,
it is very easy to change your mind about formatting and
make global changes.
And after you have mastered the art of writing macros, it
is even easier to change formats simply by changing
macro definitions.
And because the editing and formatting functions are
separate, you don't have to wait for the computer while
you are making those changes\(emthat happens while you
print.
.PP
This is not to say that
.CW troff
is superior to the best possible
.I wysiwyg
system.
High-end systems from companies like Interleaf, Xyvision,
and Texet offer power, speed, and ease of use all at once.
Unfortunately, the software is costly, and requires the
use of high-cost bit-mapped workstations.
This can lead to a bottleneck in document production unless
you have enough money to spend on hardware.
Because
.CW troff
requires only a standard alphanumeric terminal, it provides
much more \(lqbang for the buck.\(rq
.PP
There is no question that the publishing system of the
future will be a
.I wysiwyg
system.
But for now, a low-cost UNIX system with
.CW vi
and
.CW troff
is still one of the most cost-effective publishing
systems around.
.PP
This brings us to the final strength of
UNIX\(emits extensibility.
More than an operating system or a collection of programs,
UNIX is a philosophy of computing.
Let's consider an analogy.
The Volkswagen beetle was a unique automobile of the
sixties and seventies.
Its simple design was one of the reasons that made it
popular; the \(lqbug\(rq was user-maintainable.
VW owners (\(lqusers\(rq) could tinker with their cars,
performing such tasks as changing spark plugs by hand.
They scoffed at owners of other cars who depended upon
mechanics.
It is perhaps this same feeling of
independence\(emlet me do it myself\(emthat the UNIX
environment fosters in its users.
There are many quite capable software environments that
are packaged to keep users out.
In some ways, the secret of UNIX is that its working
parts are visible.
The UNIX environment,
.page 544
like the VW beetle, is designed so that users can take it
apart and put it back together.
UNIX is a philosophy of computing.
As we've stressed again and again, UNIX provides
general-purpose tools, all of which are designed
to work together.
.PP
No single program, however well thought out, will solve
every problem.
There is always a special case, a special need, a situation
that runs counter to the expected.
But UNIX is not a single program: it is a collection of
hundreds.
And with these basic tools, a clever or dedicated person
can devise a way to meet just about any text-processing
need.
.PP
Like the fruits of any advanced system, these capabilities
don't fall unbidden into the hands of new users.
But they are there for the reaching.
And over time, even writers who want a word processor they
don't have to think about will gradually reach out
for these capabilities.
Faced with a choice between an hour spent on a boring,
repetitive task and an hour putting together a tool that
will do the task in a flash, most of us will choose to
tinker.
.PP
.ix table~of~contents
The index and table of contents mechanism in this chapter
is a good example of putting together individual UNIX
tools to do a job that no one of them can easily do alone.
Its explanation is a fitting end to this book, which has
tried throughout to put the UNIX text-processing tools
in a wider context.
.Ah "Saving an External Table of Contents"
As discussed in the last chapter,
.CW troff
does provide a mechanism (namely diversions) to collect
and process a table of contents directly within the
formatter.
However, this approach is best suited to short documents,
because it requires that the entire document be reformatted
to produce the table of contents.
.PP
Likewise, you could even produce and sort an index entirely
within
.CW troff ,
though the effort required would be large.
(In fact, a
recent article on Usenet, the online UNIX news network,
described an implementation of a sort algorithm using
.CW troff
macros.
It is painfully slow\(emit was done just to prove
that it could be done, rather
than for practical application).
.PP
The beauty of UNIX, though, is that you don't have to
stretch the limits of
.CW troff
to do everything necessary to produce a book.
Just as editing is separated from formatting, you can
separate processing the table of contents and the index
from formatting the rest of the text.
.PP
The
.CW troff
formatter provides the basic mechanisms for producing the
raw material\(emthe lists of headings or index terms,
accompanied by the
page numbers on which they occur.
However, the actual saving and processing of the raw
material is done with
.CW make ,
.CW sed ,
.CW awk ,
.CW sort ,
and the shell.
.PP
In Chapter 12, we began to look at how a shell script
(which we called
.CW format )
could manage the formatting process.
We used the programming power of the shell not only to
save the user the trouble of remembering command-line
options and complicated postprocessor names, but also
to apply the power of
.CW sed
to various ancillary formatting tasks.
.page 545
.PP
.ix [format] shell~script %key format shell script
The collection of a table of contents and index requires
that we first return to this script.
As we left Chapter 17, both the table of contents
and the index macros simply write data to standard error.
.PP
A Bourne shell user can redirect this error output to a
file using the following syntax:
.Ps
$ \f[CB]ditroff\fP \f[I]file\fP \f[CB]2>\fP \f[I]tocfile\fP
.Pe
The problem is that the table of contents, index entries,
and potential formatter error messages are all captured
in the same file.
We need a mechanism for parsing this file into its
separate elements.
The user could do this manually, but it is far better to let
a program do it.
.PP
The first step is to redirect all of the error output from
the formatter to a temporary file.
After formatting is done, we can use
.CW sed
to search for the identifying strings that we introduced
as part of the \(lqerror message\(rq and output
the matching
lines into separate files.
True error messages should be sent back to the screen, and
the temporary file removed.
.PP
The trick here is naming the files into which the saved
data is stored by
.CW sed .
It is not appropriate simply to append table of contents
data to one file, because we are likely to reformat a
document many times while rewriting and revising it.
Instead, we want to have a unique table of contents file
and a unique index file for each source file that
we format.
The best way to do this without cluttering up the current
directory is to create a subdirectory for each type of
data we want to save \(em
.CW toc ,
.CW index ,
and so on.
.PP
Let's look at how we did these things in the
.CW format
script:
.Ps
roff="ditroff -Tps"; files=""; options="-mS"
pre="| ditbl"; post="| devps "
sed="| sed -f /work/macros/new/cleanup.sed"
pages=""; toc="2>/tmp$$"; lp="| lp -s"
if [ ! -d index a ! -d toc ]; then
   echo "No index and toc. Use the buildmake command."
   toc="2>/dev/null"
fi
while [ "$#" != "0" ]; do
  case $1 in
    -?) echo "Format Options are:"
        echo "-m*   Specify other macro package (-mm)"
        echo "-s    Use small format (5-1/2 by 8-1/2)"
        echo "-o    Print selected pages"
        echo "-cg   Format for Compugraphic typesetter"
        echo "-E    Invoke EQN preprocessor"
        echo "-P    Invoke PIC preprocessor"
        echo "-G    Invoke GRAP & PIC preprocessors"
        echo "-x    Redirect output to /dev/null"
        echo "-y    Invoke nroff; pipe output to screen"
.	\" Note:
.	\" The original had a ; at the end of the previous line.
.	\" It was left off assuming that it was a typo.
        echo "-a    Set interactive troff -a option"
        echo "-*    Any troff option"; exit;;
    -m*) options="$1";;
.page 546
    -s) options="$options -rS1 -rv1";;
    -o) pages="$pages -o$1";toc="2>/dev/null";;
    -cg) roff="ditroff -Tcg86"; post="| ditplus -dtcg86";;
    -E) pre="$pre | dieqn";;
    -P) pre="| pic -T720 -D $pre";;
    -G) pre="| grap | pic -T720 -D $pre";;
    -x) options="$options -z"; post=""; lp="";;
    -y) roff="nroff"; post=""; lp="| col | pg";;
    -a) post=""; options="$options -a";;
    -*) options="$options $1";;
     *) if [ -f $1 ]; then
          files="$files $1"
          txfile="$1"
          if [ -d /print ]; then touch /print/$txfile
        else
          echo "USAGE: format (options) files"
          echo "To list options, type format -? "; exit
        fi;;
  esac
  shift
done
if [ -n "$files" -o ! -t 0 ]; then
# Use soelim to expand .so's in input files
#   otherwise use cat to send files down pipe.
 eval "cat $files $sed $pre |
       $roff $options - $toc $post $pages $toc $lp"
else echo "fmt:  no files specified"; exit
fi
if [ -f tmp$$ ]; then
   if [ -d toc ]; then
   sed -n -e "s/^><CONTENTS:\\(.*\\)/\\1/p" tmp$$ > toc/$txfile
   fi
   if [ -d index ]; then
   sed -n -e "s/^><INDEX:\\(.*\\)/\\1/p" tmp$$ > index/$txfile
   fi
   if [ -d figlist ]; then
   sed -n -e "s/^><FIGURE:\\(.*\\)/\\1/p" tmp$$ > figlist/$txfile
   fi
   if [ -d tablist ]; then
   sed -n -e "s/^><TABLE:\\(.*\\)/\\1/p" tmp$$ > tablist/$txfile
   fi
   sed -n "/^></!p"
   rm /tmp$$
fi
exit
.Pe
.page 547
Now, for example, when we format a file called
.CW ch01 ,
a file of the same name will be written in each of the
four subdirectories
.CW toc ,
.CW index ,
.CW figlist ,
and
.CW tablist .
Each time we reformat the same file, the output will
overwrite the previous contents of each accessory file,
giving us the most up-to-date version.
When we use the
.CW -o
option for only partial formatting, writing out of these
files is disabled by redirecting error output to
.CW /dev/null ,
so that we don't end up with a partial table of contents
file.
.PP
There's also a
.CW -x
option, to allow us to format a file to produce the table
of contents and index without producing any regular
output.
This option uses
.CW troff 's
.CW -z
option to suppress formatted output, and sets the
.CW post
and
.CW lp
shell variables to the null string.
.PP
(You may also notice the
.CW -cg
option, which specifies a different device to both
.CW troff
and the postprocessor\(emin this case,
a Compugraphic typesetter instead of an
Apple LaserWriter.
This is included as an aside, to give you an idea of how
this is done).
.PP
The contents of the
.CW toc ,
.CW figlist ,
and
.CW tablist
directories can be assembled into a complete table of
contents, or formatted on the spot for a chapter-level
table of contents.
We can use the following simple sequence of commands
(which could be saved into a shell script):
.Ps
echo .ta \\n(LLu-5n \\n(LLuR  > book.toc
echo .ce >> book.toc
echo \\f3TABLE OF CONTENTS\\fP >> book.toc
echo .sp 2 >> book.toc
echo "\\t\\f3Page\\fP" >> book.toc
cat /toc/ch?? /toc/app? >> book.toc
echo .bp >> book.toc
cat /figlist/ch?? /figlist/app? >> book.toc
echo .bp >> book.toc
cat /tablist/ch?? /tablist/app? >> book.toc
.Pe
The resulting
.CW book.toc
source file looks like this:
.Ps
\&.ta \\n(LLu-5n \\n(LLuR
\&.ce
\\f3TABLE OF CONTENTS\\fP
\&.sp 2
|\(em\(em\(em|\\f3Page\\fP
\&.sp 3
Chapter 1 Introduction to Alcuin
\&.sp 1.5
1.1      A Tradition of Calligraphic Excellence\\a\\t1-2
1.2      Illuminated Bit-Mapped Manuscripts\\a\\t1-4
\&.sp 3
Chapter 2 Getting Started with Alcuin
\&.sp 1.5
2.1      Objectives of this Session\\a\\t2-1
2.2      Starting Up the System\\a\\t2-2
.page 548
2.2.1        Power-up Procedure\\a\\t2-2
\&.
\&.
\&.
.Pe
The index will require more serious postprocessing.
.ix indexing
.Ah "Index Processing"
It is relatively simple to assemble the components of a
table of contents into sequential order, but it is much
more difficult to process the index entries, because they
must be sorted and manipulated in a variety of ways.
.PP
This is one of the most complex tasks presented in this
book.
So let's start at the beginning, with the raw data that
is output by
.CW troff ,
and directed to our index subdirectory by the
.CW format
shell script.
For illustration, we'll assume a sparse index for a short
book containing only three chapters.
.PP
As you may recall, the user creates the index simply
by entering macro calls of the form:
.ix indexing, form~of user~entries
.Ps
\&.XX "input devices"
.Pe
or:
.Ps
\&.XX "input devices, mouse"
.Pe
or:
.Ps
\&.XR "mouse (see input devices)"
.Pe
throughout the text.
Both macros write their arguments to standard output;
the
.CW \&.XX
macro adds the current page number, but the
.CW \&.XR
.I "cross reference" ) (
macro does not.
The user is responsible for using consistent terminology,
capitalization, and spelling.
A comma separates optional subordinate entries from the
major term.
.PP
An index term should be entered on any page that the user
wants indexed\(emat the start and end of a major topic,
at least, and
perhaps several in between if the discussion spans
several pages.
.PP
In our example, entries are saved into the three files
.CW ch01 ,
.CW ch02 ,
and
.CW ch03
in the order in which they appear in the respective
input files.
The indexing term entered by the user is printed,
separated from the current page number by a tab.
Certain cross reference entries do not have a page
number.
The content of the raw index files after chapters 1
through 3 have been formatted follows.
(Here, and in the following discussion, a tab is
represented by the symbol
.CW |\(em\(em\(em| ).
.Ps
$ \f[CB]cat index/ch??\fP
Alcuin, overview of|\(em\(em\(em|1-1
illuminated manuscripts|\(em\(em\(em|1-1
fonts, designing|\(em\(em\(em|1-2
Alcuin, supported input devices|\(em\(em\(em|1-2
input devices|\(em\(em\(em|1-2
input devices, mouse|\(em\(em\(em|1-2
input devices|\(em\(em\(em|1-2
mouse (see input devices)
.page 549
input devices, bit pad|\(em\(em\(em|1-3
bit pad (see input devices)
input devices|\(em\(em\(em|1-3
startup, of system|\(em\(em\(em|2-1
power, location of main switch|\(em\(em\(em|2-1
power, for graphics display|\(em\(em\(em|2-1
startup, of system|\(em\(em\(em|2-2
input devices, mouse|\(em\(em\(em|2-2
input devices, bit pad|\(em\(em\(em|2-3
fonts, selecting|\(em\(em\(em|3-1
glyphs, designing|\(em\(em\(em|3-2
extra line space|\(em\(em\(em|3-3
symbolic names|\(em\(em\(em|3-3
@ operator|\(em\(em\(em|3-4
.Pe
To create a presentable index from this raw data, we
need to do the following:
.RS
.Ls B
.Li
Sort the entries into dictionary order, and remove
duplicates, if any.
(Duplicate entries occur whenever the user enters
.CW .XX
macros with the same argument over several input pages,
and two or more of those entries fall on the same
output page).
.Li
Combine multiple occurrences of the same term, appending
a complete list of page numbers and properly
subordinating secondary terms.
.Li
Introduce formatting codes, so that the resulting file
will have a pleasing, consistent appearance.
.Le
.RE
Just how complex a task this is may not be immediately
apparent, but rest assured that it takes the combined
operations of
.CW sort ,
.CW uniq ,
and several different
.CW awk
and
.CW sed
scripts to do the job properly.
.PP
Fortunately, we can hide all of this complexity within
a single shell program, so that all the user needs to
type is:
.Ps
$ \f[CB]cat index/\fP\f[I]files\fP \f[CB]| indexprog > book.ndx\fP
.Pe
.Bh "Sorting the Raw Index"
.ix [sort] command %key sort command
.ix indexing, sorting raw entries
The first part of
.CW indexprog
processes the index entries before they are passed to
.CW awk .
The
.CW sort
program prepares a list of alphabetical index entries;
.CW uniq
removes duplicate entries.
.Ps
sort -t\\|\(em\(em\(em| -bf +0 -1 +1n | uniq
.Pe
The options to the
.CW sort
command specify primary and secondary sort operations,
affecting the first and second fields separately.
The
.CW -t
option specifies that a tab character separates fields.
The primary sort is alphabetic and performed on the
indexing term; the secondary sort is numeric and
performed on the page number.
The primary sort is also controlled by the following
options: the
.CW -b
option (ignore leading blanks
.page 550
in making comparisons) is a safety feature; the
.CW -f
(fold uppercase and lowercase letters) is more important
because the default sort order places all uppercase
letters before all lowercase ones; and
.CW "+0 -1"
ensures that the alphabetic sort considers only the
first field.
The secondary sort that is performed on the second field
.CW +1n ) (
is numeric and ensures that page numbers will appear in
sequence.
.PP
Now let's look at the index entries after they have
been sorted:
.Ps
@ operator|\(em\(em\(em|3-4
Alcuin, overview of|\(em\(em\(em|1-1
Alcuin, supported input devices|\(em\(em\(em|1-2
bit pad (see input devices)
extra line space|\(em\(em\(em|3-3
fonts, designing|\(em\(em\(em|1-2
.	\" Note:
.	\" the previous line was missing the tab symbol in the
.	\" original.
fonts, selecting|\(em\(em\(em|3-1
glyphs, designing|\(em\(em\(em|3-2
illuminated manuscripts|\(em\(em\(em|1-1
input devices|\(em\(em\(em|1-2
input devices|\(em\(em\(em|1-3
input devices, bit pad|\(em\(em\(em|1-3
input devices, bit pad|\(em\(em\(em|2-3
input devices, mouse|\(em\(em\(em|1-2
input devices, mouse|\(em\(em\(em|2-2
mouse (see input devices)
power, for graphics display|\(em\(em\(em|2-1
power, location of main switch|\(em\(em\(em|2-1
startup, of system|\(em\(em\(em|2-1
startup, of system|\(em\(em\(em|2-2
symbolic names|\(em\(em\(em|3-3
.Pe
Multiple entries that differ only in their page number
are now arranged one after the other.
.PP
The
.CW sort
command is a simple way to obtain a sorted list of entries.
However, sorting can actually be a complicated process.
For instance, the simple
.CW sort
command that we showed above obviously works fine on our
limited sample of entries.
And while it is designed to process entries with
section-page numbering
.I 4-1,4-2,4-3 ), (
this command also works fine when sorting entries with
continuous page numbering
.I 1,2,3 ). (
.PP
However, section page numbering does present a few
additional problems that we did not encounter here.
Two-digit section numbers and page numbers, as well as
appendices
.I A-1,A-2,A-3 ) (
will not be sorted correctly.
For instance, this might cause the indexing program to
produce the following entry:
.Ps
Alcuin, software A-2, 1-1, 1-10, 1-3, 11-5, 2-1
.Pe
There are two ways to handle this problem.
One is to change the indexing macro in
.CW troff
so that it produces three fields.
Then the sorting command can sort on the section
number independent of the page number.
(Because our
.CW awk
portion of the indexing
.page 551
program is set up to operate on entries with one or two
fields, you'd have to change the program or use a
.CW sed
script to reduce the number of fields).
.PP
The second method uses
.CW sed
to replace the hyphen with a tab, creating three fields.
Actually, we run a
.CW sed
script
.I before
the entries are sorted and another one
.I after
that operation to restore the entry.
Then
.CW sort
will treat section numbers and page numbers separately
in secondary numeric sort operations, and get them in
the right order.
.PP
The only remaining problem is how to handle appendices.
What happens is that when a numeric sort is performed on
section numbers, lettered appendices are sorted to the
top of the list.
This requires cloaking the letter in a numeric disguise.
Presuming that we won't have section numbers greater than
99, our
.CW sed
script prepends the number 100 to each letter; this number
is also removed afterwards.
.Ps
sed '
    s/|\(em\(em\(em|\\([0-9][0-9]*\\)-/|\(em\(em\(em|\\1|\(em\(em\(em|/
    s/|\(em\(em\(em|\\([A-Z]\\)-/|\(em\(em\(em|100\\1|\(em\(em\(em|/' |
sort -t\\    -bf +0 -1 +1n +2n | uniq |
sed '
    s/|\(em\(em\(em|100\\([A-Z]\\)|\(em\(em\(em|/|\(em\(em\(em|\\1-/
    s/\\(|\(em\(em\(em|.*\\)|\(em\(em\(em|/\\1-/'
.Pe
Now the sorting operation of our index program handles
a wider range of entries.
.Bh "Building the Page Number List"
.ix %begin [awk] %key awk
.ix %begin [awk], used~for indexing %key awk, used for indexing
.ix indexing, building~the page~number list
The next step is more complex.
We must now combine multiple occurrences of each term
that differ only in the page number, and combine all
of the page numbers into a single list.
The
.CW awk
program is the tool of choice.
We can use a script for comparing and manipulating
successive lines similar to the one described in
Chapter 13.
We begin by building the page number list for each entry.
.Ps
awk '
BEGIN { ORS = ""; FS = "|\(em\(em\(em|" }
NF == 1 { if (NR == 1) printf ("%s", $0);
          else printf ("\\n%s", $0) }
NF > 1 {
 if ($1 == curr)
  printf (",%s", $2)
 else  {
  if (NR == 1) printf ("%s", $0)
   else printf ("\\n%s", $0)
   curr = $1
   }
}'
.Pe
.ix %end [awk] %key awk
First, the program sets the output record separator
.CW ORS ) (
to the null string, rather than the default
newline.
This means that output records will be appended to
the same line, unless we specify an explicit newline.
.page 552
.PP
Second, it sets the field separator
.CW FS ) (
to the tab character.
This divides each index entry into two fields: one
containing the text, the other containing the page
number.
(As you may recall, the page number is separated from
the text of the entry by a tab when it is output from
.CW troff ).
.PP
Then, if the number of fields
.CW NF ) (
is 1 (that is, if there is no tab-separated
page number, as is the case with cross reference entries
generated with
.CW \&.XR ),
the program prints out the entire record
.CW $0 ). (
If this is not the first line in the file
.CW "NR = 1" ), (
it precedes the record with an
explicit newline
.CW \en ). (
.PP
If the number of fields is greater than 1 (which is
the case for each line containing a tab followed by a
page number), the program compares the text of the
entry in the first field
.CW $1 ) (
with its previous value, as stored into the variable
.CW curr .
.PP
The next few lines might be easier to understand if
the condition were written in reverse order:
.Ps
if ($1 != curr)
{ if (NR == 1) printf ("%s", $0)
  else printf ("\\n%s", $0)
  curr = $1
}
else printf (",%s", $2)
.Pe
.PP
If the first field is not equal to
.CW curr ,
then this is a new entry, so the program prints out the
entire record (again preceding it with an explicit
newline if this is not the first line of the file).
The value of
.CW curr
is updated to form the basis of comparison for
the next record.
.PP
Otherwise (if the first field in the current record is
the same as the contents of the variable
.CW curr ),
the program appends a comma followed by the value of the
second field
.CW $2 ) (
to the current record.
.PP
The output after this stage of the program looks like this:
.Ps
@ operator|\(em\(em\(em|3-4
Alcuin, overview of|\(em\(em\(em|1-1
Alcuin, supported input devices|\(em\(em\(em|1-2
bit pad (see input devices)
extra line space|\(em\(em\(em|3-3
fonts, designing|\(em\(em\(em|1-2
.	\" Note:
.	\" again, the original did not have the tab symbol
.	\" in the previous line. Added to fix the typo
fonts, selecting|\(em\(em\(em|3-1
glyphs, designing|\(em\(em\(em|3-2
illuminated manuscripts|\(em\(em\(em|1-1
input devices|\(em\(em\(em|1-2,1-3
input devices, bit pad|\(em\(em\(em|1-3,2-3
input devices, mouse|\(em\(em\(em|1-2,2-2
mouse (see input devices)
power, for graphics display|\(em\(em\(em|2-1
power, location of main switch|\(em\(em\(em|2-1
startup, of system|\(em\(em\(em|2-1,2-2
symbolic names|\(em\(em\(em|3-3
.Pe
.page 553
.Bh "Subordinating Secondary Entries"
.ix indexing, subordinating secondary entries
The next trick is to subordinate secondary entries under
the main entry, without reprinting the text of the
main entry.
In addition, we want to represent consecutive page
numbers as a range separated by two dots
.CW \&.. ) (
rather than as a list of individual pages.
We'll show this script in two sections:
.ix [awk], subdividing~a field %key awk, subdividing a field
.Ps
awk '
BEGIN  { FS = "|\(em\(em\(em|";}
{
n = split ($1, curentry, ",")
if (curentry[1] == lastentry[1])
  printf ("  %s",curentry[2])
else {
  if (n > 1) printf ("%s\\n  %s", curentry[1], curentry[2])
  else printf ("%s", $1)
  lastentry[1] = curentry[1]
  }
}
.Pe
This section of the script uses
.CW awk 's
.CW split
function to break the first field into two parts,
using a comma as a separator.
.PP
There are several cases that the program has to consider:
.RS
.Ls B
.Li
The text of the entry does not contain a comma, in which
case we can just print the entire first field.
See line 9:
\f[C]printf ("%s", $1).\fP
.Li
The entry does contain a comma, in which case we want
to see if we have a new primary term
(\f[C]curentry[1]\fP)
or just a new secondary one
(\f[C]curentry[2]\fP).
.Li
If the primary term is the same as the last primary term
encountered (and saved into the variable
\f[C]lastentry\fP),
we only need to print out the secondary term.
See line 6:
\f[C]printf ("%s", curentry[2]).\fP
.Li
Otherwise, we want to print out both the primary and
secondary terms: See line 8:
\f[C]printf ("%s\\n %s", curentry[1], curentry[2]).\fP
.Le
.RE
For example:
.Ps
@ operator|\(em\(em\(em|3-4
Alcuin, overview of|\(em\(em\(em|1-1
Alcuin, supported input devices|\(em\(em\(em|1-2
.Pe
When the first line is processed, the split will return
a value of 0, so the entire line will be output.
.PP
When the second line is processed,
.CW lastentry
contains the string
.I "@ operator" ,
.CW curentry[1]
contains
.I Alcuin ,
and
.CW curentry[2]
contains
.I "overview of" .
Because
.CW lastentry
is not the same as
.CW curentry[1] ,
the program prints out both
.CW curentry[1]
and
.CW curentry[2] .
.page 554
.PP
When the third line is processed,
.CW curentry[1]
again contains the word
.I Alcuin ,
but
.CW curentry[2]
contains the words
.I "supported input devices" .
In this case, only
.CW curentry[2]
is printed.
.PP
The next part of the script, which follows, looks
considerably more complicated, but uses essentially
the same mechanism.
It splits the second field on the line (the page
number list) on the hyphens that separate section
number from page number.
Then, it compares the various sections it has split to
determine whether or not it is dealing with
a range of consecutive pages.
If so, it prints only the first and last members of the
series, separating them with the range notation
.CW \&.. ). (
.PP
If you were able to follow the previous portion of the
script, you should be able to piece this one together
as well:
.Ps
NF == 1{ printf ("\\n") }
(NF > 1) && ($2 !~ /.*_.*/) {
  printf ("\\t")
  n = split ($2, arr, ",")
  printf ("%s", arr[1])
  split (arr[1], last, "-")
  for (i = 2; i <= n; ++i) {
  split (arr[i], curr, "-")
  if ((curr[1] == last[1]) && (curr[2]/1 == last[2]/1+1)) {
    if (i != n) {
      split (arr[i+1], follow, "-")
      if ((curr[1] != follow[1]) || (curr[2]/1+1 != follow[2]/1))
        printf ("..%s", arr[i])
    } else printf ("..%s", arr[i])
  } else printf (", %s", arr[i])
  last[1] = curr[1]; last[2] = curr[2]
}
printf ("\\n")
}'
.Pe
The output from this
.CW awk
program (in sequence with the previous ones) now looks
like this:
.Ps
@ operator|\(em\(em\(em|3-4
Alcuin
   overview of|\(em\(em\(em|1-1
   supported input devices|\(em\(em\(em|1-2
bit pad (see input devices)
extra line space|\(em\(em\(em|3-3
fonts
   designing|\(em\(em\(em|1-2
.	\" Note:
.	\" again, the original should have had the tab symbol
   selecting|\(em\(em\(em|3-1
glyphs
   designing|\(em\(em\(em|3-2
illuminated manuscripts|\(em\(em\(em|1-1
input devices|\(em\(em\(em|1-2..1-3
   bit pad|\(em\(em\(em|1-3, 2-3
   mouse|\(em\(em\(em|1-2, 2-2
mouse (see input devices)
.page 555
power
   for graphics display|\(em\(em\(em|2-1
   location of main switch|\(em\(em\(em|2-1
startup
   of system|\(em\(em\(em|2-1..2-2
symbolic names|\(em\(em\(em|3-3
.Pe
That's starting to look like an index!
.Bh "Adding Formatting Codes"
.ix indexing, adding formatting~codes
We could simply quit here, and let the user finish
formatting the index.
However,
.CW awk
can continue the job and insert formatting codes.
.PP
We'd like
.CW awk
to put in headings and divide the index into
alphabetic sections.
In addition, it would be nice to insert indentation
requests, so that we can format the index source
file in fill mode, so that any long lines will
wrap correctly.
.PP
Let's look at the coded output before we look at the
script that produces it.
Only the beginning of the output is shown:
.Ps
\&.ti -4n
@ operator|\(em\(em\(em|3-4
\&.br

\&.ne 4
\&.ti -2n
\\fBA\\fR
\&.br
\&.ne 2
\&.ti -4n
Alcuin
\&.br
\&.ti -4n
  overview of|\(em\(em\(em|1-1
\&.br
\&.ti -4n
  supported input devices|\(em\(em\(em|1-2
\&.br

\&.ne 4
\&.ti -2n
\\fBB\\fR
\&.br
\&.ne 2
\&.ti -4n
bit pad (see input devices)
\&.br
.page 556
\&.ne 4
\&.ti -2n
\\fBE\\fR
\&.br
\&.ne 2
\&.ti -4n
extra line space|\(em\(em\(em|3-3
\&.br
.Pe
.PP
Here's a script that does this part of the job:
.Ps
awk '
BEGIN {OFS = ""
  lower = "abcdefghijklmnopqrstuvwxyz"
  upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
}
NF > 0 {
  if ($0 !~ /^ .*/) {
    n = 1
    while ((newchar = substr($1,n,1)) !~ /[A-Za-z]/) {
      n = n + 1
      if (n == 100) { # bad line
        newchar = oldchar
        break
      }
    }
    if (newchar ~ /[a-z]/) {
      for (i = 1; i <= 26; ++i) {
        if (newchar == substr (lower, i, 1)) {
          newchar = substr (upper, i, 1)
          break
         }
      }
    }
    if (substr($1,1,1)  ~ /[0-9]/)
      newchar = ""
    if (newchar != oldchar) {
      printf ("\\n\\n%s\\n", ".ne 4")
      printf ("%s\\n", ".ti -2n")
      printf ("%s%s%s\\n", "\\\\fB", newchar, "\\\\fR")
      printf ("%s\\n", ".br")
      oldchar = newchar }
    printf ("%s\\n", ".ne 2")
  }
  printf ("%s\\n", ".ti -4n")
  printf ("%s\\n", $0)
.page 557
  printf ("%s\\n", ".br")
}'
.Pe
Every line in the input
.CW "NF > 1" ) (
will be subjected to the last three lines in the
program.
It will be surrounded by formatting codes and printed out.
.Ps
printf ("%s\\n", ".ti -4n")
printf ("%s\\n", $0)
printf ("%s\\n", ".br")
.Pe
The rest of the script checks when the initial character
of a primary entry changes and prints a heading.
.PP
As you may have noticed, in the output of the previous
script, secondary entries were indented by three leading
spaces.
They can be excluded from consideration at the outset
by the condition:
.Ps
if ($0 !~ /^ .*/) {
.Pe
All other lines are checked to determine their initial
character.
The
.CW awk
program's
.ix [awk], [substr] function %key awk, [substr] function
.CW substr
function extracts the first letter of each line.
Then, much as it did before, the program compares each
entry with the previous until it detects a change.
.PP
The program is basically looking for alphabetic characters,
but must test (especially in computer manuals) for strings
that begin with nonalphabetic characters.
(If it doesn't do this, it will loop endlessly when it
comes to a string that doesn't begin with an
alphabetic character).
If the program loops 100 times on a single line,
it assumes that the character is nonalphabetic, breaks
out of the loop, and goes on to the next line.
.PP
When the program finds a change in the initial alphabetic
character, it prints a heading consisting of a single
capital letter and associated formatting requests.
.PP
Primary terms beginning with nonalphabetic characters are
output without causing a change of heading.
(Because they are already sorted to the beginning of
the file, they will all be listed at the head of the
output before the A's).
.ix %end [awk], used~for indexing %key awk, used for indexing
.Bh "Final Formatting Touches"
.ix indexing, final formatting~codes
Having come this far, it hardly seems fair not to finish
the job, and put in the final formatting codes that will
allow us to format and print the index without ever
looking at the source file (although we should save it
to allow manual fine-tuning if necessary).
.PP
.ix %begin [sed] editor, used~in indexing script %key sed editor, used in indexing script
A simple
.CW sed
script can be used for these final touches:
.Ps
sed "1i\\\\
\&.Se \\"\\" \\"Index\\"\\\\
\&.in +4n\\\\
\&.MC 3.15i 0.2i\\\\
\&.ds RF Index - \\\\\\\\\\\\\\\\n(PN\\\\
\&.ds CF\\\\
\&.ds LF\\\\
\&.na
s/|\(em\(em\(em|/  /"
.Pe
.page 558
Assuming that we're using our extended
.CW ms
macros, these initial macros will create the section
heading
.I Index ,
print the index in two columns, and use a page number
of the form
\f[CW]Index-\fIn\fR.
(Note how many backslashes are necessary before the
number register invocation for
.CW PN .
Backslashes must be protected from the shell,
.CW sed ,
and
.CW troff .
This line will be processed quite a few times, by
different programs, before it is output).
.PP
Finally, the script converts the tab separating the index
entry from the first page number into a pair of spaces.
.Bh "Special Cases"
.ix indexing, special formatting problems
But our indexing script is not complete.
There are a number of special cases still to consider.
For example, what about font changes within index entries?
In a computer manual, it may be desirable to carry
through \(lqcomputer voice\(rq or italics into the index.
.PP
However, the
.CW troff
font-switch codes will interfere with the proper sorting
of the index.
There is a way around this\(emawkward, but effective.
As you may recall, we use a
.CW sed
script named
.CW cleanup.sed
called from within
.CW format .
This script changes double quotation marks to pairs of
matched single quotation marks for typesetting,
and changes double hyphens to em dashes.
We can also use it to solve our current problem.
.PP
First, we add the following lines to
.CW cleanup.sed:
.Ps
/^\\.X[XR]/{
         s/\\\\\\(fP\\)/%%~/g
         s/\\\\\\(fS\\)/%%~~/g
         s/\\\\\\(fB\\)/%%~~~/g
         s/\\\\\\(fI\\)/%%~~~~/g
         s/\\\\\\(fR\\)/%%~~~~~/g
         s/\\\\\\(f(CW\\)/%%~~~~~~/g
}
.Pe
Within an
.CW \&.XX
or
.CW \&.XR
macro, the script will change the standard
.CW troff
font-switch codes into an arbitrary string of nonalphabetic
characters.
.PP
Then we add the
.CW -d
option
.I "dictionary order" ) (
to our initial
.CW sort
command in the index program.
This option causes
.CW sort
to ignore nonalphabetic characters when making comparisons.
(The exception will be lines like
.CW @
.I operator ,
which contain no alphabetic characters in the first field.
Such lines will still be sorted to the front of the list).
.PP
Finally, we use the concluding
.CW sed
script in the indexing sequence to restore the proper
font-switch codes in the final index source file:
.Ps
s/%%~~~~~~/\\\\\\\\f(CW/g
s/%%~~~~~/\\\\\\\\fR/g
s/%%~~~~/\\\\\\\\fI/g
s/%%~~~/\\\\\\\\fB/g
s/%%~~/\\\\\\\\fS/g
s/%%~/\\\\\\\\fP/g
.Pe
.ix %end [sed] editor, used~in indexing script %key sed editor, used in indexing script
.page 559
We might also want to consider the case in which a leading
period (as might occur if we were indexing
.CW troff
formatting requests) appears in an index entry.
Inserting the following line one line from the end of the
last
.CW awk
script we created will do the trick.
These lines insulate
.CW troff
codes in index entries from the formatter when the index
source file is processed by
.CW troff
for final printing:
.Ps
if ($0 ~ /^\\..*/) printf ("\\\\&")
if ($0 ~ /^%%~~*\\./) printf ("\\\\&")
.Pe
Lines beginning with a
.CW .
will be preceded with a
.CW troff
zero-width character
.CW \e& ). (
.Bh "The Entire Index Program"
We have broken the indexing process into stages to make
it easier to understand.
However, there is no need to keep individual
.CW awk
and
.CW sed
scripts; they can be combined into a single shell program
simply by piping the output of one portion to another,
within the shell program.
.ix [format] shell~script %key format shell script
.PP
Here's the whole program, as finally assembled:
.Ps
sed '
    s/|\(em\(em\(em|\\([0-9][0-9]*\\)-/|\(em\(em\(em|\\1|\(em\(em\(em|/
    s/|\(em\(em\(em|\\([A-Z]\\)-/|\(em\(em\(em|100\\1|\(em\(em\(em|/' |
sort -t\\|\(em\(em\(em| -bdf +0 -1 +1n +2n | uniq |
sed '
    s/|\(em\(em\(em|100\\([A-Z]\\)|\(em\(em\(em|/|\(em\(em\(em|\\1-/
    s/\\(|\(em\(em\(em|.*\\)|\(em\(em\(em|/\\1-/' |
awk '
BEGIN { ORS = ""; FS = "|\(em\(em\(em|" }
NF == 1 { if (NR == 1) printf ("%s", $0);
.	\" Note:
.	\" is the ; needed in the previous line?
          else printf ("\\n%s", $0) }
NF > 1 {
 if ($1 == curr)
  printf (",%s", $2)
 else  {
  if (NR == 1) printf ("%s", $0)
   else printf ("\\n%s", $0)
   curr = $1
   }
}' | awk'
BEGIN  { FS = "|\(em\(em\(em|";}
{
n = split ($1, curentry, ",")
if (curentry[1] == lastentry[1])
  printf ("  %s",curentry[2])
else {
  if (n > 1) printf ("%s\\n  %s", curentry[1], curentry[2])
.page 560
  else printf ("%s", $1)
  lastentry[1] = curentry[1]
  }
}
NF == 1{ printf ("\\n") }
(NF > 1) && ($2 !~ /.*_.*/) {
  printf ("\\t")
  n = split ($2, arr, ",")
  printf ("%s", arr[1])
  split (arr[1], last, "-")
  for (i = 2; i <= n; ++i) {
  split (arr[i], curr, "-")
  if ((curr[1] == last[1]) && (curr[2]/1 == last[2]/1+1)) {
    if (i != n) {
      split (arr[i+1], follow, "-")
      if ((curr[1] != follow[1]) || (curr[2]/1+1 != follow[2]/1))
        printf ("..%s", arr[i])
    } else printf ("..%s", arr[i])
  } else printf (", %s", arr[i])
  last[1] = curr[1]; last[2] = curr[2]
}
printf ("\\n")
}' awk'
BEGIN {OFS = ""
  lower = "abcdefghijklmnopqrstuvwxyz"
  upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
}
NF > 0 {
  if ($0 !~ /^ .*/) {
    n = 1
    while ((newchar = substr($1,n,1)) !~ /[A-Za-z]/) {
      n = n + 1
      if (n == 100) { # bad line
        newchar = oldchar
        break
      }
    }
    if (newchar ~ /[a-z]/) {
      for (i = 1; i <= 26; ++i) {
        if (newchar == substr (lower, i, 1)) {
          newchar = substr (upper, i, 1)
          break
         }
      }
    }
.page 561
    if (substr($1,1,1)  ~ /[0-9]/)
      newchar = ""
    if (newchar != oldchar) {
      printf ("\\n\\n%s\\n", ".ne 4")
      printf ("%s\\n", ".ti -2n")
      printf ("%s%s%s\\n", "\\\\fB", newchar, "\\\\fR")
      printf ("%s\\n", ".br")
      oldchar = newchar
    }
    printf ("%s\\n", ".ne 2")
  }
  printf ("%s\\n", ".ti -4n")
  if ($0 ~ /^\\..*/) printf ("\\\\&")
       if ($0 ~ /^%%~~*\\./) printf ("\\\\&")
  printf ("%s\\n", $0)
  printf ("%s\\n", ".br")
}' | sed "1i\\\\
\&.Se \\"\\" \\"Index\\"\\\\
\&.in +4n\\\\
\&.MC 3.4i 0.2i\\\\
\&.ds RF Index - \\\\\\\\\\\\\\\\n(PN\\\\
\&.ds CF\\\\
\&.ds LF\\\\
\&.na
.	\" Note:
.	\" these actually undo the cleanup.sed stuff
.	\" refer to page 558
s/%%~~~~~~/\\\\\\\\f(CW/g
s/%%~~~~~/\\\\\\\\fR/g
s/%%~~~~/\\\\\\\\fI/g
s/%%~~~/\\\\\\\\fB/g
s/%%~~/\\\\\\\\fS/g
s/%%~/\\\\\\\\fP/g"
.Pe
The result of all this processing is source text that can
be piped directly to the formatter, saved in a file for
later formatting (or perhaps minor editing), or both
(using
.CW tee
to \(lqsplit\(rq standard output into two streams, one of
which is saved in a file).
.PP
Assuming that the various raw source files produced by
.CW troff
are stored in a subdirectory called
.CW indexfiles ,
and that the index script is called
.CW indexprog ,
we can format and print the index as follows:
.Ps
$ \f[CB]cat indexfiles/* | indexprog | ditroff -mS | ... | lp\fP
.Pe
The result will look something like this:
.sp 1v
.page 562
.ch18@start
.TOPHAT 310
.in 5n
.ll 5.75i
.ps 24
.vs 26
.sp
INDEX
.br
.Hl
.sp
.ps 10
.vs 12
.TS
expand, tab(#);
l lw(3i).
.ft B
@ operator 3-4#\0P
#power
#\0for graphics display  2-1
\0A#\0location of main switch  2-1
Alcuin#
\0overview of  1-1#
\0supported input devices  1-2#\0S
#startup
#\0of system  2-1\(em2-2
\0B#symbolic names  3-3
bit pad (see input devices)#
.TE
.ll 5.5i
.ce 3
\(bu
.sp
\(bu
.sp
\(bu
.ch18@end
.Ah "Let \f[CB]make\fP Remember the Details"
.ix [make] command, coordinating final book~production~with %key make command, coordinating final book production~with
Even though we've hidden the really complex details of
index processing inside a shell script, and the format
shell script itself handles a lot of the dirty work, there
is still a lot for the user to keep track of.
The
.CW make
utility introduced in Chapter 11 can take us a long way
towards making sure that everything that needs to happen
for final production of the finished book comes together
without a hitch.
.PP
Here are some of the things we want to make sure have
been done:
.ix final book production
.RS
.Ls B
.Li
All of the relevant sections have been printed in their
most up-to-date form.
Odd as it may seem, it is possible to have last minute
changes to a file that never make it into the printed
book.
.Li
The book has been proofed using whatever automatic tools
we have provided, including the
.CW proof
and
.CW double
shell scripts (or
.CW wwb
if you have it).
All \(lqreview notes\(rq embedded in the text must also be
satisfied and removed.
.Li
An updated table of contents and index have been printed.
.Le
.RE
You can probably think of others as well.
.page 563
.PP
The
.CW make
utility is the perfect tool for this job.
We've already seen in Chapter 11 how it can be used to
specify the files (and the formatting options) required
for each section of the book.
Unfortunately, this part of the job requires that you
keep formatted output files, which are quite large.
If disk space is a problem, this drawback might lead you
to think that
.CW make
isn't worth the bother.
.PP
However, with a little thought, you can get around this
restriction.
Instead of keeping the formatted output file, you can
keep a zero-length file that you
.CW touch
whenever you format the source file.
You could add the following line to the end of the
.CW format
script:
.Ps
touch print/$file
.Pe
Or, if you use
.CW make
itself to print your document, you could put the
.CW touch
command into the makefile.
Your makefile might look like this:
.Ps
book: print/ch01 print/ch02 print/ch03...

print/ch01 : ch01
    sh /usr/local/bin/format -mS -rv1 -rS2 ch01
    touch print/ch01

print/ch02 : ch02
    sh /usr/local/bin/format -mS -P -rv1 -rS2 ch02
	touch print/ch02
				\&.
				\&.
				\&.
.Pe
Notice that in order to execute the local formatting shell
script, it is necessary to execute
.CW sh
and specify the complete pathname.
The options specified with the
.CW format
shell script can be specific to each file that is formatted.
However, generally you want to use the same options to
format all the files that make up a particular document.
Using variables, you can create a more generalized
makefile that is easier to change.
.Ps
FORMAT: sh /usr/local/bin/format
OPTIONS: -mS -P -rv1 -rS2

book: print/ch01 print/ch02 print/ch03...

print/ch01 : ch01
   $(FORMAT) $(OPTIONS) ch01
   touch print/ch01

print/ch02 : ch02
   $(FORMAT) $(OPTIONS) ch02
   touch print/ch02

		\&.
		\&.
		\&.
.Pe
.page 564
The variables used by
.CW make
are set like shell variables.
But when they are referenced, the name of the variable must
be enclosed in parentheses in addition to being prefixed
with a dollar sign.
.PP
A user can now easily edit the OPTIONS variable to add or
remove options.
You could also place additional options on the command
for a particular file.
This is not necessary, though, just because some of the
files have tables, equations, or pictures and others
don't.
Other than the small bit of extra processing it requires,
there's no reason not to run the preprocessor on all files.
.PP
Our makefile can be further expanded.
To make sure that our index and table of contents are
up-to-date (and to automate the process of creating
them out of the individual raw output files that the
format script creates), we can add the following
dependencies and creation instructions:
.Ps
book: print/ch01 ... proof/ch01 ... book.index book.toc
				\&.
				\&.
				\&.
print/ch01 : ch01
				\&.
				\&.
				\&.
book.index : index/ch01 index/ch02 ...
 cat index/* | sh /usr/local/bin/indexprog > book.index

book.toc : toc/ch01...figlist/chO1...tablist/ch01...
       echo .ta \\n(LLu-5n \\n(LLuR > book.toc
       echo .ce >> book.toc
       echo \\f3TABLE OF CONTENTS\\fP >> book.toc
       echo .sp 2 >> book.toc
       echo "\\t\\f3Page\\fP" >> book.toc
  cat toc/ch01...toc/appz >> book.toc
  echo '.bp' >> book.toc
  cat figlist/ch01...figlist/appz >> book.toc
  echo '.bp' >> book.toc
  cat tablist/ch01...tablist/appz >> book.toc

toc/ch01 : ch01
 $(FORMAT) $(OPTIONS) -x ch01
toc/ch02 : ch02
 $(FORMAT) $(OPTIONS) -x ch02
				\&.
				\&.
				\&.
index/ch01 : ch01
 $(FORMAT) $(OPTIONS) -x ch01
				\&.
.page 655
				\&.
				\&.
figlist/ch01 : ch01
 $(FORMAT) $(OPTIONS) -x ch01
				\&.
				\&.
				\&.
tablist/ch01 : ch01
 $(FORMAT) $(OPTIONS) -x ch01
				\&.
				\&.
				\&.
.Pe
Because we have directories named
.CW toc
and
.CW index ,
we give our source files names such as
.CW book.toc
and
.CW book.index
.PP
We can therefore enter:
.Ps
$ \f[CB]make book.toc\fP
.Pe
and the table of contents will be compiled automatically.
When you enter the above command, the
.CW make
program recognizes
.CW book.toc
as a
.I target .
It evaluates the following line that specifies several
dependent components.
.Ps
book.toc: toc/ch01 toc/ch02 toc/ch03
.Pe
In turn, each of these components are targets dependent
on a source file.
.Ps
toc/ch02: ch02
$(FORMAT) $(OPTIONS) -x ch02
.Pe
What this basically means is that if changes have been
made to
.CW ch02
since the file
.CW book.toc
was compiled, the source file will be formatted again,
producing new toc entries.
The other files, assuming that they have not been changed,
will not be reformatted as their entries are up-to-date.
.PP
We can add other \(lqtargets\(rq,
for instance, to check whether
or not every chapter in the book has been proofed since
it was last edited.
Based on when the dependent components were last updated,
you could invoke the
.CW proof
program on the associated file,
.CW grep
for Review Note macros, or just print a message to the
user reminding him or her to proof the file.
.PP
To do this, we create a pseudo-target.
If no file with the name
.CW proof
exists, it can never be up-to-date, so typing:
.Ps
$ \f[CB]make proof\fP
.Pe
will automatically force proofing of the document
according to the rules you have specified in the makefile.
.PP
The
.CW print
directory also serves as a pseudo-target, useful for
printing individual chapters.
Users don't have to remember the formatting options
that must be specified for a particular file.
.PP
And if all these reasons don't convince you to learn
.CW make
and begin constructing makefiles for large documents,
perhaps this next benefit will.
It gives you a simple two-word command to print an
entire book and its apparatus.
.page 566
.Ps
$ \f[CB]make book\fP
.Pe
When you enter this command, each formatting command as
it is being executed will be displayed on the screen.
If you wish to suppress these messages while you do other
work, invoke
.CW make
with the
.CW -s
option or place the line
.CW \&.SILENT:
at the top of the makefile.
.Bh "Building the Makefile"
You are limited only by your imagination and ingenuity in
organizing your work with a makefile.
However, the more complex the makefile, the longer it
gets, and the more difficult for inexperienced users
to create.
.PP
.ix [make] command, building makefile with~a shell~script %key make command, building makefile with a shell~script
You can get around this problem too\(emjust write
a shell script to build the makefile, taking
as arguments the files that make up the document.
Here's such a script, called
.CW buildmake ,
that will produce a makefile similar to the one just
described.
(The
.CW make
utility requires that the actions to be performed for
each target begin with a tab.
Such explicit tabs are shown in the following script
by the symbol
.CW |\(em\(em\(em| ).
.Ps
if [ $# -eq 0 ]; then
   echo "USAGE: buildmake files"
   echo "(You must specify the files that make up the book)"
   exit
fi
if [ ! -d print ]; then
   mkdir print
   mkdir proof
fi
if [ ! -d index ]; then
   mkdir index
fi
if [ ! -d toc ]; then
   mkdir toc
   mkdir figlist
   mkdir tablist
fi
for x
do
    prifiles="$prifiles print/$x"
    profiles="$profiles proof/$x"
    tcfiles="$tcfiles toc/$x"
    xfiles="$xfiles index/$x"
    fgfiles="$fgfiles figlist/$x"
    tbfiles="$tbfiles toc/$x"
done
echo ".SILENT:" > makefile
.page 567
echo "FORMAT = sh /usr/local/bin/format" >> makefile
echo "OPTIONS = -mS" >> makefile
echo "INDEXPROG = sh /usr/local/bin/indexprog" >> makefile
echo "book : $prifiles $profiles book.toc book.index" >> makefile
echo "book.index : $xfiles/" >>makefile
echo "|\(em\(em\(em|cat $xfiles | $(INDEXPROG) > book.index" >> makefile
echo "|\(em\(em\(em|$(FORMAT) $(OPTIONS) book.index" >> makefile
echo "book.toc : $tcfiles" >> makefile
echo "|\(em\(em\(em|echo .ta \\n(LLu-5n \\n(LLuR > book.toc" >> makefile
echo "|\(em\(em\(em|echo .ce >> book.toc" >> makefile
echo "|\(em\(em\(em|echo\\f3TABLE OF CONTENTS\\fP >> book.toc" >> makefile
echo "|\(em\(em\(em|echo .sp 2 >> book.toc" >> makefile
echo "|\(em\(em\(em|echo "\\t\\f3Page\\fP" >> book.toc" >> makefile
echo "|\(em\(em\(em|cat /work/lib/toc_top >> book.toc" >> makefile
.	\" Note:
.	\" In the previous line, only a single > was between
.	\" toc_top and book.toc
.	\" this should have been >>
echo "|\(em\(em\(em|cat $tcfiles >> book.toc" >> makefile
echo "|\(em\(em\(em|echo .bp >> book.toc" >> makefile
echo "|\(em\(em\(em|cat $fgfiles >> book.toc" >> makefile
echo "|\(em\(em\(em|echo .bp >> book.toc" >> makefile
echo "|\(em\(em\(em|cat $tbfiles >> book.toc" >> makefile
echo "|\(em\(em\(em|$(FORMAT) $(OPTIONS) book.toc" >> makefile
for x
do
    echo "print/$x : $x" >> makefile
    echo "|\(em\(em\(em|$(FORMAT) $(OPTIONS) $x" >> makefile
    echo "proof/$x : $x" >> makefile
    echo "|\(em\(em\(em|echo $x has not been proofed" >> makefile
    echo "toc/$x : $x" >> makefile
    echo "|\(em\(em\(em|$(FORMAT) $(OPTIONS) -x $x" >> makefile
    echo "index/$x : $x" >> makefile
    echo "|\(em\(em\(em|$(FORMAT) $(OPTIONS) -x $x" >> makefile
done
.Pe
To create a complex makefile, all the user needs to do
is type:
.Ps
$ \f[CB]buildmake\fP \f[I]files\fP
.Pe
In addition, the user may want to manually edit the
first line of the makefile, which specifies
formatter options.
.Ah "Where to Go from Here"
Large as this book is, it is far from comprehensive.
We have covered the basic editing and formatting tools
in some detail, but even there, topics have been
glossed over.
And when it comes to the more advanced tools, programs
not explicitly designed for text processing, much
has been left out.
.page 568
.PP
The sheer size and complexity of UNIX is one of its
fascinations.
To a beginner, it can be daunting, but to an advanced
user, the unknown has an appeal all its own.
Particularly to a technical writer, for whom the computer
is a subject as well as a tool, the challenge of taking
more control over the process of book production can
be endlessly fascinating.
The subject and the method of inquiry become ever more
intertwined, until, in Yeat's immortal phrase:
.PP
How can you know the dancer from the dance?
