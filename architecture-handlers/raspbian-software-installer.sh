#!/usr/bin/env bash
# Designed for Raspbian
# This script will (hopefully) handle most of my system expectations.
# I tend to swap systems regularly, this script is meant as a helper
# script.  It will most likely develop outdated components.
#
# I do not use this script often, I have turned towards Pi-gen to
# generate custom rasbian images.

sudo apt update
sudo apt upgrade -y

### program installer a number of program are installed with a simple
## 'apt install' from the txt file program-list-debian.txt. Programs
## requiring a more complicated installation are guided in the rest of
## this script.
function installer {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

installer git			# needed
installer libcurl4-openssl-dev	# installing R
installer libssl-dev
installer python3-pip		# installing python requirements
installer python3-doc
installer python3-virtualenv
installer python3-crontab
installer nmap			# networking
installer emacs			# work-tool
installer picard
installer neofetch		# ricing
installer pandoc		# pandoc
installer pandoc-citeproc
installer darktable		# photography
installer rawtherapee

### programming languages
  # ### latex
  # sudo apt install texlive-full -y

  ### R
  ## if running with-x=yes, needs xorg-dev.
  ## with-x=no, may need fix for various setting failures. see here 	https://stackoverflow.com/questions/54102869/during-startup-warning-message-setting-lc-ctype-failed-on-windows
  pkgver=3.6.3
  if [[ ! -f /usr/local/bin/Rscript ]]; then
      echo "============== setting up R"
      wget -N "https://cran.r-project.org/src/base/R-${pkgver%%.*}/R-${pkgver}.tar.gz" -P ~/Documents
      cd ~/Documents
      tar -xzf R-${pkgver}.tar.gz
      cd ./R-${pkgver}
      ./configure \
          --prefix=/opt/R/${pkgver} \
          --enable-memory-profiling \
          --enable-R-shlib \
          --with-blas \
          --with-lapack \
          --with-x=no
      make
      sudo make install
      sudo ln -s /opt/R/${pkgver}/bin/R /usr/local/bin/R
      sudo ln -s /opt/R/${pkgver}/bin/Rscript /usr/local/bin/Rscript
  fi
  Rscript ~/.dotfiles/programming-languages/r/installation-setup.r -y

  ### python3
  ## I don't run apt `install python3` as I use pyenv to install specific versions.
#  sudo apt install python3-pyenv -y
  mkdir ~/.python-venv/
  virtualenv ~/.python-venv/common-enviroment
  activate ~/.python-venv/common-enviroment/bin/activate
  curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

  # ### julia
  # sudo apt install julia -y
  # sudo apt install julia-doc -y

  ### radian
  pip-3 install --user radian

# ## pandoc
#### MISSING CROSSREF?!

# ## wine
# sudo apt install wine -y
# sudo apt install mono-complete -y

### setting up folders
mkdir ~/Documents
mkdir ~/Downloads

### syncthing
# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

# Add the "stable" channel to your APT sources:
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Update and install syncthing:
sudo apt update
installer syncthing -y
#nano /home/pi/.config/syncthing/config.xml

### program installer
## To make my life tougher (and potentially faster), this script below
## handles installation of programs. To pass multiple arguments,
## surrond them in quotations. Programs requiring a more complicated
## installation are guided in the rest of this script.

function installer {
  my_array=($(echo $1 | tr " " "\n"))
  for i in "${my_array[@]}"
  do
    echo "$i"
    which $i &> /dev/null

    if [ $? -ne 0 ]; then
      echo "Installing: ${?}..."
      sudo apt install -y $?
    else
      echo "Already installed: ${?}"
    fi
  done
}

installer git			# useful
installer libcurl4-openssl-dev	# installing R
installer libssl-dev
installer ubuntu-restricted-extras # media codecs
installer texlive-full		   # latex
installer "python3-pip python3-doc python3-virtualenv python3-crontab" 		   # python requirements
installer julia			# julia
installer julia-doc
installer nmap			# networking
installer emacs			# work-tool
installer picard
installer nautilus-dropbox
installer neofetch		# ricing
installer pandoc		# pandoc
installer pandoc-citeproc
installer "darktable rawtherapee"		# photography
installer gparted		# tooling
installer popsicle		# SD card
installer guake			# drop-down terminal
installer "wine mono-complete"			# compatibility
installer "autoconf automake g++ gcc libpng-dev libpoppler-dev libpoppler-glib-dev libpoppler-private-dev libz-dev make pkg-config" # fixing pdf-tools
installer "build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git" # ensure compatibility to install pyenv
