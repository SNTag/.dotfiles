# does not include:
# - anaconda
# - jupyter

yes | sudo pacman -Syu ;

# git
yes | sudo pacman -Sy git ;

git config --global user.name "SNTagore" ;
git config --global user.email "agenttiny@gmail.com" ; 

# ZSH?
sudo pacman -S zsh  
sudo pacman -S curl  
cd ~/Downloads/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Python3
Hyay -S python  
# python2
yay -S python2      
# R
yay -S r  
# for some R packages
yay -S gcc-fortran  
# htop
yay -S htop  
# bowtie
#yay -S bowtie  # problem
yay -S bowtie2  
# samtools
yay -S samtools  
# bedtools
yay -S bedtools  
# fastqc ;
yay -S fastqc  
# sudo pacman -S qnotero ;
#yay -S qnotero  # problem
# sudo pacman -S texlive ;
# yes | sudo pacman -S texlive-latex-base texlive-latex-extra texlive-latex-recommended texlive-fonts-extra texlive-luatex ;
# luaotfload-tool --update -y ;
# tlmgr init-usertree ; 
# sudo pacman -S xzdec ; 
# sudo tlmgr update --all ;
# sudo tlmgr option repository ftp://tug.org/historic/systems/texlive/2017/tlnet-final ;

# tools
#sudo apt-get install emacs -y; # commented as being installed from source above.
# sudo pacman -S default-jre ;  # JAVA
# sudo pacman -S default-jdk ;  # JAVA
# sudo pacman -S oracle-java8-installer ;  # for java.  there is a newer version
# sudo pacman -S openjdk-9-jdk ;  #JAVA

# pacman -S libtbb-dev ; # bowtie

sudo pacman -S gradle   ; # used to install picard

sudo pacman -S inotify-tools   ; # used to automate make command

# For fun
## neofetch
yay -S neofetch  
# sudo pacman -S w3m-img ; invalid
############# need to install imagemagick as described here:
############# https://linuxconfig.org/how-to-install-imagemagick-7-on-ubuntu-18-04-linux

# installin yay
sudo pacman -S --needed   base-devel git wget yajl ;  # need to confirm!!! does it need yet?
cd /tmp
git clone https://aur.archlinux.org/package-query.git
cd package-query/
yes | makepkg -si && cd /tmp/
git clone https://aur.archlinux.org/yay.git
cd yay/
yes | makepkg -si


# etc
yay -S pamac-aur   ;  # pamac
sudo pacman -S a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore ;
#gstreamer0.10-plugins   ;  # codecs
sudo pacman -S vlc   ;  # VLC

sudo pacman -S libreoffice thunderbird firefox gedit flashplugin skype dropbox aria2 emacs   ;
sudo pacman -S p7zip p7zip-plugins unrar tar rsync   ;  # archive managers
yay -S arc-gtk-theme  
# papyrus https://aur.archlinux.org/packages/papyrus/  
yay -S papirus-icon-theme   # problem!
# slack https://aur.archlinux.org/packages/slack-desktop/
yay -S slack-desktop    # need to delete slack package!
# spotify https://aur.archlinux.org/packages/spotify/
yay -S spotify    # problem
# zotero https://aur.archlinux.org/packages/zotero/
yay -S zotero  
# PDF-Reader     evince?
# rstudio https://aur.archlinux.org/packages/rstudio-desktop/
# imagej https://aur.archlinux.org/packages/imagej2/
yay -S imagej2  
# gimp https://www.archlinux.org/packages/extra/x86_64/gimp/
yay -S gimp  
# inkscape https://www.archlinux.org/packages/extra/x86_64/inkscape/
yay -S inkscape  
# jre https://aur.archlinux.org/packages/jre8
yay -S jre8  
# pandoc https://www.archlinux.org/packages/community/x86_64/pandoc/
yay -S pandoc  
# pandoc crossref https://www.archlinux.org/packages/community/x86_64/pandoc-crossref/
yay -S pandoc-crossref  
# pandoc citeproc https://www.archlinux.org/packages/community/x86_64/pandoc-citeproc/
yay -S pandoc-citeproc  
# texlive-most
yay -S texlive-most  
# latex installer
# miktex
# thinkorswim
# steam https://www.archlinux.org/packages/multilib/x86_64/steam/
yay -S steam  
# atom https://www.archlinux.org/packages/community/x86_64/atom/
yay -S atom  
# fira font https://www.archlinux.org/packages/community/any/ttf-fira-code/
yay -S ttf-fira-code  
# rufus
# adobe digital edition  https://aur-dev.archlinux.org/packages/adobe-digital-editions/
yay -S adobe-digital-editions  
# urxvt https://www.archlinux.org/packages/community/x86_64/rxvt-unicode/
yay -S rxvt-unicode  
# cabal
yay -S cabal-install 
# xmonad
cabal install xmonad
# cmake
yay -S cmake
# vale
yay -S vale
#


yay -R aspell-git
yay -S FantasqueSansMono
yay -S alsa
yay -S alsa-lib
yay -S alsa-oss
yay -S alsa-tray
yay -S alsa-utils
yay -S aspell-git
yay -S aspell-git
yay -S backlight
yay -S ephifonts
yay -S figlet
yay -S flameshot-git
yay -S flashplayer-standalone
yay -S flashplugin
yay -S foxitreader
yay -S gedit
yay -S go
yay -S google-chrome
yay -S gucharmap
yay -S herbstluftwm
yay -S hunspell-en_US
yay -S jre8-openjdk-headless
yay -S libasound2
yay -S libnl
yay -S libpulse
yay -S libreoffice-extension-writer2latex
yay -S libreoffice-still
yay -S ligthdm-webkit-theme-aether
yay -S masterpdfeditor
yay -S miktex-git
yay -S minecraft-launcher
yay -S mplayer
yay -S networkmanager
yay -S nm-connection-editor
yay -S otf-eb-garamond
yay -S otf-overpass
yay -S otf-sfmono
yay -S pandoc-citeproc
yay -S pandoc-crossref
yay -S polybar
yay -S polybar
yay -S popcorntime-bin
yay -S proselint
yay -S python-pywal
yay -S r
yay -S r 3.6.1-1
yay -S rstudio-desktop-bin
yay -S rxvt-unicode
yay -S scientifica-bdf
yay -S sidplay2-alsa
yay -S siji-git
yay -S skypeforlinux-stable-bin
yay -S snapgene
yay -S snapgene-viewer
yay -S spotify
yay -S teamviewer
yay -S termsyn-font
yay -S texlive-core
yay -S texlive-lang
yay -S texlive-latexextra
yay -S texlive-localmanager-git
yay -S texlive-most
yay -S texlive-most-doc
yay -S ttf-fantasque-sans-mono
yay -S ttf-iosevka
yay -S ttf-material-design-icons-git
yay -S ttf-ms-fonts
yay -S vale
yay -S wireless-network
yay -S wireless_tools
yay -S wpgtk-git
yay -S write-good
yay -S writer2latez-manual
yay -S xbacklight




############# Need to install yourt
############# Add to end of /etc/pacman.conf:
############# [archlinuxfr]
############# SigLevel = Never
############# Server = http://repo.archlinux.fr/$arch



######## ######## to remap capslock:

######## sudo emacs /etc/X11/xorg.conf.d/00-keyboard.conf
######## Option "XkbOptions" " ctrl:swapcaps"
