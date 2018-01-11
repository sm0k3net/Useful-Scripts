**Linux commands**
* **Clearing bash history:** $ cat /dev/null > ~/.bash_history && history -c && exit
* **Top 10 process that using the most memory:** $ ps aux --sort=-%mem | awk 'NR<=10{print $0}'
* **Show folders & files size:** $ for i in G M K; do du -ah | grep [0-9]$i | sort -nr -k 1; done | head -n 11
* **tcpdump & rsyslog debug (sending log):** $ tcpdump -nnvli any dst host 192.168.1.2 and port 514
* **tcpdump & rsyslog debug (receiving log):** $ tcpdump -nnvli any src host 192.168.1.1 and port 514
* **Delete line in a file with sed (from line 5 to 10 and line 12):** $ sed -i.bak -e '5,10d;12d' file
* **Uncomment line with sed and store it:** $ sed 's/^#//' file -i.bak
* **List something in the folder and count it:** $ ls -l /etc/ | wc -l
* **List only rules files names in /suricata/rules (to count them just add "| wc -l"):** $ ls -l /etc/suricata/rules | grep rules | awk '{print $9}'


**Windows commands**


**Snort commands & testing**

