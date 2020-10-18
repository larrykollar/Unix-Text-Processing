awk  '/^\.\\" page/ {  print ".page " $3; next; }
	{ print $0; }' $1 >$2
