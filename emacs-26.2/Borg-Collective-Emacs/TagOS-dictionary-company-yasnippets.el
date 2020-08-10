;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dictionaries, languages and encodings
;;
;; describes (in order):
;; - yasnippet
;; - flycheck-vale
;; - company-mode
;; - flyspell


;; ====================
;; yassnippet
;;
;; taken from M-emacs

(use-package yasnippet
  :diminish yas-minor-mode
  :init
  (use-package yasnippet-snippets :after yasnippet)
  :hook ((prog-mode LaTeX-mode org-mode) . yas-minor-mode)
  :bind
;;   (:map yas-minor-mode-map ("C-c C-n" . yas-expand-from-trigger-key))
  (:map yas-keymap
        (("TAB" . smarter-yas-expand-next-field)
         ([(tab)] . smarter-yas-expand-next-field)))
  :config
  (yas-reload-all)
  (yas-global-mode)
  (defun smarter-yas-expand-next-field ()
    "Try to `yas-expand' then `yas-next-field' at current cursor position."
    (interactive)
    (let ((old-point (point))
          (old-tick (buffer-chars-modified-tick)))
      (yas-expand)
      (when (and (eq old-point (point))
                 (eq old-tick (buffer-chars-modified-tick)))
        (ignore-errors (yas-next-field))))))


;; ====================
;; flycheck-vale
;;
;; linter.  Can check writing against grammatical rules.  Vale has a fun ability to add custom rules!

(use-package flycheck-vale)
(flycheck-vale-setup)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company-mode
;;
;; inspired by M-emacs

(use-package company
  :diminish company-mode
  :hook ((prog-mode LaTeX-mode latex-mode ess-r-mode) . company-mode) ; doesn't (global-company-mode 1) take care of this?
  :bind
  (:map company-active-map
        ([tab] . smarter-yas-expand-next-field-complete)
        ("TAB" . smarter-yas-expand-next-field-complete))
  :init
  (add-hook 'after-init-hook 'global-company-mode) ; doesn't (global-company-mode 1) take care of this?
  :custom
  (company-minimum-prefix-length 1)
  (company-tooltip-align-annotations t)
  (company-begin-commands '(self-insert-command))
  (company-require-match 'never)
  (company-global-modes '(not shell-mode eaf-mode))  ; Don't use company in the following modes
  (company-idle-delay 0.1)    ; Trigger completion almost immediately.
  (company-show-numbers t)    ; Number the candidates (use M-1, M-2 etc to select completions).
  :config
  (unless *clangd* (delete 'company-clang company-backends))
  (global-company-mode 1)
  (defun smarter-yas-expand-next-field-complete ()
    "Try to `yas-expand' and `yas-next-field' at current cursor position.
If failed try to complete the common part with `company-complete-common'"
    (interactive)
    (if yas-minor-mode
        (let ((old-point (point))
              (old-tick (buffer-chars-modified-tick)))
          (yas-expand)
          (when (and (eq old-point (point))
                     (eq old-tick (buffer-chars-modified-tick)))
            (ignore-errors (yas-next-field))
            (when (and (eq old-point (point))
                       (eq old-tick (buffer-chars-modified-tick)))
              (company-complete-common))))
      (company-complete-common)))
  )

(global-set-key (kbd "C-c l") 'company-yasnippet)  ; enables toggle of company-yasnippets

;; ;; will modify backends.  see further if useful
;; (add-to-list 'company-backends 'company-dabbrev-code)
;;   (add-to-list 'company-backends 'company-yasnippet)
;;   (add-to-list 'company-backends 'company-files)

;; add company-ispell?


;; ====================
;; company tab-nine
;;
;; https://github.com/TommyX12/company-tabnine

(use-package company-tabnine
  :ensure t
  :hook
  (kill-emacs . company-tabnine-kill-process)
  :init)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; other flyspells


;; ====================
;; minimal flyspell
;;
;; spell checker
;; if it doesn't work, ensure that aspell, aspell-en is installed
;; taken from:
;; https://joelkuiper.eu/spellcheck_emacs

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(dolist (mode '(emacs-lisp-mode-hook
                inferior-lisp-mode-hook
                clojure-mode-hook
                python-mode-hook
                js-mode-hook
                R-mode-hook))
  (add-hook mode
            '(lambda ()
               (flyspell-prog-mode))))

(global-set-key (kbd "<f8>") 'ispell-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word))
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)

(setq yas-indent-line (quote none))


;; ;; ====================
;; ;; extra flyspell

;; (use-package flyspell-correct)


;; ====================
;; Auto complete
;;
;; has nice doc support, but is now obsolete. most sites recommend
;; moving to other modes.

;; (use-package auto-complete)
;; ;; (use-package auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/dict")
;; (ac-config-default)
;; (auto-complete-mode)
