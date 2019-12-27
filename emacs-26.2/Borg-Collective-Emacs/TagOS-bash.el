
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bash-setup

;; ====================
;; Loads bash enviroments

(defun set-exec-path-from-shell-PATH ()
        (interactive)
        (let ((path-from-shell (replace-regexp-in-string "^.*\n.*shell\n" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
        (setenv "PATH" path-from-shell)
        (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

;; ====================
;; aweshell
;;
;; shell extension base on eshell with better features
;; taken from M-emacs

(use-package aweshell
  :load-path (lambda () (expand-file-name "site-elisp/aweshell" user-emacs-directory))
  :commands (aweshell-new aweshell-dedicated-open)
  :bind
  (("M-#" . aweshell-dedicated-open)
   (:map eshell-mode-map ("M-#" . aweshell-dedicated-close))))

;; ====================
;; Shell Here
;;
;; a tool that opens a shell buffer in (or relative to) default-directory.
;; taken from M-emacs
;;
;; will do the same as fun open-terminal-in-workdir, except IN emacs

(use-package shell-here
  :bind ("M-~" . shell-here)
  :config
  (when *sys/linux*
    (setq explicit-shell-file-name "/bin/bash")))


;; ====================
;; multiterm
;;
;; a mode based on term.el, for managing multiple terminal buffers in Emacs.
;; taken from M-emacs

(use-package multi-term
  :load-path (lambda () (expand-file-name "site-elisp/multi-term" user-emacs-directory))
  :commands (multi-term)
  :bind
  (("M-$" . multi-term)
   (:map dired-mode-map ("M-$" . multi-term)))
  :custom
  (multi-term-program (executable-find "bash")))


;; ;; ====================
;; ;; Term Keys
;; ;;
;; ;; Term Keys, a lossless keyboard input for Emacs in terminal emulators.
;; ;; taken from M-emas

;; (use-package term-keys
;;   :if (not *sys/gui*)
;;   :config (term-keys-mode t))
