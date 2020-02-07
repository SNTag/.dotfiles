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
  (add-hook 'text-mode-hook 'turn-off-auto-fill)
;;  (setq org-agenda-files '("D:/Dropbox/agenda/"))
  :diminish visual-line-mode
  :diminish org-indent-mode
  :defer t
  :bind (("\C-c a" . org-agenda)
	 ("\C-c c" . org-capture)
	 ("\C-c j" . gs-helm-org-link-to-contact))
  :config
  ;; org-functions
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

  ;; org-stylistic tweaks
  (setq org-hide-leading-stars t)       ; disables stars before heading for all levels
  (setq org-hide-emphasis-markers t)    ; For hiding markup elements.
  (setq org-use-sub-superscripts '{})   ; prevents _ from always being read as subscript during org-export
  (setq org-startup-indented t)         ; org document indentation

  ;; org-babel settings
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)(ipython . t)(shell . t)(R . t))
   )
)


;; ====================
;; Org-mode tweaks

;; (setq org-hide-emphasis-markers t)  ;; For hiding markup elements.
;; (setq org-use-sub-superscripts '{})  ;; prevents _ from always being read as subscript during org-export


;; ====================
;; org-mode export

;; markdown
(eval-after-load "org"
  '(require 'ox-md nil t))

;; latex
(require 'ox-latex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))


;; ====================
;; Automate TODO DONE states
;;
;; Switches all tasks to DONE or TODO by child completion status.
;; based on chapter 5.5 of org-manual.
;; Does not work yet.
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)  ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; ====================
;; org-mode link copy
;;
;; Enables copying of external links for pasting into web browser of choice.
;;
;; taken from:
;; https://emacs.stackexchange.com/questions/3981/how-to-copy-links-out-of-org-mode

(defun my-yank-org-link (text)
  (if (derived-mode-p 'org-mode)
      (insert text)
    (string-match org-bracket-link-regexp text)
    (insert (substring text (match-beginning 1) (match-end 1)))))

(defun my-org-copy-smart-url ()
  (interactive)
  (let* ((link-info (assoc :link (org-context)))
         (text (when link-info
                 (buffer-substring-no-properties (or (cadr link-info) (point-min))
                                                 (or (caddr link-info) (point-max))))))
    (if (not text)
        (error "Not in org link")
      (add-text-properties 0 (length text) '(yank-handler (my-yank-org-link)) text)
      (kill-new text))))
;; (global-set-key (kbd "C-c c") 'my-org-copy-smart-url)

(defun my-org-export-url ()
  (interactive)
  (let* ((link-info (assoc :link (org-context)))
         (text (when link-info
                 (buffer-substring-no-properties (or (cadr link-info) (point-min))
                                                 (or (caddr link-info) (point-max))))))
    (if (not text)
        (error "Not in org link")
      (string-match org-bracket-link-regexp text)
      (kill-new (substring text (match-beginning 1) (match-end 1))))))
(global-set-key (kbd "C-c e") 'my-org-export-url)


;; ====================
;; Projectile-mode
;;
;; requires extra installation.
;; M-x package-install [RET] projectile [RET]
;;
;; See:
;; https://github.com/bbatsov/projectile

(use-package projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)


;; ====================
;; helm-projectile


(use-package helm-projectile)


;; ====================
;; helm-org-rifle

(use-package helm-org-rifle)


;; ====================
;; org-tanglesync
;;
;; org-babel feature.
;; Causes edits in either org-babel or exported file to be reflected in the other.
;; see:
;; https://www.reddit.com/r/emacs/comments/elzcel/ann_significant_update_to_orgtanglesync_a_package/

(use-package org-tanglesync
  :hook ((org-mode . org-tanglesync-mode)
         ((prog-mode text-mode) . org-tanglesync-watch-mode))
  :custom
  (org-tanglesync-watch-files '("conf.org" "myotherconf.org"))
  :bind
  (( "C-c M-i" . org-tanglesync-process-buffer-interactive)
   ( "C-c M-a" . org-tanglesync-process-buffer-automatic)))


;; ====================
;; Org-babel tweaks

;; disable security warnings
(defun my-org-confirm-babel-evaluate (lang body)
  (not (member lang '("python3" "sh"))))

(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate) ; calls security disabling
