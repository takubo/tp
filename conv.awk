#!/usr/local/bin/gawk -f

BEGIN {
	OFS = ""

	print "#!/bin/sh"
	print ""

	page = 1
	print "page" page "()"
	print "{"
}

/^$/ || /^\^L/ {
	print "}"
	print ""
	page++
	print "page" page "()"
	print "{"
	next
}

!/^%/ {
	req_reset = -1

	if (/^\*/) {
		print "yellow; bold"
	} else if (/^---/) {
		print "yellow"
	} else if (/^\s*!!/) {
		sub(/!!/, "")
		print "yellow; bold"
	} else if (/^\s*%%/) {
		sub(/%%/, "")
		print "yellow"
	} else {
		req_reset = 0
	}

	print "echo ", "'", $0, "'"

	if (req_reset) {
		print "reset"
	}
}

END {
	print "}"
	print ""
	print "page_num=", page
	print ""
	system("cat tp_src")
}
