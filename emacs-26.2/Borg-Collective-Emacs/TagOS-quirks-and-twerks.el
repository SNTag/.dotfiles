;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs quirks & twerks

;; ====================
;; UI

(setq-default frame-title-format '("" user-login-name "@" system-name " - %b"))  ; sets title bar
(tool-bar-mode -1)		    ; tool bar icons present or not.  Value '-1' removes.
(menu-bar-mode -1)		    ; menu bar icons present or not.  Value '-1' removes.
(scroll-bar-mode -1); disable scroll-bar
(setq inhibit-startup-message t)    ; No splash screen please

;; ====================
;; user info

(setq user-full-name "Shayonendra Nath Tagore")
(setq user-mail-address "SNTagore@protonmail.com")

;; ====================
;; etc

(fset 'yes-or-no-p 'y-or-n-p)              ; simplify yes/no
(use-package all-the-icons :if *sys/gui*)  ; utility package to collect various Icon Fonts. Enable only in GUI
					   ; Emacs.
(setq frame-inhibit-implied-resize t)      ; DOOM-maintainers: Emacs resizes the (GUI) frame when your newly
					   ; set font is larger (or smaller) than the system default. This
					   ; seems to add 0.4-1s to startup.
(setq calendar-week-start-day 1)           ; Calendar should start on Monday
;;(global-set-key (kbd "M-p") 'ace-window) ; shortkeys
(setq save-interprogram-paste-before-kill t)  ; Kill ring set
(setq case-fold-search t)                  ; case-insensitive when searching.  value 'nil' makes it sensitive

;; (setq comint-prompt-read-only t)           ; Prevents deleting shell prompt ; interferring with closing shiny apps in R
(setq confirm-kill-emacs 'y-or-n-p)        ; requires confirmation for C-x C-c kill emacs command
;; (when (display-graphic-p)
;;  (global-unset-key (kbd "C-x C-c"))
;;  )					   ; removes the emacs kill command in GUI in case my clumsy fingers press
					   ; it
;; (setq x-select-enable-clipboard nil)	   ; Prevents contamination of clipboard from deleting text, but also
					   ; prevents copy/paste to outside emacs...

(setq ring-bell-function 'ignore)          ; Turn Off Cursor Alarms
(global-unset-key (kbd "C-z"))             ; unbind the minimize function
(setq initial-major-mode 'fundamental-mode); DOOM-maintainers: I don't need the scratch buffer at startup. I
					   ; have it a keybind (C-x b *scratch* RET) away if I do. Starting
					   ; text-mode at startup circumvents a couple startup optimizations,
					   ; so starting it in fundamental-mode instead helps a bit.


;; ====================
;; optimized editing

;; when reopening a file, go back to the last visited position.
(setq-default save-place  t)
(setq save-place-file "~/.emacs.d/etc/saveplace")

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


(delete-selection-mode 1)	; Replace selection on insert
(setq require-final-newline t)  ; Add a newline automatically at the end of the file upon save.

;; ====================
;; Automatic backup
;;
;; trying a system that will hopefully make it easier to handle back ups
;; @ntc1 suggested using the code under 'force-backup-of-buffer'. seeing how it is like.
;; https://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files#151946

(setq backup-directory-alist '(("." . "~/.emacs.d/backups/per-save"))	; New location for backups.
      backup-by-copying t					; don't clobber symlinks
      delete-old-versions t					; Silently delete execess backup versions
      kept-old-versions 1000					; Only keep the last 1000 backups of a file.
      vc-make-backup-files t					; Even version controlled files get to be backed up.
      version-control t 					; Use version numbers for backup files.
      delete-by-moving-to-trash t
      )

(defun force-backup-of-buffer ()
  ;; Make a special "per session" backup at the first save of each
  ;; emacs session.
  (when (not buffer-backed-up)
    ;; Override the default parameters for per-session backups.
    (let ((backup-directory-alist '(("" . "~/.emacs.d/backup/per-session")))
          (kept-new-versions 3))
      (backup-buffer)))
  ;; Make a "per save" backup on each save.  The first save results in
  ;; both a per-session and a per-save backup, to keep the numbering
  ;; of per-save backups consistent.
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook  'force-backup-of-buffer)


;; ====================
;; sensitive-mode
;;
;; minor mode that prevents the backup system from over-sharing sensitive information.
;; taken from:
;; https://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files#151946

(setq auto-mode-alist
      (append
       (list
        '("\\.\\(vcf\\|gpg\\)$" . sensitive-minor-mode)
        )
       auto-mode-alist))


;; ====================
;; aliases
;;
;; Those functions i use often, but not enough for a dedicated key.
;; Three letters are used for the aliases. If it's good enough for DNA to specify 64 different combinations with four letters,
;; it's good enough for me with 1.7e4 combinations using a 26 letter alphabet.

(defalias 'are 'align-regexp)		       ; Align-RegExp           : to set alignments by symbols
(defalias 'mmt 'markdown-toggle-markup-hiding) ; Markdown-Markup-Toggle : to toggle markdown markup
(defalias 'rer 'run-ess-r)		       ; Run-Ess-R              : start an ess-r console
(defalias 'ydt 'yas-describe-tables)	       ; Yas-Describe-Tables    : runs yas-describe-tables
(defalias 'odb 'display-buffer)	               ; Open-Display-Buffer    : opens the display buffer if it has been closed.
(defalias 'otl 'org-toggle-latex-fragment)     ; Org-Toggle-Latex       : toggles org-mode latex fragments
(defalias 'dib 'display-buffer)                ; DIsplay-Buffer         : reopens shells/consoles/pdfs/help in a side window.

;; ====================
;; smartparens - INTERFERING WITH ELPY (and maybe others) FOR NOW
;;
;; minor mode for dealing with pairs.
;; taken from M-emacs

;; (use-package smartparens
;;   :hook (prog-mode . smartparens-mode)
;;   :diminish smartparens-mode
;;   :bind
;;   (:map smartparens-mode-map
;;         ("C-M-f" . sp-forward-sexp)
;;         ("C-M-b" . sp-backward-sexp)
;;         ("C-M-a" . sp-backward-down-sexp)
;;         ("C-M-e" . sp-up-sexp)
;;         ("C-M-w" . sp-copy-sexp)
;;         ("C-M-k" . sp-change-enclosing)
;;         ("M-k" . sp-kill-sexp)
;;         ("C-M-<backspace>" . sp-splice-sexp-killing-backward)
;;         ("C-S-<backspace>" . sp-splice-sexp-killing-around)
;;         ("C-]" . sp-select-next-thing-exchange))
;;   :custom
;;   (sp-escape-quotes-after-insert nil)
;;   :config
;;   ;; Stop pairing single quotes in elisp
;;   (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
;;   (sp-local-pair 'org-mode "[" nil :actions nil)
;;   ;; Smartparens is broken in `cc-mode' as of Emacs 27. See
;;   ;; https://github.com/Fuco1/smartparens/issues/963
;;   (unless (version< emacs-version "27")
;;     (dolist (fun '(c-electric-paren c-electric-brace))
;;       (add-to-list 'sp--special-self-insert-commands fun))))


;; ====================
;; Smartparens

(electric-pair-mode 1)  ; autocomplete paired brackets
(show-paren-mode 1)  ; highlights the other bracket


;; ;; ====================
;; ;; match parenthesis - DOESNT WORK YET
;; ;;
;; ;; Match and automatically pair parenthesis, and show parenthesis even when it went offscreen
;; ;;
;; ;; taken from:
;; ;; https://with-emacs.com/posts/ui-hacks/show-matching-lines-when-parentheses-go-off-screen/

;; ;; Show matching parenthesis
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
;; indentation - WORK IN PROGRESS

(use-package highlight-indent-guides
  :if *sys/gui*
  :diminish
  :hook ((prog-mode web-mode nxml-mode) . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'fill) ; options: fill/column/character
  (highlight-indent-guides-responsive 'top)
  (highlight-indent-guides-delay 0)
  (highlight-indent-guides-auto-character-face-perc 7))

;; (setq-default indent-tabs-mode nil)
;; (setq-default indent-line-function 'insert-tab)
;; (setq-default tab-width 4)
;; (setq-default c-basic-offset 4)
;; (setq-default js-switch-indent-offset 4)
;; (c-set-offset 'comment-intro 0)
;; (c-set-offset 'innamespace 0)
;; (c-set-offset 'case-label '+)
;; (c-set-offset 'access-label 0)
;; (c-set-offset (quote cpp-macro) 0 nil)
;; (add-hook 'after-change-major-mode-hook
;;           (lambda () (if (equal electric-indent-mode 't)
;;                     (when (derived-mode-p 'text-mode)
;;                       (electric-indent-mode -1))
;;                   (electric-indent-mode 1))))

;; ;; using this to disable some odd indentation beahvior
;; (when (fboundp 'electric-indent-mode) (electric-indent-mode -1))


;; ====================
;; Custom el

(setq custom-file "~/.emacs.d/custom/custom.el")
(load custom-file 'noerror)

;; ====================
;; edit configs
;;
;; mostly bloatware below, but it makes it easy to edit my configs and i like it.
(defun edit/emacs-configs ()
  "Opens init and borg hive mind for edits"
  (interactive)
  (find-file "~/.emacs.d/init.el")
  (find-file "~/.emacs.d/Borg-Collective-Emacs/Hive-Mind-Main.el")
  )
(defun edit/emacs-quirks ()
  "Opens the emacs quirks files"
  (interactive)
  (find-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-quirks-and-twerks.el")
  )
(defun edit/emacs-themes ()
  "Opens the emacs themes files"
  (interactive)
  (find-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-themes.el")
  )
(defun edit/emacs-python ()
  "Opens the emacs python"
  (interactive)
  (find-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-python-elpy.el")
  )
(defun edit/emacs-ess ()
  "Opens the emacs ess"
  (interactive)
  (find-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-ess.el")
  )
(defun edit/emacs-polymode ()
  "Opens the emacs polymode"
  (interactive)
  (find-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-polymode.el")
  )
(defun edit/emacs-frontend ()
  "Opens the emacs frontend"
  (interactive)
  (find-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-helm.el")
  )
(defun edit/emacs-doc-loader ()
  "Opens the emacs doc-loader"
  (interactive)
  (find-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-doc-loader.el")
  )
(defun edit/emacs-frame-control ()
  "Opens the emacs quirks files"
  (interactive)
  (find-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-frame-control.el")
  )
(defun edit/emacs-org-mode ()
  "edits emacs org-mode config"
  (interactive)
  (find-file "~/.emacs.d/Borg-Collective-Emacs/TagOS-org.el")
  )
(defun edit/personal-configs ()
  "some personal configs for stuff outside the dotfiles"
  (interactive)
  (find-file "~/.emacs.d/custom/personal-configs.el")
  )


;; ====================
;; ace-window
;;
;; enables movement between emacs windows

(use-package ace-window)

(global-set-key (kbd "M-l") 'ace-window)
(global-set-key (kbd "C-c i") 'ace-swap-window)


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
;; which-key
;;
;; try which-key-posframe

(use-package which-key
  :diminish
  :custom
  (which-key-separator " ")
  (which-key-prefix-prefix "+")
  :config
  (which-key-mode))

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

(setq tab-width 4)

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

(defun time/today ()
  "Insert string for today's date nicely formatted in American style,
e.g. Sunday, September 17, 2000."
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string "%A, %B %e, %Y")))
(defun time/today-short ()
  "Insert string for today's date nicely formatted as DD/MM/YY"
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string "%d/%m/%Y")))
(defun time/web-timeconverter () ;; =============== today/web-timeconverter
  "org-docs"
  (interactive)
  (browse-url "https://www.timeanddate.com/worldclock/converter.html?iso=20200519T100000&p1=236&p2=179"))


;; ;; ====================
;; ;; mu-display-version
;; ;;
;; ;; for diagnostics as described by
;; ;; http://manuel-uberti.github.io/emacs/2018/05/25/display-version/

;; (defun mu-os-version ()
;;   "Call `lsb_release' to retrieve OS version."
;;   (replace-regexp-in-string
;;    "Description:\\|[\t\n\r]+" ""
;;    (shell-command-to-string "lsb_release -d")))

;; (defun mu-gnome-version ()
;;   "Call `gnome-shell' to retrieve GNOME version."
;;   (replace-regexp-in-string
;;    "[\t\n\r]+" ""
;;    (shell-command-to-string "gnome-terminal --version")))

;; ;;;###autoload
;; (defun mu-display-version ()
;;   "Display Emacs version and system details in a temporary buffer."
;;   (interactive)
;;   (let ((buffer-name "*version*"))
;;     (with-help-window buffer-name
;;       (with-current-buffer buffer-name
;;         (insert (emacs-version) "\n")
;;         (insert "\nRepository revision: " emacs-repository-version "\n")
;;         (when (and system-configuration-options
;;                    (not (equal system-configuration-options "")))
;;           (insert "\nConfigured using:\n"
;;                   system-configuration-options))
;;         (insert "\n\nOperating system: " (mu--os-version) "\n")
;;         (insert "Window system: " (getenv "XDG_SESSION_TYPE") "\n")
;;         (insert "Desktop environment: " (mu--gnome-version))))))


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
;; Will open, if available, an xfce, konsole, or gnome terminal. works on mac.
;;
;; WARNING: WILL OPEN MORE THAN ONE TERMINAL IF THEY AVAILABLE.
;;
;; TODO: [C] i suspect this will open all terminal options if available.  need to make it selective.
;;
;; keys:
;; C-c t  -  open-terminal-in-workdir

(defun sys/open-terminal-in-workdir ()
  (interactive)
  (call-process-shell-command			; XFCE systems
   (concat "xfce4-terminal --working-directory=" default-directory) nil 0)
  (call-process-shell-command			; KDE systems
   (concat "konsole --workdir " default-directory) nil 0)
  (call-process-shell-command   		; GNOME systems
   (concat "gnome-terminal --working-directory=" default-directory) nil 0)
  (call-process-shell-command   		; Mac systems
   (concat "open -a Terminal" default-directory) nil 0))

;; development notes:
;; needs to save the file location as a var, and pass the dir to guake
(defun sys/open-dropdown-terminal-in-workdir ()
  (interactive)
  (call-process-shell-command
   (concat "guake -e 'cs ./'") nil 0)
  )

(global-set-key (kbd "C-c t") 'sys/open-terminal-in-workdir)
(global-set-key (kbd "C-c SPC") 'sys/open-dropdown-terminal-in-workdir)


;; ====================
;; open file directory
;;
;; Opens directory for current frame

(defun sys/browse-file-directory ()
  "Open the current file's directory however the OS would."
  (interactive)
  (if default-directory
      (browse-url-of-file (expand-file-name default-directory))
    (error "No `default-directory' to open")))

(global-set-key (kbd "C-c o") 'sys/browse-file-directory)


;; ;; ====================
;; ;; open pdfs with foxit
;; ;;
;; ;; opens with default program currently, not foxit.
;; ;; might not be needed. sumatra has an option to open in foxit, can use that.

;; (use-package openwith)
;; (openwith-mode t)
;; (setq openwith-associations '(("\\.pdf\\'" "Foxit Reader.exe" (file))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; extras
;(use-package ido)  ; Forgot what it does
(use-package auto-complete)  ; Forgot what it does
(use-package helpful)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yaml-mode
;;
;; I don't care enough for this for it to have its own .el
(use-package yaml-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; htmlize
;;
;; I use it to make iCal from org files
(use-package htmlize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Programming functions
;;
;; Functions that will be used to modify programming experience across multiple modes

;; ====================
;; introduces lines

(defun my-linum-mode-hook ()
  (linum-mode 1)                        ; adds lines
;  (line-number-mode 1)
;  (column-number-mode 1)
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Literate Writing functions
;;
;; Functions that will be used to modify programming experience across multiple modes

(defun my-literate-writing-hook ()
  (linum-mode 0)                        ; adds lines
  (line-number-mode 1)
  (column-number-mode 1)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mode line modifications

(line-number-mode 1)
(column-number-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; enables emacs config reload

(defun my/reload-emacs-configuration ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
