#!/usr/bin/env bash
## This script will handle my zsh setup
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if grep -Fxq "source ~/.Borg-Collective-Bash/master-source" ~/.zshrc
then
    # code if found
    echo "already sourcing the Borg Bash"
else
    # Code if not found
    sudo apt install zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    [ -d ~/.Borg-Collective-Bash ] || mkdir ~/.Borg-Collective-Bash
    [[ -h ~/.Borg-Collective-Bash ]] || ln -s $DIR/.dotfiles/zsh/Borg-Collective-Bash/* ~/.Borg-Collective-Bash
    [[ -h ~/.Borg-Collective-Bash ]] && echo existsborgcollective
    echo "source ~/.Borg-Collective-Bash/master-source" >> ~/.zshrc
fi
