#!/bin/bash

#Detecting IP addresses with most requests and addint to temporary file
cat /home/website/access-logs/website.log | grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' | sort | uniq -c | sed 's/^[ \t]*//' | sort -k1 -t" " -n | tail -20 > iplist.txt

#Adding IPs from temporary file to .htaccess 'deny' rules
awk '{if ($1 > 1000 && $2 != "white_ip") {print "deny from " $2}}' iplist.txt >> test1.txt

#Delete our temporary file
rm iplist.txt

#Clearing logs
echo > website.log
