#!/usr/bin/awk -f 
#
# A very simple hyphen utility
# Usage: nroff [options] file | [me]

BEGIN {
	broken = 0 # true if previous line ended with a hyphen
	stem = ""  # keep the last word on the line if it ends with a hyphen
}

# If previous line had its last word hyphenated,
# join it and the first word & print.
broken > 0 { 
  print stem $1 
  broken = 0 
} 

# Keep and flag a hyphenated word at end of line.
# We're looking for "normal" and UTF-8 hyphens.
$NF ~ /[-‐]$/ { 
  stem = $NF 
  broken = 1 
}

