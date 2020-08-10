;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FRAME CONTROL
;;
;; I came to emacs while learning R in R-studio. I missed the neat
;; compartmentalization of R-studio, so in comes my frame control!
;;
;; in the process of coding, many buffers will pop up and
;; disappear. The code below attempts to identify buffers that may not
;; be as important as the frame i'm working on, and open them
;; accordingly. The code is unintelligent, and needs directing.
;;
;; ex., I start an R console, or a *-woven.md/*-exported.pdf file is generated.
;; A small, long frame will be opened on the far right that will not disturb my
;; other frames. It will remain open, and concurrent calls for R help will not
;; delete previous *R Help* frames.
;;
;; When calling up multiple frames, static buffers (not edited, for viewing)
;; will be to the bottom right. Active elements (programming consoles, helm,
;; etc) will be on the top left.
;;
;; To reopen a buffer in the side window, use 'M-x display-buffer' or 'M-x dib' and
;; select the buffer to open. If the buffer is not in the list, it will open in
;; a new frame.
;;
;; customization options here:
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Frame-Layouts-with-Side-Windows.html

(setq display-buffer-alist
      `(
		;; TO THE RIGHT
	("*R Dired" ;; ===================
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . right)
         (slot . -1)
         (window-width . 0.33)
         (reusable-frames . nil))
	("*R" ;; =========================
         (display-buffer-reuse-window display-buffer-in-side-window)
		 (side . right)
         (slot . -1)
         (window-width . 0.33)
										;	     (width . 0.33)
										;        (window-width . 0.35)
         (reusable-frames . nil))
	("-exported" ;; ==================
         (display-buffer-reuse-window display-buffer-in-side-window)
		 (side . right)
         (slot . 1)
         (window-width . 0.33)
										;	     (width . 0.33)
										;        (window-width . 0.35)
         (reusable-frames . nil))
	("-woven" ;; =====================
         (display-buffer-reuse-window display-buffer-in-side-window)
    	 (side . right)
         (slot . 1)
         (window-width . 0.33)
										;	     (width . 0.33)
										;        (window-width . 0.35)
         (reusable-frames . nil))
        ("*helm" ;; ==============================
         (display-buffer-reuse-window display-buffer-in-side-window)
		 (side . right)
         (slot . -1)
         (window-width . 0.33)
										;	     (width . 0.33)
										;        (window-width . 0.35)
         (reusable-frames . nil))
        ("*YASnippet Tables*" ;; =================
         (display-buffer-reuse-window display-buffer-in-side-window)
		 (side . right)
         (slot . 1)
         (window-width . 0.33)
										;	     (width . 0.33)
										;        (window-width . 0.35)
         (reusable-frames . nil))
	("*polymode export*" ;; ==========
         (display-buffer-reuse-window display-buffer-in-side-window)
		 (side . right)
         (slot . 1)
         (window-width . 0.33)
										;	     (width . 0.33)
										;        (window-width . 0.35)
         (reusable-frames . nil))
	("*Org Agenda*" ;; ==========
         (display-buffer-reuse-window display-buffer-in-side-window)
		 (side . right)
         (slot . 1)
         (window-width . 0.33)
										;	     (width . 0.33)
										;        (window-width . 0.35)
         (reusable-frames . nil))
        ("*Help" ;; ==============================
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . right)
         (slot . 1)
         (window-width . 0.33)
         (reusable-frames . 1))
	("*ess-describe*" ;; ==============================
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . right)
         (slot . 1)
         (window-width . 0.33)
         (reusable-frames . 1))
	("*company-documentation" ;; =====
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . right)
         (slot . 1)
         (window-width . 0.33)
         (reusable-frames . nil))
	(".pdf" ;; =====
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . right)
         (slot . 1)
         (window-width . 0.33)
         (reusable-frames . nil))
	("*.yaml" ;; ===================
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . right)
         (slot . -1)
         (window-width . 0.33)
         (reusable-frames . nil))
	("*.tex" ;; ===================
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . right)
         (slot . 1)
         (window-width . 0.33)
         (reusable-frames . nil))
	;; ("*compilation*" ;; ===================
        ;;  (display-buffer-reuse-window display-buffer-in-side-window)
        ;;  (side . right)
        ;;  (slot . 1)
        ;;  (window-width . 0.33)
        ;;  (reusable-frames . nil))
		))
