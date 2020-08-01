#!/usr/bin/env Rscript
### Select a coding language to install
## WORK IN PROGRESS. WILL BE A CRUDE TOOL.
## Built for linux, with R in mind
##
## DESCRIPTION
## This script will be an interface to install a language, and setup the profile with my preferences in mind.
## IT IS A CRUDE TOOL TO GET MY SYSTEM RUNNING FASTER, NOTHING MORE

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "which do you wish to install (type the language)"
echo "r"
echo "python3"

read var1

echo "selected ${var1}"

if [ "${var1}" = "r" ]; then
    echo "installing R" ;
    bash ~/.dotfiles/code/r/setup-r.sh
    Rscript ~/.dotfiles/code/r/installation-setup.r
    ln -s $DIR/code/r/Rprofile ~/.Rprofile
elif [ "${var1}" = "python3" ]; then
    echo "This has not been setup yet."
    echo "please do manual install."
    echo "quitting"
else
    echo "did not understand."
fi
