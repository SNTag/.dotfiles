;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Julia
;;
;; My set up as I play with this new language.
;;
;; I will be using either ess or jupyter-emacs as my MAIN mode, and see how that goes.
;;
;;
;;
;; partially inspired from:
;; https://pixorblog.wordpress.com/2018/03/07/julia-with-emacs-org-mode/
;;
;; NOTE: julia is side loaded in SNTag-ess.el through the line :mode "\\.jl\\'"
;; DOES NOT SEEM TO WORK WITHOUT ESS


;; ====================
;; julia major mode
;;
;; https://github.com/JuliaEditorSupport/julia-emacs

(use-package julia-mode
  :mode ("\\.jl\\'" . ess-mode)
  :init
  (add-hook 'julia-mode-hook 'ess-julia-mode)
  )
;; (require julia-mode)

;; ;; ====================
;; ;; julia-shell
;; ;;
;; ;; ORIGINAL GIT:    https://github.com/dennisog/julia-shell-mode
;; ;; BLOG POST:       https://ogbe.net/blog/julia-shell.html
;; ;;
;; ;; WARNING!!!! WILL NOT FUNCTION. required packages emacstools is not available repo anymore

;; (use-package julia-shell)

;; (defun my-julia-mode-hooks ()
;;   (require 'julia-shell-mode))
;; (add-hook 'julia-mode-hook 'my-julia-mode-hooks)
;; (define-key julia-mode-map (kbd "C-c C-c") 'julia-shell-run-region-or-line)
;; (define-key julia-mode-map (kbd "C-c C-s") 'julia-shell-save-and-go)
