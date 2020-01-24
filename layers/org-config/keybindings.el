(spacemacs/set-leader-keys-for-major-mode 'org-mode
  "i s" #'org-insert-structure-template)

;; restore `-' to vinegar-ish behaviour
(evil-define-key 'normal org-mode-map
  "-" #'dired-jump
  "+" #'org-cycle-list-bullet)

(evil-define-key 'normal evil-org-mode-map
  "-" #'dired-jump
  "+" #'org-cycle-list-bullet)

(evil-define-key 'insert evil-org-mode-map
  (kbd "C-t") #'org-config/org-metaright-or-evil-shift-right-line)
