;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; R coding - ess
;;
;; Has two versions: minimal and Expanded

;; ====================
;; For setting ess R version:


;; ;; ====================
;; ;; Minimal ess

;; (use-package ess)
;; (use-package ess-smart-underscore)
;; (use-package ess-R-data-view)
;; (setq ess-use-auto-complete t)
;; (autoload 'ess-rdired "ess-rdired"
;;   "View *R* objects in a dired-like buffer." t)


;; ====================
;; Expanded ess
;;
;; taken from
;; https://shrysr.github.io/docs/sr-config/

;(use-package ess-smart-underscore)
(use-package ess-R-data-view)

(use-package ess
  :ensure t
  :defer t
  :mode (
         ("\\.[rR]\\'"  . ess-mode)	; R
      	 ("\\.Rmd\\'" . R-mode)	        ; ??
	     ("\\.Rnw\\'" . R-mode)
	 	 ("\\.[rR]profile\\'" . R-mode)	; R profile
         ("\\.[jJ][lL]\\'" . ess-mode)	; Julia
	 	 ("NAMESPACE\\'" . R-mode)	; ??
         ("CITATION\\'" . R-mode)	; ??
	 )
  :defer 3
  :commands R
  :config
  (require 'ess)
;;  (load "ess-autoloads")
  (setq ess-describe-at-point-method nil)
  (setq ess-switch-to-end-of-proc-buffer t)
  (setq ess-rutils-keys +1)
  (setq ess-eval-visibly 'nil)
  (setq ess-use-flymake +1)
  (setq ess-use-company t)
  (setq ess-history-file "~/.Rhistory")
  (setq ess-use-ido t)
  (setq ess-roxy-hide-show-p t)
  ;;(speedbar-add-supported-extension ".R")
  (setq comint-scroll-to-bottom-on-input t)
  (setq comint-scroll-to-bottom-on-output t)
  (setq comint-move-point-for-output t)
;;  (setq comint-prompt-read-only 0)
  )

(add-hook 'ess-mode-hook 'my-linum-mode-hook) ; Introduces lines

(use-package ess-view
  :ensure t
  :defer t
  :config
  ;; (if (system-type-is-gnu)
  ;;     (setq ess-view--spreadsheet-program
  ;;           "tabview"
  ;;           )
  ;;   )
  )


;; ;; ====================
;; ;; Help menu
;; ;;
;; ;; CURRENTLY GIVING PROBLEMS
;; ;; modifies problems with help menu opening a new help page

;; ;; set long ac-quick-help-delay (don't activate automatically)
;; (setq ac-quick-help-delay 9999)
;; ;; set key to call ac-quick-help manually
;; (define-key ac-completing-map (kbd "M-h") 'ac-quick-help)


;; ;; ====================
;; ;; ess-smart S assign key

;; (setq ess-smart-S-assign-key ";")  ; ess-smart-S-assign-key


;; ;; ====================
;; ;; Active the R language in Babel

;; (org-babel-do-load-langagse
;;  'org-babel-load-languages
;;  '((R . t)))


;; ;; ====================
;; ;; helm-myR

;; (use-package helm-R)


;; ====================
;; kill process

(defun ess/ess-abort ()
  (interactive)
  (kill-process (ess-get-process)))
;(define-key ess-mode-map (kbd "C-c C-a") 'ess-abort)
(define-key inferior-ess-mode-map (kbd "C-c C-a") 'ess/ess-abort)


;; ====================
;; margrittr

(global-set-key (kbd "C-S-m") (lambda () (interactive) (insert " %>% ")))
(global-set-key (kbd "C-S-.") (lambda () (interactive) (insert " %in% ")))


;; ;; recommended by
;; ;; https://stackoverflow.com/questions/7502540/make-emacs-ess-follow-r-style-guide
;; ;;; ESS
;; (add-hook 'ess-mode-hook
;;           (lambda ()
;;             (ess-set-style 'C++ 'quiet)
;;             ;; Because
;;             ;;                                 DEF GNU BSD K&R  C++
;;             ;; ess-indent-level                  2   2   8   5  4
;;             ;; ess-continued-statement-offset    2   2   8   5  4
;;             ;; ess-brace-offset                  0   0  -8  -5 -4
;;             ;; ess-arg-function-offset           2   4   0   0  0
;;             ;; ess-expression-offset             4   2   8   5  4
;;             ;; ess-else-offset                   0   0   0   0  0
;;             ;; ess-close-brace-offset            0   0   0   0  0
;;             (add-hook 'local-write-file-hooks
;;                       (lambda ()
;;                         (ess-nuke-trailing-whitespace)))))
;; (setq ess-nuke-trailing-whitespace-p 'ask)
;; ;; or even
;; ;; (setq ess-nuke-trailing-whitespace-p t)
;; ;;; Perl
;; (add-hook 'perl-mode-hook
;;           (lambda () (setq perl-indent-level 4)))




;; ====================
;; need to organize this later
;;
;; https://emacs.stackexchange.com/questions/41707/disable-smart-underscore-for-good-ess

;(ess-toggle-underscore nil)
;; (setq ess-smart-S-assign-key ";")
;; (ess-toggle-S-assign nil)
;; (ess-toggle-S-assign nil)


;; (message "Loaded ESS configuration")

;; ====================
;; Rmarkdown
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


(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (pos) 'read-face-name)
                  (get-char-property (pos) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))
