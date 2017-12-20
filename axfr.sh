#!/bin/bash

# how-to:
# $ chmod +x axfr.sh
# $ cat domains.txt | xargs ./axfr.sh
# You will find separate files named by domain names and results of test inside

for domain
do
	ns=$(dig ns $domain +short)
	for item in $ns
	do
		axfr=$(dig axfr $domain @$item)
		echo "$axfr" >> "$domain".txt
	done
done
