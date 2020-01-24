(defconst git-config-packages
  '(git-gutter
    ;; git-gutter+
    ;; git-gutter-fringe
    git-gutter-fringe+
    magit))


(defun git-config/post-init-magit ()
  (spacemacs/set-leader-keys
    "a m" #'magit))


(defun git-config/post-init-git-gutter ()
  (setq git-gutter:hide-gutter t))


(defun git-config/post-init-git-gutter-fringe+ ()
  (setq git-gutter-fr+-side 'left-fringe)
  (spacemacs/add-to-hooks
   (defun git-config/git-gutter-fr+-set-fringe-symbols ()
     (let ((vertical-line-fringe-symbol '("....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX"
                                          "....XXX")))
       (dolist (name '(git-gutter-fr+-added git-gutter-fr+-modified))
       (eval (macroexpand `(fringe-helper-define name nil ,@vertical-line-fringe-symbol)))))

     (fringe-helper-define 'git-gutter-fr+-deleted nil
       "............."
       "...XXXXXXXXXX"
       "...XXXXXXXXXX"
       "............."
       ))
   '(spacemacs-post-user-config-hook spacemacs-post-theme-change-hook)))
