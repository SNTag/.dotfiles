;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-babel config
;;
;; moving elements to 'TagOS-org.el'.  will deprecate this file soon.
;; I am increasingly depending on use-package system of setting configs, and have no need for an extra file.
;;
;; in development

;; ====================
;; Org-babel pre-requisites.
;;
;; requires jupyter kernel

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
