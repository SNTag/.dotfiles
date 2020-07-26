#!/usr/bin/env bash
# Designed for Pop OS
# This script will (hopefully) handle most of my system expectations.
# I tend to swap systems regularly, this script is meant as a helper script.
# It will most likely develop outdated components.

sudo apt update
sudo apt upgrade

### zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### improved power managment
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get updatesudo apt-get install tlp tlp-rdwsudo tlp start

### install all media codecs
sudo apt-get install ubuntu-restricted-extras -y

### gnome tools
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool

### programming languages
### latex
sudo apt install texlive-full -y

### R
sudo apt install libcurl4-openssl-dev libssl-dev -y  # pre-requisites

## install R from source
## inspiredfrom here:
## https://docs.rstudio.com/resources/install-r-source/
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
    --with-lapack
make
sudo make install
sudo ln -s /opt/R/${pkgver}/bin/R /usr/local/bin/R
sudo ln -s /opt/R/${pkgver}/bin/Rscript /usr/local/bin/Rscript

# sudo apt -y install r-base -y 		       # installs R itself
Rscript ~/.dotfiles/programming-languages/r/installation-setup.r -y

## Rstudio
## see this site for the link:
## https://rstudio.com/products/rstudio/download/#download
## or use the code in dotfiles/programming-languages/r/rstudio-installer.sh

### python3
sudo apt install python3-pip -y
sudo apt install python3-doc -y
sudo apt install python3-virtualenv
mkdir ~/.python-venv/
virtualenv ~/.python-venv/common-enviroment
activate ~/.python-venv/common-enviroment/bin/activate

### julia
sudo apt install julia -y
sudo apt install julia-doc -y

### for some network mapping features
sudo apt install nmap -y

### pandoc
sudo apt install pandoc -y
sudo apt install pandoc-citeproc -y
#### MISSING CROSSREF?!

### emacs
sudo apt install emacs -y

### photo editing
sudo apt install darktable -y
sudo apt install rawtherapee -y

### wine
sudo apt install wine -y
sudo apt install mono-complete -y

### disk managment
sudo apt install gparted

### terminal ricing
sudo apt install neofetch -y

sudo apt install autoconf -y
sudo apt install automake -y
sudo apt install g++ -y
sudo apt install gcc -y
sudo apt install libpng-dev -y
sudo apt install libpoppler-dev -y
sudo apt install libpoppler-glib-dev -y
sudo apt install libpoppler-private-dev -y
sudo apt install libz-dev -y
sudo apt install make -y
sudo apt install pkg-config -y

### drop-down terminal
sudo apt install guake -y

### syncthing
# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

# Add the "stable" channel to your APT sources:
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Update and install syncthing:
sudo apt update -y
sudo apt install syncthing -y



### fonts
#rm ~/.local/share/fonts/
unzip ../fonts/* -d ~/.local/share/fonts/

### pibakery
sudo apt-get install kpartx
sudo apt install npm

git clone https://github.com/davidferguson/pibakery.git ~/bin/pibakery
cd ~/bin/pibakery
npm install
npm start

### tweaks
## fstrim
sudo systemctl enable fstrim.timer

### backups
sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt-get update
sudo apt-get install timeshift
