(defconst persistence-packages
  '(undohist))

(defun persistence/init-undohist
  (use-package undohist
    :demand
    :custom
    (undohist-directory (expand-file-name "var/undohist/" dotspacemacs-directory))
    :config
    (undohist-initialize)))
