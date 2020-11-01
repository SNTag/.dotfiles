#!/usr/bin/env bash
# Designed for Pop OS
# This script will (hopefully) handle most of my system expectations.
# I tend to swap systems regularly, this script is meant as a helper script.
# It will most likely develop outdated components.

sudo apt update
sudo apt upgrade

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

installer git                 # useful
installer libcurl4-openssl-dev        # installing R
installer libssl-dev
installer ubuntu-restricted-extras # media codecs
installer texlive-full                   # latex
installer "python3-pip python3-doc python3-virtualenv python3-crontab"                   # python requirements
installer julia                       # julia
installer julia-doc
installer nmap                        # networking
installer emacs                       # work-tool
installer picard
installer nautilus-dropbox
installer neofetch            # ricing
installer pandoc              # pandoc
installer pandoc-citeproc
installer "darktable rawtherapee"             # photography
installer gparted             # tooling
installer popsicle            # SD card
installer guake                       # drop-down terminal
installer "wine mono-complete"                        # compatibility
installer "autoconf automake g++ gcc libpng-dev libpoppler-dev libpoppler-glib-dev libpoppler-private-dev libz-dev make pkg-config" # fixing pdf-tools
installer "build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-op"

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
