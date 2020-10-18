BEGIN	{
			FS="\t";
			print ".so utp.mac";
			print ".utp";
			print ".nr % 5";	#set to starting page number for TOC
			print ".nr PN \\n%";
			print ".Se \"\"  Contents NONE";
			print ".af PN i";
			print ".vs 12";
			print ".ta \\n(.luR";
			print ".nf";
			print ".sp 2"
		}
/^Se:/	{
			if ( $4 == "Contents" )
				next;
			gsub(/\\f\(CW/, "\\f\(CB" );
			gsub(/\\f\[CW\]/, "\\f\[CB\]" );
			gsub(/\\fC/, "\\f\[CB\]" );
			print ".ps 12\n.sp";
			print $3"\\h'|.25i'\\fB"$4"\\fR	"$2;
			print ".ps 10\n.sp";
		}
/^Ah:/	{
			gsub(/\\f\(CB/, "\\f\(CW" );
			gsub(/\\f\[CB\]/, "\\f\[CW\]" );
			print "\\h'|.25i'"$3""$2;
		}
# default (skip index entries)
	{ next; }

END		{
			print ".af PN 1";
			print ".nr chapter_page2 1";
		}
