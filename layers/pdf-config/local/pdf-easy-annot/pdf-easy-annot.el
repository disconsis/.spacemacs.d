(require 'pdf-tools)

(define-minor-mode pdf-easy-highlight-minor-mode
  :lighter "ezH"
  (if pdf-easy-highlight-minor-mode
      (turn-on-pdf-easy-highlight-minor-mode)
    (turn-off-pdf-easy-highlight-minor-mode)))

(defun turn-on-pdf-easy-highlight-minor-mode ()
  )

(defun turn-off-pdf-easy-highlight-minor-mode ()
  )

(provide 'pdf-easy-annot)
