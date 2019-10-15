;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs quirks & twerks

;; ====================
;; Loads bash enviroments

(defun set-exec-path-from-shell-PATH ()
        (interactive)
        (let ((path-from-shell (replace-regexp-in-string "^.*\n.*shell\n" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
        (setenv "PATH" path-from-shell)
        (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)


;; ====================
;; etc

(tool-bar-mode -1); tool bar icons present or not.  Value '-1' removes.  Comment out to return tool bar.
(global-set-key (kbd "C-c <up>") 'shrink-window)
(global-set-key (kbd "C-c <down>") 'enlarge-window)
(menu-bar-mode -1); menu bar icons present or not.  Value '-1' removes.  Comment out to return tool bar.


(setq calendar-week-start-day 1); Calender should start on Monday
(show-paren-mode 1); parens mode
(setq inhibit-startup-message t); No splash screen please
(global-set-key (kbd "M-p") 'ace-window); shortkeys
(setq save-interprogram-paste-before-kill t); Kill ring set
(setq case-fold-search t); case-insensitive when searching.  value 'nil' makes it sensitive


(electric-pair-mode 1)  ; autocomplete paired brackets
(setq comint-prompt-read-only t)  ; Prevents deleting shell prompt
(when (display-graphic-p)
 (global-unset-key (kbd "C-x C-c"))
 )  ; unsets the emacs kill command in GUI in case my clumsy fingers press it
;; (setq x-select-enable-clipboard nil)  ; Prevents contamination of clipboard from deleting text, but also prevents copy/paste to outside emacs...

(setq doc-view-continuous t)  ; enables continous scroll on doc-view


;; ====================
;; Custom el

(setq custom-file "~/.emacs.d/custom/linux-manjaro-custom.el")
(load custom-file 'noerror)


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

(defun today-short ()
  "Insert string for today's date nicely formatted as DD/MM/YY"
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string "%d/%m/%Y")))


;; ====================
;; open file directory
;;
;; Used for opening the file manager in the current directory

(defun browse-file-directory ()
  "Open the current file's directory however the OS would."
  (interactive)
  (if default-directory
      (browse-url-of-file (expand-file-name default-directory))
    (error "No `default-directory' to open")))

(global-set-key (kbd "C-c o") 'browse-file-directory)


;; ;; ====================
;; ;; open pdfs with foxit
;; ;;
;; ;; opens with default program currently, not foxit.
;; ;; might not be needed. sumatra has an option to open in foxit, can use that.

;; (use-package openwith)
;; (openwith-mode t)
;; (setq openwith-associations '(("\\.pdf\\'" "Foxit Reader.exe" (file))))


;; ====================
;; unfill
;;
;; Useful when copy pasting from emacs to outside programs.

(use-package unfill)

(global-set-key (kbd "C-c u") 'unfill-region)


;; ====================
;; Makefile
;;
;; Enable running makefiles from within emacs!

;; set-key for compile
(global-set-key (kbd "C-c m") 'compile)

;; ;;
;; (use-package bury-successful-compilation
;;   :ensure t
;;   :bind (("C-c m" . 'compile)
;; 	 ("C-c C-m" . recompile)))


;; Make the compilation window automatically disappear - from enberg on #emacs
;; taken from:
;; https://www.reddit.com/r/emacs/comments/44jwh3/better_compile_buffer/
(setq compilation-finish-functions
      (lambda (buf str)
        (if (null (string-match ".*exited abnormally.*" str))
            ;;no errors, make the compilation window go away in a few seconds
            (progn
              (run-at-time "0.4 sec" nil
                           (lambda ()
                             (select-window (get-buffer-window (get-buffer-create "*compilation*")))
                             (switch-to-buffer nil)))
              (message "No Compilation Errors!")))))


;; ====================
;; tabs

;; sets tabs at 4.

(setq default-tab-width 4)

;; Forgot what this is for
;; Adds lines to the custom file.  need to edit there to if changes are made here?

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))

;; Enables tabs
;;
;; taken from
;; http://ergoemacs.org/emacs/emacs_tabs_space_indentation_setup.html

(defun my-insert-tab-char ()
  "Insert a tab char. (ASCII 9, \t)"
  (interactive)
  (insert "\t"))

(global-set-key (kbd "TAB") 'my-insert-tab-char) ; same as Ctrl+i


;; ====================
;; mu-display-version
;;
;; for diagnostics as described by
;; http://manuel-uberti.github.io/emacs/2018/05/25/display-version/

(defun mu--os-version ()
  "Call `lsb_release' to retrieve OS version."
  (replace-regexp-in-string
   "Description:\\|[\t\n\r]+" ""
   (shell-command-to-string "lsb_release -d")))

(defun mu--gnome-version ()
  "Call `gnome-shell' to retrieve GNOME version."
  (replace-regexp-in-string
   "[\t\n\r]+" ""
   (shell-command-to-string "gnome-shell --version")))

;;;###autoload
(defun mu-display-version ()
  "Display Emacs version and system details in a temporary buffer."
  (interactive)
  (let ((buffer-name "*version*"))
    (with-help-window buffer-name
      (with-current-buffer buffer-name
        (insert (emacs-version) "\n")
        (insert "\nRepository revision: " emacs-repository-version "\n")
        (when (and system-configuration-options
                   (not (equal system-configuration-options "")))
          (insert "\nConfigured using:\n"
                  system-configuration-options))
        (insert "\n\nOperating system: " (mu--os-version) "\n")
        (insert "Window system: " (getenv "XDG_SESSION_TYPE") "\n")
        (insert "Desktop environment: " (mu--gnome-version))))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; extras

(use-package ido)  ; Forgot what it does
(use-package auto-complete)  ; Forgot what it does
