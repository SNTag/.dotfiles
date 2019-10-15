;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; latex


;; ====================
;; auctex
;;
;; work in progress

(use-package auctex
    :mode
    ("\\.tex\\'" . latex-mode)
    :bind
    :init
    :config
    (setq-default TeX-master nil ; by each new fie AUCTEX will ask for a master fie.
;                  TeX-PDF-mode t
                  TeX-engine 'luatex)     ; optional

    (setq TeX-auto-save t
          TeX-save-query nil       ; don't prompt for saving the .tex file
          TeX-parse-self t; Enable parse on load.
	  setq TeX-auto-save t; Enable parse on save.
          TeX-show-compilation nil         ; if `t`, automatically shows compilation log
          LaTeX-babel-hyphen nil ; Disable language-specific hyphen insertion.
          ;; `"` expands into csquotes macros (for this to work, babel pkg must be loaded after csquotes pkg).
          LaTeX-csquotes-close-quote "}"
          LaTeX-csquotes-open-quote "\\enquote{"
          TeX-file-extensions '("Rnw" "rnw" "Snw" "snw" "tex" "sty" "cls" "ltx" "texi" "texinfo" "dtx"))

    ;; Font-lock for AuCTeX
    ;; ;; Note: '«' and '»' is by pressing 'C-x 8 <' and 'C-x 8 >', respectively
    ;; (font-lock-add-keywords 'latex-mode (list (list "\\(«\\(.+?\\|\n\\)\\)\\(+?\\)\\(»\\)" '(1 'font-latex-string-face t) '(2 'font-latex-string-face t) '(3 'font-latex-string-face t))))
    (add-hook 'TeX-mode-hook 'flyspell-mode); Enable Flyspell mode for TeX modes such as AUCTeX. Highlights all misspelled words.
    ;; (setq ispell-dictionary "english"); Default dictionary. To change do M-x ispell-change-dictionary RET.
    (add-hook 'TeX-mode-hook
          (lambda () (TeX-fold-mode 1))); Automatically activate TeX-fold-mode.
    (setq LaTeX-babel-hyphen nil); Disable language-specific hyphen insertion.
    (add-hook 'TeX-mode-hook 'LaTeX-math-mode)
    (add-hook 'TeX-mode-hook 'pandoc-mode)
    (add-hook 'TeX-mode-hook 'LaTeX-math-mode); LaTeX-math-mode http://www.gnu.org/s/auctex/manual/auctex/Mathematics.html
    (add-hook 'TeX-mode-hook 'turn-on-auto-fill); To enable auto-fill to latex mode
    )


;; ;; ====================
;; ;; Simple latex
;; ;;
;; ;; based on the work here:
;; ;; https://tex.stackexchange.com/questions/50827/a-simpletons-guide-to-tex-workflow-with-emacs
;; ;; NOTE:
;; ;; Keep in mind that 'tex-mode' needs to be start up.  hasn't been automated yet.

;; (setq TeX-parse-self t); Enable parse on load.
;; (setq TeX-auto-save t); Enable parse on save.
;; (setq-default TeX-master nil)

;; (setq TeX-PDF-mode t); PDF mode (rather than DVI-mode)

;; (add-hook 'TeX-mode-hook 'flyspell-mode); Enable Flyspell mode for TeX modes such as AUCTeX. Highlights all misspelled words.
;; (add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode); Enable Flyspell program mode for emacs lisp mode, which highlights all misspelled words in comments and strings.
;; ;; (setq ispell-dictionary "english"); Default dictionary. To change do M-x ispell-change-dictionary RET.
;; (add-hook 'TeX-mode-hook
;;           (lambda () (TeX-fold-mode 1))); Automatically activate TeX-fold-mode.
;; (setq LaTeX-babel-hyphen nil); Disable language-specific hyphen insertion.

;; ;; " expands into csquotes macros (for this to work babel must be loaded after csquotes).
;; (setq LaTeX-csquotes-close-quote "}"
;;       LaTeX-csquotes-open-quote "\\enquote{")

;; ;; LaTeX-math-mode http://www.gnu.org/s/auctex/manual/auctex/Mathematics.html
;; (add-hook 'TeX-mode-hook 'LaTeX-math-mode)

;; ;; ;; magic-latex-buffer
;; ;; (add-hook 'TeX-mode-hook 'magic-latex-buffer)


;; ;; To enable auto-fill to latex mode
;; (add-hook 'TeX-mode-hook 'turn-on-auto-fill)

;; (add-hook 'TeX-mode-hook 'pandoc-mode)



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


;; ====================
;; magic-latex-buffer

(use-package magic-latex-buffer)
