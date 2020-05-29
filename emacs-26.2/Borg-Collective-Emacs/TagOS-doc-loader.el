;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; docs/wiki-loader
;;
;; I need my docs! Could be replaced with an org list of bookmarks,
;; but easy doc access is fun.

;; ====================
;; my emacs readme
(defun docs/my-emacs-readme () ;; ================== docs/to-emacs-yasnippetsquickguide
  "Opens the README.org file."
  (interactive)
  (find-file "~/.emacs.d/readme.md")
  )
(global-set-key (kbd "C-c h") 'docs/my-emacs-readme)

;; ====================
;; emacs
(defun docs/to-emacs-yasnippetsquickquide () ;; ==== docs/to-emacs-yasnippetsquickguide
  "yasnippets quick guide"
  (interactive)
  (browse-url "https://joaotavora.github.io/yasnippet/snippet-development.html"))

;; ====================
;; org-docs
(defun docs/to-org-reg () ;; ======================= docs/to-org docs
  "org-docs"
  (interactive)
    (browse-url "https://orgmode.org/org.html"))
(defun docs/to-org-babel () ;; ===================== docs/to-orgbabel docs
  "org-babel-docs"
  (interactive)
  (browse-url "https://org-babel.readthedocs.io/en/latest/"))

;; ====================
;; R-docs
(defun docs/to-R-ess () ;; ========================= docs/to-ess docs
  "ess-docs"
  (interactive)
  (browse-url "http://ess.r-project.org/ess.pdf"))
(defun docs/to-R-rmarkdown () ;; =================== docs/to-R-rmarkdown docs
  "RMarkdown docs"
  (interactive)
  (browse-url "https://bookdown.org/yihui/rmarkdown/"))
(defun docs/to-R-cheatsheets () ;; ================= docs/to-R-cheatsheets docs
  "RStudio cheatsheets"
  (interactive)
  (browse-url "https://rstudio.com/resources/cheatsheets/"))
(defun docs/to-R-cran () ;; ======================== docs/to-R-cran
  "R Cran docs"
  (interactive)
  (browse-url "https://rdrr.io/find/?repos=cran&page=0&fuzzy_slug="))
(defun docs/to-R-advancedr () ;; =================== docs/to-R-advancedr
  "Hadley's advanced guide to R"
  (interactive)
  (browse-url "https://adv-r.hadley.nz/"))
(defun docs/to-R-datascience () ;; ================= docs/to-R-datascience
  "Hadley's guide to data science"
  (interactive)
  (browse-url "https://r4ds.had.co.nz/"))
(defun docs/to-R-packages () ;; ==================== docs/to-R-packages
  "Hadley's guide to R packages"
  (interactive)
  (browse-url "https://r-pkgs.org/"))

;; ====================
;; python3
(defun docs/to-python-docs () ;; =================== docs/to-python-docs
  "python3-documentation"
  (interactive)
  (browse-url "https://docs.python.org/3/index.html"))

;; ====================
;; wikis
(defun wiki/to-web-wikipedia () ;; ================= wiki/to-web-wikipedia
  "wikipedia"
  (interactive)
  (browse-url "https://www.investopedia.com/"))
(defun wiki/to-web-investopedia () ;; ============== wiki/to-web-investopedia
  "investopedia"
  (interactive)
  (browse-url "https://www.investopedia.com/"))
(defun wiki/to-web-archwiki () ;; ================== wiki/to-web-archwiki
  "takes me to the Holy Docs"
  (interactive)
  (browse-url "https://wiki.archlinux.org/"))
(defun wiki/to-web-github () ;; ==================== wiki/to-web-github
  "github"
  (interactive)
  (browse-url "https://github.com/"))
(defun wiki/to-web-stackoverflow () ;; ============= wiki/to-web-stackoverflow
  "stack-overflow"
  (interactive)
  (browse-url "https://stackoverflow.com/"))
(defun wiki/to-web-ebertreviews () ;; ===================== wiki/to-web-ebertreviews
  "ebert movie-reviews"
  (interactive)
  (browse-url "https://www.rogerebert.com/reviews"))
(defun wiki/to-web-imdb () ;; ===================== wiki/to-web-imdb
  "movie wiki"
  (interactive)
  (browse-url "https://www.imdb.com/"))
