# .emacs.d-config


Designed for Linux.

previous commits included windows incase I ever switched back and
forth.  I'm commiting my self to linux.

Build focus: I am a graduate student in molecular biology attempting
to make a break into bioinformatics with a strong desire for
minimalism in my build if possible.  Some things have been tweaked to
my design preferences.  Let me know if you have advice on design
improvements!

I have recently made the switch to Linux Manjaro, and plan to stick
with it for a long time.

The Init file has only tweaks for improving speed during loading and
to direct it to the Borg-Collective (my nickname for the style of
organization for the packages).  Names of the Borg-Collective files
indicate what it contains.



## Build focus

This config is built around my use of:
  - Markdown (markdown-mode)
  - Pandoc (pandoc-mode)
  - Python (elpy)
  - R (ess)
  - notes and todo list (org-mode)
  - Navigation (helm-buffers-list)
  - Zotero (helm-bibtex and minimal zotxt)
  - git (magit-mode)
  - latex (AucTeX [**NOTE**: I do not use latex directly anymore and
    rely on pandoc with makefile, markdown, and latex.  Latex-modes
    remains in the system in case of future use.])

It should be possible to find sections where everything related to that mode are found in the Borg-Collective.


# Future Plans

Will attempt to clean things up and introduce an babel literative programming el format if possible.


## Current keybinds: User/Init Defined

### Unbound
C-x C-c - global kill key. Unsets the emacs kill command in GUI in case my clumsy fingers press it.

### User list
C-c f - helm-bibtex-with-local-bibliography
C-u C-c f - helm-bibtex-with-local-bibliography.  To refresh bibtex key list.
C-c s - helm-buffers-list
C-c m - compile.  Useful for Makefile commands
C-c o - browse-file-directory.  Command to open the directory of current file.

C-x g - magit-status



## Custom commands

today  -  enters todays date
browse-file-directory  -  Opens the directory of current file.


Using Markdown
--------------

If interested, my thesis writing approach uses Markdown, lualatex, and
pandoc.  The paper can be written in markdown notation with latex
commands, and processed using pandoc to generate PDFs.

[Pandoc scholar](https://github.com/pandoc-scholar) 
[Pandoc-Latex-NUS-thesis](https://github.com/SNTagore/Pandoc-Latex-NUS-thesis ) 



## Customization based on system OS

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



### To load files used daily

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


