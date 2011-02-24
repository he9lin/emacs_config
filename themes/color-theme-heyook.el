;; Need color-theme plugin to work
(defun color-theme-heyook ()
  (interactive)
  (color-theme-install
   '(color-theme-heyook
      ((background-color . "#09111b")
      (background-mode . light)
      (border-color . "#1a1a1a")
      (cursor-color . "#fce94f")
      (foreground-color . "#e9e9e8")
      (mouse-color . "black"))
     (fringe ((t (:background "#1a1a1a"))))
     (mode-line ((t (:foreground "#eeeeec" :background "#555753"))))
     (region ((t (:background "#0d4519"))))
     (font-lock-builtin-face ((t (:foreground "#4f8ac9"))))
     (font-lock-comment-face ((t (:foreground "#5b7731"))))
     (font-lock-function-name-face ((t (:foreground "#edd400"))))
     (font-lock-keyword-face ((t (:foreground "#5b90c8"))))
     (font-lock-string-face ((t (:foreground "#b75cad"))))
     (font-lock-type-face ((t (:foreground"#e25934"))))
     (font-lock-variable-name-face ((t (:foreground "#24e5e3"))))
     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'color-theme-heyook)
