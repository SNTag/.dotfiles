;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-babel config
;;
;; in development

;; ====================
;; Org-babel pre-requisites

;;(use-package ob-ipython)

;; ====================
;; Org-babel
;;
;; taken from:
;; https://orgmode.org/worg/org-contrib/babel/languages/ob-doc-python.html

;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '(
;;    (python . t)
;;    (ipython . t)
;;    (shell . t)
;;    (R . t)
;;    )
;;  )

;; (setq python-shell-completion-native-enable nil)  ; prevents an error message about the 'readline'
