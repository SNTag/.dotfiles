Intro
=====

This is a collection of my dotfiles used on Manjaro Arch, Linux.  It
 makes use of:
 
- herbstluftwm
- polybar
- emacs-26.2.

This is for a Rapid assimilation of a fresh installation.

THERE ARE BASH FILES REFERENCED IN 'setup-symlink.sh' NOT PRESENT IN
THESE DOTFILES.


Installation Notes
==================

The following has not yet been automated:

**In Emacs**
- Installation of *use-package*
  
**In Terminal**
- Installation of *oh-my-zsh*

**Manjaro Software**
- Installation of everything.



Acknowledgments
===============

I took inspiration from several sources;

- tomnomnom
- reddit
- etc


Notes on usage:
==============

First argument is the name of the file in the same directory as the
README to create symlinks for.  Second argument is for any preferred
name you have for the file.  Any duplicates detected when running will
be backedup to a folder $HOME/backup with the name as the date and
file name.  By having two names, it will help in legacy tracking.

After system restart, the created symlinks will switch "Caps lock" and
"ctrl".  To prevent this, - - - -

To add Dropbox or other software storage system to bash, add this line to /etc/enviroments:

$ DROPBOX=/PATH/TO/DRIVE/AND/FOLDER/

This will create a universal enviroment variable as described here: 
https://linuxize.com/post/how-to-set-and-list-environment-variables-in-linux/

May be relevant to say that out of some geekiness, I have seperated my
emac sections into different spin off files.  I refer to my approach
of spin off files as the 'Borg Collective', from the Star Trek species
known as the Borg.  Like them, I attempt to make it easy for my
dotfiles to assimilate my systems!
