;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Markdown-mode

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
;  :init (setq-default markdown-hide-markup t)  ; Enables hiding of markup.  't' enables, 'f' disables.
  )

(add-hook 'markdown-mode-hook
          (lambda ()
            (set-fill-column 100)))  ; sets column size on loading
(add-hook 'markdown-mode-hook 'flyspell-mode)

(use-package pandoc-mode)    ; installs/loads minor pandoc-mode

(add-hook 'markdown-mode-hook 'pandoc-mode)


;; ;; ====================
;; ;; markdown + images from clipboard
;; ;;
;; ;; from https://github.com/rafadc/emacs.d/blob/master/settings.org
;; ;; Work in Progress

;; (defun md-image-from-clipboard ()
;;   "Takes a screenshot into a time stamped unique-named file in the
;; same directory as the org-buffer and insert a link to this file."
;;   (interactive)
;;   (let ((filename (concat
;;                   (make-temp-name
;;                    (concat (file-name-nondirectory (buffer-file-name)) ".images/" (format-time-string "%Y%m%d_%H%M%S_")) ) ".png")))
;;     (unless (file-exists-p (file-name-directory filename))
;;       (make-directory (file-name-directory filename) t))
;;     (call-process "pngpaste" nil nil nil filename)
;;     (if (file-exists-p filename)
;;         (insert (concat "![](" filename ")"))))
;; )

;; ====================
;; extra markdown functionality packages

(use-package markdown-mode+)  ;; markdown-mode-plus
(use-package markdown-toc)  ;; markdown table of contents

;; ====================
;; fix Rmarkdown inline code
;;
;; normal markdown will break inline code when wrapping.
;; taken from u/SpacemacsMasterRace:
;; https://www.reddit.com/r/spacemacs/comments/bcms7m/r_markdown_with_spacemacs/
(with-eval-after-load 'markdown-mode
  (add-hook 'fill-nobreak-predicate
            #'markdown-inline-code-at-point-p)
)
