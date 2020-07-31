;; ====================
;; org-agenda basics

(defun org-build-agenda ()
  (interactive)
  (setq last-build-time (format-time-string "%S.%3N"))
  (org-agenda 0 " ")
  (setq after-build-time (format-time-string "%S.%3N"))
  (print last-build-time)
  (print after-build-time)
  )

;; ====================
;; sets the agenda dates to view
;;
;; see:
;; https://emacs.stackexchange.com/questions/12517/how-do-i-make-the-timespan-shown-by-org-agenda-start-yesterday
(setq org-agenda-start-day "-1d")
(setq org-agenda-span 9)
(setq org-agenda-start-on-weekday nil)


;; ====================
;; What files to use in agenda
;;
;; Will allow setting of multiple directories for org-agenda-files.
;; following code needs to be updated regularly for monthly journal
;;
;; thanks to u\dme for the code and u\divenvrsk for telling me about it.
;; https://www.reddit.com/r/orgmode/comments/eks3tq/new_year_new_problems_setting_orgagenda/

(setq org-agenda-files (apply 'append
			      (mapcar
			       (lambda (directory)
				 (directory-files-recursively
				  directory org-agenda-file-regexp))
			       '("~/MyDisk/Dropbox/org-files/journals/2020/" "~/MyDisk/Dropbox/org-files/journals/2019/"))))


;; ====================
;; org-mode capture
;;
;; http://howardism.org/Technical/Emacs/journaling-org.html
;; following captures need to be updated regularly for monthly journal

(setq org-capture-templates
  '(;; ... other templates

    ;; ("j" "Journal Entry"
    ;;      entry (file+datetree "~/journal.org")
    ;;      "* %?"
    ;;      :empty-lines 1)

    ;; ... other templates

        ("p" "Day planning"
         entry (file+datetree "~/MyDisk/Dropbox/org-files/journals/2020/2020-07-Jul.org")
         "* Day planner %U
** thoughts / diary / major events
** Review [/]
- [ ] Month vitals
- [ ] Calendar
- [ ] Task lists
- [ ] Emails
- [ ] Reading

** Habits / important [/]
- [ ] code a day
- [ ] wake up early & cook breakfast

** Todo

** New Schedule items

	"
         :empty-lines 1)

      ;; For bookmarks
	  ("b" "Bookmark" entry (file+headline "~/MyDisk/Dropbox/org-files/life/bookmarks.org" "Bookmarks")
	   "* %?\n%U\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n" :empty-lines 1)

    )
  )
