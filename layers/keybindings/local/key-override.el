(defvar key-override-mode-map (make-sparse-keymap))

;;;###autoload
(define-minor-mode key-override-mode
  :init-value t
  :keymap key-override-mode-map)


;;;###autoload
(define-globalized-minor-mode global-key-override-mode
  key-override-mode key-override-mode)

(add-to-list 'emulation-mode-map-alists
             `((key-override-mode . ,key-override-mode-map)))

(defun turn-off-key-override-mode ()
  "Turn off key-override-mode."
  (key-override-mode -1))

(add-hook 'minibuffer-setup-hook
          #'turn-off-key-override-mode)


(provide 'key-override)
