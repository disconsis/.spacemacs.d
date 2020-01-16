(spacemacs/set-leader-keys-for-major-mode 'latex-mode
  "i p" #'latex-config/latex-insert-use-package
  "p c" #'preview-clearout-buffer
  "p a" #'preview-on-save-minor-mode
  "B" #'latex-build-on-save-minor-mode)
