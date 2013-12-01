#!/bin/bash 
echo "Loading..."
echo -n "Kernel update & packeges installation. Start install & config? (y/n) "

read item
case "$item" in
    y|Y) echo "Choose «Yes», installing..."
        ;;
    n|N) echo "Choose «No», closing..."
        exit 0
        ;;
    
esac

#Installation
echo "Begin Installation..."
aptitude update
aptitude install kernel-package libncurses5-dev fakeroot wget bzip2 unzip build-essential udev
clear
#part2
aptitude install mc htop nano
clear
#part3
cd /usr/src
cp /etc/wgetrc /etc/wgetrc_default
cat /dev/null > /etc/wgetrc
echo "passive_ftp = on
https_proxy = http://update:7i8kgt@192.168.92.2:8080
http_proxy = http://update:7i8kgt@192.168.92.2:8080
ftp_proxy = http://update:7i8kgt@192.168.92.2:8080" > /etc/wgetrc
#part4
#change linux source if need to keep your kernel up to date
aptitude update
aptitude install linux-source-2.6.32
#unpacking
echo "Unpacking..."
cd /usr/src
tar xjf linux-source-2.6.32.tar.bz2
ln -s linux-source-2.6.32 linux
cd /usr/src/linux
make clean && make mrproper
cp /boot/config-'uname -r' ./.config
make menuconfig
make-kpkg clean
#compiling kernel
fakeroot make deb-pkg
cd /usr/src
#cleaning distros
ls -l
dpkg -i linux-image-2.6.32_2.6.32-1_i386.deb
echo "Now set kernel in /boot/grub/grub.cfg"
echo "i.e.: nano /boot/grub/grub.cfg"
echo "find there (CTRL+W) set default"
echo "must be: set default = 2"
echo
echo "Installation is complete!"
