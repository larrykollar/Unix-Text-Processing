.ig
Index formatting macros, lifted from CSTR #128
with slight changes to fit the UTP manual
..
.so utp.mac
.\" Precedes each index term
.de XX
.br
.ti -.2i
.ne 2
..
.de ZZ
.br
..
.\" Header between letters
.de YY
.sp 1.5
.ne 3
.ce
- \\$1 -
.sp .5
..
.Se "" "Index" NONE
.af PN 1
.nr PS 8
.nr VS 9
.\" Just do one column for nroff...
.if t .2C
.na
.in .2i
.hy 0
.YY    
.XX
\&\f(CW.1C\fP macro (\f(CWms\fP),  103\(en104
.XX
\&\f(CW.2C\fP macro (\f(CWms\fP),  103\(en104
.YY a A
.XX
\&\f(CW.AB\fP macro (\f(CWms\fP),  101
.XX
\&\f(CW.ab\fP request,  350
.XX
\&absolute motions,  357, 369
.XX
\&\f(CW.ad\fP request,  57\(en59, 386
.XX
\&adding formatting codes, indexing,,  438
.XX
\&\f(CW.AE\fP macro (\f(CWms\fP),  101
.XX
\&\f(CW.AI\fP macro (\f(CWms\fP),  101
.XX
\&\f(CW.AL\fP macro (\f(CWmm\fP),  131\(en134
.XX
\&\f(CWalias\fP command,  239
.XX
\&alphabetic lists, \f(CWmm\fP macros,  131\(en134
.XX
\&altering output format, number registers,,  341
.XX
\&\f(CW.am\fP request,  330, 423
.XX
\&appending to
.ZZ
\&   a file,  11
.ZZ
\&   diversions,,  344
.ZZ
\&   macros,,  330
.ZZ
\&   strings,,  343
.XX
\&arguments
.ZZ
\&   Bourne shell, discarding and shifting,  280
.ZZ
\&   in macros,  332
.ZZ
\&   in shell scripts,  17
.ZZ
\&   macros,,  332
.ZZ
\&   shell scripts, discarding and shifting,  280
.ZZ
\&   to, shell scripts,,  17
.ZZ
\&   to UNIX commands,  9
.XX
\&arithmetic expressions, in \f(CWtroff\fP,  334
.XX
\&as
.ZZ
\&   global variables, number registers,,  338
.ZZ
\&   nested list counter, number registers,,  417
.XX
\&\f(CW.as\fP request,  343
.XX
\&\f(CW.AU\fP macro (\f(CWms\fP),  101
.XX
\&autoincrementing
.ZZ
\&   number registers,  341
.ZZ
\&   number registers,,  341, 417
.XX
\&\f(CWawk\fP,  275, 309\(en327, 435\(en436
.ZZ
\&   arrays,  315, 324, 464
.ZZ
\&   \f(CWawkronym\fP script,  311\(en313, 316\(en319, 327
.ZZ
\&   basic operations,  309
.ZZ
\&   \f(CWBEGIN\fP procedures,  313
.ZZ
\&   built-in functions,  324
.ZZ
\&   capabilities of,  309
.ZZ
\&   changing the field separator,  312
.ZZ
\&   command summary,  462, 464\(en465
.ZZ
\&   conditional statements,  314
.ZZ
\&   debugging,  327
.ZZ
\&   dividing input into records and fields,  310
.ZZ
\&   error handling in,  322
.ZZ
\&   \f(CWfor\fP loops,  314, 326
.ZZ
\&   \f(CWfor\fP loops with arrays,  316
.ZZ
\&   formatted print statement,  321
.ZZ
\&   invoking,  310
.ZZ
\&   passing parameters from a shell script,  311
.ZZ
\&   pattern matching,  310
.ZZ
\&   pattern matching,  463
.ZZ
\&   scripts for order tracking,  323
.ZZ
\&   similarities to \f(CWsed\fP,  309
.ZZ
\&   subdividing a field,  324, 436
.ZZ
\&   \f(CWsubstr\fP function,  439
.ZZ
\&   syntax of procedures,  463
.ZZ
\&   system variables,  313, 463
.ZZ
\&   testing fields,  311
.ZZ
\&   used for indexing,  435\(en440
.ZZ
\&   variables,  315, 464
.ZZ
\&   \f(CWwhile\fP loops,  313
.YY b B
.XX
\&\f(CW.B\fP macro
.ZZ
\&   (\f(CWmm\fP),  117\(en119
.ZZ
\&   (\f(CWms\fP),  93\(en95
.XX
\&\f(CW.B1\fP macro (\f(CWms\fP),  102
.XX
\&\f(CW.B2\fP macro (\f(CWms\fP),  102
.XX
\&background processing,  15
.ZZ
\&   Bourne shell,,  15
.XX
\&backing up
.ZZ
\&   files,  270\(en272
.ZZ
\&   files,,  270\(en272
.XX
\&bars, change,  379
.XX
\&baseline spacing,  80\(en81
.XX
\&\f(CW.BD\fP macro (\f(CWms\fP),  97
.XX
\&\f(CW.bd\fP request,  368
.XX
\&\f(CWbdiff\fP command,  258
.XX
\&\f(CW.BE\fP macro (\f(CWmm\fP),  147
.XX
\&\f(CW.BG\fP macro
.ZZ
\&   (\f(CWms\fP),  87
.ZZ
\&   (\f(CWms\fP),  388
.XX
\&\f(CW.BI\fP macro (\f(CWmm\fP),  119
.XX
\&\f(CW.BL\fP macro (\f(CWmm\fP),  126, 129\(en130
.XX
\&boldfacing
.ZZ
\&   by overstriking,  368
.ZZ
\&   by overstriking, fonts,,  368
.XX
\&book production, final,  444
.XX
\&Bourne shell,  10, 275\(en284
.ZZ
\&   background processing,  15
.ZZ
\&   cancelling commands,  10
.ZZ
\&   command summary,  495\(en499
.ZZ
\&   conditional execution,  278\(en280
.ZZ
\&   discarding and shifting arguments,  280
.ZZ
\&   interrupting commands,  10
.ZZ
\&   long command lines,  16
.ZZ
\&   prompt,  10
.ZZ
\&   repetitive execution,  281, 285
.ZZ
\&   resuming commands,  10
.ZZ
\&   secondary prompt,  17
.ZZ
\&   shell functions,  496
.ZZ
\&   special characters,  495
.ZZ
\&   variable substitution,  12, 495
.ZZ
\&   variables set by shell under execution,  496
.XX
\&Bourne shell
.ZZ
\&   breaking out of a script (\f(CWexit\fP),  282
.ZZ
\&   \f(CWCDPATH\fP environment variable,  240
.ZZ
\&   \f(CWexport\fP command,  40, 282
.ZZ
\&   \f(CWHOME\fP variable,  12
.ZZ
\&   \f(CWPATH\fP variable,  276
.ZZ
\&   \f(CWtest\fP options,  279
.ZZ
\&   variables set by \f(CW.profile\fP,  496
.XX
\&boxes, drawing,,  102, 359
.XX
\&\f(CW.bp\fP request,  70, 72\(en74
.XX
\&\f(CW.BR\fP macro (\f(CWmm\fP),  119
.XX
\&\f(CW.br\fP request,  55, 344
.XX
\&bracket-building characters,  371, 475
.XX
\&breaking out of, shell scripts,,  282
.XX
\&breaks
.ZZ
\&   importance of,  58, 344
.ZZ
\&   no-break control character,  58
.ZZ
\&   page,  403
.ZZ
\&   without line breaks, page,  72
.XX
\&breaks, \f(CWtroff\fP requests which cause,  58
.XX
\&\f(CW.BS\fP macro (\f(CWmm\fP),  147
.XX
\&\f(CW.BT\fP macro (\f(CWms\fP),  391
.XX
\&building the page number list, indexing,,  435
.XX
\&\f(CW.BX\fP macro (\f(CWms\fP),  102
.XX
\&by overstriking, boldfacing,,  368
.XX
\&bytes, files, size in,  242
.YY c C
.XX
\&C shell,  10, 239, 275
.ZZ
\&   search path, shell scripts,,  277
.XX
\&\f(CW.c2\fP request,  346
.XX
\&cancelling
.ZZ
\&   commands,,  10
.ZZ
\&   commands, Bourne shell,,  10
.XX
\&\f(CWcase\fP shell command,  278\(en280
.XX
\&\f(CWcat\fP command,  10\(en11, 108, 243
.XX
\&C/A/T typesetter,  51, 53, 61
.XX
\&cautions and warnings, notes,,  420\(en421
.XX
\&\f(CW.cc\fP request,  346
.XX
\&\f(CWcd\fP command,  12
.XX
\&\f(CW.CD\fP macro (\f(CWms\fP),  97
.XX
\&\f(CWCDPATH\fP environment variable,  240
.XX
\&\f(CW.ce\fP request,  65\(en66
.XX
\&\f(CW.cf\fP request,  366
.XX
\&\f(CW.ch\fP request,  399
.XX
\&change
.ZZ
\&   bars,  379
.ZZ
\&   pages,  402
.XX
\&changes to (SCCS), files, tracking,  258
.XX
\&changing
.ZZ
\&   directories,,  12
.ZZ
\&   fonts,,  74\(en77
.ZZ
\&   line weight, drawing,,  362
.XX
\&characteristics
.ZZ
\&   files,,  242
.ZZ
\&   of, word processors,,  1\(en4
.XX
\&characters
.ZZ
\&   bracket-building,  371, 475
.ZZ
\&   Greek,  191, 196, 476
.ZZ
\&   redefining control and escape,  346
.ZZ
\&   slanting,  376
.XX
\&\f(CWcheckeq\fP command,  205
.XX
\&checking for correctness, hyphenation,,  59
.XX
\&\f(CWcheckmm\fP command,  108, 128
.XX
\&\f(CWchmod\fP command,  14, 17, 242
.XX
\&\f(CWchown\fP command,  242
.XX
\&closing, diversions,,  343
.XX
\&\f(CWcol\fP command,  70
.XX
\&\f(CWcomm\fP command,  263\(en265
.XX
\&command
.ZZ
\&   line, number registers, setting from,  82
.ZZ
\&   line, page number, setting from,  110
.ZZ
\&   lines, Bourne shell, long,  16
.ZZ
\&   mode vs. insert mode, word processors,,  3
.ZZ
\&   summary, Bourne shell,,  495\(en499
.XX
\&commands
.ZZ
\&   Bourne shell, cancelling,  10
.ZZ
\&   Bourne shell, interrupting,  10
.ZZ
\&   Bourne shell, resuming,  10
.ZZ
\&   cancelling,  10
.ZZ
\&   interrupting,  10
.ZZ
\&   resuming,  10
.ZZ
\&   UNIX, syntax of,  9
.XX
\&comments, in \f(CWtroff\fP,  329
.XX
\&comparing, strings,,  335
.XX
\&conditional execution
.ZZ
\&   Bourne shell,,  278\(en280
.ZZ
\&   in shell scripts,  278\(en280
.ZZ
\&   shell scripts,,  278\(en280
.XX
\&conditional execution
.ZZ
\&   in \f(CWtroff\fP,  334\(en337
.ZZ
\&   in \f(CWawk\fP,  314
.XX
\&conditions, inverse,  337
.XX
\&constant
.ZZ
\&   spacing,  375, 419
.ZZ
\&   width, fonts,,  375, 419
.XX
\&contents
.ZZ
\&   created by diversion, table of,  422, 424
.ZZ
\&   diversions, table of,  422
.ZZ
\&   files, viewing,  243
.ZZ
\&   of, directories, listing,  12
.ZZ
\&   of font files, fonts,,  52, 501\(en503
.ZZ
\&   table of,  422
.ZZ
\&   written to standard error, table of,  422, 426
.XX
\&control
.ZZ
\&   and escape characters, redefining,  346
.ZZ
\&   character, breaks, no-break,  58
.ZZ
\&   character, no-break,  58
.XX
\&conventions, macros, naming,  330
.XX
\&copy mode,  333
.ZZ
\&   in, macros,,  333
.XX
\&copying, files,,  13
.XX
\&core dumps,  327
.XX
\&correctness, hyphenation, checking for,  59
.XX
\&counting characters in, files,,  16
.XX
\&cover sheet macros,  100\(en102, 105
.XX
\&\f(CWcpio\fP command,  270\(en273
.ZZ
\&   using with \f(CWfind\fP,  271\(en272
.XX
\&created by diversion, table of contents,,  422, 424
.XX
\&creating
.ZZ
\&   directories,,  12
.ZZ
\&   diversions,,  343
.XX
\&\f(CWcrypt\fP command,  270
.XX
\&\f(CW.cs\fP request,  375
.XX
\&\f(CWcsh\fP command,  275
.XX
\&\f(CW.cshrc\fP file,  240
.XX
\&\f(CWcsplit\fP command,  268\(en269
.XX
\&\f2CTRL\fP key,  33
.XX
\&\f(CWcu\fP
.ZZ
\&   command,  272
.ZZ
\&   request,  68
.XX
\&current, directories, printing,  12
.XX
\&cursor movement,  22
.XX
\&curves, drawing,,  362
.XX
\&customizing \f(CWvi\fP,  40
.XX
\&cut marks,  395\(en396
.XX
\&\f(CWcut\fP command,  265\(en266
.YY d D
.XX
\&\f(CW.da\fP request,  344, 423
.XX
\&dash, em,  292
.XX
\&data interactively, shell scripts, reading,  319
.XX
\&date and time last modified, files,,  242
.XX
\&\f(CWdate\fP command,  9
.XX
\&DDL,  54
.XX
\&\f(CW.DE\fP macro
.ZZ
\&   (\f(CWmm\fP),  115
.ZZ
\&   (\f(CWms\fP),  97\(en99
.XX
\&\f(CW.de\fP request,  81, 330
.XX
\&debugging
.ZZ
\&   in \f(CWawk\fP,  327
.ZZ
\&   in \f(CWtroff\fP,  347\(en349
.ZZ
\&   \f(CWpic\fP,  228
.XX
\&default values
.ZZ
\&   macros, setting,  385
.ZZ
\&   shell scripts, setting,  283
.XX
\&(defined)
.ZZ
\&   em,  61
.ZZ
\&   en,  61
.ZZ
\&   pica,  61
.XX
\&defining
.ZZ
\&   macros,,  105, 145, 330
.ZZ
\&   strings,,  342
.XX
\&(definition of), filling,  48
.XX
\&definition of
.ZZ
\&   justification,,  48
.ZZ
\&   shell scripts,,  275
.XX
\&\f(CWderoff\fP command,  260
.XX
\&\f(CWDESC\fP file,  501\(en502
.XX
\&developing a package, macros,,  383
.XX
\&\f(CWdevps\fP postprocessor,  53\(en54, 367
.XX
\&\f(CW.DF\fP macro (\f(CWmm\fP),  123
.XX
\&\f(CW.di\fP request,  343, 359
.XX
\&dial-up line,  272
.XX
\&\f(CWdiff\fP command,  253\(en256, 286
.XX
\&\f(CWdiff3\fP command,  254, 256\(en257
.XX
\&\f(CWdiffmk\fP command,  379
.XX
\&directories
.ZZ
\&   changing,  12
.ZZ
\&   creating,  12
.ZZ
\&   home,  12
.ZZ
\&   listing contents of,  12
.ZZ
\&   printing current,  12
.ZZ
\&   public,  273
.ZZ
\&   root,  11
.ZZ
\&   sub-,  11
.XX
\&directory
.ZZ
\&   home,  12
.ZZ
\&   root,  11
.XX
\&discarding and
.ZZ
\&   shifting arguments, Bourne shell,,  280
.ZZ
\&   shifting arguments, shell scripts,,  280
.XX
\&displays
.ZZ
\&   fill options (\f(CWmm\fP),  122
.ZZ
\&   floating (\f(CWmm\fP),  123
.ZZ
\&   floating (\f(CWms\fP),  98
.ZZ
\&   in \f(CWmm\fP macros,  121\(en122
.ZZ
\&   in \f(CWms\fP macros,  97\(en99
.ZZ
\&   labels (\f(CWmm\fP),  124
.ZZ
\&   \f(CWmm\fP vs. \f(CWms\fP,  505
.ZZ
\&   static (\f(CWmm\fP),  123
.ZZ
\&   static (\f(CWms\fP),  98
.XX
\&diversions,  343, 359, 422, 424\(en426
.ZZ
\&   appending to,  344
.ZZ
\&   closing,  343
.ZZ
\&   creating,  343
.ZZ
\&   naming by number register interpolation,  426
.ZZ
\&   splitting,  426
.ZZ
\&   table of contents,  422
.ZZ
\&   used for footnotes,  400
.XX
\&\f(CW.DL\fP macro (\f(CWmm\fP),  129\(en130
.XX
\&Documenter's Workbench,  52
.XX
\&documents, here,  286
.XX
\&dot-matrix printers,  6
.XX
\&downloadable, fonts,,  52
.XX
\&drawing,  \f2see also\fP \f(CWpic\fP preprocessor
.XX
\&drawing
.ZZ
\&   boxes,  102, 359
.ZZ
\&   changing line weight,  362
.ZZ
\&   curves,  362
.ZZ
\&   including Macintosh illustrations,  366
.ZZ
\&   lines,  358
.ZZ
\&   sample figures,  362
.XX
\&\f(CW.DS\fP macro
.ZZ
\&   (\f(CWmm\fP),  115, 121\(en122
.ZZ
\&   (\f(CWms\fP),  97\(en99
.XX
\&\f(CW.ds\fP request,  82, 342
.XX
\&dumps, core,  327
.YY e E
.XX
\&\f(CW.EC\fP macro (\f(CWmm\fP),  110, 124\(en125
.XX
\&\f(CW.ec\fP request,  346
.XX
\&\f(CWecho\fP command,  10
.XX
\&editing multiple, files,,  163
.XX
\&\f(CW.EF\fP macro (\f(CWmm\fP),  111
.XX
\&\f(CWegrep\fP command,  246
.XX
\&\f(CW.EH\fP macro (\f(CWmm\fP),  111
.XX
\&\f(CW.el\fP request,  334\(en337
.XX
\&\f(CWelif\fP shell command,  279
.XX
\&em
.ZZ
\&   dash,  292
.ZZ
\&   (defined),  61
.XX
\&\f(CW.em\fP request,  423
.XX
\&\f(CWemacs\fP editor,  4, 19
.XX
\&en (defined),  61
.XX
\&end macro,  423\(en424
.XX
\&entries, indexing
.ZZ
\&    indexing, sorting raw,  434
.ZZ
\&    indexing, subordinating secondary,  436
.XX
\&environment
.ZZ
\&   switch, number registers, substituting for,  419
.ZZ
\&   variables, setting,  15\(en16
.XX
\&environment variables
.ZZ
\&   \f(CWEXINIT\fP,  40
.ZZ
\&   \f(CWHOME\fP,  12
.ZZ
\&   \f(CWPATH\fP,  276
.ZZ
\&   \f(CWpath\fP,  277
.ZZ
\&   \f(CWTERM\fP,  15
.XX
\&environments,  345, 419
.XX
\&\f(CW.eo\fP request,  346
.XX
\&\f(CWeqn\fP preprocessor,  70, 191\(en206
.ZZ
\&   abbreviating a string,  202
.ZZ
\&   braces and brackets,  199
.ZZ
\&   diacritical marks,  191
.ZZ
\&   diacritical marks,  201
.ZZ
\&   displayed equations,  192
.ZZ
\&   fonts,  191, 204
.ZZ
\&   Greek alphabet,  191, 196
.ZZ
\&   grouping items,  205
.ZZ
\&   horizontal spacing,  191
.ZZ
\&   inline expressions,  193
.ZZ
\&   integrals,  198
.ZZ
\&   invoking,  192
.ZZ
\&   limits,  198
.ZZ
\&   lining up equations,  203
.ZZ
\&   point sizes,  191, 204
.ZZ
\&   precedence of operations,  205, 489
.ZZ
\&   problem checklist,  205
.ZZ
\&   problems with \f(CW.so\fP request,  381
.ZZ
\&   quotation marks,  195, 199, 202
.ZZ
\&   simple example,  191
.ZZ
\&   spaces in equations,  194
.ZZ
\&   special character names,  191, 196\(en197
.ZZ
\&   square root signs,  199
.ZZ
\&   subscripts,  195
.ZZ
\&   summary of command characters,  487\(en490
.ZZ
\&   summations,  198
.ZZ
\&   superscripts,  195
.ZZ
\&   syntax,  191
.ZZ
\&   tabs within equations,  194
.ZZ
\&   using braces for grouping,  196
.ZZ
\&   using \f(CWmm\fP with,  193
.ZZ
\&   using \f(CWnroff\fP with,  192
.ZZ
\&   using \f(CWtbl\fP with,  170, 192
.ZZ
\&   vertical piles (columns),  200
.ZZ
\&   vertical spacing,  191, 204
.XX
\&error, standard,  10, 426
.XX
\&errors, messages from UNIX commands,  10
.XX
\&errors
.ZZ
\&   in \f(CWmm\fP,  108
.ZZ
\&   in \f(CWms\fP,  86
.ZZ
\&   in \f(CWtroff\fP macros,  349
.XX
\&escape sequences, in \f(CWtroff\fP,  353
.XX
\&\f(CW.ev\fP request,  345
.XX
\&\f(CWex\fP editor,  149\(en168, 275, 286
.ZZ
\&   search for general classes of words,  156
.ZZ
\&   \  functions,  168
.ZZ
\&   \f(CW:\fP prompt,  21
.ZZ
\&   abbreviating recurring phrases,  165
.ZZ
\&   address symbols,  456
.ZZ
\&   appending to existing file,  160
.ZZ
\&   command summary,  455\(en460
.ZZ
\&   command mode,  150
.ZZ
\&   confirming replacements,  153
.ZZ
\&   copying lines,  151
.ZZ
\&   creating a subshell,  161
.ZZ
\&   current line,  150
.ZZ
\&   deleting lines,  151
.ZZ
\&   differences from \f(CWsed\fP,  289
.ZZ
\&   editing multiple files,  163
.ZZ
\&   executing from \f(CWvi\fP,  151
.ZZ
\&   executing from \f(CWvi\fP,  22
.ZZ
\&   executing UNIX commands from,  160
.ZZ
\&   \f(CWEXINIT\fP variable,  40
.ZZ
\&   exiting,  159, 455
.ZZ
\&   \f(CW.exrc\fP file,  40\(en41
.ZZ
\&   filtering text through a UNIX command,  161
.ZZ
\&   global search and replace,  153, 155
.ZZ
\&   insert mode,  150
.ZZ
\&   invoking,  149, 455
.ZZ
\&   leaving insert mode,  150
.ZZ
\&   limiting search to complete words,  156
.ZZ
\&   line addressing in,  152, 456
.ZZ
\&   mapping commands to keys,  166\(en167
.ZZ
\&   moving text blocks by patterns,  157
.ZZ
\&   moving lines,  151
.ZZ
\&   pattern matching,  154, 157
.ZZ
\&   printing line(s),  149
.ZZ
\&   quitting without saving edits,  159
.ZZ
\&   range of lines,  150
.ZZ
\&   reading in result of UNIX command,  161
.ZZ
\&   reading in a file,  160
.ZZ
\&   renaming the buffer,  159
.ZZ
\&   saving part of a file,  160
.ZZ
\&   saving files,  159
.ZZ
\&   scripts,  275, 284\(en286
.ZZ
\&   search and replace,  151\(en153
.ZZ
\&   substitute command,  150\(en151
.ZZ
\&   switching files,  163
.ZZ
\&   syntax of commands,  149
.ZZ
\&   using current and alternate filenames,  164
.ZZ
\&   yanking text from one file to another,  164
.XX
\&\f(CW.EX\fP macro (\f(CWmm\fP),  110, 124\(en125, 142
.XX
\&\f(CW.ex\fP
.ZZ
\&   request,  380
.ZZ
\&   scripts,  284
.ZZ
\&   scripts, built by diff,  286
.ZZ
\&   scripts, executing with \f(CW:so\fP,  284
.XX
\&execution
.ZZ
\&   Bourne shell, conditional,  278\(en280
.ZZ
\&   Bourne shell, repetitive,  281, 285
.ZZ
\&   Bourne shell, variables set by shell under,  496
.ZZ
\&   in shell scripts, conditional,  278\(en280
.ZZ
\&   shell scripts, conditional,  278\(en280
.ZZ
\&   shell scripts, repetitive,  281, 285
.XX
\&\f(CWEXINIT\fP variable,  40
.XX
\&existing
.ZZ
\&   names, macros, listing,  330
.ZZ
\&   number registers, finding names of,  331
.XX
\&\f(CWexit\fP shell command,  282
.XX
\&\f(CWexport\fP command,  40
.XX
\&\f(CWexpr\fP command,  309
.XX
\&expression operators
.ZZ
\&   in \f(CWawk\fP,  314
.ZZ
\&   in \f(CWtroff\fP,  335
.XX
\&expressions, regular,  154\(en159, 449
.XX
\&\f(CW.exrc\fP file,  40\(en41
.XX
\&extended \f(CWms\fP
.ZZ
\&   macros, chapter headings,  410\(en412
.ZZ
\&   macros, section headings,  413\(en414
.ZZ
\&   macros,  404\(en428, 508\(en510
.ZZ
\&   macros, chapter headings,  408
.ZZ
\&   macros, drawing horizontal lines,  411
.ZZ
\&   macros, figure numbering,  415
.ZZ
\&   macros, lists,  416\(en419
.ZZ
\&   macros, notes,  420\(en421
.ZZ
\&   macros, numbered headings,  412
.ZZ
\&   macros, summary of,  508\(en510
.ZZ
\&   macros, table numbering,  415
.ZZ
\&   macros, table of contents,  422
.ZZ
\&   macros, headers and footers,  414
.ZZ
\&   macros, invoking,  406
.ZZ
\&   macros, structure of,  406
.XX
\&extensions to \f(CWms\fP macros,  \f2see\fP  extended ms macros
.YY f F
.XX
\&\f(CW.FC\fP macro (\f(CWmm\fP),  110
.XX
\&\f(CW.fc\fP request,  374
.XX
\&\f(CW.FD\fP macro (\f(CWmm\fP),  110, 143
.XX
\&\f(CW.FE\fP macro
.ZZ
\&   (\f(CWmm\fP),  143\(en144
.ZZ
\&   (\f(CWms\fP),  103
.XX
\&\f(CW.FG\fP macro (\f(CWmm\fP),  124\(en125, 142
.XX
\&\f(CWfgrep\fP command,  246
.XX
\&\f(CW.fi\fP request,  56
.XX
\&fields
.ZZ
\&   in \f(CWawk\fP,  310\(en312
.ZZ
\&   in \f(CWcut\fP and \f(CWpaste\fP,  265
.ZZ
\&   in \f(CWsort\fP,  262\(en263
.ZZ
\&   in \f(CWtroff\fP,  374
.XX
\&figures, drawing, sample,  362
.XX
\&file
.ZZ
\&   appending to a,  11
.ZZ
\&   management,  2
.ZZ
\&   system,  11
.XX
\&files, searching within,  \f2see also\fP \f(CWgrep\fP
.XX
\&files
.ZZ
\&   backing up,  270\(en272
.ZZ
\&   characteristics,  242
.ZZ
\&   copying,  13
.ZZ
\&   counting characters in,  16
.ZZ
\&   date and time last modified,  242
.ZZ
\&   editing multiple,  163
.ZZ
\&   locating,  242
.ZZ
\&   metacharacters,  9, 14, 240
.ZZ
\&   moving,  13
.ZZ
\&   naming restrictions,  20
.ZZ
\&   organizing,  239
.ZZ
\&   permissions,  13\(en14, 242
.ZZ
\&   renaming,  13
.ZZ
\&   searching for,  242
.ZZ
\&   searching within,  244
.ZZ
\&   size in bytes,  242
.ZZ
\&   tracking changes to (SCCS),  258
.ZZ
\&   transferring to other systems,  273
.ZZ
\&   viewing contents,  243
.XX
\&filling (definition of),  48
.XX
\&filters,  16\(en17, 243, 289
.XX
\&final
.ZZ
\&   book production,  444
.ZZ
\&   formatting codes, indexing,,  440
.XX
\&\f(CWfind\fP command,  241\(en243, 245
.ZZ
\&   using with \f(CWcpio\fP,  271\(en272
.XX
\&finding names of existing, number registers,,  331
.XX
\&\f(CW.fl\fP request,  105, 348, 390
.XX
\&\f(CW.FO\fP macro,  389, 391
.XX
\&font files, fonts, contents of,  52, 501\(en503
.XX
\&fonts,  50, 52
.ZZ
\&   boldfacing by overstriking,  368
.ZZ
\&   changing,  74\(en77
.ZZ
\&   constant width,  375, 419
.ZZ
\&   contents of font files,  52, 501\(en503
.ZZ
\&   downloadable,  52
.ZZ
\&   four standard,  52
.ZZ
\&   mounted,  75, 501
.ZZ
\&   special,  52, 77
.XX
\&fonts, changing
.ZZ
\&    changing (\f(CWeqn\fP),  204
.ZZ
\&    changing (\f(CWms\fP),  93\(en95
.ZZ
\&    changing (\f(CWtbl\fP),  178
.XX
\&footers,  104, 111, 391
.XX
\&footnotes,  397, 507
.ZZ
\&   diversions, used for,  400
.XX
\&footnotes
.ZZ
\&   \f(CWmm\fP macros,  143\(en144
.ZZ
\&   \f(CWms\fP macros,  103
.XX
\&\f(CWfor\fP shell command,  285
.XX
\&form
.ZZ
\&   letters,  380
.ZZ
\&   of user entries, indexing,,  433
.XX
\&format, number registers, altering output,  341
.XX
\&\f(CWformat\fP shell script,  292, 295, 427, 429, 431, 441
.XX
\&formatting defaults, \f(CWmm\fP,  \f2see also\fP \f(CWmm\fP macros
.XX
\&formatting defaults, \f(CWms\fP,  \f2see also\fP \f(CWms\fP macros
.XX
\&formatting
.ZZ
\&   codes, indexing, adding,  438
.ZZ
\&   codes, indexing, final,  440
.ZZ
\&   problems, indexing, special,  440
.ZZ
\&   with a markup language,  5
.ZZ
\&   with a word processor,  4
.XX
\&formatting defaults
.ZZ
\&   \f(CWmm\fP,  108
.ZZ
\&   \f(CWms\fP,  86
.XX
\&four standard, fonts,,  52
.XX
\&\f(CW.fp\fP request,  75\(en76
.XX
\&\f(CW.FS\fP macro
.ZZ
\&   (\f(CWmm\fP),  143\(en144
.ZZ
\&   (\f(CWms\fP),  103
.XX
\&\f(CW.ft\fP request,  75\(en76
.XX
\&function
.ZZ
\&   keys, mapping,  167
.ZZ
\&   width,  370
.XX
\&functions, Bourne shell, shell,  496
.XX
\&fundamentals, UNIX, system,  9
.YY g G
.XX
\&\f(CWgetopt\fP command,  280
.XX
\&graphics,  \f2see also\fP \f(CWpic\fP preprocessor
.XX
\&graphics,  207
.XX
\&Greek characters,  191, 196, 476
.XX
\&\f(CWgrep\fP command,  16, 244\(en246
.ZZ
\&   using with find,  245
.YY h H
.XX
\&\f(CW.H\fP macro (\f(CWmm\fP),  136\(en139
.XX
\&hanging indents,  63\(en65, 90
.XX
\&\f(CWhead\fP command,  244
.XX
\&headers,  104, 111, 391
.XX
\&headings
.ZZ
\&   in wide margin,  414
.ZZ
\&   numbered,  408
.ZZ
\&   section,  407, 413
.XX
\&headings
.ZZ
\&   in extended \f(CWms\fP,  408\(en414
.ZZ
\&   in \f(CWmm\fP,  136\(en141
.ZZ
\&   in \f(CWms\fP,  99\(en100
.XX
\&here documents,  286
.XX
\&\f(CW.HM\fP macro (\f(CWmm\fP),  140\(en141
.XX
\&home
.ZZ
\&   directories,,  12
.ZZ
\&   directory,  12
.XX
\&\f(CWHOME\fP variable,  12
.XX
\&horizontal
.ZZ
\&   motions, local,  356
.ZZ
\&   position, marking a,  369
.ZZ
\&   position, returning to a,  369
.XX
\&\f(CW.HU\fP macro (\f(CWmm\fP),  136\(en139
.XX
\&\f(CW.hw\fP request,  59
.XX
\&\f(CW.HX\fP macro (\f(CWmm\fP),  147
.XX
\&\f(CW.HY\fP macro (\f(CWmm\fP),  147
.XX
\&\f(CW.hy\fP request,  60, 386
.XX
\&\f(CWhyphen\fP command,  59, 249
.XX
\&hyphenation,  49
.ZZ
\&   checking for correctness,  59
.ZZ
\&   rules for,  59
.XX
\&hyphenation
.ZZ
\&   enabling in \f(CWtroff\fP,  60
.ZZ
\&   in \f(CWmm\fP,  82, 115
.XX
\&\f(CW.HZ\fP macro (\f(CWmm\fP),  147
.YY i I
.XX
\&\f(CW.I\fP macro
.ZZ
\&   (\f(CWmm\fP),  117\(en119
.ZZ
\&   (\f(CWms\fP),  93\(en95
.XX
\&\f(CW.IB\fP macro (\f(CWmm\fP),  119
.XX
\&\f(CW.ID\fP macro (\f(CWms\fP),  97
.XX
\&\f(CW.ie\fP request,  334\(en337
.XX
\&\f(CW.if\fP
.ZZ
\&   request,  334\(en337
.ZZ
\&   shell command,  278\(en280
.XX
\&\f(CW.ig\fP request,  348
.XX
\&illustrations, Macintosh,,  366
.XX
\&importance of, breaks,,  58, 344
.XX
\&in
.ZZ
\&   macros, arguments,,  332
.ZZ
\&   shell scripts, arguments,,  17
.ZZ
\&   shell scripts, conditional execution,,  278\(en280
.ZZ
\&   three-part titles, page number,,  393
.ZZ
\&   wide margin, headings,,  414
.XX
\&\f(CW.in\fP request,  64
.XX
\&including Macintosh illustrations, drawing,,  366
.XX
\&indented (\f(CWmm\fP),  112
.ZZ
\&   indented with exceptions,  113
.XX
\&indents,  63\(en65, 112
.ZZ
\&   hanging,  63\(en65, 90
.XX
\&indexing,  427, 433
.ZZ
\&   adding formatting codes,  438
.ZZ
\&   building the page number list,  435
.ZZ
\&   final formatting codes,  440
.ZZ
\&   form of user entries,  433
.ZZ
\&   sorting raw entries,  434
.ZZ
\&   special formatting problems,  440
.ZZ
\&   subordinating secondary entries,  436
.XX
\&influence on writing process, word processors,,  1
.XX
\&initializing
.ZZ
\&   macros,,  386
.ZZ
\&   variables, shell scripts,,  283
.XX
\&input, standard,  16
.XX
\&integrals,  \f2see\fP \f(CWeqn\fP
.XX
\&interactively, shell scripts, reading data,  319
.XX
\&interpolating
.ZZ
\&   number registers,,  338
.ZZ
\&   strings,,  83, 342
.XX
\&interpolation
.ZZ
\&   diversions, naming by number register,  426
.ZZ
\&   number registers, naming by,  417
.XX
\&Interpress,  54
.XX
\&interrupted lines (in \f(CWtroff\fP),  337
.XX
\&interrupting
.ZZ
\&   commands,,  10
.ZZ
\&   commands, Bourne shell,,  10
.XX
\&inverse conditions,  337
.XX
\&\f(CW.IP\fP macro,  418
.ZZ
\&   (\f(CWms\fP),  90\(en93
.XX
\&\f(CW.IR\fP macro (\f(CWmm\fP),  119
.XX
\&\f(CW.IZ\fP macro,  387
.YY j J
.XX
\&\f(CWjoin\fP command,  262\(en263
.XX
\&justification,  48, 59
.ZZ
\&   definition of,  48
.ZZ
\&   types of,  57\(en59
.XX
\&justification
.ZZ
\&   \f(CWmm\fP macros,  114
.ZZ
\&   \f(CWms\fP macros,  87
.ZZ
\&   \f(CWnroff\fP vs. \f(CWtroff\fP,  49
.YY k K
.XX
\&\f(CW.KE\fP macro (\f(CWms\fP),  99
.XX
\&keep and release,  \f2see also\fP displays
.XX
\&keep and release,  99, 343
.XX
\&Kernighan and Pike, \f2UNIX Programming Environment\fP,  8, 315
.XX
\&kerning,  50
.XX
\&keys, mapping
.ZZ
\&    mapping function,  167
.ZZ
\&    mapping, function,  167
.XX
\&\f(CW.KS\fP macro (\f(CWms\fP),  99
.YY l L
.XX
\&labels, vertically stacked,  371
.XX
\&languages, page description,  54
.XX
\&laser printers,  7
.XX
\&last modified, files, date and time,  242
.XX
\&\f(CW.lc\fP request,  373
.XX
\&\f(CW.LD\fP macro (\f(CWms\fP),  97
.XX
\&\f(CW.LE\fP macro (\f(CWmm\fP),  126\(en128
.XX
\&leaders,  373
.XX
\&leading,  80
.XX
\&length, title,  393
.XX
\&letter-quality printers,  6
.XX
\&letters, form,  380
.XX
\&\f(CW.LG\fP macro (\f(CWms\fP),  95\(en96
.XX
\&\f(CW.lg\fP request,  377
.XX
\&\f(CW.LI\fP macro (\f(CWmm\fP),  126\(en128
.XX
\&ligatures,  377, 414
.XX
\&limitations of, word processors,,  2, 5
.XX
\&line
.ZZ
\&   breaks, page breaks, without,  72
.ZZ
\&   dial-up,  272
.ZZ
\&   weight, drawing, changing,  362
.XX
\&line number, in \f(CWvi\fP,  37
.XX
\&lines, drawing,,  358
.XX
\&list, indexing, building the page number,  435
.XX
\&listing
.ZZ
\&   contents of, directories,,  12
.ZZ
\&   existing names, macros,,  330
.XX
\&lists
.ZZ
\&   alphabetic (\f(CWmm\fP),  131\(en134
.ZZ
\&   alphabetic (\f(CWmS\fP),  416\(en417
.ZZ
\&   bulleted (\f(CWmS\fP),  416\(en417
.ZZ
\&   extended in \f(CWmS\fP,  416, 418
.ZZ
\&   in \f(CWms\fP,  90
.ZZ
\&   marked (\f(CWmm\fP),  128
.ZZ
\&   \f(CWmm\fP macros,  126\(en136
.ZZ
\&   \f(CWmm\fP vs. \f(CWms\fP,  505
.ZZ
\&   nested (\f(CWmm\fP),  127
.ZZ
\&   nested (\f(CWmS\fP),  416\(en417
.ZZ
\&   numbered (\f(CWmm\fP),  131\(en134
.ZZ
\&   numbered (\f(CWmS\fP),  416\(en417
.ZZ
\&   reference (\f(CWmm\fP),  132
.ZZ
\&   user-supplied marks (\f(CWmm\fP),  130
.ZZ
\&   variable-item (\f(CWmm\fP),  134
.XX
\&\f(CW.ll\fP request,  63, 386
.XX
\&local
.ZZ
\&   horizontal motions,  356
.ZZ
\&   vertical motions,  353
.XX
\&locating, files,,  242
.XX
\&\f(CW.login\fP file,  276
.XX
\&long command lines, Bourne shell,,  16
.XX
\&looping, shell scripts,,  285
.XX
\&\f(CWlp\fP command,  108
.XX
\&\f(CW.LP\fP macro (\f(CWms\fP),  87, 99
.XX
\&\f(CWls\fP
.ZZ
\&   command,  9, 12
.ZZ
\&   request,  70, 80
.XX
\&\f(CW.lt\fP request,  393
.YY m M
.XX
\&Macintosh
.ZZ
\&   illustrations,  366
.ZZ
\&   illustrations, drawing, including,  366
.ZZ
\&   word processing on,  7
.XX
\&macro
.ZZ
\&   end,  423\(en424
.ZZ
\&   reset,  86, 387
.XX
\&macros,  \f2see also\fP \f(CWmm\fP and \f(CWms\fP
.XX
\&macros
.ZZ
\&   appending to,  330
.ZZ
\&   arguments,  332
.ZZ
\&   copy mode in,  333
.ZZ
\&   cover sheet,  100\(en102, 105
.ZZ
\&   defining,  105, 145, 330
.ZZ
\&   developing a package,  383
.ZZ
\&   initializing,  386
.ZZ
\&   listing existing names,  330
.ZZ
\&   me,  85
.ZZ
\&   naming conventions,  330
.ZZ
\&   nested,  333
.ZZ
\&   new or extended?,  384
.ZZ
\&   number registers, used to generalize,  338
.ZZ
\&   page transition,  389
.ZZ
\&   removing,  330
.ZZ
\&   renaming,  331
.ZZ
\&   reset,  387
.ZZ
\&   setting default values,  385
.ZZ
\&   structure of package,  383\(en384
.ZZ
\&   style,  350, 414
.ZZ
\&   tabs and leaders in,  375
.XX
\&macros
.ZZ
\&   comparing \f(CWmm\fP and \f(CWms\fP,  504\(en507
.ZZ
\&   \f(CW/usr/lib/tmac\fP,  384
.XX
\&\f(CWmail\fP command,  15
.XX
\&\f(CWmake\fP command,  258\(en260
.ZZ
\&   building makefile with a shell script,  446
.ZZ
\&   coordinating final book production with,  444
.XX
\&\f(CWmakedev\fP command,  503
.XX
\&making executable, shell scripts,,  276
.XX
\&\f(CWman\fP macros,  71
.XX
\&management, file,  2
.XX
\&mapping
.ZZ
\&   function keys,  167
.ZZ
\&   function keys,,  167
.XX
\&marking a horizontal position,  369
.XX
\&marking
.ZZ
\&   in \f(CWvi\fP,  45
.ZZ
\&   in \f(CWtroff\fP,  367
.XX
\&markup language, formatting, with a,  5
.XX
\&\f(CW.MC\fP macro (\f(CWms\fP),  104
.XX
\&\f(CW.mc\fP request,  379
.XX
\&me macros,  85
.XX
\&\f(CWme\fP macros,  71
.XX
\&messages from UNIX commands, errors,,  10
.XX
\&metacharacters, files,,  9, 14, 240
.XX
\&miscellaneous
.ZZ
\&   programs, Writer's Workbench,,  252
.ZZ
\&   UNIX commands,  239
.XX
\&\f(CW.mk\fP request,  367, 401
.XX
\&\f(CWmkdir\fP command,  12
.XX
\&\f(CW.ML\fP macro (\f(CWmm\fP),  129\(en130
.XX
\&\f(CWmm\fP
.ZZ
\&   command,  107
.ZZ
\&   macros,  71
.ZZ
\&   macros, \f(CW.AL\fP macro,  131\(en134
.ZZ
\&   macros, alphabetic lists,  131\(en134
.ZZ
\&   macros, altering heading style,  137\(en141
.ZZ
\&   macros, \f(CW.B\fP macro,  117\(en119
.ZZ
\&   macros, \f(CW.BE\fP macro,  147
.ZZ
\&   macros, \f(CW.BI\fP macro,  119
.ZZ
\&   macros, \f(CW.BL\fP macro,  129\(en130
.ZZ
\&   macros, \f(CW.BL\fP macro,  126
.ZZ
\&   macros, bold font,  117
.ZZ
\&   macros, bottom-of-page processing,  147
.ZZ
\&   macros, \f(CW.BR\fP macro,  119
.ZZ
\&   macros, \f(CW.BS\fP macro,  147
.ZZ
\&   macros, changing point size,  119\(en121
.ZZ
\&   macros, changing the heading mark,  140\(en141
.ZZ
\&   macros, changing fonts,  117
.ZZ
\&   macros, changing reference defaults,  144
.ZZ
\&   macros, compared to \f(CWms\fP,  504\(en507
.ZZ
\&   macros, \f(CW.DE\fP macro,  115
.ZZ
\&   macros, default formatting,  108
.ZZ
\&   macros, \f(CW.DF\fP macro,  123
.ZZ
\&   macros, display fill options,  122
.ZZ
\&   macros, display formatting options,  121
.ZZ
\&   macros, display labels,  124
.ZZ
\&   macros, displays,  115, 121\(en122, 124
.ZZ
\&   macros, \f(CW.DL\fP macro,  129\(en130
.ZZ
\&   macros, \f(CW.DS\fP macro,  121\(en122
.ZZ
\&   macros, \f(CW.DS\fP macro,  115
.ZZ
\&   macros, \f(CW.EC\fP macro,  124\(en125
.ZZ
\&   macros, \f(CW.EC\fP macro,  110
.ZZ
\&   macros, \f(CW.EF\fP macro,  111
.ZZ
\&   macros, \f(CW.EH\fP macro,  111
.ZZ
\&   macros, errors,  108
.ZZ
\&   macros, \f(CW.EX\fP macro,  124\(en125, 142
.ZZ
\&   macros, \f(CW.EX\fP macro,  110
.ZZ
\&   macros, extensions to,  145
.ZZ
\&   macros, \f(CW.FC\fP macro,  110
.ZZ
\&   macros, \f(CW.FD\fP macro,  143
.ZZ
\&   macros, \f(CW.FD\fP macro,  110
.ZZ
\&   macros, \f(CW.FE\fP macro,  143\(en144
.ZZ
\&   macros, \f(CW.FG\fP macro,  124\(en125, 142
.ZZ
\&   macros, floating displays,  123
.ZZ
\&   macros, footers,  111
.ZZ
\&   macros, \f(CW.FS\fP macro,  143\(en144
.ZZ
\&   macros, \f(CW.H\fP macro,  136\(en139
.ZZ
\&   macros, headers,  111
.ZZ
\&   macros, heading number registers,  139
.ZZ
\&   macros, heading strings,  138
.ZZ
\&   macros, headings,  147
.ZZ
\&   macros, \f(CW.HM\fP macro,  140\(en141
.ZZ
\&   macros, \f(CW.HU\fP macro,  136\(en139
.ZZ
\&   macros, \f(CW.HX\fP macro,  147
.ZZ
\&   macros, \f(CW.HY\fP macro,  147
.ZZ
\&   macros, hyphenation,  82, 115
.ZZ
\&   macros, \f(CW.HZ\fP macro,  147
.ZZ
\&   macros, \f(CW.I\fP macro,  117\(en119
.ZZ
\&   macros, \f(CW.IB\fP macro,  119
.ZZ
\&   macros, indented paragraphs,  112
.ZZ
\&   macros, invoking,  107
.ZZ
\&   macros, \f(CW.IR\fP macro,  119
.ZZ
\&   macros, italic font,  117
.ZZ
\&   macros, justification,  114
.ZZ
\&   macros, \f(CW.LE\fP macro,  126\(en128
.ZZ
\&   macros, \f(CW.LI\fP macro,  126\(en128
.ZZ
\&   macros, lists,  126\(en136
.ZZ
\&   macros, marked lists,  128
.ZZ
\&   macros, \f(CW.ML\fP macro,  129\(en130
.ZZ
\&   macros, modifying,  145
.ZZ
\&   macros, nested lists,  127
.ZZ
\&   macros, number registers,  145
.ZZ
\&   macros, numbered headings,  136\(en139
.ZZ
\&   macros, numbered lists,  131\(en134
.ZZ
\&   macros, number registers,  484
.ZZ
\&   macros, \f(CW.P\fP macro,  112\(en113
.ZZ
\&   macros, page break,  125
.ZZ
\&   macros, page layout,  110\(en111
.ZZ
\&   macros, page numbering styles,  110
.ZZ
\&   macros, page transition,  73, 147
.ZZ
\&   macros, paragraphs,  112
.ZZ
\&   macros, paragraphs indented with exceptions,  113
.ZZ
\&   macros, \f(CW.PF\fP macro,  111
.ZZ
\&   macros, \f(CW.PH\fP macro,  111
.ZZ
\&   macros, predefined string names,  483
.ZZ
\&   macros, \f(CW.PX\fP macro,  147
.ZZ
\&   macros, \f(CW.R\fP macro,  117\(en119
.ZZ
\&   macros, \f(CW.RB\fP macro,  119
.ZZ
\&   macros, reference lists,  132
.ZZ
\&   macros, references,  144\(en145
.ZZ
\&   macros, reserved macro and string names,  485
.ZZ
\&   macros, \f(CW.RF\fP macro,  144
.ZZ
\&   macros, \f(CW.RI\fP macro,  119
.ZZ
\&   macros, \f(CW.RL\fP macro,  132
.ZZ
\&   macros, roman font,  117
.ZZ
\&   macros, \f(CW.RP\fP macro,  144\(en145
.ZZ
\&   macros, \f(CW.RP\fP macro,  110
.ZZ
\&   macros, \f(CW.RS\fP macro,  144
.ZZ
\&   macros, \f(CW.S\fP macro,  119\(en120
.ZZ
\&   macros, \f(CW.SA\fP macro,  114
.ZZ
\&   macros, \f(CW.SK\fP macro,  125
.ZZ
\&   macros, \f(CW.SM\fP macro,  120\(en121
.ZZ
\&   macros, \f(CW.SP\fP macro,  113\(en114
.ZZ
\&   macros, spacing between paragraphs,  113
.ZZ
\&   macros, static displays,  123
.ZZ
\&   macros, strings,  146
.ZZ
\&   macros, summary of macros,  479\(en485
.ZZ
\&   macros, table of contents,  141\(en142, 147
.ZZ
\&   macros, \f(CW.TB\fP macro,  142
.ZZ
\&   macros, \f(CW.TB\fP macro,  110
.ZZ
\&   macros, \f(CW.TC\fP macro,  141
.ZZ
\&   macros, top-of-page processing,  147
.ZZ
\&   macros, \f(CW.TP\fP macro,  147
.ZZ
\&   macros, \f(CW.TX\fP macro,  147
.ZZ
\&   macros, \f(CW.TY\fP macro,  147
.ZZ
\&   macros, unnumbered headings,  136\(en139
.ZZ
\&   macros, user exit,  147
.ZZ
\&   macros, user-supplied list marks,  130
.ZZ
\&   macros, variable-item lists,  134
.ZZ
\&   macros, vertical spacing,  113\(en114, 119\(en121
.ZZ
\&   macros, vertical margins,  147
.ZZ
\&   macros, \f(CW.VL\fP macro,  134
.ZZ
\&   macros, \f(CW.VM\fP macro,  147
.XX
\&mode
.ZZ
\&   copy,  333
.ZZ
\&   in, macros, copy,  333
.ZZ
\&   no-fill,  48, 55, 68, 122
.ZZ
\&   no-space,  390, 412
.XX
\&modem,  272
.XX
\&\f(CWmore\fP command,  108, 243
.XX
\&motions, absolute,  357, 369
.XX
\&mounted, fonts,,  75, 501
.XX
\&movement, cursor,  22
.XX
\&moving, files,,  13
.XX
\&\f(CWmptx\fP macros,  71
.XX
\&\f(CWmS\fP macros,  \f2see\fP extended \f(CWms\fP macros
.XX
\&\f(CWms\fP
.ZZ
\&   macros,  71, 85\(en105
.ZZ
\&   macros, \f(CW.1C\fP macro,  103
.ZZ
\&   macros, \f(CW.AB\fP macro,  101
.ZZ
\&   macros, \f(CW.AE\fP macro,  101
.ZZ
\&   macros, \f(CW.AI\fP macro,  101
.ZZ
\&   macros, \f(CW.AU\fP macro,  101
.ZZ
\&   macros, \f(CW.B\fP macro,  93\(en95
.ZZ
\&   macros, \f(CW.B1\fP macro,  102
.ZZ
\&   macros, \f(CW.B2\fP macro,  102
.ZZ
\&   macros, \f(CW.BD\fP macro,  97
.ZZ
\&   macros, \f(CW.BG\fP macro,  87
.ZZ
\&   macros, \f(CW.BG\fP macro,  388
.ZZ
\&   macros, \f(CW.BT\fP macro,  391
.ZZ
\&   macros, \f(CW.BX\fP macro,  102
.ZZ
\&   macros, \f(CW.CD\fP macro,  97
.ZZ
\&   macros, changing bottom margin,  403
.ZZ
\&   macros, compared to \f(CWmm\fP,  504\(en507
.ZZ
\&   macros, date string,  104
.ZZ
\&   macros, \f(CW.DE\fP macro,  97\(en99
.ZZ
\&   macros, displays,  97\(en99
.ZZ
\&   macros, drawing a box,  102
.ZZ
\&   macros, \f(CW.DS\fP macro,  97\(en99
.ZZ
\&   macros, error handling,  86
.ZZ
\&   macros, \f(CW.FE\fP macro,  103
.ZZ
\&   macros, \f(CW.FO\fP macro,  389, 391
.ZZ
\&   macros, fonts,  93\(en95
.ZZ
\&   macros, footers,  104, 391
.ZZ
\&   macros, footnotes,  103, 397
.ZZ
\&   macros, \f(CW.FS\fP macro,  103
.ZZ
\&   macros, headers,  104, 391
.ZZ
\&   macros, headings,  99\(en100
.ZZ
\&   macros, \f(CW.I\fP macro,  93\(en95
.ZZ
\&   macros, \f(CW.ID\fP macro,  97
.ZZ
\&   macros, indented paragraphs,  90
.ZZ
\&   macros, initialization sequence,  387
.ZZ
\&   macros, internal number register names,  477
.ZZ
\&   macros, internal macros,  477
.ZZ
\&   macros, invoking,  86
.ZZ
\&   macros, \f(CW.IP\fP macro,  90\(en93
.ZZ
\&   macros, \f(CW.IP\fP macro,  90
.ZZ
\&   macros, \f(CW.IP\fP macro,  418
.ZZ
\&   macros, \f(CW.KE\fP macro,  99
.ZZ
\&   macros, \f(CW.KS\fP macro,  99
.ZZ
\&   macros, labeled item lists,  90
.ZZ
\&   macros, \f(CW.LD\fP macro,  97
.ZZ
\&   macros, \f(CW.LG\fP macro,  95\(en96
.ZZ
\&   macros, \f(CW.LP\fP macro,  87
.ZZ
\&   macros, \f(CW.LP\fP macro,  99
.ZZ
\&   macros, \f(CW.MC\fP macro,  104
.ZZ
\&   macros, multi-column processing,  104, 401
.ZZ
\&   macros, \f(CW.NH\fP macro,  99\(en100
.ZZ
\&   macros, \f(CW.NH\fP macro,  412
.ZZ
\&   macros, \f(CW.NL\fP macro,  95\(en96
.ZZ
\&   macros, \f(CW.NP\fP macro,  105, 389, 391
.ZZ
\&   macros, number register default values,  386
.ZZ
\&   macros, numbered lists,  92
.ZZ
\&   macros, page layout,  86
.ZZ
\&   macros, page layout defaults,  86
.ZZ
\&   macros, page size,  394
.ZZ
\&   macros, page transition,  73, 384\(en403
.ZZ
\&   macros, paragraphs,  87\(en93
.ZZ
\&   macros, point size,  95\(en96
.ZZ
\&   macros, \f(CW.PP\fP macro,  87
.ZZ
\&   macros, \f(CW.PP\fP macro,  99
.ZZ
\&   macros, predefined and user-definable strings,  478
.ZZ
\&   macros, problems on first page,  105
.ZZ
\&   macros, \f(CW.PT\fP macro,  391
.ZZ
\&   macros, \f(CW.QE\fP macro,  89
.ZZ
\&   macros, \f(CW.QP\fP macro,  89
.ZZ
\&   macros, \f(CW.QS\fP macro,  89
.ZZ
\&   macros, quoted paragraphs,  89
.ZZ
\&   macros, \f(CW.R\fP macro,  93\(en95
.ZZ
\&   macros, \f(CW.RE\fP macro,  91
.ZZ
\&   macros, redefining header or footer,  392
.ZZ
\&   macros, reserved macro and string names,  478
.ZZ
\&   macros, reset macro,  387\(en388
.ZZ
\&   macros, reset macro,  86
.ZZ
\&   macros, \f(CW.RS\fP macro,  91
.ZZ
\&   macros, \f(CW.RT\fP macro,  388
.ZZ
\&   macros, \f(CW.RT\fP macro,  87
.ZZ
\&   macros, \f(CW.SH\fP macro,  99\(en100
.ZZ
\&   macros, \f(CW.SM\fP macro,  95\(en96
.ZZ
\&   macros, spacing between paragraphs,  87
.ZZ
\&   macros, summary of macros,  476\(en479
.ZZ
\&   macros, \f(CW.TL\fP macro,  101
.ZZ
\&   macros, two-column processing,  103\(en104
.ZZ
\&   macros, two-column processing,  401
.ZZ
\&   macros, \f(CW.UL\fP macro,  95
.ZZ
\&   macros, underlining,  95
.ZZ
\&   macros, vertical spacing,  87
.ZZ
\&   number registers, page layout,  478
.XX
\&multi-column processing,  104, 401
.XX
\&multiline, strings,,  82
.XX
\&multiple, files, editing,  163
.XX
\&\f(CWmv\fP command,  13
.YY n N
.XX
\&\f(CW.na\fP request,  57
.XX
\&names
.ZZ
\&   macros, listing existing,  330
.ZZ
\&   of existing, number registers, finding,  331
.XX
\&naming
.ZZ
\&   by interpolation, number registers,,  417
.ZZ
\&   by number register interpolation, diversions,,  426
.ZZ
\&   conventions, macros,,  330
.ZZ
\&   number registers,,  338
.ZZ
\&   restrictions, files,,  20
.ZZ
\&   strings,,  342
.XX
\&\f(CW.ne\fP request,  73, 403
.XX
\&nested, macros,,  333
.XX
\&new or extended?, macros,,  384
.XX
\&\f(CW.nf\fP request,  55
.XX
\&\f(CW.NH\fP macro
.ZZ
\&   (\f(CWms\fP),  99\(en100
.ZZ
\&   (\f(CWms\fP),  412
.XX
\&\f(CW.NL\fP macro (\f(CWms\fP),  95\(en96
.XX
\&\f(CW.nm\fP request,  378
.XX
\&\f(CW.nn\fP request,  379
.XX
\&no-break control
.ZZ
\&   character,  58
.ZZ
\&   character, breaks,,  58
.XX
\&no-fill mode,  48, 55, 68, 122
.XX
\&no-space mode,  390, 412
.XX
\&notes, cautions and warnings,  420\(en421
.XX
\&\f(CW.NP\fP macro
.ZZ
\&   (\f(CWms\fP),  105
.ZZ
\&   (\f(CWms\fP),  389, 391
.XX
\&\f(CW.nr\fP request,  82, 334\(en338
.XX
\&\f(CWnroff\fP formatter,  \f2see also\fP \f(CWtroff\fP
.XX
\&\f(CWnroff\fP formatter
.ZZ
\&   command line options,  51, 467
.ZZ
\&   default line length,  63
.ZZ
\&   device units,  61
.ZZ
\&   inability to use \f(CWpic\fP with,  207
.ZZ
\&   interword spacing,  50
.ZZ
\&   invoking,  51, 467
.ZZ
\&   summary of requests,  467\(en471
.ZZ
\&   units of measure,  61
.ZZ
\&   using eqn with,  192
.XX
\&\f(CW.ns\fP request,  73\(en74, 105, 389
.XX
\&number
.ZZ
\&   in three-part titles, page,  393
.ZZ
\&   register interpolation, diversions, naming by,  426
.ZZ
\&   registers,  82, 334\(en339, 386, 417, 419
.ZZ
\&   registers, altering output format,  341
.ZZ
\&   registers, as global variables,  338
.ZZ
\&   registers, as nested list counter,  417
.ZZ
\&   registers, autoincrementing,  341, 417
.ZZ
\&   registers, finding names of existing,  331
.ZZ
\&   registers, interpolating,  338
.ZZ
\&   registers, naming,  338
.ZZ
\&   registers, naming by interpolation,  417
.ZZ
\&   registers, predefined,  339
.ZZ
\&   registers, read-only,  340
.ZZ
\&   registers, removing,  342
.ZZ
\&   registers, scaled units,  338
.ZZ
\&   registers, setting default values with,  386
.ZZ
\&   registers, setting from command line,  82
.ZZ
\&   registers, substituting for environment switch,  419
.ZZ
\&   registers, used as flags,  339
.ZZ
\&   registers, used to generalize macros,  338
.ZZ
\&   setting from command line, page,  110
.XX
\&number
.ZZ
\&   in \f(CWms\fP,  82
.ZZ
\&   \f(CWmm\fP,  145
.ZZ
\&   \f(CWms\fP default values,  386
.XX
\&numbered headings,  408
.XX
\&numbered lists
.ZZ
\&   \f(CWmm\fP macros,  131\(en134
.ZZ
\&   \f(CWmS\fP macros,  416\(en419
.XX
\&numerical operators, in \f(CWpic\fP,  494
.XX
\&\f(CW.nx\fP request,  380
.YY o O
.XX
\&offset, page,  63, 385, 414
.XX
\&options to UNIX commands,  9
.XX
\&organizing, files,,  239
.XX
\&\f(CW.os\fP request,  73\(en74
.XX
\&other systems, files, transferring to,  273
.XX
\&out of, shell scripts, breaking,  282
.XX
\&output
.ZZ
\&   format, number registers, altering,  341
.ZZ
\&   redirection,  10\(en11, 16, 244
.ZZ
\&   standard,  10, 16
.ZZ
\&   transparent,  366, 423
.XX
\&overstriking,  368, 370
.ZZ
\&   fonts, boldfacing by,  368
.YY p P
.XX
\&\f(CW.P\fP macro (\f(CWmm\fP),  112\(en113
.XX
\&\f(CWpack\fP command,  272
.XX
\&package, macros
.ZZ
\&    macros, developing a,  383
.ZZ
\&    macros, structure of,  383\(en384
.XX
\&page
.ZZ
\&   breaks,  403
.ZZ
\&   breaks, without line breaks,  72
.ZZ
\&   description languages,  54
.ZZ
\&   layout,  391
.ZZ
\&   number,  104
.ZZ
\&   number, in three-part titles,  393
.ZZ
\&   number list, indexing, building the,  435
.ZZ
\&   number, setting from command line,  110
.ZZ
\&   offset,  63, 385, 414
.ZZ
\&   size,  394
.ZZ
\&   space at top of,  390
.ZZ
\&   top resets,  402
.ZZ
\&   transition,  74, 147, 384\(en403
.ZZ
\&   transition, macros,,  389
.XX
\&page
.ZZ
\&   breaks, \f(CWmm\fP macros,  125
.ZZ
\&   in \f(CWmm\fP,  110\(en111
.ZZ
\&   in \f(CWms\fP,  86
.ZZ
\&   number, in \f(CWmm\fP,  110
.ZZ
\&   number, in \f(CWmm\fP,  108
.XX
\&paragraphs, spacing between,  113
.XX
\&paragraphs
.ZZ
\&   indented (\f(CWms\fP),  90
.ZZ
\&   \f(CWmm\fP macros,  112
.ZZ
\&   \f(CWms\fP macros,  87
.ZZ
\&   quoted (\f(CWms\fP),  89
.ZZ
\&   spacing between (\f(CWms\fP),  87
.XX
\&passing arguments to, shell scripts,,  277\(en278
.XX
\&\f(CWpaste\fP command,  265, 267
.XX
\&path, search,  277
.XX
\&\f(CWPATH\fP variable,  276
.XX
\&\f(CW.pc\fP request,  393
.XX
\&\f(CWpcat\fP command,  272
.XX
\&permissions, files,,  13\(en14, 242
.XX
\&\f(CW.PF\fP macro (\f(CWmm\fP),  111
.XX
\&\f(CWpg\fP command,  108, 243
.ZZ
\&   help screens,  243
.XX
\&\f(CW.PH\fP macro (\f(CWmm\fP),  111
.XX
\&\f(CWpic\fP preprocessor,  207\(en237, 421
.ZZ
\&   reading description from remote file,  235
.ZZ
\&   adjusting drawing motion,  212
.ZZ
\&   adjusting label placement,  210
.ZZ
\&   \f(CWarc\fP,  214, 230
.ZZ
\&   \f(CWarrow\fP,  214
.ZZ
\&   as a programming language,  228
.ZZ
\&   as a programming language,  236
.ZZ
\&   automatic scaling,  227
.ZZ
\&   basic figures (graphics primitives),  208
.ZZ
\&   changing direction of drawing,  212
.ZZ
\&   controlling the dimensions of a drawing,  227
.ZZ
\&   copy facility,  235
.ZZ
\&   debugging,  228
.ZZ
\&   declarations,  490
.ZZ
\&   default dimensions of standard objects,  226
.ZZ
\&   defining macros,  232, 492
.ZZ
\&   defining object blocks,  224, 492
.ZZ
\&   describing single objects,  208
.ZZ
\&   diagonal lines,  213
.ZZ
\&   dimension variables,  226
.ZZ
\&   double-headed arrow,  218
.ZZ
\&   drawing in clockwise direction,  214
.ZZ
\&   drawing motion,  211
.ZZ
\&   enhancements to,  236
.ZZ
\&   executing UNIX commands from,  236
.ZZ
\&   expressions,  231, 493
.ZZ
\&   \f(CWfor\fP loops,  236
.ZZ
\&   functions,  231
.ZZ
\&   height of object,  209
.ZZ
\&   \f(CWif\fP conditional statements,  236
.ZZ
\&   inability to use with \f(CWnroff\fP,  207
.ZZ
\&   invisible reference object,  219
.ZZ
\&   labeling objects,  210, 492
.ZZ
\&   language of,  207
.ZZ
\&   leaving space between objects,  212
.ZZ
\&   library of frequently used objects,  235
.ZZ
\&   line,  210
.ZZ
\&   locating specific points,  217
.ZZ
\&   locating objects using Cartesian coordinates,  229
.ZZ
\&   macros,  232\(en236
.ZZ
\&   movement from a referenced object,  216
.ZZ
\&   naming an object,  222
.ZZ
\&   place and position notations,  221
.ZZ
\&   placing text in a drawing,  220, 223
.ZZ
\&   placing objects,  215
.ZZ
\&   positioning object blocks,  226, 493
.ZZ
\&   problems with \f(CW.so\fP request,  381
.ZZ
\&   programming drawings,  228
.ZZ
\&   redefining standard dimensions,  226
.ZZ
\&   relational operators for \f(CWif\fP statements,  237
.ZZ
\&   reusing dimensions,  209
.ZZ
\&   scaling,  229
.ZZ
\&   specifying size of graphics primitives,  208
.ZZ
\&   specifying dimensions,  209
.ZZ
\&   spline,  230
.ZZ
\&   \f(CWspline\fP,  215
.ZZ
\&   start and end macros,  207
.ZZ
\&   start and end of an object,  213, 217
.ZZ
\&   summary of command characters,  490\(en494
.ZZ
\&   summary of graphics primitives,  490
.ZZ
\&   turning a corner,  217
.ZZ
\&   typical figure description,  208
.ZZ
\&   units of measure,  209
.ZZ
\&   use of object blocks,  225
.ZZ
\&   used with \f(CWtroff\fP,  207, 210
.ZZ
\&   user-defined variables,  231
.ZZ
\&   using bit-mapped input,  237
.XX
\&pica (defined),  61
.XX
\&pipes,  16\(en17
.XX
\&\f(CW.pl\fP request,  72, 394
.XX
\&\f(CW.pm\fP request,  330
.XX
\&\f(CW.pn\fP request,  74
.XX
\&\f(CW.po\fP request,  63, 386
.XX
\&point size,  50, 61, 78\(en79, 95\(en96
.XX
\&point
.ZZ
\&    changing (\f(CWeqn\fP),  204
.ZZ
\&    changing (\f(CWmm\fP),  119\(en121
.ZZ
\&    changing (\f(CWms\fP),  95\(en96
.ZZ
\&    changing (\f(CWtbl\fP),  178
.XX
\&postprocessors,  366
.XX
\&PostScript,  54, 366, 377
.XX
\&\f(CW.PP\fP macro (\f(CWms\fP),  87, 99
.XX
\&\f(CWpr\fP command,  243
.XX
\&predefined, number registers,,  339
.XX
\&predefined conditions, in \f(CWtroff\fP,  334
.XX
\&printers
.ZZ
\&   dot-matrix,  6
.ZZ
\&   laser,  7
.ZZ
\&   letter-quality,  6
.ZZ
\&   (types of),  6\(en7
.XX
\&printing current, directories,,  12
.XX
\&problems, indexing, special formatting,  440
.XX
\&problems on first page (\f(CWms\fP),  105
.XX
\&processing
.ZZ
\&   background,  15
.ZZ
\&   Bourne shell, background,  15
.ZZ
\&   multi-column,  104, 401
.ZZ
\&   simple macro for, two-column,  401
.XX
\&production, final book,  444
.XX
\&\f(CW.profile\fP,  276
.XX
\&prompt, Bourne
.ZZ
\&    Bourne shell,,  10
.ZZ
\&    Bourne shell, secondary,  17
.XX
\&\f(CWproof\fP shell script,  247, 303\(en307
.XX
\&proofreading
.ZZ
\&   script, shell scripts,,  303, 307
.ZZ
\&   shell script for,  303\(en307
.XX
\&proofreading, double \f(CWawk\fP script,  315
.XX
\&\f(CW.ps\fP request,  79\(en80
.XX
\&pseudo-page transition,  390
.XX
\&\f(CW.PT\fP macro (\f(CWms\fP),  391
.XX
\&public, directories,,  273
.XX
\&putting in path, shell scripts,,  276
.XX
\&\f(CWpwd\fP command,  12
.XX
\&\f(CW.PX\fP macro (\f(CWmm\fP),  147
.YY q Q
.XX
\&\f(CW.QE\fP macro (\f(CWms\fP),  89
.XX
\&\f(CW.QP\fP macro (\f(CWms\fP),  89
.XX
\&\f(CW.QS\fP macro (\f(CWms\fP),  89
.YY r R
.XX
\&\f(CW.R\fP macro
.ZZ
\&   (\f(CWmm\fP),  117\(en119
.ZZ
\&   (\f(CWms\fP),  93\(en95
.XX
\&raw entries, indexing, sorting,  434
.XX
\&\f(CW.RB\fP macro (\f(CWmm\fP),  119
.XX
\&\f(CW.rd\fP request,  380
.XX
\&\f(CW.RE\fP macro (\f(CWms\fP),  91
.XX
\&\f(CWread\fP shell command,  319
.XX
\&reading data interactively, shell scripts,,  319
.XX
\&readings, recommended,  511
.XX
\&read-only, number registers,,  340
.XX
\&recommended readings,  511
.XX
\&records, in \f(CWawk\fP,  310
.XX
\&redefining control and escape characters,  346
.XX
\&redirection, output,  10\(en11, 16, 244
.XX
\&reference lists, \f(CWmm\fP macros,  132
.XX
\&regular
.ZZ
\&   expression, search,,  244
.ZZ
\&   expressions,  154\(en159, 449
.XX
\&removing
.ZZ
\&   macros,,  330
.ZZ
\&   number registers,,  342
.XX
\&renaming
.ZZ
\&   files,,  13
.ZZ
\&   macros,,  331
.XX
\&repetitive execution
.ZZ
\&   Bourne shell,,  281, 285
.ZZ
\&   shell scripts,,  281, 285
.XX
\&reset
.ZZ
\&   macro,  86, 387
.ZZ
\&   macros,,  387
.XX
\&resets, page top,  402
.XX
\&restrictions, files, naming,  20
.XX
\&resuming
.ZZ
\&   commands,,  10
.ZZ
\&   commands, Bourne shell,,  10
.XX
\&returning to a horizontal position,  369
.XX
\&returning to
.ZZ
\&   marked position, in \f(CWvi\fP,  45
.ZZ
\&   marked position, in \f(CWtroff\fP,  367
.XX
\&\f(CW.RF\fP macro (\f(CWmm\fP),  144
.XX
\&\f(CW.RI\fP macro (\f(CWmm\fP),  119
.XX
\&\f(CW.RL\fP macro (\f(CWmm\fP),  132
.XX
\&\f(CW.rm\fP request,  330, 406
.XX
\&\f(CW.rn\fP request,  331, 407
.XX
\&root
.ZZ
\&   directories,,  11
.ZZ
\&   directory,  11
.XX
\&\f(CW.RP\fP macro (\f(CWmm\fP),  110, 144\(en145
.XX
\&\f(CW.RS\fP macro
.ZZ
\&   (\f(CWmm\fP),  144
.ZZ
\&   (\f(CWms\fP),  91
.XX
\&\f(CW.rs\fP request,  73, 105, 390
.XX
\&\f(CW.RT\fP macro
.ZZ
\&   (\f(CWms\fP),  87
.ZZ
\&   (\f(CWms\fP),  388
.XX
\&\f(CW.rt\fP request,  367, 401
.XX
\&rules for, hyphenation,,  59
.YY s S
.XX
\&\f(CW.S\fP macro (\f(CWmm\fP),  119\(en120
.XX
\&\f(CW.SA\fP macro (\f(CWmm\fP),  114
.XX
\&sample figures, drawing,,  362
.XX
\&scaled units, number registers,,  338
.XX
\&(SCCS), files, tracking changes to,  258
.XX
\&SCCS (Source Code Control System),  258
.XX
\&script, shell scripts, proofreading,  303, 307
.XX
\&\f(CWscript\fP command,  274
.XX
\&scrolling,  3, 32\(en33
.XX
\&\f(CWsdiff\fP command,  254\(en255, 257
.XX
\&search,  \f2see also\fP \f(CWgrep\fP
.XX
\&search,  16, 35, 151, 244
.ZZ
\&   path,  277
.ZZ
\&   path, shell scripts, C shell,  277
.ZZ
\&   regular expression,  244
.XX
\&searching
.ZZ
\&   for, files,,  242
.ZZ
\&   within, files,,  244
.XX
\&secondary
.ZZ
\&   entries, indexing, subordinating,  436
.ZZ
\&   prompt, Bourne shell,,  17
.XX
\&section headings,  407, 413
.XX
\&\f(CWsed\fP editor,  4, 275, 288\(en303, 460\(en462
.ZZ
\&   matching patterns across two lines,  299\(en303
.ZZ
\&   used in indexing script,  440\(en441
.ZZ
\&   addressing,  289\(en290, 460
.ZZ
\&   branching to parts of script,  293, 295
.ZZ
\&   command summary,  461\(en462
.ZZ
\&   command syntax,  289, 460
.ZZ
\&   differences from \f(CWex\fP,  289
.ZZ
\&   excluding lines from editing,  292\(en293
.ZZ
\&   hold space,  300\(en303
.ZZ
\&   in \f(CWformat\fP script,  292
.ZZ
\&   inserting lines of text,  295
.ZZ
\&   invoking,  289, 460
.ZZ
\&   pattern space,  300\(en303
.ZZ
\&   print command,  296
.ZZ
\&   quit command,  298
.ZZ
\&   script for extracting information from a file,  296
.ZZ
\&   substitute command,  290
.ZZ
\&   syntax of commands,  275
.ZZ
\&   used in \f(CWfor\fP loop,  291
.XX
\&\f(CWset\fP command,  15
.XX
\&setting
.ZZ
\&   default values, macros,,  385
.ZZ
\&   default values, shell scripts,,  283
.ZZ
\&   default values with, number registers,,  386
.ZZ
\&   environment variables,,  15\(en16
.ZZ
\&   from command line, number registers,,  82
.ZZ
\&   from command line, page number,,  110
.XX
\&\f(CWsh\fP command,  275
.XX
\&\f(CW.SH\fP macro (\f(CWms\fP),  99\(en100
.XX
\&sheet macros, cover,  100\(en102
.XX
\&shell
.ZZ
\&   background processing, Bourne,  15
.ZZ
\&   Bourne,  10, 275\(en284
.ZZ
\&   C,  10, 239, 275
.ZZ
\&   cancelling commands, Bourne,  10
.ZZ
\&   command summary, Bourne,  495\(en499
.ZZ
\&   conditional execution, Bourne,  278\(en280
.ZZ
\&   discarding and shifting arguments, Bourne,  280
.ZZ
\&   functions, Bourne shell,,  496
.ZZ
\&   interrupting commands, Bourne,  10
.ZZ
\&   long command lines, Bourne,  16
.ZZ
\&   prompt, Bourne,  10
.ZZ
\&   repetitive execution, Bourne,  281, 285
.ZZ
\&   resuming commands, Bourne,  10
.ZZ
\&   script for, proofreading,,  303\(en307
.ZZ
\&   scripts,  17, 275\(en278, 284
.ZZ
\&   scripts, arguments to,  17
.ZZ
\&   scripts, breaking out of,  282
.ZZ
\&   scripts, C shell search path,  277
.ZZ
\&   scripts, conditional execution,  278\(en280
.ZZ
\&   scripts, definition of,  275
.ZZ
\&   scripts, discarding and shifting arguments,  280
.ZZ
\&   scripts, initializing variables,  283
.ZZ
\&   scripts, looping,  285
.ZZ
\&   scripts, making executable,  276
.ZZ
\&   scripts, passing arguments to,  277\(en278
.ZZ
\&   scripts, proofreading script,  303, 307
.ZZ
\&   scripts, putting in path,  276
.ZZ
\&   scripts, reading data interactively,  319
.ZZ
\&   scripts, repetitive execution,  281, 285
.ZZ
\&   scripts, setting default values,  283
.ZZ
\&   secondary prompt, Bourne,  17
.ZZ
\&   shell functions, Bourne,  496
.ZZ
\&   special characters, Bourne,  495
.ZZ
\&   variable substitution, Bourne,  12, 495
.ZZ
\&   variables set by shell under execution, Bourne,  496
.XX
\&shell
.ZZ
\&   \f(CWexport\fP command,  282
.ZZ
\&   number of arguments (\f(CW$#\fP),  281
.ZZ
\&   \f(CWtest\fP command in,  278\(en280
.XX
\&\f(CWshift\fP shell command,  280
.XX
\&simple macro for, two-column processing,,  401
.XX
\&size
.ZZ
\&   in bytes, files,,  242
.ZZ
\&   page,  394
.XX
\&\f(CW.SK\fP macro (\f(CWmm\fP),  125
.XX
\&slanting characters,  376
.XX
\&\f(CW.SM\fP macro
.ZZ
\&   (\f(CWmm\fP),  120\(en121
.ZZ
\&   (\f(CWms\fP),  95\(en96
.XX
\&\f(CW.so\fP request,  83, 381, 385
.XX
\&\f(CWsoelim\fP command,  382
.XX
\&\f(CWsort\fP command,  16, 261\(en262, 434
.XX
\&sorting raw entries, indexing,,  434
.XX
\&(Source Code Control System), SCCS,  258
.XX
\&\f(CW.SP\fP macro (\f(CWmm\fP),  113\(en114
.XX
\&\f(CW.sp\fP request,  58, 68\(en70
.XX
\&space
.ZZ
\&   at top of page,  390
.ZZ
\&   unpaddable,  59, 92, 378
.XX
\&spacing
.ZZ
\&   baseline,  80\(en81
.ZZ
\&   constant,  375, 419
.ZZ
\&   vertical,  61, 68, 80, 87, 113, 119
.XX
\&special
.ZZ
\&   characters, Bourne shell,,  495
.ZZ
\&   fonts,,  52, 77
.ZZ
\&   formatting problems, indexing,,  440
.XX
\&\f(CWspell\fP command,  241, 247, 303
.XX
\&\f(CWsplit\fP command,  268
.XX
\&splitting, diversions,,  426
.XX
\&SQ\f(CWtroff\fP,  349
.XX
\&\f(CW.ss\fP request,  375\(en376
.XX
\&standard
.ZZ
\&   error,  10, 426
.ZZ
\&   error, table of contents, written to,  422, 426
.ZZ
\&   fonts, four,  52
.ZZ
\&   input,  16
.ZZ
\&   output,  10, 16
.XX
\&strings
.ZZ
\&   appending to,  343
.ZZ
\&   comparing,  335
.ZZ
\&   defining,  342
.ZZ
\&   interpolating,  83, 342
.ZZ
\&   multiline,  82
.ZZ
\&   naming,  342
.XX
\&strings
.ZZ
\&   in \f(CWtroff\fP,  82
.ZZ
\&   \f(CWmm\fP,  146
.XX
\&structure of package, macros,,  383\(en384
.XX
\&style, macros,,  350, 414
.XX
\&sub-, directories,,  11
.XX
\&subdirectory,  11
.XX
\&subordinating secondary entries, indexing,,  436
.XX
\&subscripts,  \f2see also\fP \f(CWeqn\fP
.XX
\&subscripts,  195
.XX
\&substituting for environment switch, number registers,,  419
.XX
\&substitution, Bourne shell, variable,  495
.XX
\&superscripts,  \f2see also\fP \f(CWeqn\fP
.XX
\&superscripts,  195, 355
.XX
\&super-user,  242
.XX
\&\f(CW.sv\fP request,  73\(en74
.XX
\&\f(CW.sy\fP request,  382, 427
.XX
\&syntax of commands, UNIX,,  9
.XX
\&system fundamentals, UNIX,,  9
.XX
\&systems, files, transferring to other,  273
.YY t T
.XX
\&\f(CW.ta\fP request,  66\(en68, 372
.XX
\&table of
.ZZ
\&   contents,  422, 430
.ZZ
\&   contents, created by diversion,  422, 424
.ZZ
\&   contents, diversions,,  422
.ZZ
\&   contents, written to standard error,  422, 426
.XX
\&table of contents, \f(CWmm\fP macros,  141\(en142
.XX
\&tabs and leaders in, macros,,  375
.XX
\&tabs
.ZZ
\&   (in \f(CWtroff\fP),  66\(en68
.ZZ
\&   (in \f(CWtroff\fP),  372
.XX
\&\f(CWtail\fP command,  244
.XX
\&\f(CWtar\fP command,  274
.XX
\&\f(CW.TB\fP macro (\f(CWmm\fP),  110, 142
.XX
\&\f(CWtbl\fP preprocessor,  169\(en189
.ZZ
\&   global format options,  170\(en173
.ZZ
\&   alphabetic data columns,  175
.ZZ
\&   breaking up long tables,  184
.ZZ
\&   changing format within table,  181
.ZZ
\&   column format options,  173
.ZZ
\&   column format options,  486
.ZZ
\&   column width,  180
.ZZ
\&   column width,  179
.ZZ
\&   complex table example,  186
.ZZ
\&   data,  170\(en171, 487
.ZZ
\&   describing column formats,  173
.ZZ
\&   drawing lines within tables,  177
.ZZ
\&   equations within tables,  176
.ZZ
\&   fonts,  178
.ZZ
\&   format options,  170\(en172
.ZZ
\&   global format options,  486
.ZZ
\&   headers,  174
.ZZ
\&   horizontally spanning headers,  175
.ZZ
\&   invoking,  170
.ZZ
\&   numeric data columns,  175
.ZZ
\&   point sizes,  178
.ZZ
\&   problems with \f(CW.so\fP request,  381
.ZZ
\&   putting text blocks in a column,  182
.ZZ
\&   repeating table headers,  184
.ZZ
\&   simple table example,  171
.ZZ
\&   spacing within tables,  174
.ZZ
\&   staggered columns,  180
.ZZ
\&   summary of commands,  485\(en487
.ZZ
\&   table end macro,  170
.ZZ
\&   table formatting checklist,  186
.ZZ
\&   table specifications,  169
.ZZ
\&   table start macro,  170
.ZZ
\&   titling tables,  185
.ZZ
\&   using eqn with,  170, 192
.ZZ
\&   vertical spacing within data blocks,  180
.ZZ
\&   vertically spanning columns,  176
.XX
\&\f(CW.TC\fP macro (\f(CWmm\fP),  141
.XX
\&\f(CW.tc\fP request,  373
.XX
\&\f(CWTERM\fP variable,  15, 21
.XX
\&terminal type,  15, 21, 26
.XX
\&terminal
.ZZ
\&   messages from \f(CWtroff\fP,  348
.ZZ
\&   \f(CWtroff\fP,  350
.XX
\&\f(CWtest\fP command,  278\(en280
.XX
\&three-part titles, page number, in,  393
.XX
\&\f(CW.ti\fP request,  63
.XX
\&\f(CWtip\fP command,  272
.XX
\&title length,  393
.XX
\&\f(CW.TL\fP macro (\f(CWms\fP),  101
.XX
\&\f(CW.tl\fP request,  391
.XX
\&\f(CW.tm\fP request,  348, 350, 398, 422, 427
.XX
\&to
.ZZ
\&   a file, appending,  11
.ZZ
\&   macros, appending,  330
.ZZ
\&   (SCCS), files, tracking changes,  258
.ZZ
\&   UNIX commands, arguments,,  9
.XX
\&top of page, space at,  390
.XX
\&\f(CW.TP\fP macro (\f(CWmm\fP),  147
.XX
\&\f(CWtplus\fP postprocessor,  375
.XX
\&\f(CWtr\fP
.ZZ
\&   command,  267
.ZZ
\&   request,  347, 377\(en378
.XX
\&tracking changes to (SCCS), files,,  258
.XX
\&transferring to other systems, files,,  273
.XX
\&transparent output,  366, 423
.XX
\&traps,  72, 385, 389\(en391, 394, 399
.XX
\&\f(CWtroff\fP formatter,  47\(en84, 329\(en382
.ZZ
\&   predefined number register names,  473\(en474
.ZZ
\&   returning to a vertical position,  367
.ZZ
\&   selecting output pages from command line,  74
.ZZ
\&   \f(CW.ab\fP request,  350
.ZZ
\&   aborting,  350
.ZZ
\&   absolute motions,  357, 369
.ZZ
\&   \f(CW.ad\fP request,  57\(en59
.ZZ
\&   \f(CW.ad\fP request,  386
.ZZ
\&   adjusting title length,  393
.ZZ
\&   aligning numeric data,  67
.ZZ
\&   \f(CW.am\fP request,  330
.ZZ
\&   appending to a macro,  330
.ZZ
\&   appending to a diversion,  344
.ZZ
\&   appending to a string,  343
.ZZ
\&   arithmetic expressions,  334
.ZZ
\&   \f(CW.as\fP request,  343
.ZZ
\&   autoincrementing number registers,  341
.ZZ
\&   basic assumptions,  48
.ZZ
\&   \f(CW.bd\fP request,  368
.ZZ
\&   boldfacing fonts by overstriking,  368
.ZZ
\&   \f(CW.bp\fP request,  72\(en74
.ZZ
\&   \f(CW.bp\fP request,  70
.ZZ
\&   \f(CW.br\fP request,  55, 344
.ZZ
\&   bracket-building characters,  371, 475
.ZZ
\&   \f(CW.c2\fP request,  346
.ZZ
\&   \f(CW.cc\fP request,  346
.ZZ
\&   \f(CW.ce\fP request,  65\(en66
.ZZ
\&   \f(CW.cf\fP request,  366
.ZZ
\&   \f(CW.ch\fP request,  399
.ZZ
\&   change bars,  379
.ZZ
\&   changing page size,  394
.ZZ
\&   character output translations,  377
.ZZ
\&   command line options,  468
.ZZ
\&   comments,  329
.ZZ
\&   comparing strings,  335
.ZZ
\&   compiling font files,  503
.ZZ
\&   conditional execution,  334
.ZZ
\&   constant spacing,  375
.ZZ
\&   copy mode,  333
.ZZ
\&   \f(CW.cs\fP request,  375
.ZZ
\&   \f(CW.cu\fP request,  68
.ZZ
\&   cut marks,  395\(en396
.ZZ
\&   \f(CW.da\fP request,  344, 423
.ZZ
\&   \f(CW.de\fP request,  81, 330
.ZZ
\&   debugging,  347\(en349
.ZZ
\&   default units,  62
.ZZ
\&   defining macros,  70, 81, 330
.ZZ
\&   defining strings,  342
.ZZ
\&   device units,  61
.ZZ
\&   \f(CW.di\fP request,  343, 359
.ZZ
\&   diversions,  359
.ZZ
\&   double or triple spacing,  70
.ZZ
\&   downloadable fonts,  52
.ZZ
\&   drawing,  358\(en362
.ZZ
\&   \f(CW.ds\fP request,  82, 342
.ZZ
\&   \f(CW.ec\fP request,  346
.ZZ
\&   \f(CW.el\fP request,  334\(en337
.ZZ
\&   \f(CW.em\fP request,  423
.ZZ
\&   environment switching,  345
.ZZ
\&   \f(CW.eo\fP request,  346
.ZZ
\&   error handling,  349
.ZZ
\&   escape sequences,  472\(en473
.ZZ
\&   escape sequences,  54, 354
.ZZ
\&   \f(CW.ev\fP request,  345
.ZZ
\&   \f(CW.ex\fP request,  380
.ZZ
\&   executing system commands from,  382
.ZZ
\&   expression operators,  335
.ZZ
\&   \f(CW.fc\fP request,  374
.ZZ
\&   \f(CW.fi\fP request,  56
.ZZ
\&   fields,  374
.ZZ
\&   \f(CW.fl\fP request,  105, 348, 390
.ZZ
\&   flushing output buffer,  348
.ZZ
\&   fonts,  52, 74\(en77
.ZZ
\&   footnotes,  397
.ZZ
\&   form letters,  380
.ZZ
\&   \f(CW.fp\fP request,  75\(en76
.ZZ
\&   \f(CW.ft\fP request,  75\(en76
.ZZ
\&   Greek characters,  476
.ZZ
\&   headers and footers,  391
.ZZ
\&   horizontal spacing,  61
.ZZ
\&   \f(CW.hw\fP request,  59
.ZZ
\&   \f(CW.hy\fP request,  60
.ZZ
\&   \f(CW.hy\fP request,  386
.ZZ
\&   hyphenation,  59\(en60, 385
.ZZ
\&   \f(CW.ie\fP request,  334\(en337
.ZZ
\&   \f(CW.if\fP request,  334\(en337
.ZZ
\&   \f(CW.ig\fP request,  348
.ZZ
\&   ignoring input,  348
.ZZ
\&   \f(CW.in\fP request,  64
.ZZ
\&   including Macintosh illustrations,  366
.ZZ
\&   interactive use,  348
.ZZ
\&   interrupted lines,  337
.ZZ
\&   interword spacing,  50
.ZZ
\&   inverse conditions,  337
.ZZ
\&   invoking,  53, 468
.ZZ
\&   justification using \f(CWmm\fP,  114
.ZZ
\&   keeping text block together,  343
.ZZ
\&   \f(CW.lc\fP request,  373
.ZZ
\&   leaders,  373
.ZZ
\&   \f(CW.lg\fP request,  377
.ZZ
\&   ligatures,  377
.ZZ
\&   line drawing,  358
.ZZ
\&   line weight,  362
.ZZ
\&   \f(CW.ll\fP request,  63, 386
.ZZ
\&   local horizontal motions,  356
.ZZ
\&   local vertical motions,  353
.ZZ
\&   \f(CW.ls\fP request,  70, 80
.ZZ
\&   \f(CW.lt\fP request,  393
.ZZ
\&   macro arguments,  332
.ZZ
\&   macro arguments,  81
.ZZ
\&   macro names,  330
.ZZ
\&   macro style,  350
.ZZ
\&   marking a vertical position,  367
.ZZ
\&   marking a horizontal position,  369
.ZZ
\&   mathematic symbols,  475
.ZZ
\&   \f(CW.mc\fP request,  379
.ZZ
\&   \f(CW.mk\fP request,  367, 401
.ZZ
\&   multi-column processing,  401
.ZZ
\&   multi-column processing,  367
.ZZ
\&   multiline conditions,  336
.ZZ
\&   \f(CW.na\fP request,  57
.ZZ
\&   names of existing macros,  330
.ZZ
\&   names of existing number registers,  331
.ZZ
\&   \f(CW.ne\fP request,  73, 403
.ZZ
\&   negative vertical motions,  69
.ZZ
\&   nested macros,  333
.ZZ
\&   \f(CW.nf\fP request,  55
.ZZ
\&   \f(CW.nm\fP request,  378
.ZZ
\&   \f(CW.nn\fP request,  379
.ZZ
\&   \f(CW.nr\fP request,  82, 338
.ZZ
\&   \f(CW.ns\fP request,  73\(en74
.ZZ
\&   \f(CW.ns\fP request,  105, 389
.ZZ
\&   number registers,  82, 334\(en339, 386, 417, 419
.ZZ
\&   numeric expressions,  62
.ZZ
\&   \f(CW.nx\fP request,  380
.ZZ
\&   \f(CW.os\fP request,  73\(en74
.ZZ
\&   output line numbering,  378
.ZZ
\&   overstriking,  368, 370
.ZZ
\&   page breaks,  403
.ZZ
\&   page breaks without line breaks,  72
.ZZ
\&   page layout,  60, 391
.ZZ
\&   page length,  70\(en71
.ZZ
\&   page numbering,  74
.ZZ
\&   page numbers,  392
.ZZ
\&   page offset,  414
.ZZ
\&   page top resets,  402
.ZZ
\&   page transition,  70\(en71, 384\(en403
.ZZ
\&   \f(CW.pc\fP request,  393
.ZZ
\&   \f(CW.pl\fP request,  72, 394
.ZZ
\&   \f(CW.pm\fP request,  330
.ZZ
\&   \f(CW.pn\fP request,  74
.ZZ
\&   \f(CW.po\fP request,  63, 386
.ZZ
\&   point size,  78\(en79
.ZZ
\&   postprocessors,  53\(en54, 366
.ZZ
\&   predefined number register names,  339
.ZZ
\&   predefined conditions,  334
.ZZ
\&   \f(CW.ps\fP request,  79\(en80
.ZZ
\&   pseudo-page transition,  390
.ZZ
\&   \f(CW.rd\fP request,  380
.ZZ
\&   reading standard input,  380
.ZZ
\&   read-only number registers,  340, 473
.ZZ
\&   redefining control and escape characters,  346
.ZZ
\&   removing macros,  330
.ZZ
\&   removing number registers,  342
.ZZ
\&   renaming macros,  331
.ZZ
\&   returning to a horizontal position,  369
.ZZ
\&   \f(CW.rm\fP request,  330, 406
.ZZ
\&   \f(CW.rn\fP request,  331, 407
.ZZ
\&   \f(CW.rs\fP request,  73, 105, 390
.ZZ
\&   \f(CW.rt\fP request,  367, 401
.ZZ
\&   setting page number from command line,  74
.ZZ
\&   \f(CW.so\fP request,  83, 348, 381, 385
.ZZ
\&   space at top of page,  390
.ZZ
\&   \f(CW.sp\fP request,  68\(en70
.ZZ
\&   \f(CW.sp\fP request,  58
.ZZ
\&   space size,  376
.ZZ
\&   spacing to an absolute position,  69
.ZZ
\&   special characters,  474\(en476
.ZZ
\&   special characters,  77
.ZZ
\&   \f(CW.ss\fP request,  375\(en376
.ZZ
\&   stacking up characters,  371
.ZZ
\&   summary of requests,  468\(en471
.ZZ
\&   superscripts,  355
.ZZ
\&   suspending line numbering,  379
.ZZ
\&   \f(CW.sv\fP request,  73\(en74
.ZZ
\&   \f(CW.sy\fP request,  382
.ZZ
\&   syntax of requests,  54
.ZZ
\&   \f(CW.ta\fP request,  66\(en68
.ZZ
\&   \f(CW.ta\fP request,  372
.ZZ
\&   tabs and leaders,  372
.ZZ
\&   tabs in macros,  375
.ZZ
\&   \f(CW.tc\fP request,  373
.ZZ
\&   terminal messages,  348
.ZZ
\&   three-part titles,  393
.ZZ
\&   \f(CW.ti\fP request,  63
.ZZ
\&   \f(CW.tl\fP request,  391
.ZZ
\&   \f(CW.tm\fP request,  348, 350, 398, 422
.ZZ
\&   \f(CW.tr\fP request,  377\(en378
.ZZ
\&   \f(CW.tr\fP request,  347
.ZZ
\&   transparent output,  366
.ZZ
\&   traps,  70, 385, 389\(en391, 394, 399
.ZZ
\&   two-column processing,  367
.ZZ
\&   \f(CW.ul\fP request,  68
.ZZ
\&   underlining,  358
.ZZ
\&   units of measure,  61\(en62
.ZZ
\&   used with laser printers,  7
.ZZ
\&   using \f(CWpic\fP with,  207
.ZZ
\&   using \f(CWpic\fP with,  210
.ZZ
\&   using with \f(CWms\fP,  86
.ZZ
\&   versions of,  52
.ZZ
\&   vertical spacing,  61, 68, 80
.ZZ
\&   vertically stacked labels,  371
.ZZ
\&   \f(CW.vs\fP request,  80\(en81
.ZZ
\&   \f(CW.wh\fP request,  70, 386, 389, 399
.ZZ
\&   widows and orphans,  403
.ZZ
\&   width function,  370
.XX
\&two-column processing, simple macro for,  401
.XX
\&two-column processing, \f(CWms\fP macros,  103\(en104
.XX
\&\f(CW.TX\fP macro (\f(CWmm\fP),  147
.XX
\&\f(CW.TY\fP macro (\f(CWmm\fP),  147
.XX
\&type, terminal,  21, 26
.XX
\&types of, justification,,  57\(en59
.XX
\&(types of), printers,  6\(en7
.XX
\&typesetter, C/A/T,  51, 53, 61
.YY u U
.XX
\&\f(CW.UL\fP macro (\f(CWms\fP),  95
.XX
\&\f(CW.ul\fP request,  68
.XX
\&underlining,  95
.XX
\&underlining
.ZZ
\&   in \f(CWtroff\fP,  358
.ZZ
\&   \f(CWms\fP macros,  95
.XX
\&\f(CWuniq\fP command,  261\(en262
.XX
\&units, number registers, scaled,  338
.XX
\&UNIX
.ZZ
\&   commands, errors, messages from,  10
.ZZ
\&   commands, miscellaneous,  239
.ZZ
\&   commands, options to,  9
.ZZ
\&   syntax of commands,  9
.ZZ
\&   system fundamentals,  9
.ZZ
\&   version used for this book,  9
.XX
\&\f(CWunpack\fP command,  272
.XX
\&unpaddable space,  59, 92, 378
.XX
\&used
.ZZ
\&   as flags, number registers,,  339
.ZZ
\&   for footnotes, diversions,,  400
.ZZ
\&   to generalize macros, number registers,,  338
.XX
\&user entries, indexing, form of,  433
.XX
\&user exit macros (\f(CWmm\fP),  147
.XX
\&\f(CW/usr/lib/font\fP,  50, 52, 75, 501\(en503
.ZZ
\&   \f(CWDESC\fP tile,  501\(en502
.ZZ
\&   font description files,  502\(en503
.XX
\&\f(CW/usr/lib/tmac\fP,  83
.XX
\&\f(CWuucp\fP command,  272
.XX
\&\f(CWuuname\fP command,  273
.YY v V
.XX
\&values
.ZZ
\&   macros, setting default,  385
.ZZ
\&   shell scripts, setting default,  283
.XX
\&variable substitution, Bourne shell,,  12, 495
.XX
\&variable-item lists, \f(CWmm\fP macros,  134
.XX
\&variables
.ZZ
\&   number registers, as global,  338
.ZZ
\&   set by shell under execution, Bourne shell,,  496
.ZZ
\&   setting, environment,  15\(en16
.ZZ
\&   shell scripts, initializing,  283
.XX
\&version used for this book, UNIX,,  9
.XX
\&vertical
.ZZ
\&   motions, local,  353
.ZZ
\&   spacing,  61, 68, 80, 87, 113, 119
.XX
\&vertically stacked labels,  371
.XX
\&\f(CWvi\fP editor, \f(CWex\fP commands in,  \f2see also\fP \f(CWex\fP
.XX
\&\f(CWvi\fP editor,  19\(en42, 149\(en168
.ZZ
\&   deleting single characters,  25\(en29
.ZZ
\&   abbreviations,  165
.ZZ
\&   alternative insert commands,  43
.ZZ
\&   append text,  43
.ZZ
\&   appending to named buffers,  44
.ZZ
\&   changing text,  26\(en28
.ZZ
\&   characters not used in command mode,  453
.ZZ
\&   command line options,  38
.ZZ
\&   command mode,  21
.ZZ
\&   command summary,  451, 455
.ZZ
\&   command syntax,  451
.ZZ
\&   command syntax,  21
.ZZ
\&   copying text,  30, 42
.ZZ
\&   current and alternate filenames,  164
.ZZ
\&   cursor movement within lines,  34
.ZZ
\&   cursor movement within screen,  33
.ZZ
\&   cursor movement,  22\(en23
.ZZ
\&   cursor movement by line numbers,  37
.ZZ
\&   cursor movement by text blocks,  34
.ZZ
\&   cursor movement with numeric argument,  35
.ZZ
\&   deleting text,  28\(en29
.ZZ
\&   deleting text,  25
.ZZ
\&   displaying line numbers,  24, 37
.ZZ
\&   editing multiple files,  163
.ZZ
\&   errors when opening,  21
.ZZ
\&   \f(CWex\fP commands in,  151
.ZZ
\&   filtering text through a UNIX command,  162
.ZZ
\&   ignoring case during searches,  40
.ZZ
\&   insert mode,  19, 21
.ZZ
\&   inserting text,  21, 25
.ZZ
\&   joining lines,  31
.ZZ
\&   leaving insert mode,  22, 26
.ZZ
\&   mapping command sequences,  166
.ZZ
\&   marking place in file,  45
.ZZ
\&   movement by line number,  37
.ZZ
\&   moving by screenfuls,  32
.ZZ
\&   moving cursor by single lines,  23
.ZZ
\&   moving cursor by spaces,  23
.ZZ
\&   moving cursor by text blocks,  25
.ZZ
\&   moving text,  25, 29, 46
.ZZ
\&   named buffers,  44\(en45
.ZZ
\&   numbered buffers,  43\(en44
.ZZ
\&   numeric arguments to commands,  24
.ZZ
\&   numeric prefixes to commands,  42
.ZZ
\&   on a dumb terminal,  26
.ZZ
\&   opening a file,  20
.ZZ
\&   opening a new line for insertion,  43
.ZZ
\&   opening a file to a specific place,  38
.ZZ
\&   pattern matching characters,  182
.ZZ
\&   prompt line,  21
.ZZ
\&   quitting,  21
.ZZ
\&   quitting without saving edits,  32
.ZZ
\&   read-only mode,  39
.ZZ
\&   recovering a buffer,  39
.ZZ
\&   recovering deletions,  43
.ZZ
\&   repeat last search,  36
.ZZ
\&   repeating last command,  31
.ZZ
\&   replacing characters,  28, 42
.ZZ
\&   returning to a position,  37
.ZZ
\&   saving a file,  22
.ZZ
\&   screen lines vs. logical lines,  24
.ZZ
\&   scrolling,  32\(en33
.ZZ
\&   search for pattern,  35\(en37
.ZZ
\&   search options,  42
.ZZ
\&   search within current line,  36
.ZZ
\&   setting options,  40\(en42
.ZZ
\&   setting options,  40, 453
.ZZ
\&   shiftwidth,  42
.ZZ
\&   showing contents of numbered buffers,  44
.ZZ
\&   size of window,  40
.ZZ
\&   status line,  451
.ZZ
\&   summary of options,  450
.ZZ
\&   undoing last change,  31, 43
.ZZ
\&   view mode,  39
.ZZ
\&   wrapmargin,  22, 42
.XX
\&\f(CWview\fP command,  \f2see\fP \f(CWvi\fP editor
.XX
\&\f(CWview\fP command,  39
.XX
\&viewing contents, files,,  243
.XX
\&\f(CW.VL\fP macro (\f(CWmm\fP),  134
.XX
\&\f(CW.VM\fP macro (\f(CWmm\fP),  147
.XX
\&\f(CW.vs\fP request,  80\(en81
.XX
\&vs. text editors, word processors,,  2
.YY w W
.XX
\&\f(CWwc\fP command,  16
.XX
\&\f(CW.wh\fP request,  70, 386, 389, 399
.XX
\&\f(CWwhile\fP shell command,  281
.XX
\&\f(CWwho\fP command,  16
.XX
\&widows and orphans,  403
.XX
\&width
.ZZ
\&   fonts, constant,  419
.ZZ
\&   function,  370
.XX
\&with a
.ZZ
\&   markup language, formatting,,  5
.ZZ
\&   word processor, formatting,,  4
.XX
\&within, files, searching,  244
.XX
\&without line breaks, page breaks,,  72
.XX
\&word
.ZZ
\&   processing on, Macintosh,,  7
.ZZ
\&   processor, formatting, with a,  4
.ZZ
\&   processors, characteristics of,  1\(en4
.ZZ
\&   processors, command mode vs. insert mode,  3
.ZZ
\&   processors, influence on writing process,  1
.ZZ
\&   processors, limitations of,  2, 5
.ZZ
\&   processors, vs. text editors,  2
.XX
\&Writer's Workbench,  250
.ZZ
\&   miscellaneous programs,  252
.XX
\&Writer's
.ZZ
\&   analyze style/readability (\f(CWstyle\fP),  250
.ZZ
\&   explain \f(CWdiction\fP errors (\f(CWexplain\fP),  252
.ZZ
\&   search for poor phrasing (\f(CWdiction\fP),  251
.XX
\&writing process, word processors, influence on,  1
.XX
\&written to standard error, table of contents,,  422, 426
.XX
\&\f2wysiwyg\fP defined,  5
.YY x X
.XX
\&\f(CWxargs\fP command,  246
