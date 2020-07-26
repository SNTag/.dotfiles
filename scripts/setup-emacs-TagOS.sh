#!/usr/bin/env bash
## This is a messy approach, but gets the job done, with tweaks to get
## into MY emacs faster. Will setup access to my
## emacs-flavour, with packages installed fresh. See
## '/emacs-26.2/readme.md' for more details. A peripheral script NOT
## IN THIS GIT is called to install some private settings.
##
## FUTURE IMPROVEMENTS:
## - see if it can be compressed further
DIR="$( cd "../$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # need to move up one directory

echo 'Emacs general stuff============================='

echo Setting up fundamental Emacs.d files
[[ -d ~/.emacs.d ]] || mkdir ~/.emacs.d
[[ -d ~/.emacs.d/config ]] || mkdir ~/.emacs.d/config
[[ -d ~/.emacs.d/snippets ]] || mkdir ~/.emacs.d/snippets

echo For items difficult to symlink
ln -s $DIR/emacs-26.2/snippets/* ~/.emacs.d/snippets/

echo installing init
ln -s $DIR/emacs-26.2/init.el ~/.emacs.d/

echo "Emacs: personalization ========================="

echo Setting up the Borg Collective.  Resistance is futile.

[[ -d ~/.emacs.d/Borg-Collective-Emacs/ ]] || mkdir -p ~/.emacs.d/Borg-Collective-Emacs
ln -s $DIR/emacs-26.2/Borg-Collective-Emacs/*.el ~/.emacs.d/Borg-Collective-Emacs/
[[ -f ~/.emacs.d/readme.md ]] || ln -s ${DIR}/emacs-26.2/readme.md ${HOME}/.emacs.d/readme.md # TODO confirm functional

echo "universal yasnippets============================"
## there are snippets that I want the same across major modes. This
## redirects the snippet-symlinks created earlier.
inputP=$DIR/emacs-26.2/snippets/programming-snippets
inputW=$DIR/emacs-26.2/snippets/writing-snippets
output=$DIR/emacs-26.2/snippets

##### PROGRAMMING
ln -s $inputP/* $output/ess-mode/
ln -s $inputP/* $output/python-mode/
ln -s $inputP/* $output/lisp-mode/
ln -s $inputP/* $output/ruby-mode/
ln -s $inputP/* $output/sh-mode/

##### Writing
ln -s $inputW/* $output/org-mode/
ln -s $inputW/* $output/markdown-mode/
ln -s $inputW/* $output/text-mode/

echo ========================================== FINISHING
