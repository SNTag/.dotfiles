;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs quirks & twerks

;; ====================
;; UI

(setq-default frame-title-format '("TagOS - " user-login-name "@" system-name " - %b"))  ; sets title bar
(tool-bar-mode -1)  ; tool bar icons present or not.  Value '-1' removes.
(menu-bar-mode -1)  ; menu bar icons present or not.  Value '-1' removes.
(setq inhibit-startup-message t)  ; No splash screen please

;; ====================
;; user info

(setq user-full-name "Shayonendra Nath Tagore")
(setq user-mail-address "shayontagore@gmail.com")

;; ====================
;; etc

(fset 'yes-or-no-p 'y-or-n-p)  ; simplify yes/no
(use-package all-the-icons :if *sys/gui*)  ; utility package to collect various Icon Fonts. Enable only in GUI Emacs.
(setq calendar-week-start-day 1)  ; Calender should start on Monday
;;(global-set-key (kbd "M-p") 'ace-window)  ; shortkeys
(setq save-interprogram-paste-before-kill t)  ; Kill ring set
(setq case-fold-search t)  ; case-insensitive when searching.  value 'nil' makes it sensitive

(setq comint-prompt-read-only t)  ; Prevents deleting shell prompt
(when (display-graphic-p)
 (global-unset-key (kbd "C-x C-c"))
 )  ; unsets the emacs kill command in GUI in case my clumsy fingers press it
;; (setq x-select-enable-clipboard nil)  ; Prevents contamination of clipboard from deleting text, but also prevents copy/paste to outside emacs...

(setq ring-bell-function 'ignore)  ; Turn Off Cursor Alarms


;; ====================
;; optimized editing

;; Remove useless whitespace before saving a file
(defun delete-trailing-whitespace-except-current-line ()
  "Sometimes `delete-trailing-whitespace' becomes very annoying.
It deletes trailing whitespace current line.  Therefore I use this alternative."
  (interactive)
  (let ((begin (line-beginning-position))
        (end (line-end-position)))
    (save-excursion
      (when (< (point-min) begin)
        (save-restriction
          (narrow-to-region (point-min) (1- begin))
          (delete-trailing-whitespace)
          (widen)))
      (when (> (point-max) end)
        (save-restriction
          (narrow-to-region (+ end 2) (point-max))
          (delete-trailing-whitespace)
          (widen))))))
(add-hook 'before-save-hook #'delete-trailing-whitespace-except-current-line)


(delete-selection-mode 1)  ; Replace selection on insert
(setq require-final-newline t)  ; Add a newline automatically at the end of the file upon save.


;; ====================
;; smartparens
;;
;; minor mode for dealing with pairs.
;; taken from M-emacs

(use-package smartparens
  :hook (prog-mode . smartparens-mode)
  :diminish smartparens-mode
  :bind
  (:map smartparens-mode-map
        ("C-M-f" . sp-forward-sexp)
        ("C-M-b" . sp-backward-sexp)
        ("C-M-a" . sp-backward-down-sexp)
        ("C-M-e" . sp-up-sexp)
        ("C-M-w" . sp-copy-sexp)
        ("C-M-k" . sp-change-enclosing)
        ("M-k" . sp-kill-sexp)
        ("C-M-<backspace>" . sp-splice-sexp-killing-backward)
        ("C-S-<backspace>" . sp-splice-sexp-killing-around)
        ("C-]" . sp-select-next-thing-exchange))
  :custom
  (sp-escape-quotes-after-insert nil)
  :config
  ;; Stop pairing single quotes in elisp
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
  (sp-local-pair 'org-mode "[" nil :actions nil)
  ;; Smartparens is broken in `cc-mode' as of Emacs 27. See
  ;; https://github.com/Fuco1/smartparens/issues/963
  (unless (version< emacs-version "27")
    (dolist (fun '(c-electric-paren c-electric-brace))
      (add-to-list 'sp--special-self-insert-commands fun))))

(electric-pair-mode 1)  ; autocomplete paired brackets

;; ;; ====================
;; ;; match parenthesis - DOESNT WORK YET
;; ;;
;; ;; Match and automatically pair parenthesis, and show parenthesis even when it went offscreen
;; ;;
;; ;; taken from:
;; ;; https://with-emacs.com/posts/ui-hacks/show-matching-lines-when-parentheses-go-off-screen/

;; ;; Show matching parenthesis
;; (show-paren-mode 1)
;; ;; we will call `blink-matching-open` ourselves...
;; (remove-hook 'post-self-insert-hook
;;              #'blink-paren-post-self-insert-function)

;; ;; this still needs to be set for `blink-matching-open` to work
;; (setq blink-matching-paren 'show)
;; (let ((ov nil)) ; keep track of the overlay
;;   (advice-add
;;    #'show-paren-function
;;    :after
;;     (defun show-paren--off-screen+ (&rest _args)
;;       "Display matching line for off-screen paren."
;;       (when (overlayp ov)
;;         (delete-overlay ov))
;;       ;; check if it's appropriate to show match info,
;;       ;; see `blink-paren-post-self-insert-function'
;;       (when (and (overlay-buffer show-paren--overlay)
;;                  (not (or cursor-in-echo-area
;;                           executing-kbd-macro
;;                           noninteractive
;;                           (minibufferp)
;;                           this-command))
;;                  (and (not (bobp))
;;                       (memq (char-syntax (char-before)) '(?\) ?\$)))
;;                  (= 1 (logand 1 (- (point)
;;                                    (save-excursion
;;                                      (forward-char -1)
;;                                      (skip-syntax-backward "/\\")
;;                                      (point))))))
;;         ;; rebind `minibuffer-message' called by
;;         ;; `blink-matching-open' to handle the overlay display
;;         (cl-letf (((symbol-function #'minibuffer-message)
;;                    (lambda (msg &rest args)
;;                      (let ((msg (apply #'format-message msg args)))
;;                        (setq ov (display-line-overlay+
;;                                  (window-start) msg))))))
;;           (blink-matching-open))))))


;; ====================
;; indentation

(use-package highlight-indent-guides
  :if *sys/gui*
  :diminish
  :hook ((prog-mode web-mode nxml-mode) . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'character)
  (highlight-indent-guides-responsive 'top)
  (highlight-indent-guides-delay 0)
  (highlight-indent-guides-auto-character-face-perc 7))

(setq-default indent-tabs-mode nil)
(setq-default indent-line-function 'insert-tab)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default js-switch-indent-offset 4)
(c-set-offset 'comment-intro 0)
(c-set-offset 'innamespace 0)
(c-set-offset 'case-label '+)
(c-set-offset 'access-label 0)
(c-set-offset (quote cpp-macro) 0 nil)
(add-hook 'after-change-major-mode-hook
          (lambda () (if (equal electric-indent-mode 't)
                    (when (derived-mode-p 'text-mode)
                      (electric-indent-mode -1))
                  (electric-indent-mode 1))))


;; ====================
;; Custom el

(setq custom-file "~/.emacs.d/custom/linux-manjaro-custom.el")
(load custom-file 'noerror)

;; ====================
;; ace-window
;;
;; enables movement between emacs windows

(use-package ace-window)

(global-set-key (kbd "M-l") 'ace-window)


;; ====================
;; Diminish

(use-package diminish)


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
;; formal all
;;
;; a feature that lets you auto-format source code.
;; Prerequisite: Read Supported Languages on the main 'format all' page to see which additional tool you need to install for the specific language.

(use-package format-all
  :bind ("C-c C-f" . format-all-buffer))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; functions

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


;; ====================
;; README LOADER

(defun borg-secretary-readme ()
  "opens the read-me if i forget the self-implemented keys"
  (interactive)
  (find-file "~/.emacs.d/readme.md")
  )

(global-set-key (kbd "C-c h") 'borg-secretary-readme)

;; ====================
;; edit configs

(defun borg-secretary-editconfigs ()
  "Opens the README.org file."
  (interactive)
  (find-file "~/.emacs.d/init.org")
  (find-file "~/.emacs.d/Borg-Collective-Emacs/Hive-Mind-Main.el")
  (find-file "~/.emacs.d/Borg-Collective-Emacs-private/Hive-Mind-Dropbox.el")
  )

; (global-set-key (kbd "C-l e") #'borg-secretary-editconfigs)

;; ;; ====================
;; ;; open pdfs with foxit
;; ;;
;; ;; opens with default program currently, not foxit.
;; ;; might not be needed. sumatra has an option to open in foxit, can use that.

;; (use-package openwith)
;; (openwith-mode t)
;; (setq openwith-associations '(("\\.pdf\\'" "Foxit Reader.exe" (file))))


;; ;; ====================
;; ;; previous window

;; (defun back-window ()
;;   (interactive)
;;   (other-frame -1))

;; (global-set-key (kbd "C-c p") 'back-window)


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


;; ====================
;; finding files based on partial names

(defun bar (base prefix)
  (let ((files (file-expand-wildcards (concat base "/" prefix "*"))))
    (cond
     ((= (length files) 1) (find-file (car files)))
     (t (error "No match, or ambiguous match.")))))

;; ====================
;; open external shell
;;
;; keys:
;; C-c t  -  open-terminal-in-workdir
;;
;; future plan:
;; include some way to detect WM and thus main terminal.
;; ex., xfce = xfce4-terminal, kde = konsole, etc.

(defun open-terminal-in-workdir ()
  (interactive)
  (call-process-shell-command
   (concat "xfce4-terminal --working-directory=" default-directory) nil 0))

(global-set-key (kbd "C-c t") 'open-terminal-in-workdir)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; extras

(use-package ido)  ; Forgot what it does
(use-package auto-complete)  ; Forgot what it does
