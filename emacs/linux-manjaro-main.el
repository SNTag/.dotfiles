
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start up configuration
;;
;; Load files specified at the end to prevent possible configuration complications when loading modes.

;; ;; ====================
;; ;; Dimensions
;; ;;
;; ;; This section can cause emacs to start-up at a pre-configured size.

;; (setq default-frame-alist '(
;; 			    (left . 0)
;; 			    (top . 32)
;; 			    (height . 62)
;; 			    (width . 75) ;; 115
;; 			    ))

;; ====================
;; Dropbox details

(setq dropbox "/media/PhD/Dropbox/Library/")
(setq dropbox-elpa "~/Dropbox/Library/Emacs/elpa-26.1")
(setq default-directory "/media/PhD/Dropbox/")  ; C-x C-f location changed


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; quirks

(electric-pair-mode 1)  ; autocomplete paired brackets
(setq comint-prompt-read-only t)  ; Prevents deleting shell prompt
(when (display-graphic-p)
 (global-unset-key (kbd "C-x C-c"))
 )  ; unsets the emacs kill command in GUI in case my clumsy fingers press it
;; (setq x-select-enable-clipboard nil)  ; Prevents contamination of clipboard from deleting text, but also prevents copy/paste to outside emacs...
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

(use-package unfill)

(global-set-key (kbd "C-c u") 'unfill-region)

;; ====================
;; Makefile - personalization

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
;; Helm-buffers
;;
;; Used to switch between buffers using helm

(global-set-key (kbd "C-c s") 'helm-buffers-list)  ; improves buffer changing


;; ====================
;; tabs
;;
;; Forgot what this is for

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))


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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Theme
;;
;; Forgot what this is for

;; (use-package twilight-bright-theme
;;   :ensure t)

(add-hook 'text-mode-hook 'turn-on-auto-fill)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dictionaries, languages and encodings
;;
;; Use hunspell.exe for automatic spell checking. Available
;; from Chocolately as choco install hunspell



;; ;; ====================
;; ;; WOOOORRRRKKKKKSSSS

;; ;; if (aspell installed) { use aspell}
;; ;; else if (hunspell installed) { use hunspell }
;; ;; whatever spell checker I use, I always use English dictionary
;; ;; I prefer use aspell because:
;; ;; 1. aspell is older
;; ;; 2. looks Kevin Atkinson still get some road map for aspell:
;; ;; @see http://lists.gnu.org/archive/html/aspell-announce/2011-09/msg00000.html
;; (defun flyspell-detect-ispell-args (&optional run-together)
;;   "if RUN-TOGETHER is true, spell check the CamelCase words."
;;   (let (args)
;;     (cond
;;      ((string-match  "aspell$" ispell-program-name)
;;       ;; Force the English dictionary for aspell
;;       ;; Support Camel Case spelling check (tested with aspell 0.6)
;;       (setq args (list "--sug-mode=ultra" "--lang=en_US"))
;;       (if run-together
;;           (setq args (append args '("--run-together"))))
;;      ((string-match "hunspell$" ispell-program-name)
;;       ;; Force the English dictionary for hunspell
;;       (setq args "-d en_US")))
;;     args))

;; (cond
;;  ((executable-find "aspell")
;;   ;; you may also need `ispell-extra-args'
;;   (setq ispell-program-name "aspell"))
;;  ((executable-find "hunspell")
;;   (setq ispell-program-name "hunspell")

;;   ;; Please note that `ispell-local-dictionary` itself will be passed to hunspell cli with "-d"
;;   ;; it's also used as the key to lookup ispell-local-dictionary-alist
;;   ;; if we use different dictionary
;;   (setq ispell-local-dictionary "en_US")
;;   (setq ispell-local-dictionary-alist
;;         '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8))))
;;  (t (setq ispell-program-name nil)))

;; ;; ispell-cmd-args is useless, it's the list of *extra* arguments we will append to the ispell process when "ispell-word" is called.
;; ;; ispell-extra-args is the command arguments which will *always* be used when start ispell process
;; ;; Please note when you use hunspell, ispell-extra-args will NOT be used.
;; ;; Hack ispell-local-dictionary-alist instead.
;; (setq-default ispell-extra-args (flyspell-detect-ispell-args t))
;; ;; (setq ispell-cmd-args (flyspell-detect-ispell-args))
;; (defadvice ispell-word (around my-ispell-word activate)
;;   (let ((old-ispell-extra-args ispell-extra-args))
;;     (ispell-kill-ispell t)
;;     (setq ispell-extra-args (flyspell-detect-ispell-args))
;;     ad-do-it
;;     (setq ispell-extra-args old-ispell-extra-args)
;;     (ispell-kill-ispell t)))

;; (defadvice flyspell-auto-correct-word (around my-flyspell-auto-correct-word activate)
;;   (let ((old-ispell-extra-args ispell-extra-args))
;;     (ispell-kill-ispell t)
;;     ;; use emacs original arguments
;;     (setq ispell-extra-args (flyspell-detect-ispell-args))
;;     ad-do-it
;;     ;; restore our own ispell arguments
;;     (setq ispell-extra-args old-ispell-extra-args)
;;     (ispell-kill-ispell t)))

;; (defun text-mode-hook-setup ()
;;   ;; Turn off RUN-TOGETHER option when spell check text-mode
;;   (setq-local ispell-extra-args (flyspell-detect-ispell-args)))
;; (add-hook 'text-mode-hook 'text-mode-hook-setup))


;; ;; ====================
;; ;; minimal spellcheck - Alex Gromnitsky
;; ;;
;; ;; WORKS!!!!
;; ;; If the other flyspell programs do not work,
;; ;; Comment all other flyspell programs and uncomment this section
;; ;;
;; ;; minimal configuration that should 'work regardless of the underlying OS'
;; ;; http://gromnitsky.blogspot.com/2016/09/emacs-251-hunspell.html

;; (setenv "LANG" "en_US.UTF-8")
;; (setq ispell-program-name "hunspell")


;; (setq ispell-dictionary "en_US")
;; (setq flyspell-default-dictionary "en_US") 

;; ;; ====================
;; ;; classical flyspell
;; ;;
;; ;; https://joelkuiper.eu/spellcheck_emacs

;; (dolist (modey '(text-mode-hook
;; 		markdown-mode
;; 		))
;;   (add-hook modey
;; 	    '(lambda ()
;; 	       (flyspell-mode 1))))

;; (global-set-key (kbd "C-<f8>") 'ispell-word)
;; (defun flyspell-check-next-highlighted-word ()
;;   "Custom function to spell check next highlighted word"
;;   (interactive)
;;   (flyspell-goto-next-error)
;;   (ispell-word))
;; (global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)


;; ====================
;; flyspell - chen bin stack
;;
;; https://emacs.stackexchange.com/questions/43973/problem-with-flyspell-in-emacs-26/43986#43986

;; (setq ispell-program-name "aspell")
;; ;; Please note ispell-extra-args contains ACTUAL parameters passed to aspell
;; (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))


;; ;; ====================
;; ;; flyspell -binchen
;; ;;
;; ;; http://blog.binchen.org/posts/what-s-the-best-spell-check-set-up-in-emacs.html

;; ;; if (aspell installed) { use aspell}
;; ;; else if (hunspell installed) { use hunspell }
;; ;; whatever spell checker I use, I always use English dictionary
;; ;; I prefer use aspell because:
;; ;; 1. aspell is older
;; ;; 2. looks Kevin Atkinson still get some road map for aspell:
;; ;; @see http://lists.gnu.org/archive/html/aspell-announce/2011-09/msg00000.html
;; (defun flyspell-detect-ispell-args (&optional run-together)
;;   "if RUN-TOGETHER is true, spell check the CamelCase words."
;;   (let (args)
;;     (cond
;;      ((string-match  "aspell$" ispell-program-name)
;;       ;; Force the English dictionary for aspell
;;       ;; Support Camel Case spelling check (tested with aspell 0.6)
;;       (setq args (list "--sug-mode=ultra" "--lang=en_US"))
;;       (if run-together
;;           (setq args (append args '("--run-together"))))
;;      ((string-match "hunspell$" ispell-program-name)
;;       ;; Force the English dictionary for hunspell
;;       (setq args "-d en_US")))
;;     args))

;; (cond
;;  ((executable-find "aspell")
;;   ;; you may also need `ispell-extra-args'
;;   (setq ispell-program-name "aspell"))
;;  ((executable-find "hunspell")
;;   (setq ispell-program-name "hunspell")

;;   ;; Please note that `ispell-local-dictionary` itself will be passed to hunspell cli with "-d"
;;   ;; it's also used as the key to lookup ispell-local-dictionary-alist
;;   ;; if we use different dictionary
;;   (setq ispell-local-dictionary "en_US")
;;   (setq ispell-local-dictionary-alist
;;         '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8))))
;;  (t (setq ispell-program-name nil)))

;; ;; ispell-cmd-args is useless, it's the list of *extra* arguments we will append to the ispell process when "ispell-word" is called.
;; ;; ispell-extra-args is the command arguments which will *always* be used when start ispell process
;; ;; Please note when you use hunspell, ispell-extra-args will NOT be used.
;; ;; Hack ispell-local-dictionary-alist instead.
;; (setq-default ispell-extra-args (flyspell-detect-ispell-args t))
;; ;; (setq ispell-cmd-args (flyspell-detect-ispell-args))
;; (defadvice ispell-word (around my-ispell-word activate)
;;   (let ((old-ispell-extra-args ispell-extra-args))
;;     (ispell-kill-ispell t)
;;     (setq ispell-extra-args (flyspell-detect-ispell-args))
;;     ad-do-it
;;     (setq ispell-extra-args old-ispell-extra-args)
;;     (ispell-kill-ispell t)))

;; (defadvice flyspell-auto-correct-word (around my-flyspell-auto-correct-word activate)
;;   (let ((old-ispell-extra-args ispell-extra-args))
;;     (ispell-kill-ispell t)
;;     ;; use emacs original arguments
;;     (setq ispell-extra-args (flyspell-detect-ispell-args))
;;     ad-do-it
;;     ;; restore our own ispell arguments
;;     (setq ispell-extra-args old-ispell-extra-args)
;;     (ispell-kill-ispell t)))

;; (defun text-mode-hook-setup ()
;;   ;; Turn off RUN-TOGETHER option when spell check text-mode
;;   (setq-local ispell-extra-args (flyspell-detect-ispell-args)))
;; (add-hook 'text-mode-hook 'text-mode-hook-setup)



;; ====================
;; flycheck
;; not a spell checker

(use-package flycheck
  ;; Jun 28 - I like this idea, but sometimes this is too slow.
  :config
  (add-hook 'text-mode-hook #'flycheck-mode)
  (add-hook 'org-mode-hook #'flycheck-mode)
  (define-key flycheck-mode-map (kbd "s-;") 'flycheck-previous-error))


;; ====================
;; flycheck-vale
;;
;; linter.  Can check writing against grammatical rules.  Vale has a fun ability to add custom rules!

(require 'flycheck-vale)
(flycheck-vale-setup)



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; company-mode

;; (use-package company-mode)

(use-package auto-complete)
(require 'auto-complete-config)
(ac-config-default)



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Setting up R program location
;; ;; will have to be updated when R is updated.
;; (setq-default inferior-R-program-name
;;              "c:/program files/r/r-3.5.2/bin/R.exe")
;; ;; Currently causing a message in *Shell Command Output*: 'c:/Program' is not recognized as an internal or external command, operable program or batch file.



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yasnippets
;;
;; There is a seperate config directory for the yasnippets.  That needs to be under ~/.emacs/ in order to work right.


;; (use-package yasnippet
;; :if (not (bound-and-true-p disable-pkg-yasnippet))
;;   :defer 20
;;   :bind (:map modi-mode-map
;;          ("s-y" . hydra-yas/body)
;;          ("C-c y" . hydra-yas/body))
;;   :config
;;   (progn
;;     (setq yas-prompt-functions '(yas-ido-prompt
;;                                  yas-completing-prompt))

;;     (setq modi/yas-snippets-dir (let ((dir (concat user-emacs-directory
;;                                                    "snippets/")))
;;                                   (make-directory dir :parents)
;;                                   dir))

;;     ;; The directories listed in `yas-snippet-dirs' should contain snippet
;;     ;; folders only for the major modes where you are ever going to use
;;     ;; yasnippet.
;;     ;;   By default, `yas-snippet-dirs' also contains the snippets
;;     ;; directory that comes with the package, which contains major mode dirs
;;     ;; like `fundamental-mode' in which you are never going to use yasnippet!
;;     ;;   So the solution is to copy only the snippet folders that I am ever
;;     ;; going to use to `modi/yas-snippets-dir'.
;; (setq yas-snippet-dirs (list 'modi/yas-snippets-dir))))

(use-package yasnippet                  ; Snippets
  :ensure t
  :config
  ;; (with-eval-after-load 'yasnippet
  ;;   (setq yas-snippet-dirs (append yas-snippet-dirs
  ;; 				   '("~/config/snippets-in-use")))
  ;;   )

  (yas-reload-all)
  (yas-global-mode)
  )

;; (use-package yasnippet-snippets         ; Collection of snippets
;;   :ensure t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; extras

(use-package ido)  ; Forgot what it does
(use-package auto-complete)  ; Forgot what it does



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python
;; (load-file "~/.emacs.d/config/windows-python.el")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Markdown-mode

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq-default markdown-hide-markup t)  ; Enables hiding of markup.  't' enables, 'f' disables.
  )

(add-hook 'markdown-mode-hook
          (lambda ()
            (set-fill-column 100)))  ; sets column size on loading
(add-hook 'markdown-mode-hook 'flyspell-mode)

(use-package pandoc-mode)    ; installs/loads minor pandoc-mode

(add-hook 'markdown-mode-hook 'pandoc-mode)


;; ;; ====================
;; ;; markdown + images from clipboard  
;; ;;
;; ;; from https://github.com/rafadc/emacs.d/blob/master/settings.org
;; ;; Work in Progress

;; (defun md-image-from-clipboard ()
;;   "Takes a screenshot into a time stamped unique-named file in the
;; same directory as the org-buffer and insert a link to this file."
;;   (interactive)
;;   (let ((filename (concat
;;                   (make-temp-name
;;                    (concat (file-name-nondirectory (buffer-file-name)) ".images/" (format-time-string "%Y%m%d_%H%M%S_")) ) ".png")))
;;     (unless (file-exists-p (file-name-directory filename))
;;       (make-directory (file-name-directory filename) t))
;;     (call-process "pngpaste" nil nil nil filename)
;;     (if (file-exists-p filename)
;;         (insert (concat "![](" filename ")"))))
;; )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elpy - python

;; ;; need to add line numbers
;; (global-linum-mode t) ;; enable line numbers globally

;; ;; would this be useful?
;; ;; enable autopep8 formatting on save
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(use-package elpy
  :ensure t
  :defer 2
  :config
  (progn
    ;; Use Flycheck instead of Flymake
    (when (require 'flycheck nil t)
      (remove-hook 'elpy-modules 'elpy-module-flymake)
      (remove-hook 'elpy-modules 'elpy-module-yasnippet)
      (remove-hook 'elpy-mode-hook 'elpy-module-highlight-indentation)
      (add-hook 'elpy-mode-hook 'flycheck-mode))
    (elpy-enable)
    ;; jedi is great
    (setq elpy-rpc-backend "jedi")))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; latex
;; based on the work here:
;; https://tex.stackexchange.com/questions/50827/a-simpletons-guide-to-tex-workflow-with-emacs
;; NOTE:
;; Keep in mind that 'tex-mode' needs to be start up.  hasn't been automated yet.

(setq TeX-parse-self t); Enable parse on load.
(setq TeX-auto-save t); Enable parse on save.
(setq-default TeX-master nil)

(setq TeX-PDF-mode t); PDF mode (rather than DVI-mode)

(add-hook 'TeX-mode-hook 'flyspell-mode); Enable Flyspell mode for TeX modes such as AUCTeX. Highlights all misspelled words.
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode); Enable Flyspell program mode for emacs lisp mode, which highlights all misspelled words in comments and strings.
;; (setq ispell-dictionary "english"); Default dictionary. To change do M-x ispell-change-dictionary RET.
(add-hook 'TeX-mode-hook
          (lambda () (TeX-fold-mode 1))); Automatically activate TeX-fold-mode.
(setq LaTeX-babel-hyphen nil); Disable language-specific hyphen insertion.

;; " expands into csquotes macros (for this to work babel must be loaded after csquotes).
(setq LaTeX-csquotes-close-quote "}"
      LaTeX-csquotes-open-quote "\\enquote{")

;; LaTeX-math-mode http://www.gnu.org/s/auctex/manual/auctex/Mathematics.html
(add-hook 'TeX-mode-hook 'LaTeX-math-mode)

;; ;; magic-latex-buffer
;; (add-hook 'TeX-mode-hook 'magic-latex-buffer)


;; To enable auto-fill to latex mode
(add-hook 'TeX-mode-hook 'turn-on-auto-fill)



;; ;; ====================
;; ;; RefTeX
;; ;; Disabled as Helm-bibtex should be able to do the same thing
;; ;; Turn on RefTeX for AUCTeX http://www.gnu.org/s/auctex/manual/reftex/reftex_5.html
;; (add-hook 'TeX-mode-hook 'turn-on-reftex)

;; (eval-after-load 'reftex-vars; Is this construct really needed?
;;   '(progn
;;      (setq reftex-cite-prompt-optional-args t); Prompt for empty optional arguments in cite macros.
;;      ;; Make RefTeX interact with AUCTeX, http://www.gnu.org/s/auctex/manual/reftex/AUCTeX_002dRefTeX-Interface.html
;;      (setq reftex-plug-into-AUCTeX t)
;;      ;; So that RefTeX also recognizes \addbibresource. Note that you
;;      ;; can't use $HOME in path for \addbibresource but that "~"
;;      ;; works.
;;      (setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))
;; ;     (setq reftex-default-bibliography '("UNCOMMENT LINE AND INSERT PATH TO YOUR BIBLIOGRAPHY HERE")); So that RefTeX in Org-mode knows bibliography
;;      (setcdr (assoc 'caption reftex-default-context-regexps) "\\\\\\(rot\\|sub\\)?caption\\*?[[{]"); Recognize \subcaptions, e.g. reftex-citation
;;      (setq reftex-cite-format; Get ReTeX with biblatex, see https://tex.stackexchange.com/questions/31966/setting-up-reftex-with-biblatex-citation-commands/31992#31992
;;            '((?t . "\\textcite[]{%l}")
;;              (?a . "\\autocite[]{%l}")
;;              (?c . "\\cite[]{%l}")
;;              (?s . "\\smartcite[]{%l}")
;;              (?f . "\\footcite[]{%l}")
;;              (?n . "\\nocite{%l}")
;;              (?b . "\\blockcquote[]{%l}{}")))))

;; ====================
;; What was this for?    <----------------------------------
;; Fontification (remove unnecessary entries as you notice them) http://lists.gnu.org/archive/html/emacs-orgmode/2009-05/msg00236.html http://www.gnu.org/software/auctex/manual/auctex/Fontification-of-macros.html
(setq font-latex-match-reference-keywords
      '(
        ;; biblatex
        ("printbibliography" "[{")
        ("addbibresource" "[{")
        ;; Standard commands
        ;; ("cite" "[{")
        ("Cite" "[{")
        ("parencite" "[{")
        ("Parencite" "[{")
        ("footcite" "[{")
        ("footcitetext" "[{")
        ;; ;; Style-specific commands
        ("textcite" "[{")
        ("Textcite" "[{")
        ("smartcite" "[{")
        ("Smartcite" "[{")
        ("cite*" "[{")
        ("parencite*" "[{")
        ("supercite" "[{")
        ; Qualified citation lists
        ("cites" "[{")
        ("Cites" "[{")
        ("parencites" "[{")
        ("Parencites" "[{")
        ("footcites" "[{")
        ("footcitetexts" "[{")
        ("smartcites" "[{")
        ("Smartcites" "[{")
        ("textcites" "[{")
        ("Textcites" "[{")
        ("supercites" "[{")
        ;; Style-independent commands
        ("autocite" "[{")
        ("Autocite" "[{")
        ("autocite*" "[{")
        ("Autocite*" "[{")
        ("autocites" "[{")
        ("Autocites" "[{")
        ;; Text commands
        ("citeauthor" "[{")
        ("Citeauthor" "[{")
        ("citetitle" "[{")
        ("citetitle*" "[{")
        ("citeyear" "[{")
        ("citedate" "[{")
        ("citeurl" "[{")
        ;; Special commands
        ("fullcite" "[{")))

(setq font-latex-match-textual-keywords
      '(
        ;; biblatex brackets
        ("parentext" "{")
        ("brackettext" "{")
        ("hybridblockquote" "[{")
        ;; Auxiliary Commands
        ("textelp" "{")
        ("textelp*" "{")
        ("textins" "{")
        ("textins*" "{")
        ;; supcaption
        ("subcaption" "[{")))

(setq font-latex-match-variable-keywords
      '(
        ;; amsmath
        ("numberwithin" "{")
        ;; enumitem
        ("setlist" "[{")
        ("setlist*" "[{")
        ("newlist" "{")
        ("renewlist" "{")
        ("setlistdepth" "{")
        ("restartlist" "{")))


;; ====================
;; alternative tex install
;; ;; latex
;; ;; based on:
;; ;; https://nasseralkmim.github.io/notes/2016/08/21/my-latex-environment/


;; (use-package tex
;;   :defer t
;;   :ensure auctex
;;   :config
;;   (setq-default TeX-master nil)
;;   (setq TeX-auto-save t)
;;   (setq TeX-parse-self t)
;;   (setq TeX-view-program-list
;;   '(("Sumatra PDF" ("\"C:/Program Files/SumatraPDF/SumatraPDF.exe\" -reuse-instance"
;; 		    )))
;;   )
  
;;  (eval-after-load 'tex
;;    '(progn
;;      (assq-delete-all 'output-pdf TeX-view-program-selection)
 ;;      (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF")))
;;   (add-hook 'LaTeX-mode-hook
;;             (lambda ()
;; 	      (setq TeX-PDF-mode t)
;;               (rainbow-delimiters-mode)
;;               (company-mode)
;;               (smartparens-mode)
;;               (turn-on-reftex)
;;               (setq reftex-plug-into-AUCTeX t)
;;               (reftex-isearch-minor-mode)
;;               (setq TeX-source-correlate-method 'synctex)
;;               (setq TeX-source-correlate-start-server t)
;; 	      (TeX-fold-mode 1)
;; 	      ))
;; ))

;; ====================
;; alternative reftex install
;; ;; reftex
;; (use-package reftex
;;   :ensure t
;;   :defer t
;;   :config
;;   (setq reftex-cite-prompt-optional-args t)); Prompt for empty optional arguments in cite

;; (setq org-highlight-latex-and-related '(latex))

;; ;; remove comments from org document for use with export hook
;; ;; https://emacs.stackexchange.com/questions/22574/orgmode-export-how-to-prevent-a-new-line-for-comment-lines
;; (defun delete-org-comments (backend)
;;   (loop for comment in (reverse (org-element-map (org-element-parse-buffer)
;;                     'comment 'identity))
;;     do
;;     (setf (buffer-substring (org-element-property :begin comment)
;;                 (org-element-property :end comment))
;;           "")))

;; ;; add to export hook
;; (add-hook 'org-export-before-processing-hook 'delete-org-comments)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; orgmode
;; agenda
;; based on:
;; https://blog.aaronbieber.com/2016/09/24/an-agenda-for-life-with-org-mode.html
;; and
;; http://cachestocaches.com/2016/9/my-workflow-org-agenda/

;; (load-file "~/.emacs.d/config/init-org-agenda.el")

(use-package org
  :ensure org-plus-contrib
  :init
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook 'flyspell-mode)
  (setq org-agenda-files '("D:/Dropbox/agenda/"))
  :diminish visual-line-mode
  :diminish org-indent-mode
  :defer t
  :bind (("\C-c a" . org-agenda)
	 ("\C-c c" . org-capture)
	 ("\C-c j" . gs-helm-org-link-to-contact))
  :config  

  (setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (agenda "")
          (alltodo ""
                   ((org-agenda-skip-function
                     '(or (air-org-skip-subtree-if-priority ?A)
                          (org-agenda-skip-if nil '(scheduled deadline))))))))))
  
  (defun air-org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))

  (defun air-org-skip-subtree-if-habit ()
  "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
  (let ((subtree-end (save-excursion (org-end-of-subtree t))))
    (if (string= (org-entry-get nil "STYLE") "habit")
        subtree-end
      nil)))

  (setq org-agenda-custom-commands
      '(("d" "Daily agenda and all TODOs"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (agenda "" ((org-agenda-ndays 1)))
          (alltodo ""
                   ((org-agenda-skip-function '(or (air-org-skip-subtree-if-habit)
                                                   (air-org-skip-subtree-if-priority ?A)
                                                   (org-agenda-skip-if nil '(scheduled deadline))))
                    (org-agenda-overriding-header "ALL normal priority tasks:"))))
         ((org-agenda-compact-blocks t)))))
)



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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; saving customization

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Magit
;;
;; enables Git cooperation

(use-package magit
  :ensure t)

;; ====================
;; magit keybinds

(global-set-key (kbd "C-x g") 'magit-status)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm-bibtex
;;
;; https://github.com/tmalsburg/helm-bibtex
;; helps in interacting with zotero
;;
;; To make zotero bibliography:
;; 
;;
;; keys of note:
;; C-c f        -  activates helm-bibtex search
;; C-u C-c f    -  Refresh helm-bibtex

(use-package helm-bibtex
  :ensure t)
;;  bibtex-completion-notes-path "~/Dropbox/OrgMode/Papers.org"
(setq   bibtex-completion-bibliography '("/media/PhD/Dropbox/latex journal/resources/Greg-Tucker-Kellogg.bib")
        bibtex-completion-library-path '("~/Zotero/"))

(setq bibtex-completion-pdf-field "file")  ; Uses lower case "file" to work with better-bibtex zotero plugin

;; ;; ====================
;; ;; For opening PDFs

;; ;; Needs to be edited for linux
;; (setq   helm-bibtex-open-pdf-function
;;         (lambda (fpath)
;;           (call-process "open" nil 0 nil "-a" "C:/Program Files (x86)/Foxit Software/Foxit Reader" fpath)))

(setq bibtex-completion-format-citation-functions
  '((org-mode      . bibtex-completion-format-citation-org-link-to-PDF)
    (latex-mode    . bibtex-completion-format-citation-cite)
    (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
    (default       . bibtex-completion-format-citation-default)))


;; ;; ====================
;; ;; Switching bibtex files

;; ;; Create a BibTeX file containing only specific entries
;; (progn
;;   (switch-to-buffer (generate-new-buffer "my_new_bibliography.bib"))
;;   (--map (insert (bibtex-completion-make-bibtex it)) (-distinct '("Key1" "Key2"))))


;; ====================
;; keybindings

(global-set-key (kbd "C-c f") 'helm-bibtex-with-local-bibliography)  ; allows paper searching rapidly. For refreshing, C-u C-c f


;; ====================
;; zotxt
;;
;; details on using zotxt with emacs:
;; http://www.mkbehr.com/posts/a-research-workflow-with-zotero-and-org-mode/

(use-package zotxt)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ein - jupyter notebook for emacs

;; (require 'ein)
(use-package ein
:defer t)
