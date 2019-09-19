;; quirks and twerks
(load-file "~/.emacs.d/Borg-Collective/SNTag-quirks-and-twerks.el")

;; ;; custom-files
;; (load-file "~/.emacs.d/Borg-Collective/SNTag-custom-file.el")

;; dropbox
(load-file "~/.emacs.d/Borg-Collective/SNTag-dropbox.el")

;; themes
(load-file "~/.emacs.d/Borg-Collective/SNTag-themes.el")

;; dictionary, company, and yasnippet
(load-file "~/.emacs.d/Borg-Collective/SNTag-dictionary-company-and-yasnippets.el")

;; jupyter-notebook.el
(load-file "~/.emacs.d/Borg-Collective/SNTag-jupyter-notebook.el")

;; elpy-python
(load-file "~/.emacs.d/Borg-Collective/SNTag-elpy-python.el")

;; ess
(load-file "~/.emacs.d/Borg-Collective/SNTag-ess.el")

;; elpy-python
(load-file "~/.emacs.d/Borg-Collective/SNTag-markdown.el")

;; org-mode
(load-file "~/.emacs.d/Borg-Collective/SNTag-org-mode.el")

;; magit
(load-file "~/.emacs.d/Borg-Collective/SNTag-magit.el")

;; latex
(load-file "~/.emacs.d/Borg-Collective/SNTag-latex.el")

;; start-up-config
(load-file "~/.emacs.d/Borg-Collective/SNTag-start-up-config.el")

;; helm-bibtex
(load-file "~/.emacs.d/Borg-Collective/SNTag-helm-bibtex.el")

;; load-files
(if (display-graphic-p)
    (load-file "~/.emacs.d/Borg-Collective/SNTag-load-files.el")
  )
