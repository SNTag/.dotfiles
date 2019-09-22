
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs - Lets get started!


;; ====================
;; init starting: speed up
;;
;; can try to futher improve speeds using profile-dotemacs.el supposedly
;; (setq gc-cons-threshold 50000000)
;; increases start up memory allocation, and after init loading, returns it to normal.

(add-hook 'emacs-startup-hook 'my/set-gc-threshold)
(defun my/set-gc-threshold ()
  "Reset `gc-cons-threshold' to its default value."
  (setq gc-cons-threshold 800000))


;; ====================
;; quirks
;;
;; These are also in the Borg Quirks file.  repeated here to make a nice looking startup from the begining

(tool-bar-mode -1); tool bar icons present or not.  Value '-1' removes.  Comment out to return tool bar.
(menu-bar-mode -1); menu bar icons present or not.  Value '-1' removes.  Comment out to return tool bar.


;; ====================
;; Added by Package.el.
;;
;; This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


;; ====================
;; Use-package

;; uncomment this line when using emacs on a computer for the first time!
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/use-package")

(require 'use-package)

;; (with-eval-after-load 'info
;;   (info-initialize)
;;   (add-to-list 'Info-directory-list
;;                "~/.emacs.d/site-lisp/use-package/"))

(setq use-package-always-ensure t)


;; ====================
;; Begin Borg Assimilation

(load-file "~/.emacs.d/Borg-Collective_Emacs/Hive-Mind.el")
