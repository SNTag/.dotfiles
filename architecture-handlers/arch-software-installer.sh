#!/usr/bin/env bash
# This script will (hopefully) handle most of my system expectations.
# I tend to swap systems regularly, this script is meant as a helper script.
# It will most likely develop outdated components.

#
pacman -Syu

## essentials going forward
# install git
sudo pacman -S git

sudo git clone https://aur.archlinux.org/yay.git /usr/local/yay
cd /usr/local/yay
makepkg -si

#
yay -Syu

# programming languages
## latex
yay -S texlive-most
yay -S texlive-lang
yay -S texlive-localmanager-git
yay -S texlive-most-doc
yay -S pandoc

## R
yay -S r
yay -S tk 			# Needed for interactive package installation

## python3
yay -S python
yay -S python-docs

## julia
yay -S julia			# seems safe to remove blas for openblas
yay -S gnuplots               # ??? what is this for again ???
yay -S julia-docs

# for some network mapping features
yay -S nmap

# photo editing
yay -S darktable
yay -S rawtherapee

# wine
yay -S wine
yay -S wine_gecko
