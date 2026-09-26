.ig
	ch01.t
	Typed by: Stewart Russell.
	Marked up by: Michael Hobgood
	Proofed on: 1 Oct 2002
..
.so utp.mac
.utp
.Se 1 "From Word Processors to Typesetting" "Chapter" 1
.page 1
.ix %begin word~processors, influence~on writing~process
.LP
Before we consider the special tools that the UNIX environment
provides for text processing, we need to think about the
process of writing
when you begin to use a word processor.
.PP
The most important features of a computer program for writers
are the ability to remember what is typed,
and the ability
to enter only the changes when revising a draft.
For writers of a previous generation,
moving from a typewriter to word processing software,
no other features even begin to compare.
The crudest command structure, the most elementary
formatting capabilities, were forgiven because of the
immense labor savings that took place.
.PP
Writing is basically an iterative process.
Few writers can dash out a finished piece;
most of us work in circles,
returning again and again to the same piece of prose,
adding or deleting words, phrases, and sentences,
changing the order of thoughts,
and elaborating a single sentence into pages of text.
.PP
A writer working on paper
periodically needs to clear the deck\c
\(em\c
to type a clean copy, free of elaboration.
As the writer reads the new copy,
the process of revision continues,
a word here, a sentence there,
until the new draft is as obscured
by changes as the first.
As Joyce Carol Oates is said to have remarked:
\(lqNo book is ever finished.
It is abandoned.\(rq
.PP
Word processing first took hold in the office
as a tool to help secretaries
prepare perfect letters, memos, and reports.
As low-cost personal computers replaced dedicated word processors,
writers were quick to see the value of this tool.
In a civilization obsessed with the written word,
WordStar, a word processing program,
became an early best seller
of the personal computer revolution.
.PP
Consider your word processor workflow.
Because you can revise as you go,
you can think with your fingers when you write,
instead of outlining your thoughts beforehand,
and polish each sentence as you create it.
.PP
If you do work from an outline, enter it first,
then write your first draft by filling in the outline,
section by section
(and there is no law that requires you
to fill out each section in sequence).
If you are writing a structured document
.page 2
such as a technical manual,
your outline points become the headings in your document.
If you are writing a free-flowing work,
they can be subsumed gradually in the text
as you flesh them out.
In either case, you can write in small segments
that can be moved as you reorganize your ideas.
.ix %end word~processors, influence~on writing~process
.PP
.ix %begin word~processors, characteristics~of
The writer using a word processor creates many more drafts
than someone using a pen or typewriter.
Instead of three or four drafts,
the writer may produce ten or twenty.
Printing a copy provides another way
of looking at the manuscript,
revealing issues glossed over on the screen.
.PP
This brings us to the second major benefit of word-processing programs:
they help the writer to format a document.
For example, a word processor breaks a paragraph into individual lines,
and (if requested) adjusts the space between words
so all the lines are the same length.
When you make changes,
the word processor automatically readjusts.
There are commands for centering,
underlining, and boldfacing text.
.PP
Word processors always provide a clean printed copy,
making the flaws of organization and content
stand out vividly on paper.
But this also puts an added burden on the writer.
Where your grandparents had only to worry about content,
you are fussing with consistency of margins,
headings, boldface, italics,
and all the other formerly superfluous impedimenta
that are now integral to your task.
.PP
As the writer gets increasingly involved
in the formatting of a document,
the tools must help revise the document's appearance
as easily as its content.
.
.Ah "A Workspace"
.LP
An important capability of a word processor
is to provide a space where you can create and maintain documents.
In one sense, your display window,
that echoes the characters you type,
is analogous to a sheet of paper.
But the workspace of a word processor
is not so unambiguous as a sheet of paper wound into a typewriter,
that may be added neatly to the stack of completed work when
finished, or torn out and crumpled as a false start.
From the computer's point of view,
.page 3
your workspace is a block of memory, called a
.I buffer ,
that is allocated when you begin a
word-processing session.
The buffer is a temporary holding area
for storing your work,
and is emptied when you close the document.
.PP
To save your work, your word processor application
writes the contents of the buffer to a
.I file .
A file is a permanent storage area on a disk,
either the computer's hard disk or a USB flash drive.
After you have saved your work in a file,
you can open it later.
.PP
When you begin editing an existing document,
the word processor application makes a copy of the file
and reads its contents into the buffer.
You work on the copy, making changes to
.I it ,
not the original.
The file does not change
until you save your changes
during or at the end of your work session.
You can discard changes made to the buffered copy,
keeping the original file intact,
or save multiple versions of a document in separate files.
.PP
.ix file management
If, like most writers,
you save multiple drafts,
you can lose track of which version of a file is the latest.
An ideal text-processing environment for serious writers
provides tools for saving and managing multiple drafts on disk,
not just on paper.
It should allow the writer to
.RS
.Ls B
.Li
work on documents of any length;
.Li
save multiple versions of a file;
.Li
save part of a document into a file for later use;
.Li
use variables to represent text that might change later on;
.Li
switch easily between multiple files;
.Li
reference other sections of the document;
.Li
include \[lq]boilerplate\[rq]
(text repeated across a collection of documents)
without copying the boilerplate into the document;
.Li
insert the contents of an existing file into the buffer;
.Li
summarize the differences between two versions of a document.
.Le
.RE
.LP 0
.ix word~processors, limitations~of
Most word-processing applications for personal computers
work well for short documents such as letters and memos
that offices churn out by the millions each day.
Although word processors can create longer documents,
many features that would help organize a large document
such as a book or manual
are missing from these programs.
.PP
.ix word~processors, vs.~text~editors
Long before word processors became popular,
programmers used another class of programs called
.I "text editors" .
Text editors were designed chiefly
for entering computer programs,
not text.
They were designed for use by computer
professionals, not computer novices.
Thus, a text editor can be more difficult to learn,
lacking many on-screen formatting features
available with word processors.
.PP
But text editors used in program development
provide better facilities for managing large writing projects
than their office word processing counterparts.
Large programs, like large documents,
are often contained in many separate files.
You can use software development tools
to manage a large writing project
(this technique is called \[lq]docs as code\[rq]).
This allows you to track the differences
between versions of a document
the same way developers track differences
in their software.
.PP
UNIX is a pre-eminent program development environment
and a superb document development environment.
Although its text editing tools
at first may appear limited in contrast to word processors,
those tools offer productivity gains
that word processing software cannot match.
.
.Ah "Tools for Editing"
.page 4
.LP
Before you can get the benefits of word processing,
there is a lot to learn.
.PP
Editing operations are performed by issuing commands.
Each word-processing system has its own unique set of commands.
At a minimum, there are commands to
.RS
.Ls B
.Li
move to a particular position in the document;
.Li
insert new text;
.Li
change or replace text;
.Li
delete text;
.Li
copy or move text.
.Le
.RE
.LP 0
To make changes to a document, move to
that place in the text
where you want to make your edits.
Most documents are too large to be displayed in their entirety
in the word processor window\**.
.FS
*Some editors, such as
.CW emacs
or
.CW Vim ,
can split the terminal screen
into multiple windows.
In addition, many high-powered UNIX
workstations with large bit-mapped screens have their own
windowing software that allows multiple programs to be run
simultaneously in separate windows.
.FE
.ix scrolling
If you enter new text
and reach the bottom line in the window,
the text on the screen automatically scrolls
(rolls up) to reveal an additional line at the bottom.
A cursor marks your current position in the window.
.PP
There are two kinds of movement:
.RS
.Ls B
.Li
scrolling new text into the window
.Li
positioning the cursor within the window
using either the arrow keys or the mouse
.Le
.RE
.LP 0
When you begin a new document, the first line of text is the
first line in the window, and the cursor is positioned on
the first character.
If you open an existing document,
the word processor may remember where
you had positioned the cursor,
and return to that spot.
Scrolling commands change which lines
are displayed in the window by moving forward or backward
through the document.
Cursor positioning commands allow you
to move up and down to individual lines, and along lines to
particular characters.
Use the mouse to either position the cursor,
or select anything from an individual character
to multiple paragraphs.
.PP
After you position the cursor, make the desired edit:
.Ls B
.Li
Start typing to insert text at the cursor,
or replace selected text.
.Li
Press
.I Backspace
to delete the character to the left of the cursor, or
.I Delete
to delete the character to the right.
If you have selected text, either keypress
removes the selected text.
.Li
Use the menus, or keyboard shortcuts,
to affect the format of selected text
or subsequent text typed at that location.
You can also cut (remove the text,
saving it in a buffer) selected text,
copy selected text (into the buffer without deleting it),
or paste previously cut or copied text
at the cursor or replace selected text.
.Le
.PP
.ix word~processors, command~mode~vs.~insert~mode
Because you use the keyboard to enter both text and
commands, there must be some way to distinguish between the
two.
Word-processing programs assume you are entering text
unless you specify otherwise;
newly entered text either replaces existing text
.page 5
or pushes it over to make room for the new text.
Use either the menu or keyboard shortcuts to enter commands.
Most keyboard shortcuts require holding down the
.I "control key"
(\c
.I CTRL )
while pressing another key.
For example,
.I CTRL-C
(hold down
.I CTRL
and press
.I C )
is usually the command to copy selected text.
.PP
Other programs assume that you are issuing commands; you must
enter a command before you can type any text at all.
There are
advantages and disadvantages to each approach.
Starting out in
text mode is more intuitive to those coming from a typewriter,
but may be slower for experienced writers, because all commands
must be entered by special key combinations that are often
hard to reach and slow down typing.
(We'll return to this
topic when we discuss
.CW vi ,
a UNIX text editor).
.PP
Far more significant than the style of command entry is the
range and speed of commands.
For example, you can
issue a command that finds and replaces
every occurrence of a word or phrase
in an entire document.
And, after you start making such global changes,
you need some way to undo them if you make a mistake.
.PP
A word processor that substitutes ease of learning
for ease of use by having fewer commands
ultimately fails the serious writer,
because the time spent learning complex commands
pays off when they simplify complex tasks.
.PP
When you do issue a complex command,
it must work as quickly as possible,
so that you aren't left waiting
while the computer grinds away.
The extra seconds add up when
you spend hours or days at the keyboard; and,
once having been given a taste of freedom from drudgery,
writers want as much freedom as they can get.
.ix %end word~processors, characteristics~of
.PP
Text editors were developed before word processors
(in the rapid evolution of computers),
and have continued to evolve.
The oldest editors were originally designed for printing terminals,
not large LCD screens
with sophisticated graphic user interfaces (GUI)
that word processors and other applications now use.
These programs have commands that work with text on a line-by-line basis.
These commands are often more obscure than
the equivalent office word-processing commands.
However, though the commands used by text editors are sometimes
more difficult to learn, they are usually very effective.
The commands designed for use with slow paper terminals
were often extraordinarily powerful,
to make up for the limited capabilities of the
input and output devices of that time.
.PP
There are two basic kinds of text editors,
.I "line editors"
and
.I "screen editors" ,
and both are available in UNIX.
The difference
is simple: line editors display one line at a time,
and screen editors can display a full screen.
.PP
The line editors in UNIX include
.CW ed ,
.ix [sed] editor %key sed editor
.CW sed ,
and
.CW ex .
Although writers rarely use line editors nowadays\**,
.FS
One exception is to create a distraction-free
writing environment
for composing text.
Maximize the editing window,
turn off notifications,
and start entering text.
.FE
there are applications at which they excel,
as we will see in Chapters 7 and 12.
.PP
The most common screen editor in UNIX is
.CW vi ,
or its enhanced descendant
.CW Vim .
GUI-based editors are often bundled with
your computer's operating system,
but they usually provide little more than
the most basic features.
Popular GUI-based text editors
like VScode (or the open-source derivative VScodium)
provide many of the features of terminal-based
screen editors,
and can ease the transition
from GUI-based word processor software
to a command line-based toolchain.
.PP
Learning
.CW vi
or some other suitable screen editor
is the first step in mastering the
UNIX text-processing environment.
You will spend most of your time using the editor.
.PP
UNIX screen editors such as
.CW vi
and
.ix [emacs] editor %key emacs editor
.CW emacs
(another editor available on many UNIX systems)
lack ease-of-learning features
common in many word processors\c
\(em\c
there are no menus and only
primitive on-line help screens, and the commands are often
complex and nonintuitive\c
\(em\c
but they are powerful and fast.
UNIX line editors such as
.CW ex
and
.CW sed
give additional
capabilities not found in word processors\c
\(em\c
.page 6
such as the ability to write
a script of editing commands that can be applied to multiple
files.
Such editing scripts open new ranges of capability to
the writer.
.
.Ah "Document Formatting"
.LP
The object of the writing process
is to produce a properly-formatted document
for others to read.
A formatted document is more than words on paper;
it is an arrangement of text on a page.
For instance, the elements of a business letter
have a consistent format and layout,
helping the reader identify those elements.
Reports and more complex documents,
such as technical manuals or books,
require even greater attention to formatting.
The format of a document
conveys how information is organized,
assisting in the presentation of ideas to a reader.
This can be thought of as
.I "shared context" .
.PP
.ix formatting, with~a word~processor
Modern word-processing programs
have built-in formatting capabilities.
Formatting commands and editing commands
share the same menu and keyboard,
so you can view and edit your document on the screen.
An automatic centering command
saves the trouble of manually counting characters
to center a title or other text.
They provide automatic pagination
and printing of headers or footers.
Some word processing programs
support different views\c
\[em]\c
displaying the full page, including headers and footers,
or hiding those elements
and displaying only your content.
.PP
Text editors, by contrast,
usually have few formatting capabilities.
Because they are designed for entering programs
or building websites,
their formatting capabilities
tend to be oriented toward the formats required
by one or more programming languages.
.PP
Programmers also write reports and technical papers.
Especially at AT&T
(where UNIX was developed),
there was a great emphasis
on document preparation tools
to help the programmers and scientists of Bell Labs
produce research reports, manuals,
and other documents associated with their development work.
.PP
Word processing, with its emphasis on ease of use
and simple on-screen formatting, was in its infancy.
Computerized phototypesetting, on the other hand,
was already a developed art.
.ix formatting, with~a markup~language
Until recently, it was not possible to represent
on a video screen the variable type styles and sizes used in
typeset documents.
Thus, typesetting uses
a markup system that indicates formatting instructions with
special codes.
These formatting instructions to the computerized
typesetter are often direct descendants of the instructions
that were formerly given to a human typesetter\c
\(em\c
center the
next line, indent five spaces, boldface this heading.
.PP
The text formatter most commonly used with the UNIX system
is called
.CW nroff .
To use it, you must intersperse formatting
instructions (usually one- or two-letter codes preceded by
a period) within your text, then pass the file through the
formatter.
The
.CW nroff
program interprets the formatting codes
and reformats the document \(lqon the fly\(rq while passing it
on to the printer.
The
.CW nroff
formatter prepares documents
for printing on line printers, dot-matrix printers, and
letter-quality printers.
Another program called
.CW troff
uses an
extended version of the same markup language used by
.CW nroff ,
but prepares documents for printing on laser printers and
typesetters.
We'll talk more about printing in a moment.
.PP
.ix {wysiwyg}~defined %key wysiwyg defined
Although formatting with a markup language seems
inferior to the \(lqwhat you see is what you get\(rq
(\c
.I wysiwyg )
approach of most office word processing programs,
it actually has many advantages.
.page 7
.PP
.ix word~processors, limitations~of
.\" xxx most wps can indeed to this on modern hardware.
Before the advent of low-cost computers supporting a GUI,
early word processors could not display everything on
the screen just as it appeared on the printed page.
WordStar, an early word-processing program
for personal computers,
represented underlining by surrounding the word or
words to be underlined with the special control character
\f[CI]^S\fP
(the character generated by holding down the
.I control
key while
typing the letter
.I S ).
For example, the following title line
would be underlined when the document is printed:
.Ps
^SWord Processing with WordStar^S
.Pe
.LP 0
Is this really superior to the following
.CW nroff
construct?
.Ps
\&.ul
Text Processing with vi and nroff
.Pe
.LP 0
The point, though, is that most word processors are oriented
toward the production of short documents.
When you get beyond
a letter, memo, or report, you start to understand that there
is more to formatting.
.PP
Although \(lqwhat you see is what you get\(rq is fine for laying
out a single page, enforcing consistency
across a large document is more difficult.
The design of a large document is often
determined before writing begins,
just as an architect and engineer
draw a set of plans for a house
before anyone starts construction.
The design is a plan for organizing a document,
arranging various parts
to handle the same types of material
in the same way.
.PP
The parts of a document might be
chapters, sections, or subsections.
For instance, a technical manual is often organized
into chapters and appendices.
Within each chapter,
there might
be numbered sections that are further divided into three or
four levels of subsections.
.PP
Document design seeks to accomplish across the entire document
what is accomplished by the table of contents of a book.
It
presents the structure of a document and helps the reader
locate information.
.PP
Each of the parts must be clearly identified.
The design
specifies how they look, trying to achieve consistency
throughout the document.
The strategy might specify that
major section headings are all uppercase, underlined,
with three blank lines above and two below, and secondary
headings are in uppercase and lowercase, underlined,
with two blank lines above and one below.
.PP
If you have ever tried to format a large document using a word
processor, you have probably found it difficult to enforce
consistency in such formatting details as these.
By contrast, a
markup language\c
\(em\c
especially one like
.CW nroff
that allows you to
define repeated command sequences, or
.I macros \c
\(em\c
makes it easy:
the style of a heading is defined once, and a code used
to reference it.
For example, a top-level heading might be
specified by the code
.CW \.H1 ,
and a secondary heading by
.CW \.H2 .
.page 8
If you later decide to change the design,
change the definition of the relevant design elements.
If you used a word processor to format
the document as it was written,
without defining styles, going back
and changing the format is a painful task.
.
.Ah "Printing"
.ix %begin printers (types~of)
.LP
The formatting capabilities of a word-processing system
are limited by what can be output on a printer.
For example, some printers cannot backspace
and therefore cannot underline.
For this discussion,
we are considering three different classes
of printers: inkjet, laser printer, and phototypesetter.
.PP
.ix inkjet printers
An inkjet printer, like the ancestral
.I dot-matrix
printer, composes characters as a series of dots.
But instead of striking paper
with close-spaced pins through an inked ribbon,
it sprays ink onto the page.
Inkjet printers are suitable
for preparing personal documents
and printing color flyers and newsletters.
They provide resolutions of 1200dpi and higher.
.PP
Dot-matrix printers are still available,
but used mostly to print multi-part forms
or long printouts using continuous feed paper.
.ig
.\" Removing this for UTP Revisited
.	\" Note: an example paragraph of dot matrix output
.	\" is in the original.  Not having access to any fonts
.	\" that make an attempt to duplicate the poor quality,
.	\" I've just typed the paragraph in using the
.	\" CW font in .nf mode supplied as defaults in .Ps/.Pe macros.
.	\" In the original printed book, the word "sophisticated"
.	\" was mis-spelled as "sophicated". Corrected here.
.	\" -- Michael Hobgood
.Ps
.sp .5v
This paragraph was printed with a dot-matrix printer.  It uses a print
head containing 9 pins, which are adjusted to produce the shape of each
character.  More sophisticated dot-matrix printers have print heads
containing up to 24 pins.  The greater the number of pins, the finer
the dots that are printed, and the more possible it is to fool the eye
into thinking it sees a solid character.  Dot matrix printers are also
capable of printing out graphic displays.
.Pe
..
.ig
.\" also removing this from UTP Revisited... are these even made now?
.PP
.ix letter-quality printers
A
.I letter-quality
printer is more expensive and slower.
Its
printing mechanism operates like a typewriter and achieves a
similar result.
.	\" This paragraph is simulated using large point, CB type.
.	\" -- Michael Hobgood
.Ps
.ft CB
.ps 12
.vs 14
.sp 2p
This paragraph was printed with a letter-
quality printer.  It is essentially a
computer-controlled typewriter and, like a
typewriter, uses a print ball or wheel
containing fully formed characters.
.ps 9
.vs 10
.ft P
.Pe
.LP
A letter-quality printer produces clearer, easier-to-read
copy than a dot-matrix printer.
Letter-quality printers are
generally used in offices for formal correspondence as well
as for the final drafts of proposals and reports.
..
.PP
.ix [troff] formatter, used~with laser printers %key troff formatter, used with laser printers
.ix laser printers
A few years after
.CW troff
was introduced, inkjet and laser printers
that can produce near typeset quality output
at a fraction of the cost made phototypesetters nearly obsolete.
.	\" again, another simulated paragraph.
.	\" here, I just used bold, roman type.
.	\" -- Michael Hobgood
.Ps
.fi
.ft B
.ll 4.5i
.sp 4p
This paragraph was produced on a laser printer.
Laser printers produce
high-resolution characters\c
\(em\c
300 to 2400 dots per inch\c
\(em\c
though they are not quite as finely formed as phototypeset
characters.
Laser printers are not only cheaper to purchase
than phototypesetters, they also print on plain paper,
like Xerox machines, and are therefore much cheaper to operate.
However, as is always the case with computers,
you need the proper software
to take advantage of improved hardware capabilities.
.ft P
.nf
.ll
.Pe
.PP
Until very recently, documents that needed a higher quality of
printing than that available with letter-quality printers were
sent out for typesetting.
Even if draft copy was word-processed,
the material was often re-entered by the typesetter, although
many typesetting companies can read the files created by
popular word-processing programs and use them as a starting
point for typesetting.
.page 9
.Ps
.ll 4.5i
.fi
.ft R
.sp .5v
This paragraph, like the rest of this book, was typeset.
While most typesetting is done with laser printing now,
the phototypesetter is a specific kind of typesetter.
In phototypesetting, a photographic technique prints
characters on film or photographic paper.
There is a wide choice of type styles,
and the characters are much more finely formed
than those produced by inkjet and consumer-quality laser printers.
Typesetters produce characters by an arrangement of tiny dots,
much like an inkjet or laser
printer\c
\(em\c
but there are over 2400 dots per inch.
.ll
.nf
.ft P
.Pe
.LP 0
There are several major advantages to typesetting.
The high resolution supports aesthetically pleasing type.
The shape of the characters is much finer.
You can mix styles
(for example, bold and italic)
and sizes of type on the same page.
.PP
Most typesetting equipment uses a markup language instead of a
.I wysiwyg
approach to specify point sizes, type styles, leading,
and so on.
In the early days of word processing software,
the technology did not exist
to represent on a screen the variable-width typefaces
that appear in published books and magazines.
.ix %end printers (types~of)
.PP
AT&T, a company with its own extensive internal publishing
operation, developed its own typesetting markup language
and typesetting program\c
\(em\c
a sister to
.CW nroff
called
.CW troff
(\c
.I typesetter-roff ).
Although
.CW troff
extends the capabilities of
.CW nroff
in significant ways,
you can print the same document on both.
.LP
.ix Macintosh, word~processing~on
Desktop publishing programs,
originally developed for Apple Macintosh computers,
were among the first to tap the capabilities of laser printers.
Still, a markup language such as that provided by
.CW troff
provides the easiest and lowest-cost access
to the world of electronic publishing.
.PP
The point made previously,
that markup languages are preferable to
.I wysiwyg
systems for large documents,
is especially true
when you begin to use variable size fonts, leading,
and other advanced formatting features.
You can lose track of the
overall format of your document
and find it difficult to make overall changes
after your formatted text is in place.
The most expensive electronic publishing systems
(most of them originally based on advanced UNIX workstations)
give you both the capability to see what you get on the screen
and the ability to define
and easily change overall document formats.
.PP
Markup languages often provide ways to define
variable text or numeric values,
and to incorporate other files,
allowing reusing content over two or more documents.
Some word processors have similar capabilities,
but they often are hard to use.
.
.Ah "Other UNIX Text-Processing Tools"
.page 10
.LP
Document editing and formatting
are the most important parts of text processing,
but they are not the whole story.
For instance,
in writing many types of documents,
such as technical manuals,
the writer rarely starts from scratch.
Something is already written,
often a first draft written by someone else,
a product specification,
or the previous version of a manual.
.PP
Then you can use custom-made programs
to search through the source material
and extract useful information.
Word-processing programs
often store text in files with different internal formats.
UNIX provides a number of useful analysis and translation tools
that can help decipher files with nonstandard formats.
Other tools allow you to \(lqcut and paste\(rq portions of a document
into the one you are writing.
.PP
As you write, there are programs to check
spelling, style, and diction.
The reports produced by those programs
can help you see if there is any detectable pattern
in syntax or structure
that might make a document more difficult
for the reader than it needs to be.
.PP
Although many documents are written once and published or filed,
there is also a large class of documents (manuals in particular)
that are revised again and again.
Documents such as these
require special tools for managing revisions.
Writers can use
UNIX program development tools
such as Git and
.CW diff
to compare past versions with the current draft
and print out reports of the differences,
or generate printed copies with change bars in the margin
marking the differences.
.PP
In addition to all of the individual tools it provides,
UNIX is a particularly fertile environment for
writers who aren't afraid of computers.
If that describes you,
then you can write custom command files, or
.I scripts ,
to meet your specific needs
and make you more productive.
For example, automatic index generation
is a complex task that
no standard UNIX text-processing tools handle.
By applying the tools available in the UNIX environment,
and a little ingenuity,
you can automate index generation
and many other tasks.
.PP
We have two different objectives in this book.
The first objective is to show you how
to use many of the tools available on most UNIX systems.
The second objective is to help you develop
an understanding of how these different tools work together
in a document preparation system.
We're not just presenting
a UNIX user's manual,
but suggesting applications that you can build
and modify to suit your needs.
.PP
To take full advantage of the UNIX text-processing environment,
you must do more than just learn a few programs.
For the writer, the job includes
establishing processes
about how to store documents,
how they appear in print,
and what kinds of programs make the processes
most efficient.
Another way of looking at it:
you have to make certain choices
before beginning a project.
We want to encourage you to make your own choices,
set your own standards,
and realize the many possibilities
that are open to a diligent and creative person.
.page 11
.PP
In the past, many of the steps in creating a finished book
were out of the hands of the writer.
Proofreaders and copy editors
went over the text for spelling and grammatical errors.
It was generally the printer who did the typesetting
(a service usually paid by the publisher).
At the print shop, a typesetter (a person)
retyped the text and specified font sizes and styles.
A graphic artist, performing layout and pasteup, made
many of the decisions about the appearance of the printed page.
.PP
Although producing a high-quality book
can still involve many people,
UNIX provides the tools that allow a writer
to control the process from start to finish.
An analogy is the difference
between an assembly worker on a production line
who views only one step in the process
and a craftsman who guides the product
from beginning to end.
The craftsman develops the process of
putting together a product,
while an assembly worker follows a defined process.
.PP
After you are acquainted with the basic tools
available in UNIX
and have spent some time using them,
you can design additional tools
to streamline your work
and make you more productive.
To create these tools, you write scripts
that use the resources of UNIX in special ways.
There is a certain satisfaction
that comes with taking control of the computer.
It seems to reward careful thought.
.PP
What programming means to us is,
when we confront a problem
that submits only to tedium or brute force,
we think of a way to get the computer to solve the problem.
Doing this often means
looking at the problem in a more general way
and solving it in a way that can be applied again and again.
.PP
.ix Kernighan~and~Pike, {UNIX~Programming~Environment} %key Kernighan and~Pike, UNIX~Programming~Environment
An important book on UNIX is
.I "The UNIX Programming Environment"
by Brian W. Kernighan and Rob Pike.
They wrote that what makes UNIX effective
\(lqis an approach to programming,
a philosophy of using the computer.\(rq
At the heart of this philosophy
\(lqis the idea that the power of a system
comes more from the relationships among programs
than from the programs themselves.\(rq
.PP
When we talk about building a document preparation system,
we are trying to apply this philosophy.
Thus, this is a flexible system that
gives the builders a feeling of breaking new ground.
The UNIX text-processing environment
is a system that can be tailored to
the specific tasks you want to accomplish.
In some instances,
it can let you do just what a word processor does.
In other instances,
it lets you use more of the computer
to do things that a word processor
either can't do or can't do very well.
