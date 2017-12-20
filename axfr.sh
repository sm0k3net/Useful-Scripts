#!/bin/bash
if which dig 2>&1 >/dev/null ; then
echo "Starting the tests..."
mkdir "domains_check"
for domain
do
	ns=$(dig ns $domain +short)
	for item in $ns
	do
		axfr=$(dig axfr $domain @$item)
		if test=$(echo "$axfr" | grep "Transfer failed") ;
		then 
			echo "$domain [$item] - failed" >> domains_check/stats.txt
			#echo "true"
		else
			echo "$axfr" >> "domains_check/$domain".txt
			echo "$domain [$item] - success" >> domains_check/stats.txt
			#echo "false"
		fi
	done
done
echo "All tests were finished!"
sresults=$(grep -c 'success' domains_check/stats.txt) ;  echo "Successful results: $sresults"
fresults=$(grep -c 'failed' domains_check/stats.txt) ;  echo "Failed results: $fresults"
else
	echo "No dig installed..."
	echo "Use 'apt-get install dnsutils' (Debian/Ubuntu) or 'yum install dnsutils' (CentOS/RHEL)"
fi
