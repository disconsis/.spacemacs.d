(defun pdf-config/match-midnight-colors-to-theme ()
  (setq pdf-view-midnight-colors
        (cons (face-foreground 'default) (face-background 'default))))
