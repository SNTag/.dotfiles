Intro
=====

This is a collection of my dotfiles used on Manjaro Arch, Linux.  It
 makes use of:
 
- herbstluftwm
- polybar
- emacs-26.2.
- Zsh


For Rapid Prep of Fresh Installation
====================================

To create symlinks for Emacs, herbstluftwm, polybar, etc in this
folder, run the script "setup-symlink.sh" **WARNING**: Recommended to
customize the script to your usage.  At the bottom of the script,
modify/add/remove each linkDotFile command per item of interest.
First argument is the name of the file in the same directory as the
README to create symlinks for.  Second argument is for any preferred
name you have for the file.  Any duplicates detected when running will
be backedup to a folder $HOME/backup with the name as the date and
file name.  By having two names, it will help in legacy tracking.

Keep in mind it does not install the relevant programs to run them.
For that, run the package "quick_install_manjaro-yay.sh" to install
relevant packages from the AUR (such as emacs). (This script is under
development).

After system restart, the created symlinks will switch "Caps lock" and
"ctrl".  To prevent this, - - - -

To add Dropbox or other software storage system to bash, run this
command in bash:

$ echo "DROPBOX=/PATH/TO/DRIVE/AND/FOLDER/"

This will create a universal enviroment variable as described here: 
https://linuxize.com/post/how-to-set-and-list-environment-variables-in-linux/
