;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elpy - python

;; ;; need to add line numbers
;; (global-linum-mode t) ;; enable line numbers globally

;; ensure anaconda-mode is present
(use-package anaconda-mode)

;; ;; would this be useful?
;; ;; enable autopep8 formatting on save
;; (use-package py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(use-package elpy
  :ensure nil
  :after flycheck
  :mode "\\.py\\'"
  :defer 2
  :config
  (progn
    ;; Use Flycheck instead of Flymake
    (when (require 'flycheck nil t)
      (remove-hook 'elpy-modules 'elpy-module-flymake)
      (remove-hook 'elpy-modules 'elpy-module-yasnippet)
      (remove-hook 'elpy-mode-hook 'elpy-module-highlight-indentation)
;;      (add-hook 'elpy-mode-hook 'flycheck-mode)  ;; I have a suspicion its slowing elpy down
      (add-hook 'python-mode-hook 'anaconda-mode))
    (elpy-enable)
    ;; jedi is great
    (setq elpy-rpc-backend "jedi")
    (setq-default indent-tabs-mode nil)
;;	(setq-default indent-line-function 'insert-tab)
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
))

      ;; ;; when enabled, says "WARNING: your terminal doesn't support cursor position requests (CPR)."
      ;; (setq python-shell-interpreter "ipython"
      ;; 	    python-shell-interpreter-args "-i")

(add-hook 'python-mode-hook 'anaconda-mode)
(defun my-python-mode-hook ()
  (linum-mode 1))
(add-hook 'python-mode-hook 'my-python-mode-hook)
(setq python-shell-completion-native-enable nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; conda variables - STOPPED WORKING ON THIS FOR NOW
;;
;; improves compatability with anaconda.

;; (add-to-list 'exec-path "~/anaconda3/bin")

;; (use-package conda
;;   :ensure t
;;   :init
;;   (setq conda-anaconda-home (expand-file-name "~/anaconda3"))
;;   (setq conda-env-home-directory (expand-file-name "~/anaconda3")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python mypy

(use-package flycheck-mypy)
(add-hook 'python-mode-hook 'flycheck-mode)

(add-to-list 'flycheck-disabled-checkers 'python-flake8)
(add-to-list 'flycheck-disabled-checkers 'python-pylint)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pyenv mode
;;
;; inspired by:
;; http://rakan.me/emacs/python-dev-with-emacs-and-pyenv/

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


;; ====================
;; sets python-version to global

(defvar pyenv-current-version nil nil)

(defun pyenv-init()
  "Initialize pyenv's current version to the global one."
  (let ((global-pyenv (replace-regexp-in-string "\n" "" (shell-command-to-string "pyenv global"))))
    (message (concat "Setting pyenv version to " global-pyenv))
    (pyenv-mode-set global-pyenv)
    (setq pyenv-current-version global-pyenv)))

(add-hook 'after-init-hook 'pyenv-init)
