#!/usr/bin/env bash
# This script will (hopefully) handle most of my system expectations.
# I tend to swap systems regularly, this script is meant as a helper script.
# It will most likely develop outdated components.

sudo apt-get update
sudo apt-get upgrade

# programming languages
## latex
sudo apt-get install texlive-full

## R
sudo apt-get install libcurl4-openssl-dev libssl-dev # pre-requisites
sudo apt -y install r-base			     # installs R itself
Rscript ~/.dotfiles/code/r/installation-setup.r

## python3
sudo apt install python3-pip
sudo apt-get install python3-doc -y

## julia
sudo apt-get install julia -y
sudo apt-get install julia-doc -y

# for some network mapping features
sudo apt-get install nmap -y

# photo editing
sudo apt-get install darktable -y
sudo apt-get install rawtherapee -y
