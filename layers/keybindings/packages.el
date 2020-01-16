(defconst keybindings-packages
  '(general
    (key-override :location local)))

(defun keybindings/init-general ()
  (use-package general
    :defer t))

(defun keybindings/init-key-override ()
  (use-package key-override
    :defer t
    :config
    (global-key-override-mode 1)))
