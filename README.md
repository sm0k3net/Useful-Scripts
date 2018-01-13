Useful Scripts
============
<pre>
<u>Linux, Bash:</u>

* <b>vsftpd.sh</b> -- fast vsftpd config for Debian server with /var/ftp directory, ftpuser group
* <b>deb-kern-up.sh</b> -- Debian distro kernel update script, don't forget to change version to keep it up to date
* <b>simple_apache_firewall.sh</b> -- Simple firewall script for apache to block IPs with lots requests from log
* <b>swap.sh</b> -- Script to count RAM and help create swap for faster system working
* <b>wordpress.sh</b> -- Special script to help configure Apache, MySQL, WordPress, Swap and some other stuff, automatically installs all required packages, configure files etc
* <b>axfr.sh</b> -- script for quick check for possible domain zone trasfer misconfiguration (simple guide inside the file)
</pre>

<hr />

<pre>
<u>Windows, PowerShell:</u>

* <b>winlogs.ps1</b> -- Windows Logs Extracting is a PowerShell script to easily extract required logs preformated for quick parsing into text file.
Usage:
 ./winlogs.ps1 list  #will show all available logs
 ./winlogs.ps1 "Security" 25  #will store 25 security log events into file with mask "date_logtype.txt" i.e: 20160303_security.txt</pre>
</pre>

<pre>
<u>Windows, Batch: </u>
* <b>quser.bat</b> -- Windows batch script to check users in domain with "query user" command with list of IP addresses from ip.txt file (1 ip address on the line)
Usage:
 1. Create ip.txt file with list of IP addresses
 2. Put in the same directory both files (quser.bat & ip.txt)
 3. Start from command line batch file "quser.bat". If need to do output into the file, just use "quser.bat > results.txt" as example.
</pre>
