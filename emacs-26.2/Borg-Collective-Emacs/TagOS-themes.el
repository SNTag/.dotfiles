;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Themes
;;
;; The theme is being set here.

;; ====================
;; Ensuring themes, icons are available

(use-package doom-themes)
(use-package all-the-icons)
(use-package leuven-theme)


;; ====================
;; Setting themes
;;
;; This enables a theme depending on running from terminal or GUI.

;; (if (display-graphic-p)
;;     (load-theme 'leuven)
;;     (load-theme 'doom-molokai)
;;     )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; editing themes
;;
;; tools for when you need to get that theme right

;; ====================
;; what-face
;;
;; identifies face for where cursor is at.
(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (pos) 'read-face-name)
                  (get-char-property (pos) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))
