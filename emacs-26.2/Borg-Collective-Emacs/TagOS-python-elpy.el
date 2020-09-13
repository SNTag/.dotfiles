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
(use-package python
  :mode (
		 ("\\.py\\'" . python-mode)
		 ("\\.pymd\\'" . python-mode)
		 )
		:interpreter ("python" . python-mode)
		:config
		(setq python-shell-interpreter "/usr/local/bin/jupyter"
				python-shell-interpreter-args "console --simple-prompt"
				python-shell-prompt-detect-failure-warning nil)
add-to-list 'python-shell-completion-native-disabled-interpreters
"jupyter")


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; python mypy

;; (use-package flycheck-mypy)
;; (add-hook 'python-mode-hook 'flycheck-mode)

;; (add-to-list 'flycheck-disabled-checkers 'python-flake8)
;; (add-to-list 'flycheck-disabled-checkers 'python-pylint)


;; ;; ====================
;; ;; ob-ipython

;; (use-package ob-ipython)








;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python - v2
;;
;; remaking the above. I'm getting back into thorough python development and want the fluidity i experienced with Rmarkdown
;;
;; development notes:
;; - pweave works now using polymode and noweb syntax. files are 'pymd'. However, as pweave hasn't been improved for two years and difficulty in sending regions to console, discontinuing work.
;; - org-mode + babel is functional.
;;
;; to look into:
;; https://www.seas.upenn.edu/~chaoliu/2017/09/01/python-programming-in-emacs/
;;
;; org-babel + python examples:
;; http://ehneilsen.net/notebook/orgExamples/org-examples.html

;; ====================
;; elpy
;;
;; notes:
;; - why isn't elpy getting activated
;;
;; some references:
;; https://github.com/ajschumacher/.emacs.d/blob/master/init.el
;; https://github.com/jorgenschaefer/elpy/issues/968
;; https://rodogi.github.io/emacs-config-file/


(use-package elpy
  :ensure t
  :init (elpy-enable)
  :after flycheck
;;   :mode (
;; 		 ("\\.py\\'" . python-mode)
;; 		 ("\\.pymd\\'" . python-mode)
;; ;		 ("\\.py\\'" . elpy-mode)
;; ;		 ("\\.pymd\\'" . elpy-mode)
;; 		 )
  :config
  (when (executable-find "ipython")
    (elpy-use-ipython))
  ;; Use Flycheck instead of Flymake
  (when (load "flycheck" t t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))

  (custom-set-variables
   '(elpy-rpc-backend "jedi")			; use jedi-company backend
   '(help-at-pt-timer-delay 0.9)
   '(tab-width 4)
   )

  (define-key elpy-mode-map (kbd "C-c C-n") 'next-error)
  (define-key elpy-mode-map (kbd "C-c C-p") 'previous-error)

;;  (progn
;;    (setq elpy-rpc-backend "jedi")		; use jedi-company backend
;;    (setq-default indent-tabs-mode nil) ; should I disable this, let my global settings take over?
;;	(setq-default indent-line-function 'insert-tab)
;;	(setq-default tab-width 4)          ; should I disable this, let my global settings take over?
;;	(setq-default c-basic-offset 4)
;;	(setq-default js-switch-indent-offset 4)
;;	(c-set-offset 'comment-intro 0)
;;	(c-set-offset 'innamespace 0)
;;	(c-set-offset 'case-label '+)
;;	(c-set-offset 'access-label 0)
;;	(c-set-offset (quote cpp-macro) 0 nil)
  ;; 	(add-hook 'after-change-major-mode-hook
  ;; 	          (lambda () (if (equal electric-indent-mode 't)
  ;;   	                (when (derived-mode-p 'text-mode)
  ;;       	              (electric-indent-mode -1))
  ;;           			(electric-indent-mode 1))))
  ;; 	)
)

(elpy-enable)

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
  :custom (pyenv-mode-set "3.8.2")
  :config
  (pyenv-mode)
  :bind
  ("C-x p e" . pyenv-activate-current-project))




(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--pylab=osx --pdb --nosep --classic"
      python-shell-prompt-regexp ">>> "
      python-shell-prompt-output-regexp ""
      python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; ====================
;; pyenv

(use-package pyvenv
  :after python
  :hook (python-mode . pyvenv-mode)
  :custom
  (pyvenv-default-virtual-env-name "env")
  (pyvenv-mode-line-indicator '(pyvenv-virtual-env-name ("[venv:" pyvenv-virtual-env-name "]"))))


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
;; pweave
;;
;; not sure if the following code is necessary
;;
;; taken from:
;; http://mpastell.com/pweave/editors.html#emacs

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
       (setq noweb-default-code-mode 'python-mode)
       (setq noweb-doc-mode 'latex-mode))

(setq auto-mode-alist (append (list (cons "\\.ptexw$" 'texw-mode))
			      auto-mode-alist))



;; ====================
;; lsp-mode

(use-package lsp-mode
  :hook (prog-mode . lsp))

(use-package lsp-ui)

(use-package lsp-python-ms
  :defer 0.3
  :custom (lsp-python-ms-auto-install-server t))


;; ====================
;; blacken
;;
;; code formatter. may be able to disable features in python such as
;; bracket completion thanks to black, have to test.
;;
;; taken from:
;; https://www.reddit.com/r/emacs/comments/ijmgtx/tip_how_to_use_a_stable_and_fast_environment_to/

(use-package blacken
  :delight
  :hook (python-mode . blacken-mode)
  :custom (blacken-line-length 80))


;; ====================
;; py-isort

(use-package py-isort
  :after python
  :hook ((python-mode . pyvenv-mode)
         (before-save . py-isort-before-save)))


;; ====================
;; python quirks
;; adding company-jedi here is repetitive? its added for elpy above

(add-hook 'after-init-hook 'global-company-mode)
(company-quickhelp-mode 1)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi)
  )

(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook 'run-python-internal)
