#!/usr/bin/env bash
# Designed for Pop OS
# This script will (hopefully) handle most of my system expectations.
# I tend to swap systems regularly, this script is meant as a helper script.
# It will most likely develop outdated components.

sudo apt update
sudo apt upgrade

# ### zsh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### improved power managment
sudo add-apt-repository ppa:linrunner/tlp
sudo apt update
installer tlp
installer tlp-rdwsudo
installer start

### gnome tools
sudo add-apt-repository universe
installer gnome-tweak-tool

### programming languages
### latex

### R
## install R from source
## inspiredfrom here:
## https://docs.rstudio.com/resources/install-r-source/
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
        --with-lapack
    make
    sudo make install
    sudo ln -s /opt/R/${pkgver}/bin/R /usr/local/bin/R
    sudo ln -s /opt/R/${pkgver}/bin/Rscript /usr/local/bin/Rscript
fi
Rscript ~/.dotfiles/programming-languages/r/installation-setup.r -y

## Rstudio
## see this site for the link:
## https://rstudio.com/products/rstudio/download/#download
## or use the code in dotfiles/programming-languages/r/rstudio-installer.sh

### python3
mkdir ~/.python-venv/
virtualenv ~/.python-venv/common-enviroment
activate ~/.python-venv/common-enviroment/bin/activate
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

### julia

### radian
pip-3 install --user radian

### pandoc
#### MISSING CROSSREF?!

### syncthing
# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

# Add the "stable" channel to your APT sources:
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Update and install syncthing:
sudo apt update -y
installer syncthing



### fonts
#rm ~/.local/share/fonts/
unzip ../fonts/* -d ~/.local/share/fonts/

### tweaks
## fstrim
sudo systemctl enable fstrim.timer

### backups
sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt update
installer timeshift
