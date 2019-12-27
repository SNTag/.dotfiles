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

(use-package ess-smart-underscore)
(use-package ess-R-data-view)

(use-package ess
  :ensure t
  :defer t
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
  )

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

;; (message "Loaded ESS configuration")

(setq display-buffer-alist
      `(("*R Dired"
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . right)
         (slot . -1)
         (window-width . 0.33)
         (reusable-frames . nil))
        ("*R"
         (display-buffer-reuse-window display-buffer-at-bottom)
         (window-width . 0.35)
         (reusable-frames . nil))
        ("*Help"
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . right)
         (slot . 1)
         (window-width . 0.33)
         (reusable-frames . nil))))



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


;; ====================
;; Auto complete

(use-package auto-complete)
;; (use-package auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/dict")
(ac-config-default)
(auto-complete-mode)


;; ;; ====================
;; ;; helm-myR

;; (use-package helm-R)


;; ====================
;; kill process

(defun ess-abort ()
  (interactive)
  (kill-process (ess-get-process)))
(define-key ess-mode-map (kbd "C-c C-a") 'ess-abort)
(define-key inferior-ess-mode-map (kbd "C-c C-a") 'ess-abort)
