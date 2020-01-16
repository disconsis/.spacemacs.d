(defconst shell-config-packages
  '(eshell vterm))

(defun shell-config/post-init-eshell ()
  (setq eshell-banner-message "")
  ;; eshell has a bug where it resets its mode map when started.
  ;; this is a workaround for that.
  (add-hook 'eshell-mode-hook
            (defun shell-config/eshell-setup-keybindings ()
              (evil-define-key 'evilified eshell-mode-map
                (kbd "<C-k>") #'eshell-previous-input
                (kbd "<C-j>") #'eshell-next-input))))

(defun shell-config/init-vterm ()
  (use-package vterm
    :defer t))
