#!/bin/bash

#########################################################
## This script is designed to automatically count RAM, ##
## count size of possible swap and create swap file.   ##
#########################################################

clear

RAM="`free -m | grep Mem | awk '{print $2}'`"
swap_allowed=$(($RAM * 2))
swap=$swap_allowed"M"

echo -e "Detected RAM: $RAM
Recommended swap size: $swap"
echo -e "For example you can create swap for 1000M or 2G"
echo -e "Create swap for: "
read swap_size

read -r -p "Are you sure you want to create swap for $swap_size? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 

  echo "Creating swap..."

  fallocate -l $swap_size /var/swap.img
  chmod 600 /var/swap.img
  mkswap /var/swap.img
  swapon /var/swap.img

  echo -e "Swap for $swap_size was succesfully created!"
  sleep 3

  free -m | grep swap
  swapon -s

        ;;
    *)
        echo -e "Creation of swap file was rejected! Exiting!"
        exit 0
        ;;
esac


