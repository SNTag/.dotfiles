;; quirks and twerks
(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-quirks-and-twerks.el")

;; frame control
(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-frame-control.el")

;; docs/wiki-loader
(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-doc-loader.el")

;; themes
(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-themes.el")

;; dictionary, company, and yasnippet
(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-dictionary-company-yasnippets.el")

;; ein
(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-ein.el")

;; elpy-python
;(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-python-elpy.el")

;; bash
(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-bash.el")

;; ess
(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-ess.el")

;; julia
(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-julia.el")

;; markdown
(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-markdown.el")

;; polymode
(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-polymode.el")

;; org-mode
(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-org.el")

;; org-agenda
; (load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-org.el")

;; ;; org-babel
;; (load-file "~/.dotfiles/emacs-26.2/Borg-Collective/TagOS-literative-programming.el")

;; ;; magit
;; (load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-magit.el")

;; latex
(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-latex.el")

;; ;; start-up config
;; (load-file "~/.emacs.d/Borg-Collective_Emacs/TagOS-startup.el")

;; helm-bibtex
(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-helm.el")

;; helm-bibtex
(load-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-pdf.el")

;; for some personal configurations that are only useful in graphics mode.
(if (file-exists-p "~/.emacs.d/custom/personal-configs.el")
    (if (display-graphic-p)
	(load-file "~/.emacs.d/custom/personal-configs.el")
      )
  )
