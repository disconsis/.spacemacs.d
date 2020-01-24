(defconst org-config-packages
  '(org mixed-pitch))

(defun org-config/post-init-org ()
  ;; org agenda
  (setq org-agenda-files '("~/tmp/todo.org"))

  ;; store org-latex-preview images in a cache
  (setq org-preview-latex-image-directory (expand-file-name "var/ltximg/" user-emacs-directory))

  ;;; org latex preview reasonable sized
  (setq org-format-latex-options '(:foreground default
                                   :background default
                                   :scale 1.5
                                   :html-foreground "Black"
                                   :html-background "Transparent"
                                   :html-scale 1.0
                                   :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))

  (setq org-fontify-done-headline t)

  ;; startup options
  (setq org-startup-indented t)
  (setq org-startup-with-inline-images t)
  (setq org-startup-with-latex-preview t)
  (setq org-startup-folded nil)

  ;; better emphasize ~this~
  (setq org-emphasis-alist
        '(("*" bold)
          ("/" italic)
          ("=" org-verbatim verbatim)
          ("~" org-kbd)
          ("+" :strike-through t)))

  ;; hide emphasis markers
  (setq
   org-hide-emphasis-markers t  ;; sure? try to remove it for the current line
   org-catch-invisible-edits 'show-and-error)

  ;; ;; theming
  ;; (add-hook 'org-mode-hook
  ;;           (lambda ()
  ;;             (variable-pitch-mode)))

  ;; (spacemacs/add-to-hooks
  ;;  (defun org-config/set-fixed-pitch-faces-for-variable-pitch-mode ()
  ;;    (set-face-attribute 'org-indent nil :foreground "red" :inherit (org-hide fixed-pitch))))

  ;; (defun org-show-emphasis-markers-at-point ()
  ;;   (save-match-data
  ;;     (if (and (org-in-regexp org-emph-re 2)
  ;;              (>= (point) (match-beginning 3))
  ;;              (<= (point) (match-end 4))
  ;;              (member (match-string 3) (mapcar 'car org-emphasis-alist)))
  ;;         (with-silent-modifications
  ;;           (remove-text-properties
  ;;            (match-beginning 3) (match-beginning 5)
  ;;            '(invisible org-link)))
  ;;       (apply 'font-lock-flush (list (match-beginning 3) (match-beginning 5))))))

  ;; (add-hook 'org-mode-hook
  ;;           (add-hook 'post-command-hook 'org-show-emphasis-markers-at-point t t))


  )

(defun org-config/init-mixed-pitch ()
  (use-package mixed-pitch
    :defer t
    :hook (org-mode . mixed-pitch-mode)))
