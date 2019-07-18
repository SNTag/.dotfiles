;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; opening files for conditional pass
(find-file "D:/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/01-Introduction.md")
(find-file "D:/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/02-Approach.md")
(find-file "D:/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/03-Technical-Plan.md")
(find-file "D:/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/03-Methods-and-Materials.md")
(find-file "D:/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/04-Timeline.md")
(find-file "D:/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/05-Risk-Assessment.md")
(find-file "D:/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters_thesis/10-Preliminary-Results.md")
;; (find-file "D:/Dropbox/latex journal/resources/QE_paper-Shayon/md-conditional pass/QE-Shayon.md")
;; (find-file "D:/Dropbox/latex journal/resources/QE_paper-Shayon/md-masters thesis/QE-Shayon.md")

;; ====================
;; For notes
 (find-file "D:/Dropbox/latex journal/resources/research notes/notes-org-v1.org")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This will hopefully set up a correct layout on start up.
;; layout definition
(defun my-startup-layout ()
 (interactive)
 (delete-other-windows)
 ;; (next-multiframe-window)
 ;; (find-file "D:/Dropbox/latex journal/notebook v3.0/00-labbookv3.0.tex")
 (find-file "D:/Dropbox/latex journal/notebook v4.0/00-labbookv4.md")
 ;; (split-window-vertically) ;;  -> --
 ;; (next-multiframe-window)
 (find-file "D:/Dropbox/agenda/agenda.org")
)





;; execute the layout
(my-startup-layout )
