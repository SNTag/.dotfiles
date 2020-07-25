#!/usr/bin/env bash
# Designed for quickly getting a vps running.
# This script will (hopefully) handle most of my system expectations.
# I tend to swap systems regularly, this script is meant as a helper script.
# It will most likely develop outdated components.
# It is designed for minimal setups.

sudo apt update
sudo apt upgrade

### zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### firewall
ufw allow OpenSSH
ufw enable

### dotfiles
git clone https://github.com/sntag/.dotfiles ~/.dotfiles

### gnome tools
#sudo add-apt-repository universe

### programming languages
### R
sudo apt install libcurl4-openssl-dev libssl-dev -y  # pre-requisites
sudo apt install libxml2-dev

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
sudo apt update
sudo apt install r-base


# sudo apt -y install r-base -y 		       # installs R itself
Rscript ~/.dotfiles/code/r/installation-setup.r -y

## Rstudio
## see this site for the link:
## https://rstudio.com/products/rstudio/download/#download
## or use the code in dotfiles/code/r/rstudio-installer.sh

### emacs
sudo apt install emacs -y

### terminal ricing
sudo apt install neofetch -y

### syncthing
# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

# Add the "stable" channel to your APT sources:
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Update and install syncthing:
sudo apt update -y
sudo apt install syncthing -y
