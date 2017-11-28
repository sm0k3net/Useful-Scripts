**Clearing bash history:** cat /dev/null > ~/.bash_history && history -c && exit
**Top 10 process that using the most memory:** ps aux --sort=-%mem | awk 'NR<=10{print $0}'
**Show folders & files size:** for i in G M K; do du -ah | grep [0-9]$i | sort -nr -k 1; done | head -n 11
