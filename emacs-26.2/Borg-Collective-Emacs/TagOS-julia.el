;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Julia
;;
;; My set up as I play with this new language.
;;
;; I will be using either ess or jupyter-emacs, and see how that goes.


;; ====================
;; julia major mode
;;
;; https://github.com/JuliaEditorSupport/julia-emacs

(use-package julia-mode)





;; ;; ====================
;; ;; julia-shell
;; ;;
;; ;; ORIGINAL GIT:    https://github.com/dennisog/julia-shell-mode
;; ;; BLOG POST:       https://ogbe.net/blog/julia-shell.html

;; (use-package julia-shell)

;; (defun my-julia-mode-hooks ()
;;   (require 'julia-shell-mode))
;; (add-hook 'julia-mode-hook 'my-julia-mode-hooks)
;; (define-key julia-mode-map (kbd "C-c C-c") 'julia-shell-run-region-or-line)
;; (define-key julia-mode-map (kbd "C-c C-s") 'julia-shell-save-and-go)
