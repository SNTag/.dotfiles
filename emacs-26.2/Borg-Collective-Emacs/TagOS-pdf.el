
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Doc-view

(setq doc-view-continuous t)  ; enables continous scroll on doc-view


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PDF-tiiks
;;
;; adapted from:
;; http://pragmaticemacs.com/emacs/view-and-annotate-pdfs-in-emacs-with-pdf-tools/

;; (use-package pdf-tools
;;  :pin manual ;; manually update
;;  :config
;;  ;; initialise
;;  (pdf-tools-install)
;;  ;; open pdfs scaled to fit page
;;  (setq-default pdf-view-display-size 'fit-page)
;;  ;; automatically annotate highlights
;;  (setq pdf-annot-activate-created-annotations t)
;;  ;; use normal isearch
;;  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
;;  )

;; ;; (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)  ; will hopefully load latex-pdf after compilation

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pdf-tools

(use-package pdf-tools-install
  :ensure pdf-tools
  :if (and *sys/gui* (not *sys/win32*))
  :mode "\\.pdf\\'"
  :commands (pdf-loader-install)
  :custom
  (TeX-view-program-selection '((output-pdf "pdf-tools")))
  (TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view")))
  :hook
  (pdf-view-mode . (lambda () (display-line-numbers-mode -1)))
  :config
  (pdf-loader-install))
