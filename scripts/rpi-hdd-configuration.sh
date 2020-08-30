#!/usr/bin/env bash
sudo echo '# power managment for usb' | sudo tee -a /boot/config.txt
sudo echo 'max_usb_current=1' | sudo tee -a /boot/config.txt

sudo apt install ntfs-3g
