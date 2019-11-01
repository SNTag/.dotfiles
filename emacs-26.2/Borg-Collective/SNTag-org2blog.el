;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org2blog
;;
;; experimental org2blog setup
;; taken from:
;; http://blog.gabrielsaldana.org/post-to-wordpress-blogs-with-emacs-org-mode/

(setq load-path (cons "~/.emacs.d/git-programs/org2blog/" load-path))
(require 'org2blog-autoloads)

(setq org2blog/wp-blog-alist
      '(("wordpress"
         :url "http://username.wordpress.com/xmlrpc.php"
         :username "username"   
         :default-title "Hello World"
         :default-categories ("org2blog" "emacs")
         :tags-as-categories nil)
        ("my-blog"             
         :url "http://username.server.com/xmlrpc.php"
         :username "admin")))
