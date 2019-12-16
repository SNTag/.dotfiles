;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm

(use-package helm
  :ensure t
  :demand
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-buffers-list)
         ("C-x c o" . helm-occur) ;SC
         ("M-y" . helm-show-kill-ring) ;SC
         ("C-x r b" . helm-filtered-bookmarks) ;SC
	 ("C-c s" . helm-buffers-list)  ; improves buffer changing
	 )
  :preface (require 'helm-config)
  :config (helm-mode 1)
  )


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
  :ensure t
  :bind ("C-c f" . helm-bibtex-with-local-bibliography)  ; allows paper searching rapidly. For refreshing, C-u C-c f
  )
;;  bibtex-completion-notes-path "~/Dropbox/OrgMode/Papers.org"

;; ;; The following two lines are run elsewhere. kept here for notes.
;; (setq   bibtex-completion-bibliography '("/path/to/file.bib")
;;         bibtex-completion-library-path '("/path/to/zotero"))

(setq bibtex-completion-pdf-field "file")  ; Uses lower case "file" to work with better-bibtex zotero plugin


;; ;; ====================
;; ;; For opening PDFs

;; ;; Needs to be edited for linux
;; (setq   helm-bibtex-open-pdf-function
;;         (lambda (fpath)
;;           (call-process "open" nil 0 nil "-a" "C:/Program Files (x86)/Foxit Software/Foxit Reader" fpath)))


;; ====================
;; bibtex citation format based on buffer mode

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
;; zotxt
;;
;; details on using zotxt with emacs:
;; http://www.mkbehr.com/posts/a-research-workflow-with-zotero-and-org-mode/

(use-package zotxt)
