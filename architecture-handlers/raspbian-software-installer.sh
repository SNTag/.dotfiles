#!/usr/bin/env bash
# Designed for Raspbian
# This script will (hopefully) handle most of my system expectations.
# I tend to swap systems regularly, this script is meant as a helper script.
# It will most likely develop outdated components.

sudo apt update
sudo apt upgrade
sudo apt install git

### programming languages
# ### latex
# sudo apt install texlive-full -y

### R
## if running with-x=yes, needs xorg-dev.
## with-x=no, may need fix for various setting failures. see here 	https://stackoverflow.com/questions/54102869/during-startup-warning-message-setting-lc-ctype-failed-on-windows
sudo apt install libcurl4-openssl-dev libssl-dev -y
pkgver=3.6.3
wget "https://cran.r-project.org/src/base/R-${pkgver%%.*}/R-${pkgver}.tar.gz" -P ~/Documents
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

### python3
sudo apt install python3-pip -y
sudo apt install python3-doc -y
sudo apt install python3-virtualenv
mkdir ~/.python-venv/
virtualenv ~/.python-venv/common-enviroment
activate ~/.python-venv/common-enviroment/bin/activate

# ### julia
# sudo apt install julia -y
# sudo apt install julia-doc -y

### R
sudo apt install libcurl4-openssl-dev libssl-dev -y  # pre-requisites
sudo apt -y install r-base -y 		       # installs R itself
Rscript ~/.dotfiles/programming-languages/r/installation-setup.r -y

### for some network mapping features
sudo apt install nmap -y

# ## pandoc
# sudo apt install pandoc -y
# sudo apt install pandoc-citeproc -y
#### MISSING CROSSREF?!

### emacs
sudo apt install emacs -y

# ## photo editing
# sudo apt install darktable -y
# sudo apt install rawtherapee -y

# ## wine
# sudo apt install wine -y
# sudo apt install mono-complete -y

### terminal ricing
sudo apt install neofetch -y

### setting up folders
mkdir ~/Documents
mkdir ~/Downloads

### syncthing
# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

# Add the "stable" channel to your APT sources:
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Update and install syncthing:
sudo apt-get update
sudo apt-get install syncthing
#nano /home/pi/.config/syncthing/config.xml

### crontab handler
