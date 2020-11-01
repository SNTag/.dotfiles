#!/usr/bin/env bash
### program installer
## these are programs I generally need for my standard configurations.
sudo apt update
sudo apt upgrade

# sudo apt install -y git
# useful
sudo apt install -y libcurl4-openssl-dev                                       # installing R
sudo apt install -y libssl-dev
sudo apt install -y ubuntu-restricted-extras                                   # media codecs
sudo apt install -y texlive-full                                               # latex
sudo apt install -y python3-pip python3-doc python3-virtualenv python3-crontab # python requirements
sudo apt install -y julia                                                      # julia
sudo apt install -y gfortran libreadline-dev                                   # R
sudo apt install -y julia-doc
sudo apt install -y nmap                                                       # networking
sudo apt install -y emacs                                                      # work-tool
sudo apt install -y picard
sudo apt install -y nautilus-dropbox
sudo apt install -y neofetch zsh                                               # ricing
sudo apt install -y pandoc                                                     # pandoc
sudo apt install -y pandoc-citeproc
sudo apt install -y darktable rawtherapee                                      # photography
sudo apt install -y gparted                                                    # tooling
sudo apt install -y popsicle                                                   # SD card
sudo apt install -y guake                                                      # drop-down terminal
sudo apt install -y wine mono-complete                                         # compatibility
sudo add-apt-repository universe                                               # gnome tools
sudo apt install -y gnome-tweak-tool
sudo apt install -y libnotify-bin                                              # notifications
sudo apt install -y autoconf automake g++ gcc libpng-dev libpoppler-dev libpoppler-glib-dev libpoppler-private-dev libz-dev make pkg-config # fixing pdf-tools
sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git # ensure compatibility to install pyenv
sudo add-apt-repository ppa:linrunner/tlp # improved power managment
sudo apt update
sudo apt install -y tlp
sudo apt install -y tlp-rdwsudo
sudo apt install -y start

### tweaks
## https://www.digitalocean.com/community/tutorials/how-to-configure-periodic-trim-for-ssd-storage-on-linux-servers
sudo systemctl enable fstrim.timer

### program installer
## To make my life tougher (and potentially faster), this script below
## handles installation of programs. To pass multiple arguments,
## surrond them in quotations. Programs requiring a more complicated
## installation are guided in the rest of this script.

# function installer {
#   my_array=($(echo $1 | tr " " "\n"))
#   for i in "${my_array[@]}"
#   do
#     echo "$i"
#     which $i &> /dev/null

#     if [ $? -ne 0 ]; then
#       echo "Installing: ${?}..."
#       sudo apt install -y $?
#     else
#       echo "Already installed: ${?}"
#     fi
#   done
# }

# sudo apt install -y git
# useful
sudo apt install -y libcurl4-openssl-dev	# installing R
sudo apt install -y libssl-dev
sudo apt install -y ubuntu-restricted-extras # media codecs
sudo apt install -y texlive-full		   # latex
sudo apt install -y python3-pip python3-doc python3-virtualenv python3-crontab 		   # python requirements
sudo apt install -y julia			# julia
sudo apt install -y gfortran                  # R
sudo apt install -y julia-doc
sudo apt install -y nmap			# networking
sudo apt install -y emacs			# work-tool
sudo apt install -y picard
sudo apt install -y nautilus-dropbox
sudo apt install -y neofetch		# ricing
sudo apt install -y pandoc		# pandoc
sudo apt install -y pandoc-citeproc
sudo apt install -y darktable rawtherapee		# photography
sudo apt install -y gparted		# tooling
sudo apt install -y popsicle		# SD card
sudo apt install -y guake			# drop-down terminal
sudo apt install -y wine mono-complete			# compatibility
sudo apt install -y autoconf automake g++ gcc libpng-dev libpoppler-dev libpoppler-glib-dev libpoppler-private-dev libz-dev make pkg-config # fixing pdf-tools
sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git # ensure compatibility to install pyenv
