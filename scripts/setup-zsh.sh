#!/usr/bin/env bash
## This script will install zsh and setup my configs. I have not
## tested if this will install zsh in one go. I suspect it will
## unsuccesfully run 'x-terminal-emulator'.
DIR="$( cd "../$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # need to move up one directory

if grep -Fxq "source ~/.zsh_TagOS" ~/.zshrc
then
    # code if found
    echo "already sourcing my zsh"
else
    dest="${HOME}/"
    dateStr=$(date +%Y-%m-%d-%H%M)

    echo "###<<<<<<<<<<<<<<<<<<<<<<<-------------------------------------------------------------------------"
    echo "### setting up zsh files"
    echo "###<<<<<<<<<<<<<<<<<<<<<<<-------------------------------------------------------------------------"

    ## Code if not found
    sudo apt install zsh
    ## taken from:
    ## https://stackoverflow.com/questions/13648780/run-a-shell-script-in-new-terminal-from-current-terminal
    if [ ! -t 0 ]; then # script is executed outside the terminal?
        # execute the script inside a terminal window with same arguments
        x-terminal-emulator -e "sh -c '$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'"
        # and abort running the rest of it
        exit 0
    fi

    echo "###<<<<<<<<<<<<<<<<<<<<<<<-------------------------------------------------------------------------"
    echo "### copying zsh_TagOS"
    echo "###<<<<<<<<<<<<<<<<<<<<<<<-------------------------------------------------------------------------"
    if [ ! -f ~/.zsh_TagOS ]; then
        ln -s ${DIR}/zsh_TagOS $dest/.zsh_TagOS
    fi

    [ -f ~/.zsh_TagOS ] && echo existsTagOS
    echo "source ~/.zsh_TagOS" >> ~/.zshrc
    source ~/.zshrc
fi
