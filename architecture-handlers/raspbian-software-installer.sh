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

for i in $(cat ./program-list-pi.txt)
do
  installer $i
done

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

for i in $(cat ./program-list-debian.txt)
do
  installer $i
done
