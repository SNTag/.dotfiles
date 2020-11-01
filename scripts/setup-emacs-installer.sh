#!/usr/bin/env bash
### emacs
emacs_version="27.1"
[ ! -d ${HOME}/bin/emacs/ ] && mkdir ${HOME}/bin/emacs
wget -N "http://mirrors.ocf.berkeley.edu/gnu/emacs/emacs-${emacs_version}.tar.xz" -P ${HOME}/bin/emacs/
cd ${HOME}/bin/emacs/
tar -xvf emacs-27.1.tar.xz
cd emacs-${emacs_version}
sudo apt install -y build-essential libgtk-3-dev
sudo apt install -y libtiff5
sudo apt install -y libtiff-dev
sudo apt install -y libxpm-dev
sudo apt install -y libgiftiio-dev
sudo apt install -y libgif-dev
sudo apt install -y libncurses-dev
./configure
make
make install
