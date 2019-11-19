;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org2blog


;; ====================
;;trial 1
;; experimental org2blog setup
;; taken from:
;; http://blog.gabrielsaldana.org/post-to-wordpress-blogs-with-emacs-org-mode/

;; (setq load-path (cons "~/.emacs.d/git-programs/org2blog/" load-path))
;; (require 'org2blog-autoloads)

;; (setq org2blog/wp-blog-alist
;;       '(("wordpress"
;;          :url "http://username.wordpress.com/xmlrpc.php"
;;          :username "username"   
;;          :default-title "Hello World"
;;          :default-categories ("org2blog" "emacs")
;;          :tags-as-categories nil)
;;         ("my-blog"             
;;          :url "http://username.server.com/xmlrpc.php"
;;          :username "admin")))



;; ====================
;; trial 2
;;
;; taken from:
;; http://www.pygopar.com/creating-and-deploying-org-mode-jekyll-site-to-github-pages

;; For jekyll
(setq org-publish-project-alist
    '(("org-mysite"
       ;; Path to your org files.
       :base-directory "~/Documents/harappun-files/org"
       :base-extension "org"

       ;; Path to your Jekyll project.
       :publishing-directory "~/Documents/harappun-files/"
       :recursive t
       :publishing-function org-publish-org-to-html
       :headline-levels 4
       :html-extension "html"
       :body-only t ;; Only export section between <body> </body>
       :table-of-contents nil)

      ("org-static-mysite"
       :base-directory "~/Documents/harappun-files/org/"
       :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
       :publishing-directory "path/to/proj/mysite/"
       :recursive t
       :publishing-function org-publish-attachment
       :table-of-contents nil)

      ("mysite" :components ("org-mysite" "org-static-mysite"))))



;; ====================
;; trial 3
;;
;; taken from:
;; https://orgmode.org/worg/org-tutorials/org-jekyll.html

;; (save-excursion
;;   ;; map over all tasks entries
;;   (let ((dev-file (expand-file-name
;;                    "development.org"
;;                    (file-name-directory (buffer-file-name))))
;;         (posts-dir (expand-file-name
;;                     "_posts"
;;                     (file-name-directory (buffer-file-name))))
;;         (yaml-front-matter '(("layout" . "default"))))
;;     ;; go through both the tasks and bugs
;;     (mapc
;;      (lambda (top-level)
;;        (find-file dev-file)
;;        (goto-char (point-min))
;;        (outline-next-visible-heading 1)
;;        (org-map-tree
;;         (lambda ()
;;           (let* ((props (org-entry-properties))
;;                  (todo (cdr (assoc "TODO" props)))
;;                  (time (cdr (assoc "TIMESTAMP_IA" props))))
;;             ;; each task with a state and timestamp can be exported as a
;;             ;; jekyll blog post
;;             (when (and todo time)
;;               (message "time=%s" time)
;;               (let* ((heading (org-get-heading))
;;                      (title (replace-regexp-in-string
;;                              "[:=\(\)\?]" ""
;;                              (replace-regexp-in-string
;;                               "[ \t]" "-" heading)))
;;                      (str-time (and (string-match "\\([[:digit:]\-]+\\) " time)
;;                                     (match-string 1 time)))
;;                      (to-file (format "%s-%s.html" str-time title))
;;                      (org-buffer (current-buffer))
;;                      (yaml-front-matter (cons (cons "title" heading) yaml-front-matter))
;;                      html)
;;                 (org-narrow-to-subtree)
;;                 (setq html (org-export-as-html nil nil nil 'string t nil))
;;                 (set-buffer org-buffer) (widen)
;;                 (with-temp-file (expand-file-name to-file posts-dir)
;;                   (when yaml-front-matter
;;                     (insert "---\n")
;;                     (mapc (lambda (pair) (insert (format "%s: %s\n" (car pair) (cdr pair))))
;;                           yaml-front-matter)
;;                     (insert "---\n\n"))
;;                   (insert html))
;;                 (get-buffer org-buffer)))))))
;;      '(1 2))))
