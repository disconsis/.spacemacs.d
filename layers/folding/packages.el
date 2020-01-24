(defconst folding-packages
  '(outshine))

(defun folding/init-outshine ()
  (use-package outshine
    :ensure t
    :defer t
    :hook (prog-mode . outshine-mode)
    :config
    (evil-define-minor-mode-key 'normal 'outshine-mode
      (kbd "z a") #'outline-toggle-children
      (kbd "TAB") #'outline-toggle-children
      (kbd "z c") #'outline-hide-subtree
      (kbd "z o") #'outline-show-subtree
      (kbd "z r") #'outline-show-all
      (kbd "z m") #'hide-sublevels
      )
    )
  )
