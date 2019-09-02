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
;; Cover Letter

(find-file "/media/iDropbox/Dropbox/journal_etc/papers/2019/files/CSHL_02326-R/coverLetter/01-letter.md")

;; ====================
;; thesis files

(find-file "/media/iDropbox/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/")  ; Sum product
(find-file "DROPBOX/latex journal/resources/QE_paper-Shayon/md-masters_thesis/01-Introduction.md")
(find-file "/media/iDropbox/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/03-Methods-and-Materials.md")
(find-file "/media/iDropbox/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/04-Results.md")
(find-file "/media/iDropbox/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/05-Discussion.md")
(find-file "/media/iDropbox/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/scratch.org")  ; Used for notes

;; (find-file "/media/iDropbox/Dropbox/latex journal/resources/QE_paper-Shayon/md-conditional pass/QE-Shayon.md")
;; (find-file "/media/iDropbox/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters thesis/QE-Shayon.md")


;; ====================
;; thesis image files
(find-file "/media/iDropbox/Dropbox/latex journal/resources/QE_paper-Shayon/tbls/tables-R-script.r")  ; tbls


;; ====================
;; For notes
(find-file "/media/iDropbox/Dropbox/latex journal/resources/research notes/notes-org-v1.org")
(find-file "/media/iDropbox/Dropbox/latex journal/notebook v4.0/00-labbookv4.md")
(find-file "/media/iDropbox/Dropbox/agenda/agenda.org")
(find-file "/media/iDropbox/Dropbox/journal_etc/journal/journal.org")



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
 ;; (find-file "/media/iDropbox/Dropbox/journal_etc/emacs-background.jpg")
)

;; execute the layout
(my-startup-layout )
