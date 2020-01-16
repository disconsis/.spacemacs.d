(setq
 shell-default-shell 'eshell
 shell-default-term-shell "/usr/bin/bash"
 shell-default-height 30
 shell-default-position 'bottom)

(add-hook 'eshell-mode-hook
          (lambda ()
            (setq eshell-prompt-function #'epe-theme-dakrone)))
