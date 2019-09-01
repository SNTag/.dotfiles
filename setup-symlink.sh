#!/bin/bash

# inspiration taken from tomnomnom

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
	mv ${HOME}/${2} ${HOME}/backup/{${dateStr}_${1}}
	
    elif [ -f "${dest}" ]; then
	# Existing file
	echo "Backing up existing file ${dest}"
	mv ${dest} ~/backup/{${dateStr}.${1}}

    elif [ -d "${dest}" ]; then
	# Existing directory
	echo "Backing up existing directory ${dest}"
	mv ${dest} ~/backup/{.${dateStr}.${1}}
    fi

    echo "Creating new symlink: ${dest}"
    ln -s ${dotfilesGit}/${1} ${dest}
#    rm -r ~/.$(2)
    mv ${HOME}/${1} ${HOME}/${2}
    echo "${HOME}/${2}"
}



linkDotFile emacs-26.2 .emacs.d
linkDotFile herbstluftwm .config/herbstluftwm
linkDotFile polybar .config/polybar
linkDotFile zshrc .zshrc
linkDotFile bashrc .bashrc
