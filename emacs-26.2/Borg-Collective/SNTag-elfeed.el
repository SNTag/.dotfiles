;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RSS
;;
;; taken from:
;; https://github.com/skeeto/elfeed
;; http://pragmaticemacs.com/emacs/read-your-rss-feeds-in-emacs-with-elfeed/

;; ====================
;; elfeed-org

;; use an org file to organise feeds
(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "/media/iDropbox/Dropbox/org-files/life/elfeed.org")))



;; ====================
;; shortcuts
;;
;; categories:
;; all; work; programming; news; hobby

;;shortcut functions
(defun bjm/elfeed-show-all ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-all"))
(defun bjm/elfeed-show-emacs ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-work"))
(defun bjm/elfeed-show-emacs ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-programming"))
(defun bjm/elfeed-show-daily ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-news"))
(defun bjm/elfeed-show-daily ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-hobby"))



;; ====================
;; quirks and tweaks

(defun elfeed-mark-all-as-read ()
  (interactive)
  (mark-whole-buffer)
  (elfeed-search-untag-all-unread))

;;functions to support syncing .elfeed between machines
;;makes sure elfeed reads index from disk before launching
(defun bjm/elfeed-load-db-and-open ()
  "Wrapper to load the elfeed db from disk before opening"
  (interactive)
  (elfeed-db-load)
  (elfeed)
  (elfeed-search-update--force))

;;write to disk when quiting
(defun bjm/elfeed-save-db-and-bury ()
  "Wrapper to save the elfeed db to disk before burying buffer"
  (interactive)
  (elfeed-db-save)
  (quit-window))

(defalias 'elfeed-toggle-star
(elfeed-expose #'elfeed-search-toggle-all 'star))



;; ====================
;; elfeed
;;
;; categories:
;; all; work; programming; news; hobby

(setq elfeed-db-directory "/media/iDropbox/Dropbox/my_journal/elfeeddb")

(use-package elfeed
  :ensure t
  :bind (:map elfeed-search-mode-map
              ("A" . bjm/elfeed-show-all)
              ("W" . bjm/elfeed-show-work)
              ("P" . bjm/elfeed-show-programming)
	      ("N" . bjm/elfeed-show-news)
	      ("H" . bjm/elfeed-show-hobby)
              ("q" . bjm/elfeed-save-db-and-bury)
	      ("m" . elfeed-toggle-star)
              ("M" . elfeed-toggle-star)))

(global-set-key (kbd "C-c w") 'elfeed)



;; ====================
;; elfeed-goodies

(use-package elfeed-goodies
:ensure t
:config
(elfeed-goodies/setup))
