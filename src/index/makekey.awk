BEGIN { FS=OFS="\t" }

# in -	'pg	string'		out -	'pg	string'
# in -	'pg	str [ing]'	out -	'pg	str [ing] %key str ing'

$2 ~ /[\[\]]/ {	#left/right square brackets
	ss = $2
	sub( /\[/, "", ss )	# remove brackets from key
	sub( /\]/, "", ss )
	sub( /\~/, " ", ss )	# dump tildes too
	print $0 " %key " ss	# insert key string
	next
}
$2 ~ /[\{\}]/ {	#left/right square brackets
	ss = $2
	sub( /\{/, "", ss )	# remove brackets from key
	sub( /\}/, "", ss )
	sub( /\~/, " ", ss )	# dump tildes too
	print $0 " %key " ss	# insert key string
	next
}
{ print }
