(defconst coq-config-packages
  '(proof-general))


(defun coq-config/init-proof-general ()
  (use-package proof-general
    :defer t
    :init
    (setq proof-splash-enable nil)
    (setq coq-compile-before-require t)
    (spacemacs/set-leader-keys-for-major-mode 'coq-mode
      "n" #'proof-assert-next-command-interactive
      "." #'proof-goto-point
      "b" #'proof-process-buffer
      ">" #'proof-autosend-toggle
      "R" #'proof-retract-buffer
      "f" #'proof-find-theorems
      "l" #'proof-layout-windows
      "p" #'coq-Print
      "s" #'coq-SearchAbout
      "a" #'coq-About
      )

    (evil-define-key 'normal coq-mode-map
      (kbd "C-r") #'undo-tree-redo)
    ))
