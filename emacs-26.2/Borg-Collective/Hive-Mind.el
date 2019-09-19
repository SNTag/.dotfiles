;; quirks and twerks
(load-file "~/.emacs.d/Borg-Collective-Emacs/SNTag-quirks-and-twerks.el")

;; ;; custom-files
;; (load-file "~/.emacs.d/Borg-Collective-Emacs/SNTag-custom-file.el")

;; dropbox
(load-file "~/.emacs.d/Borg-Collective-Emacs/SNTag-dropbox.el")

;; themes
(load-file "~/.emacs.d/Borg-Collective-Emacs/SNTag-themes.el")

;; dictionary, company, and yasnippet
(load-file "~/.emacs.d/Borg-Collective-Emacs/SNTag-dictionary-company-and-yasnippets.el")

;; jupyter-notebook.el
(load-file "~/.emacs.d/Borg-Collective-Emacs/SNTag-jupyter-notebook.el")

;; elpy-python
(load-file "~/.emacs.d/Borg-Collective-Emacs/SNTag-elpy-python.el")

;; ess
(load-file "~/.emacs.d/Borg-Collective-Emacs/SNTag-ess.el")

;; elpy-python
(load-file "~/.emacs.d/Borg-Collective-Emacs/SNTag-markdown.el")

;; org-mode
(load-file "~/.emacs.d/Borg-Collective-Emacs/SNTag-org-mode.el")

;; magit
(load-file "~/.emacs.d/Borg-Collective-Emacs/SNTag-magit.el")

;; latex
(load-file "~/.emacs.d/Borg-Collective-Emacs/SNTag-latex.el")

;; start-up-config
(load-file "~/.emacs.d/Borg-Collective-Emacs/SNTag-start-up-config.el")

;; helm-bibtex
(load-file "~/.emacs.d/Borg-Collective-Emacs/SNTag-helm-bibtex.el")

;; load-files
(if (display-graphic-p)
    (load-file "~/.emacs.d/Borg-Collective_Emacs-private/SNTag-load-files.el")
  )
