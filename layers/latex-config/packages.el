(defconst latex-config-packages
  '((evil-latex-textobjects :location local)))

(defun latex-config/init-evil-latex-textobjects ()
  (use-package evil-latex-textobjects
    ;; :defer t
    :config
    (add-hook
     'LaTeX-mode-hook
     #'turn-on-evil-latex-textobjects-mode)))
