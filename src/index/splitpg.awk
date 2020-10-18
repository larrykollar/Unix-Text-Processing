BEGIN {
	FS = "	"
	OFS = "	"
}
{
	split( $NF, pages, "," )
	$NF = ""
	for( i in pages ) {
		sub( /^ /, "", pages[i] )
		print pages[i] "	" $0
	}
}
