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
(defun docs/to-org-manual () ;; ==================== docs/to-org docs
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
(defun docs/to-R-caret () ;; ======================= docs/to-R-caret
  "R documentation to caret"
  (interactive)
  (browse-url "https://topepo.github.io/caret/index.html"))
;; (defun docs/to-R-tidymodels () ;; ================== docs/to-R-tidymodels
;;   "R tidymodels"
;;   (interactive)
;;   (browse-url ""))
(defun docs/to-R-bookdown () ;; ==================== docs/to-R-bookdown
  "R documentation to writing R books"
  (interactive)
  (browse-url "https://bookdown.org/yihui/bookdown/"))
(defun docs/to-R-blogdown () ;; ==================== docs/to-R-blogdown
  "R documentation to writing R blogs"
  (interactive)
  (browse-url "https://bookdown.org/yihui/blogdown/"))
(defun docs/to-R-tidytext () ;; ==================== docs/to-R-tidytext
  "R documentation to tidytext"
  (interactive)
  (browse-url "https://www.tidytextmining.com/ngrams.html"))
(defun docs/to-R-Hands-On-Programming () ;; ======== docs/to-R-Hands-On-Programming
  "R documentation to tidytext"
  (interactive)
  (browse-url "https://rstudio-education.github.io/hopr/index.html"))
(defun docs/to-R-bioconductor () ;; ======== docs/to-R-bioconductor
  "R bioconductor"
  (interactive)
  (browse-url "https://bioconductor.org/"))


;; ====================
;; python3
(defun docs/to-python-docs () ;; =================== docs/to-python-docs
  "python3-documentation"
  (interactive)
  (browse-url "https://docs.python.org/3/index.html"))

;; ====================
;; emacs
(defun docs/to-emacs-all-docs () ;; ================ docs/to-python-docs
  "emacs-documentation"
  (interactive)
  (browse-url "https://www.gnu.org/software/emacs/manual/"))
(defun docs/to-emacs-docs () ;; ==================== docs/to-python-docs
  "emacs-documentation"
  (interactive)
  (browse-url "https://www.gnu.org/software/emacs/manual/html_node/emacs/index.html"))

;; ====================
;; latex
(defun docs/to-latex-ctan () ;; ==================== docs/to-latex-ctan
  "emacs-documentation"
  (interactive)
  (browse-url "https://ctan.org/"))

;; ====================
;; encyclopedia
(defun ency/to-web-wikipedia () ;; ================= ency/to-web-wikipedia
  "wikipedia"
  (interactive)
  (browse-url "https://www.investopedia.com/"))
(defun ency/to-web-investopedia () ;; ============== ency/to-web-investopedia
  "investopedia"
  (interactive)
  (browse-url "https://www.investopedia.com/"))
(defun ency/to-web-archwiki () ;; ================== ency/to-web-archwiki
  "takes me to the Holy Docs"
  (interactive)
  (browse-url "https://wiki.archlinux.org/"))
(defun ency/to-web-github () ;; ==================== ency/to-web-github
  "github"
  (interactive)
  (browse-url "https://github.com/"))
(defun ency/to-web-stackoverflow () ;; ============= ency/to-web-stackoverflow
  "stack-overflow"
  (interactive)
  (browse-url "https://stackoverflow.com/"))
(defun ency/to-web-ebertreviews () ;; ============== ency/to-web-ebertreviews
  "ebert movie-reviews"
  (interactive)
  (browse-url "https://www.rogerebert.com/reviews"))
(defun ency/to-web-imdb () ;; ====================== ency/to-web-imdb
  "movie encyclopedia"
  (interactive)
  (browse-url "https://www.imdb.com/"))


;; ====================
;; emails

(defun emails/to-protonmail () ;; ================== emails/to-protonmail
  "emails protonmail"
  (interactive)
  (browse-url "https://protonmail.com/"))
(defun emails/to-nus-webmail () ;; ================= emails/to-nus-webmail
  "emails nus webmail"
  (interactive)
  (browse-url "https://exchange.nus.edu.sg/owa/auth/logon.aspx?url=https://exchange.nus.edu.sg/owa/&reason=0"))
(defun emails/to-gmail () ;; ======================= emails/to-gmail
  "emails gmail"
  (interactive)
  (browse-url "https://www.gmail.com"))
