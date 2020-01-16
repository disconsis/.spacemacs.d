(defconst pdf-config-packages
  '(pdf-tools
    (pdf-easy-annot :location local)))

(defun pdf-config/post-init-pdf-tools ()
  (setq pdf-view-display-size 'fit-page)
  (setq pdf-view-resize-factor 1.1)

  ;; save pdf on committing an annotation
  (advice-add #'pdf-annot-edit-contents-commit
              :after
              (defun my/save-buffer-no-args (&optional args)
                (save-buffer)))

  ;; `pdf-sync-minor-mode' causes hanging on mouse events
  (add-hook 'pdf-tools-enabled-hook
            (defun pdf-config/disable-pdf-sync-minor-mode ()
              (setq pdf-tools-enabled-modes
                    (remove 'pdf-sync-minor-mode pdf-tools-enabled-modes))))

  ;; change `pdf-midnight-minor-mode' color to current theme's
  (spacemacs/add-to-hooks
   #'pdf-config/match-midnight-colors-to-theme
   '(emacs-startup-hook spacemacs/post-theme-change-hook))

  ;; white cursor from around pdf
  (evil-set-initial-state 'pdf-view-mode 'emacs)
  (add-hook 'pdf-view-mode-hook
            (defun pdf-config/disable-cursor ()
              (dolist (cursor '(evil-emacs-state-cursor evil-evilified-state-cursor))
               (set (make-local-variable cursor) '("White" box)))))

  (evil-define-key 'evilified pdf-view-mode-map (kbd "h") #'pdf-view-previous-page)
  (evil-define-key 'evilified pdf-view-mode-map (kbd "l") #'pdf-view-next-page)
  )

(defun pdf-config/init-pdf-easy-annot ()
  (use-package pdf-easy-annot
    :defer t))
