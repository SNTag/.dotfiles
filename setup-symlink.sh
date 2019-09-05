#!/bin/bash

# inspiration taken from tomnomnom
# Future edit: add correction for individual files (ex., readme.md) and emacs

dotfilesGit=${HOME}/.dotfiles

[[ -d ~/backup ]] || mkdir ~/backup

function linkDotFile {
    dest="${HOME}/${1}"
    dateStr=$(date +%Y-%m-%d-%H%M)

    echo "========================================== ${1} "
    
    #  Deals with cleaning/backing up any files/directories at final/priming
    #+ destination with same name
    if [ -h "${dest}" ]; then
	# existing symlink
	echo "Removing existing symlink: ${dest}"
	rm ${dest}
	
    elif [ -f "${dest}" ]; then
	# Existing file
	echo "Backing up existing file ${dest}"
	mv ${dest} ~/backup/{${dateStr}.${1////-}}

    elif [ -d "${dest}" ]; then
	# Existing directory
	echo "Backing up existing directory ${dest}"
	mv ${dest} ~/backup/{_${dateStr}_${1////-}}

    echo "Cleaned up ${HOME}/${1} =================="
    fi

    #  Deals with cleaning/backing up configurations involving a ${2}
    echo "~/${2}/${1}"
    if [ -h "${HOME}/${2}/${1}" ]; then
	# existing symlink
	echo "Removing existing symlink: ~/${2}/${1}"
	rm ${HOME}/${2}/${1}

    elif [ -f "${HOME}/${2}/${1}" ]; then
	# Existing file
	echo "Backing up existing file ~/${2}/${1}"
	mv ${dest} ~/backup/{${dateStr}_${2////-}_${1////-}}

    elif [ -d "${HOME}/${2}/${1}" ]; then
    	# existing directory
    	echo "Backing up existing directory: ~/${2}/${1}"
    	mv ${HOME}/${2}/${1}/ ${HOME}/backup/{${dateStr}_${2////-}_${1////-}}
    fi

    echo "Cleaned up ${HOME}/${2}/${1} =============="

    echo "Creating new symlink: ${dest}"
    ln -s ${dotfilesGit}/${1} ${dest}
#    rm -r ~/.$(2)
    echo "Moving ${HOME}/${1} to ${HOME}/${2}"
    mv ${HOME}/${1} ${HOME}/${2}
}


#linkDotFile emacs-26.2 .emacs.d
linkDotFile herbstluftwm .config
linkDotFile polybar .config

# FOR EMACS - slightly more complicated to prevent accidental symlink of elpa packages, which need to be uniquely installed per computer

echo 'Emacs =========================================='

echo Setting up Emacs.d files
[[ -d ~/.emacs.d ]] || mkdir ~/.emacs.d
[[ -d ~/.emacs.d/config ]] || mkdir ~/.emacs.d/config
[[ -d ~/.emacs.d/snippets ]] || mkdir ~/.emacs.d/snippets


echo Accommodating errors
[[ -d ~/emacs-26.2 ]] || mkdir ~/emacs-26.2


echo For simple files
linkDotFile emacs-26.2/init.el .emacs.d/init.el
linkDotFile emacs-26.2/readme.md .emacs.d/readme.md


echo For items difficult to symlink
#$ I will assume theres some sort of confusion when running linkDotFile on earlier commands.  will figure it out later.
ln -s ~/.dotfiles/emacs-26.2/config/*.el ~/.emacs.d/config/
ln -s ~/.dotfiles/emacs-26.2/snippets/* ~/.emacs.d/snippets/


echo Cleaning

[[ -d ~/emacs-26.2 ]] && rm -r ~/emacs-26.2


echo Setting up the Borg Collective.  Resistance is futile.

[[ -d ~/.emacs.d/Borg-Collective/ ]] || mkdir ~/.emacs.d/Borg-Collective
ln -s ~/.dotfiles/emacs-26.2/Borg-Collective/*.el ~/.emacs.d/Borg-Collective/


echo Setting up privacy from Github

[[ -d ~/.emacs.d/privacy/ ]] || mkdir ~/.emacs.d/privacy/
ln -s $DROPBOX/journal_etc/scripts/emacs-26.2/privacy/*.el ~/.emacs.d/privacy/
[[ -d ~/.emacs.d/custom ]] || mkdir ~/.emacs.d/custom
ln -s $DROPBOX/journal_etc/scripts/emacs-26.2/custom/*.el ~/.emacs.d/custom/
ln -s $DROPBOX/journal_etc/scripts/emacs-26.2/secret-Borg/*.el ~/.emacs.d/config/

echo ========================================== FINISHING
