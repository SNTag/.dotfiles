Intro
=====

This is a collection of my dotfiles used on Manjaro Arch, Linux.  It
 makes use of:
 
- herbstluftwm
- polybar
- emacs-26.2.

This is for the For Rapid Prep of Fresh Installation


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
