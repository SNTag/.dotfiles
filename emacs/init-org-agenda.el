;; (require 'org)
;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)
;; (setq org-log-done t)
;; (setq org-agenda-files '("D:/Dropbox/agenda/"))  ; sets location

;;  (setq org-agenda-custom-commands
;;        '(("c" "Simple agenda view"
;;           ((tags "PRIORITY=\"A\""
;;                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
;;                   (org-agenda-overriding-header "High-priority unfinished tasks:")))
;;            (agenda "")
;;            (alltodo "")))))


;;  (setq org-agenda-custom-commands
;;        '(("d" "Daily agenda and all TODOs"
;;           ((tags "PRIORITY=\"A\""
;;                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
;;                   (org-agenda-overriding-header "High-priority unfinished tasks:")))
;;            (agenda "" ((org-agenda-ndays 1)))
;;            (alltodo ""
;;                     ((org-agenda-skip-function '(or (air-org-skip-subtree-if-habit)
;;                                                     (air-org-skip-subtree-if-priority ?A)
;;                                                     (org-agenda-skip-if nil '(scheduled deadline))))
;;                      (org-agenda-overriding-header "ALL normal priority tasks:"))))
;;           ((org-agenda-compact-blocks t)))))



(use-package org
  :ensure org-plus-contrib
  :init
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook 'flyspell-mode)
  (setq org-mobile-directory "~/Dropbox (Personal)/Apps/MobileOrg")
  :diminish visual-line-mode
  :diminish org-indent-mode
  :defer t
  :bind (("\C-c a" . org-agenda)
	 ("\C-c c" . org-capture)
	 ("\C-c j" . gs-helm-org-link-to-contact))
  :config


  (defun sk/diminish-org-indent ()
    "Diminish org-indent-mode on the modeline"
    (interactive)
    (diminish 'org-indent-mode ""))
  (add-hook 'org-indent-mode-hook #'sk/diminish-org-indent)
  
  ;; ;; Custom functions for emacs & org mode
  ;; (load-file "~/.emacs.d/config/gs-org.el")
  ;; (require 'org)

  (setq org-display-inline-images t)
  (setq org-redisplay-inline-images t)
  (setq org-startup-with-inline-images "inlineimages")

  ;; == Agenda ==
  (defvar org-agenda-window-setup)
  (setq org-agenda-window-setup 'current-window)

  ;; Run/highlight code using babel in org-mode
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (python . t)
     (ipython . t)
     (octave . t)
     (C . t)
     (shell . t)
     ))
  ;; Syntax hilight in #+begin_src blocks
  (setq org-src-fontify-natively t)
  ;; Don't prompt before running code in org
  (setq org-confirm-babel-evaluate nil)
  ;; Display inline images after running code
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

  ;; Org + LaTeX
  (with-eval-after-load 'ox-latex
    (add-to-list 'org-latex-classes
	       '("book-noparts"
		 "\\documentclass{book}"
		 ("\\chapter{%s}" . "\\chapter*{%s}")
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))


  (use-package helm-org-rifle
    :ensure t)

  (use-package ob-async
    :ensure t
    ;:load-path "/Users/Greg/Desktop/ob-async"
    :config
    (setq ob-async-no-async-languages-alist '("ipython"))
    )

  (use-package ob-ipython
    :ensure t)

  ;; Capture mode
  (add-hook 'org-capture-mode-hook 'evil-insert-state)
  (general-define-key
   :keymaps 'org-capture-mode-map
   :states '(normal motion)
   :prefix gjs-leader-key
   "c" 'org-capture-finalize
   "k" 'org-capture-kill
   "w" 'org-capture-refile
   )

  (general-define-key
   :keymaps 'org-agenda-mode-map
   :prefix gjs-leader-key
   :states '(normal motion)
   "" '(:ignore t :which-key "Agenda")
   "i" 'org-agenda-clock-in
   "k" 'org-agenda-kill
   "o" 'org-agenda-clock-out
   "t" 'org-agenda-todo
   "w" 'org-agenda-refile
   "/" 'org-agenda-filter-by-tag
   "cs" '(gs-org-goto :which-key "org goto")
   "c/" '(helm-org-rifle :which-key "org-rifle")
   )

  ;; (general-define-key
  ;;  :keymaps org-mode-map
  ;;  :states '(normal)
  ;;  (kbd "<M-return>") 'gs-org-meta-return
  ;;  (kbd "<C-return>") 'gs-org-insert-heading-respect-content
  ;;  )
  (general-define-key
   :prefix (concatenate 'string gjs-leader-key)
   :keymaps 'org-mode-map
   :states '(normal motion)
   "i" '(org-clock-in :which-key "clock in")
   "o" '(org-clock-out :which-key "clock out")
   "t" '(org-todo :which-key "todo state")
   "ct" '(org-todo :which-key "todo state")
   "ce" '(org-export-dispatch :which-key "org export")
   "cp" '(org-set-property :which-key "org set property")
   "cs" '(gs-org-goto :which-key "org goto")
   "cj" '(gs-helm-org-link-to-contact :which-key "link contact")
   "c/" '(helm-org-rifle :which-key "org-rifle")
   )
  ;; some functions for timing
  )

(defun org-build-agenda ()
  (interactive)
  (setq last-build-time (format-time-string "%S.%3N"))
  (org-agenda 0 " ")
  (setq after-build-time (format-time-string "%S.%3N"))
  (print last-build-time)
  (print after-build-time)
)
