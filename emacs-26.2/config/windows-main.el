

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; loading files

(load-file "~/.emacs.d/config/package.list.el")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; sets start up

(setq default-frame-alist '( (left . 0) (top . 32) (height . 62) (width . 115) ))

(setq dropbox "D:/Dropbox/Library/")
(setq dropbox-elpa "~/Dropbox/Library/Emacs/elpa-26.1")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; quirks

(setq default-directory "D:/Dropbox/")  ; C-x C-f location change
(electric-pair-mode 1)  ; autocomplete paired brackets
(setq comint-prompt-read-only t)  ; Prevents deleting shell prompt
(global-unset-key (kbd "C-x C-c"))  ; unsets the emacs kill command in case my clumsy fingers press it

;; ====================
;; open pdfs with foxit
;; opens with default program currently, not foxit.
;; might not be needed. sumatra has an option to open in foxit, can use that.

(use-package openwith)
(openwith-mode t)
(setq openwith-associations '(("\\.pdf\\'" "Foxit Reader.exe" (file))))


;; ====================
;; Helm-buffers

(global-set-key (kbd "C-c s") 'helm-buffers-list)  ; improves buffer changing


;; ====================
;; tabs

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Theme

;; (use-package twilight-bright-theme
;;   :ensure t)

(add-hook 'text-mode-hook 'turn-on-auto-fill)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dictionaries, languages and encodings
;;
;; Use hunspell.exe for automatic spell checking. Available
;; from Chocolately as choco install hunspell

(use-package flyspell
  :defer t
  :bind
  (("" . ispell-word)
   ;; ("C-S-" . flyspell-mode)
   ;; ("C-M-" . flyspell-buffer)
   ;; ("C-" . flyspell-check-previous-highlighted-word)
   ;; ("M-" . flyspell-check-next-highlighted-word)
    )
  :init
  (setenv "DICTPATH" "c:\\ProgramData\\chocolatey\\lib\\hunspell.portable\\tools\\share\\hunspell\\")
  (setenv "DICTIONARY" "c:\\ProgramData\\chocolatey\\lib\\hunspell.portable\\tools\\share\\hunspell\\en_US")
  (setq ispell-program-name "c:\\ProgramData\\chocolatey\\bin\\hunspell.exe"
	;; Save dictionary in common location
	ispell-extra-args `("-p" ,(expand-file-name "hunspell" dropbox))
	;; Save dictionary without asking
	ispell-silently-savep t
	;; Do not issue warnings for all wrong words
	flyspell-issue-message-flag nil)

  (defun flyspell-check-next-highlighted-word ()
    "Custom function to spell check next highlighted word"
    (interactive)
    (flyspell-goto-next-error)
    (ispell-word)
    )

  :config
  (ispell-change-dictionary "en_US" t)
  ) ; use-package flyspell

;;; Encoding for everything
(prefer-coding-system 'utf-8-unix)


;; following may contain help in improving flyspell
;; https://emacs.stackexchange.com/questions/14909/how-to-use-flyspell-to-efficiently-correct-previous-word



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

(use-package ido)
(use-package auto-complete)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python
(load-file "~/.emacs.d/config/windows-python.el")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Markdown-mode

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(add-hook 'markdown-mode-hook
          (lambda ()
            (set-fill-column 100)))
(add-hook 'markdown-mode-hook 'flyspell-mode)

(use-package pandoc-mode)    ; installs minor pandoc-mode

(add-hook 'markdown-mode-hook 'pandoc-mode)

;markdown + images from clipboard  
;from https://github.com/rafadc/emacs.d/blob/master/settings.org
  
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
(setq ispell-dictionary "english"); Default dictionary. To change do M-x ispell-change-dictionary RET.
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
;; R coding

(use-package ess)
(use-package ess-smart-underscore)
(use-package ess-R-data-view)
(setq ess-use-auto-complete t)
(autoload 'ess-rdired "ess-rdired"  
  "View *R* objects in a dired-like buffer." t)  


;; ====================
;; modifies problems with help menu opening a new help page
;; set long ac-quick-help-delay (don't activate automatically)
(setq ac-quick-help-delay 9999)
;; set key to call ac-quick-help manually
(define-key ac-completing-map (kbd "M-h") 'ac-quick-help)

;; ====================
;; Directory information
;; based off:
;; https://stackoverflow.com/questions/16860694/ess-does-not-find-rterm-exe-on-windows

(setq ess-directory-containing-R "c:/Program Files")
;; Add to list of prefixes recognized by ESS. 
;; Matching versions will appear after doing M-x R <TAB> <TAB> 
(setq ess-r-versions '("R-1" "R-2" "R-3" "R-current" "R-devel" "R-patched"))
;; (load "C:/Program Files/GNU Emacs 23.3/site-lisp/ess/lisp/ess-site.el")

;; Set default R version, (i.e. the one launched by typing M-x R <RET>)
(setq inferior-R-program-name "c:/Program Files/R/R-3.5.3/bin/i386/Rterm.exe")


;; ====================
;; opens buffer configuration


;; ====================
;; ess-smart S assign key

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

(use-package magit
  :ensure t)

;; ====================
;; magit keybinds

(global-set-key (kbd "C-x g") 'magit-status)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm-bibtex
;; https://github.com/tmalsburg/helm-bibtex
;; helps in interacting with zotero

(use-package helm-bibtex
  :ensure t)
;;  bibtex-completion-notes-path "~/Dropbox/OrgMode/Papers.org"
(setq   bibtex-completion-bibliography '("D:/Dropbox/latex journal/resources/Greg-Tucker-Kellogg.bib")
        bibtex-completion-library-path '("C:/Users/shayo/Zotero/"))

(setq bibtex-completion-pdf-field "file")  ; Uses lower case "file" to work with better-bibtex zotero plugin

(setq   helm-bibtex-open-pdf-function
        (lambda (fpath)
          (call-process "open" nil 0 nil "-a" "C:/Program Files (x86)/Foxit Software/Foxit Reader" fpath)))

(setq bibtex-completion-format-citation-functions
  '((org-mode      . bibtex-completion-format-citation-org-link-to-PDF)
    (latex-mode    . bibtex-completion-format-citation-cite)
    (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
    (default       . bibtex-completion-format-citation-default)))

;; ;; Create a BibTeX file containing only specific entries
;; (progn
;;   (switch-to-buffer (generate-new-buffer "my_new_bibliography.bib"))
;;   (--map (insert (bibtex-completion-make-bibtex it)) (-distinct '("Key1" "Key2"))))


;; ====================
;; keybindings

(global-set-key (kbd "C-c f") 'helm-bibtex-with-local-bibliography)  ; allows paper searching rapidly. For refreshing, C-u C-c f


;; ====================
;; zotxt
;; details on using zotxt with emacs:
;; http://www.mkbehr.com/posts/a-research-workflow-with-zotero-and-org-mode/

(use-package zotxt)
