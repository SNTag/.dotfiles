;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; projectile

;; (use-package projectile
;;   :ensure t
;;   :config
;;   (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;;   (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;   (projectile-mode +1))



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; dashboard

;; (use-package dashboard
;;   :ensure t
;;   :config
;;   (dashboard-setup-startup-hook))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Opening files

;; (filesets-init)


;; ====================
;; thesis files

(find-file "/media/PhD/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/")  ; Sum product
(find-file "/media/PhD/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/01-Introduction.md")
;; (find-file "/media/PhD/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/02-Technical-Details.md")  ; not in use anymore.  Included in introduction
(find-file "/media/PhD/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/03-Methods-and-Materials.md")
(find-file "/media/PhD/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/04-Results.md")
(find-file "/media/PhD/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/05-Discussion.md")
(find-file "/media/PhD/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/scratch.org")  ; Used for notes


;; (find-file "/media/PhD/Dropbox/latex journal/resources/QE_paper-Shayon/md-conditional pass/QE-Shayon.md")
;; (find-file "/media/PhD/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters thesis/QE-Shayon.md")

;; ====================
;; For notes
(find-file "/media/PhD/Dropbox/latex journal/resources/research notes/notes-org-v1.org")
(find-file "/media/PhD/Dropbox/latex journal/notebook v4.0/00-labbookv4.md")
(find-file "/media/PhD/Dropbox/agenda/agenda.org")
(find-file "/media/PhD/Dropbox/journal_etc/journal/journal.org")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Layout


;; ====================
;; on start up.

(defun my-startup-layout ()
 (interactive)
 (delete-other-windows)
 ;; (next-multiframe-window)
 ;; (find-file "D:/Dropbox/latex journal/notebook v3.0/00-labbookv3.0.tex")
;; (find-file "D:/Dropbox/latex journal/notebook v4.0/00-labbookv4.md")
 ;; (split-window-vertically) ;;  -> --
 ;; (next-multiframe-window)
 ;; (find-file "D:/Dropbox/agenda/agenda.org")
 ;; (find-file "/media/PhD/Dropbox/journal_etc/emacs-background.jpg")
)

;; execute the layout
(my-startup-layout )
