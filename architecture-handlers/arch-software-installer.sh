#!/usr/bin/env bash
# This script will (hopefully) handle most of my system expectations.
# I tend to swap systems regularly, this script is meant as a helper script.
# It will most likely develop outdated components.

###
pacman -Syu

### essentials going forward
### install git
sudo pacman -S git

sudo git clone https://aur.archlinux.org/yay.git /usr/local/yay
cd /usr/local/yay
makepkg -si

###
yay -Syu

### programming languages
### latex
yay -S texlive-most
yay -S texlive-lang
yay -S texlive-localmanager-git
yay -S texlive-most-doc
yay -S pandoc

### R
yay -S r
yay -S tk 			# Needed for interactive package installation

### python3
yay -S python
yay -S python-docs

### julia
yay -S julia			# seems safe to remove blas for openblas
yay -S gnuplots               # ??? what is this for again ???
yay -S julia-docs

### for some network mapping features
yay -S nmap

### pandoc
yay -S pandoc
yay -S pandoc-citeproc
yay -S pandoc-crossref

### emacs
yay -S emacs

### photo editing
yay -S darktable
yay -S rawtherapee

### wine
yay -S wine
yay -S wine_gecko

### disk managment
yay -S gparted-git

### terminal ricing
yay -S neofetch-git

### syncthing
yay -S syncthing
yay -S syncthing-gtk

### fonts
#rm ~/.local/share/fonts/
unzip ../fonts/* -d ~/.local/share/fonts/

### pibakery
yay -S npm

git clone https://github.com/davidferguson/pibakery.git ~/bin/pibakery
cd ~/bin/pibakery
npm install
npm start

### tweaks
#### THESE TWEAKS HAVE NOT BEEN VERIFIED ON ARCH!! DISABLED UNTIL TESTED
## fstrim
# sudo systemctl enable fstrim.timer

### backups
yay -S timeshift
