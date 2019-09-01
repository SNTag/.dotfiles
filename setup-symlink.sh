#!/bin/bash

# inspiration taken from tomnomnom
# Future edit: add correction for individual files (ex., readme.md)

dotfilesGit=${HOME}/.dotfiles

function linkDotFile {
    dest="${HOME}/${1}"
    dateStr=$(date +%Y-%m-%d-%H%M)

    if [ -h ~/${1} ]; then
	# existing symlink
	echo "Removing existing symlink: ${dest}"
	rm ${dest}

    elif [ -d ~/${2} ]; then
	# existing directory
	[[ -d ~/backup ]] || mkdir ~/backup
	echo "Removing existing directory ${2}: ${dest}"
	mv ${HOME}/${2} ${HOME}/backup/{${dateStr}_${1////-}}
	
    elif [ -f "${dest}" ]; then
	# Existing file
	echo "Backing up existing file ${dest}"
	mv ${dest} ~/backup/{${dateStr}.${1////-}}

    elif [ -d "${dest}" ]; then
	# Existing directory
	echo "Backing up existing directory ${dest}"
	mv ${dest} ~/backup/{.${dateStr}.${1////-}}
    fi

    echo "Creating new symlink: ${dest}"
    ln -s ${dotfilesGit}/${1} ${dest}
#    rm -r ~/.$(2)
    echo "Moving ${HOME}/${1} to ${HOME}/${2}"
    mv ${HOME}/${1} ${HOME}/${2}

    echo 'NEW ITEM ==========================================='
}



#linkDotFile emacs-26.2 .emacs.d
linkDotFile herbstluftwm .config/herbstluftwm
linkDotFile polybar .config/polybar
linkDotFile zshrc .zshrc
linkDotFile bashrc .bashrc

# FOR EMACS - slightly more complicated to prevent accidental symlink of elpa packages, which need to be uniquely installed per computer

#####
[[ -d ~/.emacs.d ]] || mkdir ~/.emacs.d
[[ -d ~/.emacs.d/config ]] || mkdir ~/.emacs.d/config
[[ -d ~/.emacs.d/snippets ]] || mkdir ~/.emacs.d/snippets

##### prevents certain errors
[[ -d ~/emacs-26.2 ]] || mkdir ~/emacs-26.2

##### Solves the problem of MELPA access
[[ -d ~/.emacs.d/custom ]] || cp -r ~/.dotfiles/emacs-26.2/custom ~/.emacs.d/

linkDotFile emacs-26.2/init.el .emacs.d/init.el
#linkDotFile emacs-26.2/config/ .emacs.d/config/
#linkDotFile emacs-26.2/snippets .emacs.d/snippets
linkDotFile emacs-26.2/readme.md .emacs.d/readme.md

##### For the difficult to symlink
#$ I will assume theres some sort of confusion when running linkDotFile on earlier commands.  will figure it out later.
ln -s ~/.dotfiles/emacs-26.2/config/*.el ~/.emacs.d/config/
ln -s ~/.dotfiles/emacs-26.2/snippets/* ~/.emacs.d/snippets/

##### Cleaning

[[ -d ~/emacs-26.2 ]] && rm -r ~/emacs-26.2
