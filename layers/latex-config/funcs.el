(defun latex-config/latex-insert-use-package (package)
  "Add package to latex file."
  (interactive "MUse package: ")
  (setq posn (point))
  (if
      (or (progn (end-of-buffer) (search-backward "\\usepackage" nil t nil))
          (progn (beginning-of-buffer) (search-forward "\\documentclass" nil t nil)))
      (progn
        (end-of-line)
        (insert (format "\n\\usepackage{%s}" package))
        (goto-char posn)
        (forward-line 2))
    (progn (goto-char posn)
           (error "Must have a \\documentclass in your latex file."))))

(defun latex-config/preview-buffer-on-save ()
  (interactive)
  (add-hook 'after-save-hook
            #'preview-buffer
            t t))

(define-minor-mode preview-on-save-minor-mode
  :init-value nil
  :lighter "Preview"
  :keymap nil
  (if preview-on-save-minor-mode
      (add-hook 'after-save-hook
                #'preview-buffer nil t)
    (remove-hook 'after-save-hook
                 #'preview-buffer t)))

(define-minor-mode latex-build-on-save-minor-mode
  :init-value nil
  :lighter "Build"
  :keymap nil
  (if latex-build-on-save-minor-mode
      (add-hook 'after-save-hook
                #'latex/build)
    (remove-hook 'after-save-hook
                 #'latex/build)))
