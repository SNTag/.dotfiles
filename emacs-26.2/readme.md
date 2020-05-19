# .emacs.d-config


Works best on Linux. For Windows-emacs, my old code snippets are in
[windows-elisp-snippets.md](./windows-elisp-snippets.md) (see below: 'customization based on system
OS').

Consistently used on emacs 26. As I am usually using the latest most stable emacs, I'm rarely
checking for backwards compatibility and cannot confirm all features will work.

Feel free to use or take details from this set up. Sources of inspiration are
mentioned in the code where relevant.

**Build focus:** Focused on developing emacs as what it is: a tool.

I aim to make a minimalist Emacs rich in functionality.

**Understanding my init**
The Init file hold only tweaks for improving speed during loading and to direct it to the
Borg-Collective (my nickname for my mode configuration organization). Names of the
Borg-Collective files indicate what it contains.

**NOTE** I have noticed a consistent error with emacs regarding file name length. I suspect it to be an error with gcc.


## Main Useage

This config is built around my use of:
  - Markdown (markdown-mode, poly-R)
  - Pandoc (pandoc-mode)
  - Python (elpy)
  - R (ess, polymode, Rmarkdown)
  - notes and todo list (org-mode)
  - literative programming (org-mode, EIN, RMarkdown, babel)
  - Navigation (helm-buffers-list)
  - Zotero (helm-bibtex and minimal zotxt)
  - git (magit-mode)
  - latex (AucTeX [**NOTE**: I do not use latex mode often and rely on pandoc through a makefile and
    knitr. Latex-mode remains in the system in case of future use.])

Where possible, I have added notations describing that system.


## Why I don't use a literate emacs file (yet)
Literate emacs seems like a great way to make configs accessible to others. There are many literate
files that I have used as inspiration for this config, but I cannot adopt it myself just yet. There
are too many gaps in my knowledge, and I need the room to make a non-linear mess. My current
approach of isolating modes into many individually loaded files, while inefficient, acts as a way of
compartmentalizing the code. It's been great to learn from.


## Requires
- xfce4 or konsole (see Borg-Collective/SNTag-quirks-and-twerks.el > defun borg/open-terminal-in-workdir) **NOTE** complications from using both.
- multi-term installed from git to ~/.emacs/site-elisp/
- aweshell installed from git to ~/.emacs/site-elisp/


# Outline


## Current keybinds: User/Init Defined

### unbound!
C-z - **suspend-frame** -- Just getting annoying <br />

### General Helm Config (Additional helm functions listed elsewhere) (Moving helm-functions to Ivy except for the reference managment)
**NOTE:** Current keybindings for some default emacs functions have been remapped to helm-config <br />
M-x		 - **helm-M-x**					 -- Rebound from default. Uses helm to search for commands <br />
C-x C-f	 - **helm-find-files**			 -- Rebound from default. Uses helm to find files <br />
C-x b	 - **helm-occur**				 -- <br />
M-y		 - **helm-show-kill-ring**		 -- <br />
C-x r b	 - **helm-filtered-bookmarks**	 -- <br />
C-c w	 - **elfeed**					 -- opens elfeed <br />

### ispell/company/yassnippet
f8				 - **ispell-word**							 -- <br />
M-f8			 - **flyspell-check-next-highlighted-word**	 -- <br />
<!-- C-c C-n	 - **yas-expand-from-trigger-key**		 -- <br /> -->
C-c l			 - *company-yasnippet*					 -- will toggle company-yasnippet <br />

### Emacs Window Management
M-l		 - **ace-window**					 -- set up to call ace-window <br />
C-c i	 - **ace-swap-window**				 -- swaps windows around <br />

### Reference management (Helm based)
Confirmed to work with zotero.

C-c f		 - **helm-bibtex-with-local-bibliography**	 -- <br />
C-u C-c f	 - **helm-bibtex-with-local-bibliography**	 -- To refresh bibtex key list <br />

### Navigation
C-c s	 - **helm-buffers-list**	    	 -- Uses helm to search among open files <br />
C-c o	 - **sys/browse-file-directory**	 -- Command to open the directory of current file <br />

### File interaction/Management
C-c m	 - **compile**					     -- Useful for Makefile commands.<br />
C-x g	 - **magit-status**			    	 -- calls magit status.<br />
C-c t	 - **sys/open-terminal-in-workdir**	 -- opens terminal (xfce4-terminal, konsole, gnome-terminal) **WARNING** will open multiple terminals on systems with more than one. **WARNING** may not function on your system without adjustments.
C-c o    - **sys/browse-file-directory**	 -- Opens directory for current frame.

### Org-mode
C-c a	 - **org-agenda**					 -- calls org agenda.<br />
C-c c	 - **org-capture**					 -- calls org-capture.<br />
C-c j	 - **gs-helm-org-link-to-contact**	 -- <br />
C-c e	 - **my-org-export-url**			 -- Pull external links into clipboard.<br />
TBS		 - **my-org-copy-smart-url**		 -- <br />

### projectile (UNDER DEVELOPMENT)
s-p		 - **projectile-command-map**	 -- <br />
C-c p	 - **projectile-command-map**	 -- <br />

### General programming
C-c C-f	 - **format-all-buffer**	 -- <br />

### ess
C-c C-a	 - **ess/ess-abort**		-- stops the current process.<br />
C-S-m	 - **DPLYR modifier**   	-- inserts "%>%" <br />

### document links
This list is not conclusive. There may be links I forgot to add here.  Opens websites/local
docs. Functions here follow the format 'doc/to-{category}-{type}' Opens the relevant docs in the
default browser.

**docs/my-emacs-readme**				-- Opens this README.org file <br />
**docs/to-emacs-yasnippetsquickquide**	-- yasnippets quick guide <br />
**docs/to-org-reg**						-- org-docs <br />
**docs/to-org-babel**					-- org-babel-docs <br />
**docs/to-R-ess**						-- ess-docs <br />
**docs/to-R-rmarkdown**					-- RMarkdown docs <br />
**docs/to-R-cheatsheets**				-- RStudio cheatsheets <br />
**docs/to-R-cran**						-- R Cran docs <br />
**docs/to-R-advancedr**					-- Hadley's advanced guide to R <br />
**docs/to-R-datascience**				-- Hadley's guide to data science <br />
**docs/to-python-docs**					-- python3-documentation <br />
**wiki/to-web-wikipedia**				-- wikipedia <br />

### edit/files
links to rapidly open emacs files to edit.

**edit/emacs-config**	 -- opens Hive-Mind files <br />

### time/commands
**time/today**				 -- enters todays date <br />
**time/today-short**		 -- pastes date as DD/MM/YY <br />
**time/web-timeconverter     -- opens a url to timeanddate for easy timezone conversions <br />

### defalias
commands I use often but not enough to deserve it's own hotkey.
ar - **align-regexp**                  -- aligns paragraphs by a symbol
ma - **Markdown-toggle-markup-hiding** -- toggles markup. makes it easier to edit sometimes. I never remember its hotkey.


## Custom commands
**my-org-export-url**		 --
**my-org-copy-smart-url**	 -- Pull external links into clipboard
<!-- **ace-window**				 -- set up to call ace-window -->


# Extra details

## Backup Configuration
Default behaviour of emacs is to save backups to the same place as the file being edited. This has
been changed to "~/.emacs.d/backups", and will save up to the last 1000 backups of a file.



# Other details

## Borg-Collective
Styled after the Star-Trek Borgs (like several packages on git), my emacs files and commands are
organized in a system I like to call the Borg-Collective. Like the Borg, my emacs absorbs features of
interest and implements it. Albeit in a far less malicious way.

In the folder 'Borg-collective', the file 'Hive-mind' is used to let emacs know where to find all my lisp files of
interest. Each file in the collective is written for a specific major or minor mode. This has helped in
separating my code into neat digestible chunks, compared to the single massive init that I had
previously (see 'Why I don't use a literate emacs file (yet)').

## Frame control
I came to emacs from Rstudio, and miss the controlled use of frames. I have implemented (roughly) a
way of frame control, which assigns frames I do not want to concern myself with (or pay most of my
attention to) to a frame on the far left, 1/3 of the screen. See
[TagOS-frame-control.el](./Borg-Collective-Emacs/TagOS-frame-control.el).

## Customization based on system OS
**NOTE** I originally made my emacs config for windows. However, I have since switched to linux
full-time, which call for different emacs coding in places. The code snippets I thought were
of interest has been re-allocated to [windows-elisp-snippets.md](./windows-elisp-snippets.md).

## credits
Reddit has been a big help. It is darned useful.
