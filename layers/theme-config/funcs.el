(defun theme-config/cycle-next (list)
  `(,@(cdr list) ,(car list)))

(defun theme-config/font-next ()
  "Change font to the next entry in `dotspacemacs-default-font'."
  (interactive)
  (setq dotspacemacs-default-font (theme-config/cycle-next dotspacemacs-default-font))
  (spacemacs/set-default-font dotspacemacs-default-font)
  (spaceline-compile))
