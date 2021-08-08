#!/bin/bash
#
#This file is to install various configs lying around my dotfiles. Installs to
#home directory. Modified from
#https://github.com/victoriadrake/dotfiles/blob/ubuntu-19.10/scripts/symlink.sh
#
cd ../ # need to move up one directory
DIR=$(pwd)

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  echo "* Installing ${1}"

  if [ -f ${DIR}/${1} ]; then
    echo "** File exists"

    if [ -h ~/${1} ]; then
      # Existing symlink
      echo "** Removing existing symlink: ${dest}"
      rm ${dest}

    elif [ -f "${dest}" ]; then
      # Existing file
      echo "** Backing up existing file: ${dest}"
      mv ${dest}{,.${dateStr}}

    elif [ -d "${dest}" ]; then
      # Existing dir
      echo "** Backing up existing dir: ${dest}"
      mv ${dest}{,.${dateStr}}
    fi

    echo "** Creating new symlink: ${dest}"
    ln -s ${DIR}/${1} ${dest}

  else
    echo "** ERROR: File missing"
    echo "Make sure you are in the right directory if file exists"
  fi
}

linkDotfile .zsh_TagOS
linkDotfile .gitconfig
linkDotfile .Rprofile
linkDotfile .radian_profile
linkDotfile Picard.ini
sudo mv picard.ini ${HOME}/.config/MusicBrainz #makes the symlink but not to the right place. Poor practice
linkDotfile abcde.conf
sudo mv abcde.conf /etc/ #makes the symlink but not to the right place. Poor practice
