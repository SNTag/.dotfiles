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



;; ;; ====================
;; ;; flycheck
;; ;; not a spell checker

;; (use-package flycheck
;;   ;; Jun 28 - I like this idea, but sometimes this is too slow.
;;   :config
;;   (add-hook 'text-mode-hook #'flycheck-mode)
;;   (add-hook 'org-mode-hook #'flycheck-mode)
;;   (add-hook 'markdown-hook #'flycheck-mode)
;;   (define-key flycheck-mode-map (kbd "s-;") 'flycheck-previous-error))


;; ====================
;; flycheck-vale
;;
;; linter.  Can check writing against grammatical rules.  Vale has a fun ability to add custom rules!

(use-package flycheck-vale)
;; (require 'flycheck-vale)
(flycheck-vale-setup)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; company-mode

;; (use-package company-mode)

(use-package auto-complete)
(require 'auto-complete-config)
(ac-config-default)

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
  (:map yas-minor-mode-map ("C-c C-n" . yas-expand-from-trigger-key))
  (:map yas-keymap
        (("TAB" . smarter-yas-expand-next-field)
         ([(tab)] . smarter-yas-expand-next-field)))
  :config
  (yas-reload-all)
  (defun smarter-yas-expand-next-field ()
    "Try to `yas-expand' then `yas-next-field' at current cursor position."
    (interactive)
    (let ((old-point (point))
          (old-tick (buffer-chars-modified-tick)))
      (yas-expand)
      (when (and (eq old-point (point))
                 (eq old-tick (buffer-chars-modified-tick)))
        (ignore-errors (yas-next-field))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; other flyspells
;; ;; ====================
;; ;; extra flyspell

;; (use-package flyspell-correct)


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
