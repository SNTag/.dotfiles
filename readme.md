Intro
=====

This is a collection of my dotfiles. I swap systems often (usually between pop-OS and manjaro), so
this is streamlined for those distros. I have quite ricing, i got too caught up in herbsluftwm.  My
dotfiles are now designed with the goal for rapid and easy setup.

This dotfile rapidly prepares:

- rudimentary/common software
- bioinformatic software
- emacs
- some fonts
- tweaks


Installation Notes
==================
## Warning

The following has not yet been automated:

**In Terminal**
- Installation of *oh-my-zsh*

## To Use

Rapid install dotfiles through running 'setup-symlink-TagOS.sh'.

Further components for each architecture can be found in architecture-handlers.


Acknowledgments
===============

I took inspiration from several sources;

- reddit
- Sacha Chua
- M-emacs
- etc


Notes on usage:
==============

1. To setup emacs, run './setup-emacs-TagOS.sh'
2. To setup architecture (rudimentary/common software, some fonts, tweaks), run the appropiate file in './architecture-handlers'
3. To setup bioinformatic software, run './setup-bioinformatics-tools.sh'
