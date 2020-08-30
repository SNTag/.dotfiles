;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elpy - python

;; ;; need to add line numbers
;; (global-linum-mode t) ;; enable line numbers globally

;; ;; ====================
;; ;; anaconda-mode
;; ;; ensure anaconda-mode is present
;; (use-package anaconda-mode)

;; ====================
;; python-mode
;; (use-package python
;;   :mode (
;; ;		 ("\\.py\\'" . python-mode)
;; ;		 ("\\.pymd\\'" . python-mode)
;; 		 )
;; 		:interpreter ("python" . python-mode)
;; 		:config
;; 		(setq python-shell-interpreter "/usr/local/bin/jupyter"
;; 				python-shell-interpreter-args "console --simple-prompt"
;; 				python-shell-prompt-detect-failure-warning nil)
;; add-to-list 'python-shell-completion-native-disabled-interpreters
;; "jupyter")

;; ;; ====================
;; ;; elpy

;; ;; ;; would this be useful?
;; ;; ;; enable autopep8 formatting on save
;; ;; (use-package py-autopep8)
;; ;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; (use-package elpy
;;   :init (elpy-enable)
;;   :ensure t
;;   :after flycheck
;;   :mode (
;; ;		 ("\\.py\\'" . python-mode)
;; ;		 ("\\.pymd\\'" . python-mode)
;; 		 ("\\.py\\'" . elpy-mode)
;; 		 ("\\.pymd\\'" . elpy-mode)
;; 		 )
;;   :config
;;   (progn
;;     ;; Use Flycheck instead of Flymake
;;     (when (require 'flycheck nil t)
;;       (remove-hook 'elpy-modules 'elpy-module-flymake) ; allows my personal global syntax correction
;;       (remove-hook 'elpy-modules 'elpy-module-yasnippet)
;;       (remove-hook 'elpy-mode-hook 'elpy-module-highlight-indentation)
;; ;;      (add-hook 'elpy-mode-hook 'flycheck-mode)  ; I have a suspicion its slowing elpy down
;;       (add-hook 'python-mode-hook 'anaconda-mode))
;;     (elpy-enable)
;;     ;; jedi is great
;;     (setq elpy-rpc-backend "jedi")
;;     (setq-default indent-tabs-mode nil) ; should I disable this, let my global settings take over?
;; ;;	(setq-default indent-line-function 'insert-tab)
;; 	(setq-default tab-width 4)          ; should I disable this, let my global settings take over?
;; 	(setq-default c-basic-offset 4)
;; 	(setq-default js-switch-indent-offset 4)
;; 	(c-set-offset 'comment-intro 0)
;; 	(c-set-offset 'innamespace 0)
;; 	(c-set-offset 'case-label '+)
;; 	(c-set-offset 'access-label 0)
;; 	(c-set-offset (quote cpp-macro) 0 nil)
;; 	(add-hook 'after-change-major-mode-hook
;; 	          (lambda () (if (equal electric-indent-mode 't)
;;     	                (when (derived-mode-p 'text-mode)
;;         	              (electric-indent-mode -1))
;;             	      (electric-indent-mode 1))))
;;     ))

      ;; ;; when enabled, says "WARNING: your terminal doesn't support cursor position requests (CPR)."
      ;; (setq python-shell-interpreter "ipython"
      ;; 	    python-shell-interpreter-args "-i")

;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'my-linum-mode-hook) ; Introduces lines
;; (setq python-shell-completion-native-enable nil)


;; ;; ====================
;; ;; elpy - v2

;; (use-package elpy
;;   :ensure t
;;   :init
;;   (elpy-enable))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; python mypy

;; (use-package flycheck-mypy)
;; (add-hook 'python-mode-hook 'flycheck-mode)

;; (add-to-list 'flycheck-disabled-checkers 'python-flake8)
;; (add-to-list 'flycheck-disabled-checkers 'python-pylint)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; pyenv mode
;; ;;
;; ;; WARNING: default env is set to 'my_env'
;; ;;
;; ;; inspired by:
;; ;; http://rakan.me/emacs/python-dev-with-emacs-and-pyenv/
;; ;; https://smythp.com/emacs/python/2016/04/27/pyenv-elpy.html

;; (use-package pyenv-mode
;;   :init
;;   (add-to-list 'exec-path "~/.pyenv/shims")
;;   (setenv "WORKON_HOME" "~/.pyenv/versions/")
;;   :config
;;   (pyenv-mode)
;;   :bind
;;   ("C-x p e" . pyenv-activate-current-project))


;; ;; ====================
;; ;; helps update pyenv project

;; (defun pyenv-activate-current-project ()
;;   "Automatically activates pyenv version if .python-version file exists."
;;   (interactive)
;;   (let ((python-version-directory (locate-dominating-file (buffer-file-name) ".python-version")))
;;     (if python-version-directory
;;         (let* ((pyenv-version-path (f-expand ".python-version" python-version-directory))
;;                (pyenv-current-version (s-trim (f-read-text pyenv-version-path 'utf-8))))
;;           (pyenv-mode-set pyenv-current-version)
;;           (message (concat "Setting virtualenv to " pyenv-current-version))))))


;; ;; ====================
;; ;; pyvenv
;; ;;
;; ;; sets up my virtual environment for elpy, ein, and babel

;; (use-package pyvenv
;;   :init
;;   (pyvenv-activate "~/my_env"))

;; (use-package virtualenvwrapper)
;; (venv-initialize-interactive-shells) ;; if you want interactive shell support
;; (venv-initialize-eshell) ;; if you want eshell support
;; ;; note that setting `venv-location` is not necessary if you
;; ;; use the default location (`~/.virtualenvs`), or if the
;; ;; the environment variable `WORKON_HOME` points to the right place
;; (setq venv-location "/home/sntag/my_env/bin/activate")


;; ;; ====================
;; ;; ob-ipython

;; (use-package ob-ipython)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python - v2
;;
;; remaking the above. I'm getting into more thorough python development and need it working with poly-pweave-mode

;; ====================
;; elpy

(use-package elpy
  :init (elpy-enable)
  :ensure t
  :after flycheck
  :mode (
;		 ("\\.py\\'" . python-mode)
;		 ("\\.pymd\\'" . python-mode)
		 ("\\.py\\'" . elpy-mode)
		 ("\\.pymd\\'" . elpy-mode)
		 )
  :config
  (progn
    ;; Use Flycheck instead of Flymake
    (when (require 'flycheck nil t)
      (remove-hook 'elpy-modules 'elpy-module-flymake) ; allows my personal global syntax correction
      (remove-hook 'elpy-modules 'elpy-module-yasnippet)
      (remove-hook 'elpy-mode-hook 'elpy-module-highlight-indentation)
;;      (add-hook 'elpy-mode-hook 'flycheck-mode)  ; I have a suspicion its slowing elpy down
      (add-hook 'python-mode-hook 'anaconda-mode))

    ;; jedi is great
    (setq elpy-rpc-backend "jedi")
    (setq-default indent-tabs-mode nil) ; should I disable this, let my global settings take over?
;;	(setq-default indent-line-function 'insert-tab)
	(setq-default tab-width 4)          ; should I disable this, let my global settings take over?
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
    ))

      ;; ;; when enabled, says "WARNING: your terminal doesn't support cursor position requests (CPR)."
      ;; (setq python-shell-interpreter "ipython"
	  ;;   python-shell-interpreter-args "-i")

;; (use-package elpy
;;   :ensure t
;;   :defer t
;;   :init
;;   (advice-add 'python-mode :before 'elpy-enable))

;; ====================
;; quirks

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'my-linum-mode-hook) ; Introduces lines
(setq python-shell-completion-native-enable nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pyenv mode
;;
;; WARNING: default env is set to 'my_env'
;;
;; inspired by:
;; http://rakan.me/emacs/python-dev-with-emacs-and-pyenv/
;; https://smythp.com/emacs/python/2016/04/27/pyenv-elpy.html

(use-package pyenv-mode
  :init
  (add-to-list 'exec-path "~/.pyenv/shims")
  (setenv "WORKON_HOME" "~/.pyenv/versions/")
  :config
  (pyenv-mode)
  :bind
  ("C-x p e" . pyenv-activate-current-project))


;; ====================
;; helps update pyenv project

(defun pyenv-activate-current-project ()
  "Automatically activates pyenv version if .python-version file exists."
  (interactive)
  (let ((python-version-directory (locate-dominating-file (buffer-file-name) ".python-version")))
    (if python-version-directory
        (let* ((pyenv-version-path (f-expand ".python-version" python-version-directory))
               (pyenv-current-version (s-trim (f-read-text pyenv-version-path 'utf-8))))
          (pyenv-mode-set pyenv-current-version)
          (message (concat "Setting virtualenv to " pyenv-current-version))))))







;Pnw-mode for Pweave reST documents
(defun Pnw-mode ()
       (require 'noweb-font-lock-mode)
       (noweb-mode)
       (setq noweb-default-code-mode 'python-mode)
       (setq noweb-doc-mode 'rst-mode))

(setq auto-mode-alist (append (list (cons "\\.prstw$" 'rstw-mode))
                   auto-mode-alist))

;Plw-mode for Pweave Latex documents
(defun Plw-mode ()
       (require 'noweb-font-lock-mode)
       (noweb-mode)
       (setq noweb-default-code-mode 'elpy-mode)
       (setq noweb-doc-mode 'latex-mode))

(setq auto-mode-alist (append (list (cons "\\.ptexw$" 'texw-mode))
                   auto-mode-alist))
