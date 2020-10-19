BEGIN	{
			FS="\t";
			print ".so utp.mac";
			print ".utp";
			print ".pl 27.9c";
			print ".nr % 5";	#set to starting page number for TOC
			print ".nr PN \\n%";
			print ".Se \"\"  Contents NONE";
			print ".af PN i";
			print ".vs 12";
			print ".nr llen \\n(.lu-.25i";
			print ".ta \\n[llen]uR";
			print ".nf";
			print ".sp 2"
		}
/^Se:/	{
			if ( $5 == "Contents" )
				next;
			gsub(/\\f\(CW/, "\\f[CB]" );
			gsub(/\\f\(CB/, "\\f[CB]" );
			gsub(/\\f\[CW\]/, "\\f[CB]" );
			gsub(/\\fC/, "\\f[CB]" );
			print ".ps 12\n.sp";
			print $4"\\h'|.25i'\\fB\\c";
			print ".pdfhref L -D "$2" -E -- "$5"\t\\fR"$3;
			print ".ps 10\n.sp";
		}
/^Ah:/	{
			gsub(/\\f\(CB/, "\\f[CW]" );
			gsub(/\\f\[CB\]/, "\\f[CW]" );
			print ".pdfhref L -D "$2" -P \\h'|.25i' -E -- "$4""$3;
		}
# default (skip index entries)
	{ next; }

END		{
			print ".af PN 1";
			print ".nr chapter_page2 1";
		}
