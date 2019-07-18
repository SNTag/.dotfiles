# .emacs.d-config


OS: Linux (up-to-date), Windows (May have complications)

Build focus:
I am a graduate student in molecular biology attempting to make a break into bioinformatics with a
strong desire for minimalism in my build if possible.  Some things have been tweaked to my design
preferences.  Let me know if you have advice on design improvements!

I have recently made the switch to Linux Manjaro (yes, I'm now an elitist Arch user), and the
windows related components may be deprecated.  I'll update them in the future if given a chance.

The Init file has only personal tweaks, and code telling emacs what files to load for the
configuration based on the system it is on.  Notes are available on how to tweak it where possible
or I've remembered why I putsomething in.



## Build focus

The windows config is built around my use of:
  - Markdown (markdown-mode)
  - Pandoc (pandoc-mode)
  - Python (elpy)
  - R (ess)
  - notes and todo list (org-mode)
  - Navigation (helm-buffers-list)
  - Zotero (helm-bibtex and minimal zotxt)
  - git (magit-mode)
  - latex (AucTeX [**NOTE**: I do not use latex anymore and rely on pandoc.  This remains in the system in case of future use.])

It should be possible to find sections where everything related to that mode are found.



## Current keybinds

C-c f - helm-bibtex-with-local-bibliography
C-c f - helm-bibtex-with-local-bibliography (to refresh)
C-x g - magit-status
C-c s - helm-buffers-list



## Custom commands

today  -  enters todays date
browse-file-directory  -  Opens the current files directory


Using Markdown
--------------

If interested, my thesis writing approach uses Markdown, lualatex, and pandoc.  The paper can be
written in markdown notation with latex commands, and processed using pandoc to generate PDFs.

Pandoc Scholar - https://github.com/pandoc-scholar



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


