Intro
=====

This is a collection of my dotfiles used on Manjaro Arch, Linux.  It *USED* to hold files for herbstluftwm and polybar (amazing programs), but Ricing my system is a little too tiring.  My dotfiles are being streamlined for rapid installation to get down to what I want to do.

This dotfile rapidly prepares:

- fonts
- emacs

This is for a Rapid assimilation of a fresh installation.


Installation Notes
==================
## Warning

The following has not yet been automated:

**In Terminal**
- Installation of *oh-my-zsh*

**Manjaro Software**
- Installation of everything.

## To Use

Rapid install dotfiles through running 'setup-symlink-TagOS.sh'.

If running on Arch system, extra components can be gained by running 'setup-programs-TagOS.sh'


Acknowledgments
===============

I took inspiration from several sources;

- reddit
- M-emacs
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
