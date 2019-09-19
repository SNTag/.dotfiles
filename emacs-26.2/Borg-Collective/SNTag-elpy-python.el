;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elpy - python

;; ;; need to add line numbers
;; (global-linum-mode t) ;; enable line numbers globally

;; would this be useful?
;; enable autopep8 formatting on save
(use-package py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

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
      (add-hook 'elpy-mode-hook 'flycheck-mode)
      (add-hook 'python-mode-hook 'anaconda-mode)
      (setq pythong-shell-interpreter "ipython"
	    python-shell-interpreter-args "-i --simple-prompt"))
    (elpy-enable)
    ;; jedi is great
    (setq elpy-rpc-backend "jedi")))

(add-hook 'python-mode-hook 'anaconda-mode)
(defun my-python-mode-hook () 
  (linum-mode 1)) 
(add-hook 'python-mode-hook 'my-python-mode-hook)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; conda variables - python

;; (use-package conda
;;   :ensure t
;;   :init
;;   (setq conda-anaconda-home (expand-file-name "~/anaconda3"))
;;   (setq conda-env-home-directory (expand-file-name "~/anaconda3")))
