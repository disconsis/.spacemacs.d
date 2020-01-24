(defconst helm-config-packages
  '(helm))

(defun helm-config/post-init-helm ()
  ;; skip . and .. on `helm-find-files'
  (advice-add #'helm-preselect :around #'helm-config/helm-skip-dots)
  (advice-add #'helm-ff-move-to-first-real-candidate :around #'helm-config/helm-skip-dots)
  )
