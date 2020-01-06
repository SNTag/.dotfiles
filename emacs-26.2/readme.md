# .emacs.d-config


Works on Linux.
Compatible with emacs 26.1 to 26.3.

While the majority of this system was set up on windows, there are some odd details written with
linux in mind.  Feel free to use or take details from this set up.  Sources of inspiration are
mentioned in the code.

**Build focus:** I've been too focused on improving the overall feel of emacs.  Focusing now on using emacs
as what it is: a tool.

The Init file has only tweaks for improving speed during loading and to direct it to the
Borg-Collective (my nickname for my mode configuration organization).  Names of the
Borg-Collective files indicate what it contains.

**NOTE** Org-babel is currently disabled.  It is a work in progress, and is interfering with non-programming org-mode config settings.



## Build focus

This config is built around my use of:
  - Markdown (markdown-mode)
  - Pandoc (pandoc-mode)
  - Python (elpy)
  - R (ess)
  - notes and todo list (org-mode)
  - literative programming (org-mode)
  - Navigation (helm-buffers-list)
  - Zotero (helm-bibtex and minimal zotxt)
  - git (magit-mode)
  - latex (AucTeX [**NOTE**: I do not use latex mode often and rely on pandoc with makefile, markdown,
    and latex.  Latex-mode remains in the system in case of future use.])

It should be possible to find sections where everything related to that mode are found in the Borg-Collective.



## Requires

- konsole (see Borg-Collective/SNTag-quirks-and-twerks.el, defun open-terminal-in-workdir)
- multi-term installed from git to ~/.emacs/site-elisp/
- aweshell installed from git to ~/.emacs/site-elisp/



# Outline


## Current keybinds: User/Init Defined

### Helm Config
**NOTE:**  Current keybindings for some default emacs functions have been remapped to helm-config.<br />
M-x - **helm-M-x** - calls helm-posframe command search.<br />
C-x C-f - **helm-find-files** -<br />
C-x b - **helm-occur** -<br />
M-y - **helm-show-kill-ring** -<br />
C-x r b - **helm-filtered-bookmarks** -<br />

### Emacs Window Management
M-l - **ace-window** - set up to call ace-window.<br />
C-c h - **borg-secretary-readme** - opens this readme if i forget a custom key bind.<br />
C-c r - **borg-secretary-editconfigs** - opens Hive-Mind files.<br />

### Reference management
C-c f - **helm-bibtex-with-local-bibliography** -<br />
C-u C-c f - **helm-bibtex-with-local-bibliography** - To refresh bibtex key list.<br />

### Navigation
C-c s - **helm-buffers-list** - <br />
C-c o - **browse-file-directory** - Command to open the directory of current file.<br />

### File interaction/Management
C-c m - **compile** -  Useful for Makefile commands.<br />
C-x g - **magit-status** - calls magit status.<br />
C-c t - **open-terminal-in-workdir** - opens terminal (konsole) set to current dir.<br />

### Org-mode
C-c a - **org-agenda** - calls org agenda.<br />
C-c c - **org-capture** - calls org-capture.<br />
C-c j - **gs-helm-org-link-to-contact** -<br />
C-c e - **my-org-export-url** - Pull external links into clipboard.<br />
TBS - **my-org-copy-smart-url** -<br />

### projectile (UNDER DEVELOPMENT)
s-p - **projectile-command-map** -<br />
C-c p - **projectile-command-map** -<br />

### coding
C-c C-f - **format-all-buffer** -<br />

### ess
C-c C-a - **ess-abort** - stops the current process.<br />


## Custom commands

**today**  -  enters todays date
**today-short** - pastes date as DD/MM/YY
**browse-file-directory**  -  Opens the directory of current file.
**my-org-export-url** -
**my-org-copy-smart-url** - Pull external links into clipboard.
**ace-window** - set up to call ace-window
**borg-secretary** - opens this readme if i forget a custom key bind


Using Markdown
--------------
If interested, my thesis writing approach uses Markdown, lualatex, and pandoc.  The paper can be
written in markdown notation with latex commands, and processed using pandoc to generate PDFs.

**NOTE** I have a finished system that has not been uploaded to github yet.  I will do so when I have the time.

[Pandoc scholar](https://github.com/pandoc-scholar)
[Pandoc-Latex-NUS-thesis](https://github.com/SNTagore/Pandoc-Latex-NUS-thesis )



# Extra details

## Useful links
These links are guides that I've found useful in setting up my system.  Useful for developing modifications to this init.  THESE LINKS MOSTLY IGNORE REFERENCES METIONED INSIDE EL FILES.

### Markdown

markdown-mode

### Pandoc

pandoc-mode

### Python

elpy

### R

ess

### notes and todo list

org-mode

### literative programming

org-mode
**org-babel** - https://org-babel.readthedocs.io/en/latest/

### Navigation

helm-buffers-list

### Zotero

helm-bibtex
zotxt
### git

magit-mode

### latex



# Lisp snippets of interest

## Borg-Collective

Styled after the Star-Trek Borgs (like several packages on git), my emacs files are organized in a
system I like to call the Borg-Collective.  I have a file called Hive-mind which is used to let
emacs know where to find all my lisp files of interest.  Each file is written for one mode or
feature.  This has helped in separating my code into neat digestible chunks, compared to the single
massive init that I had previously.

## Customization based on system OS

**NOTE** I do not use these codes anymore.  Use of just linux has made them unnecessary.  Leaving it up
in case it helps sometime in the future.

### To load custom el files based on system

``` lisp
;; ====================
;; Custom el

(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (setq custom-file "~/.emacs.d/config/custom/windows-main-custom.el")
    (load custom-file 'noerror)
    ))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (setq custom-file "~/.emacs.d/config/custom/linux-terminal-custom.el")
    (load custom-file 'noerror)
    )) )
```



### To load main config files

``` lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; check OS type

(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (load-file "~/.emacs.d/config/windows-main.el")
    ))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (load-file "~/.emacs.d/config/linux-terminal.el")
    )) )
```



### To load files used daily based on system

``` lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; check OS type FOR LOAD-FILES

(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (load-file "~/.emacs.d/config/windows-loadfiles.el")
    ))
  ;; ((string-equal system-type "gnu/linux") ; linux
  ;; (progn
  ;;   (load-file "~/.emacs.d/config/linux-terminal.el")
  ;;   ))
  )
```



### Minor packages
To load packages minor enough to not have a great deal of work required to use, and/or only require
a one time installation.

``` lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use-package

(add-to-list 'load-path "~/.emacs.d/site-lisp/use-package")

(require 'use-package)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/.emacs.d/site-lisp/use-package/"))

(setq use-package-always-ensure t)
```
