Intro
=====

This is a collection of my dotfiles. I'm frequently reinstalling my system and
don't want to waste my time getting my configs back. My dotfiles are written in
such a way to get those important systems back.

This dotfile handles my:

- rudimentary/common software
- bioinformatic software
- emacs (my original and my literate doom configs)
- some fonts
- tweaks (quickly adding removable drives, etc)
- zsh


Installation Notes
==================
## Warning

The following has not been fully automated:

**In Terminal**
- Installation of *oh-my-zsh*

## Notes on usage:

- emacs: run '/scripts/setup-emacs-TagOS.sh'
- bioinformatic software: run '/scripts/setup-bioinformatics-tools.sh'
- zsh: recommended to run '/scripts/setup-zsh-TagOS.sh'. Some modifications to '/scripts/setup-etc-TagOS.sh' would do the same job.
- To setup architecture (rudimentary/common software, some fonts, tweaks) for either debian or arch based, run the appropiate file in '/architecture-handlers'
- Programming languages are set up through scripts under '/programming-languages/


Acknowledgments
===============

I took inspiration from several sources;

- reddit
- Sacha Chua
- M-emacs
- etc
- [tomnomnom](https://github.com/tomnomnom/dotfiles)
- [victoriadrake](https://github.com/victoriadrake/dotfiles/blob/ubuntu-19.10/scripts/symlink.sh)
