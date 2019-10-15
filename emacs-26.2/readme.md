# .emacs.d-config


Works on Linux.
Compatible with emacs 26.1 to 26.3.

While the majority of this system was set up on windows, there are some odd details written with
linux in mind.  Feel free to use or take details from this set up.  Sources of inspiration are
mentioned in the code.

**Build focus:** I've been too focused on improving the overall feel of emacs.  Focusing now on using emacs
as what it is: a tool.

I have recently made the switch to Linux Manjaro, and plan to stick with it for a long time.

The Init file has only tweaks for improving speed during loading and to direct it to the
Borg-Collective (my nickname for my mode configuration organization).  Names of the
Borg-Collective files indicate what it contains.



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


# Outline


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
If interested, my thesis writing approach uses Markdown, lualatex, and pandoc.  The paper can be
written in markdown notation with latex commands, and processed using pandoc to generate PDFs.

**NOTE** I have a finished system that has not been uploaded to github yet.  I will do so when I have the time.

[Pandoc scholar](https://github.com/pandoc-scholar) 
[Pandoc-Latex-NUS-thesis](https://github.com/SNTagore/Pandoc-Latex-NUS-thesis ) 



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


