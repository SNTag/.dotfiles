#!/bin/bash

# FOR EMACS
# This is a messy approach, but gets the job done.  Will setup access to emacs-borg, with packages installed uniquely to each system upon first running.
# Will setup most of my writing approach system by itself.  A peripheral script NOT IN THIS GIT is called to install some private settings.
#
#

## FUTURE IMPROVEMENTS:
## - make it able to detect script location, so that dotfiles can be anywhere in the system

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo 'Emacs general stuff============================='

echo Setting up fundamental Emacs.d files
[[ -d ~/.emacs.d ]] || mkdir ~/.emacs.d
[[ -d ~/.emacs.d/config ]] || mkdir ~/.emacs.d/config
[[ -d ~/.emacs.d/snippets ]] || mkdir ~/.emacs.d/snippets


echo For items difficult to symlink
ln -s $DIR/emacs-26.2/snippets/* ~/.emacs.d/snippets/

echo installing init
ln -s $DIR/emacs-26.2/init.el ~/.emacs.d/

# echo Cleaning
# [[ -d ~/emacs-26.2 ]] && rm -r ~/emacs-26.2

echo "Emacs: personalization ========================="

echo Setting up the Borg Collective.  Resistance is futile.

[[ -d ~/.emacs.d/Borg-Collective-Emacs/ ]] || mkdir -p ~/.emacs.d/Borg-Collective-Emacs
ln -s $DIR/emacs-26.2/Borg-Collective-Emacs/*.el ~/.emacs.d/Borg-Collective-Emacs/
[[ -f ~/.emacs.d/readme.md ]] || cp $DIR/emacs-26.2/readme.md ~/.emacs.d/readme.md

echo "yasnippets ====================================="
# future improvements:
# - make ln take multiple output arguments
# - make git ignore the files made through the following lines

##### PROGRAMMING
ln -s $DIR/emacs-26.2/snippets/programming-snippets/* $DIR/emacs-26.2/snippets/ess-mode/
ln -s $DIR/emacs-26.2/snippets/programming-snippets/* $DIR/emacs-26.2/snippets/python-mode/
ln -s $DIR/emacs-26.2/snippets/programming-snippets/* $DIR/emacs-26.2/snippets/lisp-mode/
ln -s $DIR/emacs-26.2/snippets/programming-snippets/* $DIR/emacs-26.2/snippets/ruby-mode/
ln -s $DIR/emacs-26.2/snippets/programming-snippets/* $DIR/emacs-26.2/snippets/sh-mode/

##### Writing
ln -s $DIR/emacs-26.2/snippets/writing-snippets/* $DIR/emacs-26.2/snippets/org-mode/
ln -s $DIR/emacs-26.2/snippets/writing-snippets/* $DIR/emacs-26.2/snippets/markdown-mode/
ln -s $DIR/emacs-26.2/snippets/writing-snippets/* $DIR/emacs-26.2/snippets/text-mode/

echo ========================================== FINISHING
