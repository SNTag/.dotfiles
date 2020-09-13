;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Polymode config
;;
;; This section controls my polymode config. It is used across
;; different modes, and thus needs an easy way to configure it.

;; ====================
;; R markdown
;;
;; inspired by:
;; https://stackoverflow.com/questions/16172345/how-can-i-use-emacs-ess-mode-with-r-markdown#16176115

;; (use-package poly-R)
;; (use-package poly-markdown)

;; (defun rmd-mode ()
;;   "ESS Markdown mode for rmd files"
;;   (interactive)
;;   ;; (setq load-path
;;   ;;   (append (list "path/to/polymode/" "path/to/polymode/modes/")
;;   ;;       load-path))
;;   (require 'poly-R)
;;   (require 'poly-markdown)
;;   (poly-markdown+r-mode))

;; (setq load-path
;;       (append '("/home/sntag/.polymode/polymode/polymode/"  "/home/sntag/.polymode/polmode/poly-markdown/")
;;               load-path))

(use-package polymode)
(use-package poly-markdown)
(use-package poly-R)
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-markdown+r-mode))


;; ====================
;; Py markdown
;;
;; inspired by:
;; https://stackoverflow.com/questions/52489905/emacs-polymode-for-markdown-and-python
;; https://github.com/polymode/polymode/issues/180

;; define pwn polymode
(use-package poly-noweb)
(use-package poly-markdown)
(require 'poly-noweb)
(require 'poly-markdown)

(defcustom pm-inner/noweb-python
  (clone pm-inner/noweb
         :name "noweb-python"
         :mode 'python-mode)
  "Noweb for Python"
  :group 'poly-innermodes
  :type 'object)

(define-polymode poly-pweave-mode poly-markdown-mode
  :innermodes '(pm-inner/noweb-python :inherit))

(add-to-list 'auto-mode-alist '("\\.pymd" . poly-pweave-mode))
(add-to-list 'auto-mode-alist '("\\.pmd" . poly-pweave-mode))



      (defun python-shell-send-chunk ()
        "Send chunk under cursor via Python `comint' REPL.
See `pm-eval-from-here' and `python-shell-send-region'"
        (interactive)
        (let ((span (pm-get-innermost-span nil t)))
          (when (eq (nth 0 span) 'body)
            (python-shell-send-region-echo
             (1+ (nth 1 span)) (1- (nth 2 span))))
          ))
