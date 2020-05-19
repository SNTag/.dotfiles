;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs - Lets get started!


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init starting: speed up
;;
;; can try to futher improve speeds using profile-dotemacs.el supposedly
;; (setq gc-cons-threshold 50000000)
;; increases start up memory allocation, and after init loading, returns it to normal.

(add-hook 'emacs-startup-hook 'my/set-gc-threshold)
(defun my/set-gc-threshold ()
  "Reset `gc-cons-threshold' to its default value."
  (setq gc-cons-threshold 800000))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; quirks
;;
;; These are also in the Borg-collective/TagOS-quirks-and-twerks.el file. repeated here to make a nice looking startup from the beginning

(tool-bar-mode -1); tool bar icons present or not.  Value '-1' removes.  Comment out to return tool bar.
(menu-bar-mode -1); menu bar icons present or not.  Value '-1' removes.  Comment out to return tool bar.
(scroll-bar-mode -1); disable scroll-bar


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Defining Constants
;;
;; taken from:
;; https://github.com/MatthewZMD/.emacs.d

(defconst *sys/gui*
  (display-graphic-p)
  "Are we running on a GUI Emacs?")

(defconst *sys/win32*
  (eq system-type 'windows-nt)
  "Are we running on a WinTel system?")

(defconst *sys/linux*
  (eq system-type 'gnu/linux)
  "Are we running on a GNU/Linux system?")

(defconst *sys/mac*
  (eq system-type 'darwin)
  "Are we running on a Mac system?")

(defconst *sys/root*
  (string-equal "root" (getenv "USER"))
  "Are you a ROOT user?")

(defconst *rg*
  (executable-find "rg")
  "Do we have ripgrep?")

(defconst *python*
  (or (executable-find "python3")
      (and (executable-find "python")
           (> (length (shell-command-to-string "python --version | grep 'Python 3'")) 0)))
  "Do we have python3?")

(defconst *tr*
  (executable-find "tr")
  "Do we have tr?")

(defconst *mvn*
  (executable-find "mvn")
  "Do we have Maven?")

(defconst *clangd*
  (or (executable-find "clangd")  ;; usually
      (executable-find "/usr/local/opt/llvm/bin/clangd"))  ;; macOS
  "Do we have clangd?")

(defconst *gcc*
  (executable-find "gcc")
  "Do we have gcc?")

(defconst *git*
  (executable-find "git")
  "Do we have git?")

(defconst *pdflatex*
  (executable-find "pdflatex")
  "Do we have pdflatex?")

(defconst *eaf-env*
  (and *sys/linux* *sys/gui* *python*
       (executable-find "pip")
       (not (equal (shell-command-to-string "pip freeze | grep '^PyQt\\|PyQtWebEngine'") "")))
  "Check basic requirements for EAF to run.")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Melpa-packages
;;
;; load emacs 24's package system. Add MELPA repository.
;;
;; taken from:
;; http://ergoemacs.org/emacs/emacs_package_system.html

(when (>= emacs-major-version 24)
  (require 'package)
  ;; (add-to-list
  ;;  'package-archives
  ;; ;;  '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
  ;;  '("melpa" . "http://melpa.milkbox.net/packages/")
  ;;  t)
  )

;; ====================
;; Enables access to three different repositories/
;;
;; taken from:
;; https://emacs.stackexchange.com/questions/2969/is-it-possible-to-use-both-melpa-and-melpa-stable-at-the-same-time

(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/")
	("org"          . "https://orgmode.org/elpa/"))
      package-archive-priorities
      '(("MELPA Stable" . 10)
        ("GNU ELPA"     . 5)
        ("MELPA"        . 1)
	("org"          . 0)))


;; ====================
;; Added by Package.el.
;;
;; This must come before configurations of installed packages.

(package-initialize)


;; ====================
;; Use-package
;;
;; Install use-package if not installed
;; taken from M-Emacs

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-expand-minimally t)
  (setq use-package-compute-statistics t)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package)
  (require 'bind-key))

;; (with-eval-after-load 'info
;;   (info-initialize)
;;   (add-to-list 'Info-directory-list
;;                "~/.emacs.d/site-lisp/use-package/"))

(setq use-package-always-ensure t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Begin Borg Assimilation

;; ====================
;; dotfiles emacs
(load-file "~/.emacs.d/Borg-Collective-Emacs/Hive-Mind-Main.el")

;; ====================
;; dropbox files
(load-file "~/.emacs.d/Borg-Collective-Emacs-private/Hive-Mind-Personal.el")
