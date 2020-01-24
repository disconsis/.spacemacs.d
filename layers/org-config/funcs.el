(defun org-config/org-metaright-or-evil-shift-right-line ()
  (interactive)
  ;; works because of dynamic resolution
  (let ((forward-word #'evil-shift-right-line))
    (org-metaright)))
