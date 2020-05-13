# .emacs.d-config


Works on Linux.
Compatible with emacs 26.1 to 26.3. As I am usually using the latest most stable emacs, I'm rarely checking for backwards compatibility. Let me know if something breaks.

While the majority of this system was set up on windows, there are some odd details written with
linux in mind. Feel free to use or take details from this set up. Sources of inspiration are
mentioned in the code.

**Build focus:** I've quite the ricing game. Focused on developing emacs as what it is: a tool.

**Understanding my init**
The Init file hold only tweaks for improving speed during loading and to direct it to the
Borg-Collective (my nickname for my mode configuration organization). Names of the
Borg-Collective files indicate what it contains.

**NOTE** SNTag-org-babel.el is deprecated. babel is active and integrated into SNTag-org.el

**NOTE2** I have noticed a consistent error with emacs regarding file name length. I suspect it to be an error with gcc.


## Build focus

This config is built around my use of:
  - Markdown (markdown-mode, poly-R)
  - Pandoc (pandoc-mode)
  - Python (elpy)
  - R (ess, polymode)
  - notes and todo list (org-mode)
  - literative programming (org-mode, EIN, RMarkdown)
  - Navigation (helm-buffers-list)
  - Zotero (helm-bibtex and minimal zotxt)
  - git (magit-mode)
  - latex (AucTeX [**NOTE**: I do not use latex mode often and rely on pandoc through a makefile and
    knitr. Latex-mode remains in the system in case of future use.])

Where possible, I have added notations describing that system.


## Why I don't use a literate emacs file (yet)

Literate emacs seems like a great way to make configs accessible to others. There are many literate
files that I have used as inspiration for this config, but I cannot adopt it myself just yet. There
are too many gaps in my knowledge, and I need the room to make a mess. My current approach of
isolating modes into individually loaded files, while inefficient, acts as a way of locking code
into individual boxes. It's easier for me to understand emacs through compartmentalization.


## Requires
- xfce4 or konsole (see Borg-Collective/SNTag-quirks-and-twerks.el > defun open-terminal-in-workdir) **NOTE** complications from using both.
- multi-term installed from git to ~/.emacs/site-elisp/
- aweshell installed from git to ~/.emacs/site-elisp/


# Outline


## Current keybinds: User/Init Defined

### unbound
C-z - **suspend-frame** -- Just getting annoying. <br />

### General Helm Config (Additional helm functions listed elsewhere) (Moving helm-functions to Ivy except for the reference managment)
**NOTE:** Current keybindings for some default emacs functions have been remapped to helm-config.<br />
M-x		 - **helm-M-x**					 -- calls helm-posframe command search.<br />
C-x C-f	 - **helm-find-files**			 -- <br />
C-x b	 - **helm-occur**				 -- <br />
M-y		 - **helm-show-kill-ring**		 -- <br />
C-x r b	 - **helm-filtered-bookmarks**	 -- <br />
C-c w	 - **elfeed**					 -- opens elfeed <br />

### ispell/company/yassnippet
f8				 - **ispell-word**							 -- <br />
M-f8			 - **flyspell-check-next-highlighted-word**	 -- <br />
<!-- C-c C-n	 - **yas-expand-from-trigger-key**		 -- <br /> -->
C-c l			 - *company-yasnippet*					 -- will toggle company-yasnippet<br />

### Emacs Window Management
M-l		 - **ace-window**					 -- set up to call ace-window.<br />
C-c i	 - **ace-swap-window**				 -- swaps windows around.<br />
C-c h	 - **borg-secretary-readme**		 -- opens this readme if i forget a custom key bind.<br />
C-c r	 - **borg-secretary-editconfigs**	 -- opens Hive-Mind files.<br />

### Reference management (Helm based)
C-c f		 - **helm-bibtex-with-local-bibliography**	 -- <br />
C-u C-c f	 - **helm-bibtex-with-local-bibliography**	 -- To refresh bibtex key list.<br />

### Navigation
C-c s	 - **helm-buffers-list**		 -- <br />
C-c o	 - **browse-file-directory**	 -- Command to open the directory of current file.<br />

### File interaction/Management
C-c m	 - **compile**					 -- Useful for Makefile commands.<br />
C-x g	 - **magit-status**				 -- calls magit status.<br />
C-c t	 - **open-terminal-in-workdir**	 -- opens terminal (xfce or konsole) set to current dir. **NOTE** may have issues on OS with both terminals.<br />

### Org-mode
C-c a	 - **org-agenda**					 -- calls org agenda.<br />
C-c c	 - **org-capture**					 -- calls org-capture.<br />
C-c j	 - **gs-helm-org-link-to-contact**	 -- <br />
C-c e	 - **my-org-export-url**			 -- Pull external links into clipboard.<br />
TBS		 - **my-org-copy-smart-url**		 -- <br />

### projectile (UNDER DEVELOPMENT)
s-p		 - **projectile-command-map**	 -- <br />
C-c p	 - **projectile-command-map**	 -- <br />

### coding
C-c C-f	 - **format-all-buffer**	 -- <br />

### ess
C-c C-a	 - **ess-abort**		-- stops the current process.<br />
C-S-m	 - **DPLYR modifier**	-- inserts "%>%"

### borg-to-docs
Opens the relevant docs in the default browser.
**borg-to-org**			 -- opens html org-mode doc
**borg-to-ess**			 -- opens ess docs
**borg-to-orgbabel**	 -- opens org-babel docs

### defalias
commands I use often but not enough to deserve it's own hotkey.
ar - **align-regexp**                  -- aligns paragraphs by a symbol
ma - **Markdown-toggle-markup-hiding** -- toggles markup. makes it easier to edit sometimes. I never remember its hotkey.


## Custom commands
**today**					 -- enters todays date
**today-short**				 -- pastes date as DD/MM/YY
**browse-file-directory**	 -- Opens the directory of current file.
**my-org-export-url**		 --
**my-org-copy-smart-url**	 -- Pull external links into clipboard.
**ace-window**				 -- set up to call ace-window
**borg-secretary**			 -- opens this readme if i forget a custom key bind


# Extra details

## Backup Configuration
Default behaviour of emacs is to save backups to the same place as the file being edited. This has
been changed to "~/.emacs.d/backups", and will save up to the last 1000 backups of a file.



# Other details

## Borg-Collective
Styled after the Star-Trek Borgs (like several packages on git), my emacs files are organized in a
system I like to call the Borg-Collective. I have a file called Hive-mind which is used to let
emacs know where to find all my lisp files of interest. Each file is written for one mode or
feature. This has helped in separating my code into neat digestible chunks, compared to the single
massive init that I had previously.

## Customization based on system OS
**NOTE** I originally made my emacs config for windows. However, I have since switched to linux
full-time, which call for different emacs coding in places. The code snippets I thought were
of interest has been re-allocated to [windows-elisp-snippets.md](./windows-elisp-snippets.md).

## credits
Reddit has been a big help. It is darned useful.
