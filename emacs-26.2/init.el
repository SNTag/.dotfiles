
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init starting: speed up
;;
;; can try to futher improve speeds using profile-dotemacs.el supposedly
;; (setq gc-cons-threshold 50000000)
;; increases start up memory allocation, and after init loading, returns it to normal.

(add-hook 'emacs-startup-hook 'my/set-gc-threshold)
(defun my/set-gc-threshold ()
  "Reset `gc-cons-threshold' to its default value."
  (setq gc-cons-threshold 800000))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs quirks & twerks


(defun set-exec-path-from-shell-PATH ()
        (interactive)
        (let ((path-from-shell (replace-regexp-in-string "^.*\n.*shell\n" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
        (setenv "PATH" path-from-shell)
        (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

(tool-bar-mode -1); tool bar icons present or not.  Value '-1' removes.  Comment out to return tool bar.
(global-set-key (kbd "C-c <up>") 'shrink-window)
(global-set-key (kbd "C-c <down>") 'enlarge-window)
(menu-bar-mode -1); menu bar icons present or not.  Value '-1' removes.  Comment out to return tool bar.

(setq calendar-week-start-day 1); Calender should start on Monday
(show-paren-mode 1); parens mode
(setq inhibit-startup-message t); No splash screen please
(global-set-key (kbd "M-p") 'ace-window); shortkeys
(setq save-interprogram-paste-before-kill t); Kill ring set
(setq default-tab-width 4)
(setq case-fold-search t); case-insensitive when searching.  value 'nil' makes it sensitive


;; ====================
;; Custom el

;; (if (display-graphic-p)
;;   (progn
    (setq custom-file "~/.emacs.d/custom/linux-manjaro-custom.el")
    (load custom-file 'noerror)
;;    )
    ;; (progn
    ;; (setq custom-file "~/.emacs.d/custom/linux-manjaroTerminal-custom.el")
    ;; (load custom-file 'noerror)
    ;; )
    ;; )


;; ====================
;; insert date and time
;;
;; taken from:
;; https://stackoverflow.com/questions/251908/how-can-i-insert-current-date-and-time-into-a-file-using-emacs

(defun today ()
  "Insert string for today's date nicely formatted in American style,
e.g. Sunday, September 17, 2000."
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string "%A, %B %e, %Y")))


;; ====================
;; open file directory
;;
;; Used for opening dolphin in the current directory

(defun browse-file-directory ()
  "Open the current file's directory however the OS would."
  (interactive)
  (if default-directory
      (browse-url-of-file (expand-file-name default-directory))
    (error "No `default-directory' to open")))


;; ====================
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use-package

;; uncomment this line when using emacs on a computer for the first time!
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/use-package")

(require 'use-package)

;; (with-eval-after-load 'info
;;   (info-initialize)
;;   (add-to-list 'Info-directory-list
;;                "~/.emacs.d/site-lisp/use-package/"))

(setq use-package-always-ensure t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Further quirks

(load-file "~/.emacs.d/config/package.list.el")

(load-file "~/.emacs.d/Borg-Collective/Hive-Mind.el")

;; ====================
;; Themes
;;
;; The theme is being set here.  The theme is revised again in the config file.
(if (display-graphic-p)
    (load-theme 'leuven)
    (load-theme 'doom-molokai)
  )

;; (if (display-graphic-p)
;;     (load-file "~/.emacs.d/Borg-Collective/SNTag-loadfiles.el")
;;   )


(use-package doom-modeline
      :ensure t
      :hook (after-init . doom-modeline-mode))
