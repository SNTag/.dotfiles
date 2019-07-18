;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; loading files

(load-file "~/.emacs.d/config/package.list.el")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs quirks
(setq default-directory "/mnt/d/Dropbox/"); C-x C-f location change





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dictionaries, languages and encodings
;;
;; Use hunspell.exe for automatic spell checking. Available
;; from Chocolately as choco install hunspell


;; (use-package flyspell
;;   :defer t
;;   :bind
;;   (("" . ispell-word)
;;    ;; ("C-S-" . flyspell-mode)
;;    ;; ("C-M-" . flyspell-buffer)
;;    ;; ("C-" . flyspell-check-previous-highlighted-word)
;;    ;; ("M-" . flyspell-check-next-highlighted-word)
;;     )
;;   :init
;;   (setenv "DICTPATH" "c:\\ProgramData\\chocolatey\\lib\\hunspell.portable\\tools\\share\\hunspell\\")
;;   (setenv "DICTIONARY" "c:\\ProgramData\\chocolatey\\lib\\hunspell.portable\\tools\\share\\hunspell\\en_US")
;;   (setq ispell-program-name "c:\\ProgramData\\chocolatey\\bin\\hunspell.exe"
;; 	;; Save dictionary in common location
;; 	ispell-extra-args `("-p" ,(expand-file-name "hunspell" dropbox))
;; 	;; Save dictionary without asking
;; 	ispell-silently-savep t
;; 	;; Do not issue warnings for all wrong words
;; 	flyspell-issue-message-flag nil)

;;   (defun flyspell-check-next-highlighted-word ()
;;     "Custom function to spell check next highlighted word"
;;     (interactive)
;;     (flyspell-goto-next-error)
;;     (ispell-word)
;;     )

;;   :config
;;   (ispell-change-dictionary "en_US" t)
;;   ) ; use-package flyspell

;; ;;; Encoding for everything
;; (prefer-coding-system 'utf-8-unix)


;; ;; following may contain help in improving flyspell
;; ;; https://emacs.stackexchange.com/questions/14909/how-to-use-flyspell-to-efficiently-correct-previous-word






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yasnippets



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



;; (load-file "~/.emacs.d/config/windows-python.el")






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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elpy

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elpy - python

;; ;; ;; need to add line numbers
;; ;; (global-linum-mode t) ;; enable line numbers globally

;; ;; ;; would this be useful?
;; ;; ;; enable autopep8 formatting on save
;; ;; (require 'py-autopep8)
;; ;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; (use-package elpy
;;   :ensure t
;;   :defer 2
;;   :config
;;   (progn
;;     ;; Use Flycheck instead of Flymake
;;     (when (require 'flycheck nil t)
;;       (remove-hook 'elpy-modules 'elpy-module-flymake)
;;       (remove-hook 'elpy-modules 'elpy-module-yasnippet)
;;       (remove-hook 'elpy-mode-hook 'elpy-module-highlight-indentation)
;;       (add-hook 'elpy-mode-hook 'flycheck-mode))
;;     (elpy-enable)
;;     ;; jedi is great
;;     (setq elpy-rpc-backend "jedi")))
