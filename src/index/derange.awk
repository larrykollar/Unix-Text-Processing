BEGIN { FS=OFS="\t" }

$1 ~ /-/ {
	split( $1, be, "-" )
	$1 = ""
	ss = "%begin " $2
	es = "%end " $2
	print be[1], ss
	print be[2], es
	next
}
{ print }
