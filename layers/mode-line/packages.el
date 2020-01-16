(defconst mode-line-packages
  '(spaceline))


(defun mode-line/post-init-spaceline ()

  (defvar mode-line/mode-line-font nil
    "Font used for mode line if set. Format same as `dotspacemacs-default-font'.")

  (defun mode-line/fix-mode-line-minor-modes-highlighter ()
    (dolist (face '(mode-line mode-line-inactive))
      (set-face-attribute face nil
                          :family
                          "Victor Mono"
                          :height 102
                          :bold t))
          (setq powerline-height 18))
  ;; (spacemacs/add-to-hooks
  ;;  #'mode-line/fix-mode-line-minor-modes-highlighter
  ;;  '(emacs-startup-hook spacemacs-post-theme-change-hook))

  (setq spaceline-highlight-face-func 'spaceline-highlight-face-modified)

  (spaceline-define-segment current-directory
    (when default-directory
      (mode-line/tildify-path (substring default-directory 0 -1))))


  (spaceline-define-segment file-relative
    (if (not (buffer-file-name)) (buffer-name)
      (mode-line/tildify-path
       (if (not default-directory) (buffer-file-name)
         (file-relative-name (buffer-file-name) default-directory)))))


  (spaceline-define-segment version-control-styled
    "Version control information in style."
    (when (and vc-mode (buffer-file-name))
      (let* ((style
              (pcase (vc-state (buffer-file-name))
                (`up-to-date   '(""        . 'spaceline-flycheck-info))
                (`edited       '(" *"      . 'spaceline-flycheck-warning))
                (`added        '(" +"      . 'spaceline-python-venv))
                (`unregistered '(" ?"      . 'spaceline-flycheck-warning))
                (`removed      '(" -"      . 'spaceline-python-venv))
                (`needs-merge  '(" "     . 'spaceline-flycheck-warning))
                (`needs-update '(" "     . 'spaceline-flycheck-warning))
                (`ignored      '(" "     . 'default))
                (`_            '(" [???] " . 'helm-history-deleted))
                ))
             (state-str (car style))
             (state-face (cdr style)))

        (powerline-raw
         (s-trim
          (concat
           (propertize " " 'face state-face)
           (s-chop-prefixes '("Git:" "Git-") (s-trim vc-mode))
           (propertize state-str 'face state-face)))))))
    ;; (when vc-mode
    ;;   (powerline-raw
    ;;    (s-trim (concat (s-replace "Git:" " " vc-mode)
    ;;                    (when (buffer-file-name)
    ;;                      (pcase (vc-state (buffer-file-name))
    ;;                        (`up-to-date "")
    ;;                        (`edited " ")
    ;;                        (`added " ")
    ;;                        (`unregistered " ")
    ;;                        (`removed " ")
    ;;                        (`needs-merge " ")
    ;;                        (`needs-update " ")
    ;;                        (`ignored " ")
    ;;                        (_ " [???]"))))))))

  (setq spaceline-segments-left
        '(((persp-name workspace-number)
           :face highlight-face
           :priority 100)
          (anzu :priority 100)
          (current-directory
           :priority 70)
          ((file-relative (buffer-modified :when '(buffer-file-name)))
           :priority 80)
          (version-control-styled
           :when active
           :priority 78)
          ((flycheck-error flycheck-warning flycheck-info)
           :when active
           :priority 89)
          (remote-host
           :priority 98)))

  (setq spaceline-segments-right
        '((major-mode :priority 79)
          ;; (minor-modes :priority 10 :separator " ")
          (org-pomodoro :when active)
          (org-clock :when active)
          (python-pyvenv)
          (battery :when active)
          (selection-info :priority 95)
          input-method
          ((point-position
            line-column)
           :separator " | "
           :priority 96)
          (global :when active)
          (hud :priority 99)))

  (spaceline-compile
    spaceline-segments-left
    spaceline-segments-right))
