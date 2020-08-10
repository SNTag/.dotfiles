# .emacs.d-config


Built for linux.

Used in emacs 26.

Feel free to use or take details from this set up. Sources of inspiration are
mentioned in the code where relevant.

**Build focus:**
emacs is not an OS, but I do use it as an interface.

I aim to make a minimalist Emacs rich in functionality. It has to have quick fire access to those
tools and documents I refer to often, and does not seek to replace basic functions available in linux.

**Understanding my init**
The Init file hold only tweaks for improving speed during loading and to direct it to the
Borg-Collective (my nickname for my mode configuration organization). Names of the
Borg-Collective files indicate what its for.

**NOTE**
I have noticed a consistent error across OS regarding file name length in emacs. I suspect it to be some conflict error with gcc.


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
  - latex (AucTeX)

Where possible, I have added notations describing that system.


## Why I don't use a literate emacs file (yet)
Literate emacs seems like a great way to make configs accessible to others. There are many literate
files that I have used as inspiration for this config, but I cannot bring myself to adopt it. I've
become entrenched in a system where in-built commands enable editing of specific modes. ex,
'edit/emacs-ess' enables editing of my ess mode. It's helpful to not fall into the pit of endless
improvements. The literative approach is great for building a well-rounded system, but the
temptation is too high to get lost in the larger picture instead of getting things done.


# Outline
Emacs is not an operating system. I leave a good deal of functions to those designed to do them to
reduce the work on my part. ex, web links, bash, etc.

## Major differences to most emacs versions
### Frame control
I came emacs from Rstudio, which has a wonderful way of displaying multiple frames with distinct
purposes. I attempted to replicate that here through the file 'TagOS-frame-control.el'. It will open
most shells, references (help, documentation, pdfs, yaml, etc), and helm in a sidebar.

### links to documentation
I keep emacs to doing what it does best (editing files), and leave anything of potential conflict to the system's
default programs. ex, my links to various documents. It's not a complete list, but I have unique
links in the format of 'docs/to-X' which will open the default online documentation in your default
web browser. For example, I need help with org (docs/to-org-manual) or ess (docs/to-R-ess). I type
the relevant command, and it will open in firefox.

## Installation
In the home directory for this git repo, there is a file 'setup-emacs-TagOS.sh'. It was written for
linux. The script will set up a specific flavor of emacs, not install emacs itself. It will set up
the init file, transfer snippets, and install the borg-collective.

## Requires
- xfce4, konsole, or gnome-terminal (see Borg-Collective/SNTag-quirks-and-twerks.el > defun borg/open-terminal-in-workdir) **NOTE** complications from having multiple terminals installed.
- multi-term installed from git to ~/.emacs/site-elisp/
- aweshell installed from git to ~/.emacs/site-elisp/
- aspell-en **EXPECT LONG FILE LOADING/EMACS INIT TIME WITHOUT THIS**


## Current keybinds: User/Init Defined
A number of custom bindings/functions for this version of emacs are bunched under certain categories:
sys  - system (OS) functions.
edit - emacs config files to edit
docs - documentation links
ency - encyclopedia links
time - time functions/formatting
my   - functions to wrap things together
etc
these functions are called through M-x category/the-function. ex, docs/to-org-reg


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
C-c SPC	 - **sys/open-dropdown-terminal-in-workdir**	 -- **IN DEVELOPMENT** opens drop-down terminal in the working dir of current file. Works only with guake right now.

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
**ency/to-web-wikipedia**				-- wikipedia <br />

### edit/files
links to rapidly open emacs files to edit.

**edit/emacs-config**	  -- opens Hive-Mind files <br />
**edit/emacs-quirks**     -- Opens the emacs quirks files <br />
**edit/emacs-doc-loader** -- Opens the emacs doc-loader <br />
**edit/emacs-ess**        -- Opens the emacs ess configs <br />

### time/commands
**time/today**			       -- enters todays date <br />
**time/today-short**	  	   -- pastes date as DD/MM/YY <br />
**time/web-timeconverter**     -- opens a url to timeanddate for easy timezone conversions <br />

### defalias
commands I use often but not enough to deserve it's own hotkey.
are - align-regexp 						-- Align-RegExp           : to set alignments by symbols
mmt - markdown-toggle-markup-hiding 	-- Markdown-Markup-Toggle : to toggle markdown markup
rer - run-ess-r 						-- Run-Ess-R              : start an ess-r console
ydt - yas-describe-tables 				-- Yas-Describe-Tables    : runs yas-describe-tables
odb - display-buffer 					-- Open-Display-Buffer    : opens the display buffer if it has been closed.
otl - org-toggle-latex-fragment			-- Org-Toggle-Latex       : toggles org-mode latex fragments
dib - display-buffer                    -- DIsplay-Buffer         : reopens shells/consoles/pdfs/help in a side window.


## Custom commands
**my-org-export-url**		 --
**my-org-copy-smart-url**	 -- Pull external links into clipboard
<!-- **ace-window**				 -- set up to call ace-window -->


# Extra details

## Backup Configuration
Default behaviour of emacs is to save backups to the same place as the file being edited. This has
been changed to "~/.emacs.d/backups", and will save up to the last 1000 backups of a file.

configuration for the backup system under "TagOS-quirks.el".

# Other details

## Borg-Collective
Styled after the Star-Trek Borgs (like several packages on git), my emacs files and commands are
organized in a system I like to call the Borg-Collective. Like the Borg, my emacs assimilates files
and implements them. Albeit in a far less malicious way.

In the folder 'Borg-collective', the file 'Hive-mind' is used to let emacs know where to find all my lisp files of
interest. Each file in the collective is written for a specific major or minor mode. This has helped in
separating my code into neat digestible chunks, compared to the single massive init that I had
previously (see 'Why I don't use a literate emacs file (yet)').

## Personal customizations/playground
I have left a file open for random/testing/personal customization under
".emacs.d/custom/personal-configs.el". Some code that I am playing with, or unique code snippets,
are shuffled to there.

## Frame control
I came to emacs from Rstudio and miss the controlled use of frames. I have implemented (roughly) a
way of frame control, which assigns frames I do not want to concern myself with (or pay most of my
attention to) to a frame on the far left, 1/3 of the screen. See
[TagOS-frame-control.el](./Borg-Collective-Emacs/TagOS-frame-control.el).

## credits
Reddit has been a big help. It is darned useful.
