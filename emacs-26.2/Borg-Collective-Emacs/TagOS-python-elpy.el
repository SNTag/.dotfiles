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
    (setq elpy-rpc-backend "jedi")))

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
