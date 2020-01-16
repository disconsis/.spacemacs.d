(defconst evil-config-packages
  '(evil))

(defun evil-config/post-init-evil ()

  ;; sane window splitting
  (setq
   evil-split-window-below t
   evil-vsplit-window-right t)

  ;; stop printing evil state everywhere
  (setq evil-echo-state nil)

  ;; vim-like searching
  ;; TODO: make () magic
  (setq evil-search-module 'evil-search)
  (setq evil-ex-search-vim-style-regexp t)
  (setq evil-magic 'very-magic)

  )
