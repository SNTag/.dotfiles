#!/bin/bash
## Up from scripts dir
DIR="$( cd "../$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # need to move up one directory

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  echo "###<<<<<<<<<<<<<<<<<<<<<<<------------------------------------------"
  echo "### installing ${1}"
  echo "###<<<<<<<<<<<<<<<<<<<<<<<------------------------------------------"

  if [ -h ~/${1} ]; then
    # Existing symlink
    echo "Removing existing symlink: ${dest}"
    rm ${dest}

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${DIR}/${1} ${dest}
}

linkDotfile .zsh_TagOS
linkDotfile .gitconfig
linkDotfile .Rprofile
linkDotfile .radian_profile
linkDotfile Picard.ini
sudo mv picard.ini ${HOME}/.config/MusicBrainz
linkDotfile abcde.conf
sudo mv abcde.conf /etc/
