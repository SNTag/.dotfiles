;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Magit
;;
;; enables Git cooperation

(use-package magit
  :ensure t)

;; ====================
;; magit keybinds

(global-set-key (kbd "C-x g") 'magit-status)
