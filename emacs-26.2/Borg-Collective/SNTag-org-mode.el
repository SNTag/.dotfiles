;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; orgmode
;; agenda
;; based on:
;; https://blog.aaronbieber.com/2016/09/24/an-agenda-for-life-with-org-mode.html
;; and
;; http://cachestocaches.com/2016/9/my-workflow-org-agenda/

;; (load-file "~/.emacs.d/config/init-org-agenda.el")

(use-package org
  :ensure org-plus-contrib
  :init
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook 'flyspell-mode)
  (setq org-agenda-files '("D:/Dropbox/agenda/"))
  :diminish visual-line-mode
  :diminish org-indent-mode
  :defer t
  :bind (("\C-c a" . org-agenda)
	 ("\C-c c" . org-capture)
	 ("\C-c j" . gs-helm-org-link-to-contact))
  :config  

  (setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (agenda "")
          (alltodo ""
                   ((org-agenda-skip-function
                     '(or (air-org-skip-subtree-if-priority ?A)
                          (org-agenda-skip-if nil '(scheduled deadline))))))))))
  
  (defun air-org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))

  (defun air-org-skip-subtree-if-habit ()
  "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
  (let ((subtree-end (save-excursion (org-end-of-subtree t))))
    (if (string= (org-entry-get nil "STYLE") "habit")
        subtree-end
      nil)))

  (setq org-agenda-custom-commands
      '(("d" "Daily agenda and all TODOs"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (agenda "" ((org-agenda-ndays 1)))
          (alltodo ""
                   ((org-agenda-skip-function '(or (air-org-skip-subtree-if-habit)
                                                   (air-org-skip-subtree-if-priority ?A)
                                                   (org-agenda-skip-if nil '(scheduled deadline))))
                    (org-agenda-overriding-header "ALL normal priority tasks:"))))
         ((org-agenda-compact-blocks t)))))
)


;; ====================
;; org-capture
;;
;; http://howardism.org/Technical/Emacs/journaling-org.html

(setq org-capture-templates
  '(;; ... other templates
    
    ;; ("j" "Journal Entry"
    ;;      entry (file+datetree "~/journal.org")
    ;;      "* %?"
    ;;      :empty-lines 1)

    ;; ... other templates

        ("p" "Day planning"
         entry (file+datetree "/media/iDropbox/Dropbox/org-files/journals/2019/2019-09-Sep.org")
         "* Day planner %U
** Done list / thoughts / diary
** Tasks for today [/]
** Tasks that will satisfy end-of-the-day Charl [/]
** Focus blocks
** Sleep
** Review [/]
- [ ] Month vitals
- [ ] Calendar
- [ ] Org tasks
- [ ] dropbox mobile inbox
        
** Habits / important [/]

	"
         :empty-lines 1)
    )
  )
