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
yay -S pandoc

# wine
yay -S wine
yay -S wine_gecko

# programming languages
yay -S r
yay -S tk 			# Needed for interactive package installation

yay -S python
yay -S python-docs

yay -S julia			# seems safe to remove blas for openblas
yay -S gnuplots
yay -S julia-docs

# for some network mapping features
yay -S nmap

# photo editing
yay -S darktable
yay -S rawtherapee
