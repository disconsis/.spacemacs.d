(add-hook 'coq-mode-hook
          (defun coq-config/set-TeX-input-method ()
            (set-input-method 'TeX)))
