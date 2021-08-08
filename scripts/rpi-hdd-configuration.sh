#!/usr/bin/env bash
#
#This is more of a reminder of good practices when adding hdd to pi
sudo echo '# power managment for usb' | sudo tee -a /boot/config.txt
sudo echo 'max_usb_current=1' | sudo tee -a /boot/config.txt

sudo apt install ntfs-3g -y
