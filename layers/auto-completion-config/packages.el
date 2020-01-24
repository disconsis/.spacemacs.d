(defconst auto-completion-config-packages
    '(company-posframe))

(defun auto-completion-config/init-company-posframe ()
  (use-package company-posframe
    :defer t
    :hook (company-mode . company-posframe-mode)))
