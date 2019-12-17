#
pacman -Syu

## essentials going forward
# install git
sudo pacman -S git






# install yay
sudo git clone https://aur.archlinux.org/yay.git /usr/local/yay
cd /usr/local/yay
makepkg -si

#
yay -Syu

# latex
yay -S texlive-most
yay -S texlive-lang
yay -S texlive-localmanager-git
yay -S texlive-most-doc 

# wine
yay -S wine
yay -S wine_gecko

# programming languages
yay -S r
yay -S python
