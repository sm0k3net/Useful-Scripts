#!/bin/bash
#Fast vsftpd install && config for Debian distro
aptitude update
aptitude install vsftpd -y
usermod -d /var/ftp ftp
rmdir /home/ftp
addgroup ftpuser
useradd -d /var/ftp -g ftpuser ftpuser
mkdir /var/ftp
mkdir /var/ftp/tmp
mkdir /var/ftp/tmp/torrents
chmod 555 /var/ftp
chmod 777 /var/ftp/tmp
chmod 777 /var/ftp/tmp/torrents
chown root:ftpuser /var/ftp
chown muzftp:ftpuser /var/ftp/tmp
cp /etc/vsftpd.conf /etc/vsftpd.conf_bak
cat /dev/null > /etc/vsftpd.conf
echo "listen=YES
anonymous_enable=NO
no_anon_password=NO
anon_root=/var/ftp/pub
anon_umask=022
local_enable=YES
write_enable=YES
local_umask=023
chroot_local_user=YES
chroot_list_enable=NO
xferlog_enable=YES
xferlog_file=/var/log/vsftpd.log" > /etc/vsftpd.conf
