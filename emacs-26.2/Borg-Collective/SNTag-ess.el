;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Setting up R program location
;; ;; will have to be updated when R is updated.
;; (setq-default inferior-R-program-name
;;              "c:/program files/r/r-3.5.2/bin/R.exe")
;; ;; Currently causing a message in *Shell Command Output*: 'c:/Program' is not recognized as an internal or external command, operable program or batch file.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; R coding - ess
;;
;; Has two versions: minimal and Expanded

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
;; taken from
;; https://shrysr.github.io/docs/sr-config/
(use-package ess
  :ensure t
  :defer t
  :config
  (require 'ess)
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

;;(require 'ess-R-data-view)
;;(require 'ess-rutils)

(use-package ess-view
  :ensure t
  :defer t
  :config
  ;; (if (system-type-is-darwin)
  ;;     (setq ess-view--spreadsheet-program
  ;;           "/Applications/Tad.app/Contents/MacOS/Tad"
  ;;           )
  ;;   )
  ;; (if (system-type-is-gnu)
  ;;     (setq ess-view--spreadsheet-program
  ;;           "tabview"
  ;;           )
  ;;   )
  )


(message "Loaded ESS configuration")


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



;; ====================
;; Help menu
;;
;; modifies problems with help menu opening a new help page
;; set long ac-quick-help-delay (don't activate automatically)
(setq ac-quick-help-delay 9999)
;; set key to call ac-quick-help manually
(define-key ac-completing-map (kbd "M-h") 'ac-quick-help)

;; ====================
;; Directory information
;;
;; based off:
;; https://stackoverflow.com/questions/16860694/ess-does-not-find-rterm-exe-on-windows

;; (setq ess-directory-containing-R "c:/Program Files")
;; Add to list of prefixes recognized by ESS. 
;; Matching versions will appear after doing M-x R <TAB> <TAB> 
(setq ess-r-versions '("R-1" "R-2" "R-3" "R-current" "R-devel" "R-patched"))
;; (load "C:/Program Files/GNU Emacs 23.3/site-lisp/ess/lisp/ess-site.el")

;; Set default R version, (i.e. the one launched by typing M-x R <RET>)
;; (setq inferior-R-program-name "c:/Program Files/R/R-3.5.3/bin/i386/Rterm.exe")


;; ====================
;; opens buffer configuration


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
