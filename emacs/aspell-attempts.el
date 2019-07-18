;; ;; ====================
;; ;; flyspell-correct-helm

;; (use-package flyspell-correct-helm
;;   :bind ("C-M-;" . flyspell-correct-wrapper)
;;   :init
;;   (setq flyspell-correct-interface #'flyspell-correct-helm))

;; ====================
;; generic flyspell
;; very messy right now

;; (use-package flyspell
;;   :defer t
;;   :bind
;;   (("" . ispell-word)
;;    ;; ("C-S-" . flyspell-mode)
;;    ;; ("C-M-" . flyspell-buffer)
;;    ;; ("C-" . flyspell-check-previous-highlighted-word)
;;    ;; ("M-" . flyspell-check-next-highlighted-word)
;;     )
;;   :init
;;   ;; (setenv "DICTPATH" "/usr/bin/hunspell")
;;   (setenv "DICTIONARY" "/home/sntagore/Dictionaries/en_US")
;;   (setq ispell-program-name "hunspell"
;; 	;; "c:\\ProgramData\\chocolatey\\bin\\hunspell.exe"
;; 	;; ;; Save dictionary in common location
;; 	;; ispell-extra-args `("-p" ,(expand-file-name "hunspell" dropbox))
;; 	;; ;; Save dictionary without asking
;; 	;; ispell-silently-savep t
;; 	;; ;; Do not issue warnings for all wrong words
;; 	;; flyspell-issue-message-flag nil
;; 	)

;;   (defun flyspell-check-next-highlighted-word ()
;;     "Custom function to spell check next highlighted word"
;;     (interactive)
;;     (flyspell-goto-next-error)
;;     (ispell-word)
;;     )

;;   ;; :config
;;   ;; (ispell-change-dictionary "en_US" t)
;;   ) ; use-package flyspell

;; ;; Encoding for everything
;; (prefer-coding-system 'utf-8-unix)


;; ;; following may contain help in improving flyspell
;; ;; https://emacs.stackexchange.com/questions/14909/how-to-use-flyspell-to-efficiently-correct-previous-word


;; ;; ====================
;; ;; hunspell - uberti
;; ;;
;; ;; is there a difference to ispell?

;; (setq ispell-program-name (executable-find "hunspell")
;;       ispell-dictionary "en_US")


;; ;; ====================
;; ;; flyspell - uberti
;; ;; changed from ivy

;; (use-package flyspell-correct-helm
;;   :ensure t
;;   :demand t
;;   :bind (:map flyspell-mode-map
;;               ("C-c $" . flyspell-correct-word-generic))
;;   )


;; ;; ====================
;; ;; flyspell - sheeshmacs
;; ;;
;; ;; taken from
;; ;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=33493

;; (when (eq system-type 'gnu/linux)
;; (use-package flyspell
;; :ensure t
;; :init
;; (add-hook 'org-mode-hook 'flyspell-mode)
;; (add-hook 'text-mode-hook 'flyspell-mode)
;; :bind
;; (("C-; ," . flyspell-goto-next-error)
;; ("C-; ." . flyspell-auto-correct-word))
;; :config
;; (setq flyspell-issue-message-flag nil)
;; (define-key flyspell-mode-map (kbd "C-.") nil)
;; (define-key flyspell-mode-map (kbd "C-,") nil)
;; (define-key flyspell-mode-map (kbd "C-;") nil)
;; (with-eval-after-load "ispell"
;; (setq ispell-program-name "hunspell")
;; (setq ispell-dictionary "en_US")
;; (ispell-set-spellchecker-params)
;; (when (> emacs-major-version 24)
;; (ispell-hunspell-add-multi-dic "en_US")))
;; ))


;; ;; ====================
;; ;; flyspell - scimax

;; ;; https://manuel-uberti.github.io/emacs/2016/06/06/spellchecksetup/
;; (use-package flyspell-correct-ivy
;;   :ensure t
;;   :init
;;   (if (file-directory-p (expand-file-name "emacs-win" scimax-dir))
;;       (progn
;; 	;; spell-checking on windows
;; 	(setq ispell-program-name
;; 	      (expand-file-name
;; 	       "emacs-win/bin/hunspell"
;; 	       scimax-dir))

;; 	(setq ispell-dictionary "english")

;; 	(setq ispell-local-dictionary-alist
;; 	      `(("english"
;; 		 "[[:alpha:]]"
;; 		 "[^[:alpha:]]"
;; 		 "[']"
;; 		 t
;; 		 ("-d" "en_US" "-p" ,(expand-file-name
;; 				      "emacs-win/share/hunspell/en_US"
;; 				      scimax-dir))
;; 		 nil
;; 		 utf-8))))
;;     (setenv "DICPATH" (expand-file-name "~/Library/Spelling"))
;;     (setq ispell-program-name (executable-find "hunspell")
;; 	  ispell-dictionary "en_US"
;; 	  ispell-local-dictionary "en_US"
;; 	  ispell-local-dictionary-alist
;; 	  `(("english"
;; 	     "[[:alpha:]]"
;; 	     "[^[:alpha:]]"
;; 	     "[']"
;; 	     t
;; 	     ("-d" "en_US" "-p" ,(expand-file-name "~/Library/Spelling/"))
;; 	     nil
;; 	     utf-8)
;; 	    ("en_US"
;; 	     "[[:alpha:]]"
;; 	     "[^[:alpha:]]"
;; 	     "[']"
;; 	     t
;; 	     ("-d" "en_US" "-p" ,(expand-file-name "~/Library/Spelling/"))
;; 	     nil
;; 	     utf-8))
;; 	  flyspell-correct-interface 'flyspell-correct-ivy))
;;   (add-hook 'flyspell-incorrect-hook
;; 	    (lambda (beg end sym)
;; 	      (message "%s misspelled. Type %s to fix it."
;; 		       (buffer-substring beg end)
;; 		       (substitute-command-keys
;; 			"\\[flyspell-correct-previous-word-generic]"))
;; 	      ;; return nil so word is still highlighted.
;; 	      nil))
;;   (add-hook 'text-mode-hook
;; 	    (lambda ()
;; 	      (flyspell-mode)
;; 	      (flycheck-mode)))

;;   (add-hook 'org-mode-hook
;; 	    (lambda ()
;; 	      (flyspell-mode +1)
;; 	      (flycheck-mode +1)))

;;   :after flyspell
;;   :config
;;   (progn
;; (define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-previous-word-generic)))


;; ;; ====================
;; ;; Dictionaries
;; ;;
;; ;; based off here
;; ;; https://emacs.stackexchange.com/questions/21378/spell-check-with-multiple-dictionaries

;; (with-eval-after-load "ispell"
;;   (setq ispell-program-name "hunspell")
;;   (setq ispell-dictionary "en_US")
;;   ;; ispell-set-spellchecker-params has to be called
;;   ;; before ispell-hunspell-add-multi-dic will work
;;   (ispell-set-spellchecker-params)
;;   (ispell-hunspell-add-multi-dic "en_US")
;;   )
