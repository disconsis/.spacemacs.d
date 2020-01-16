;; better window keys
(spacemacs/set-leader-keys
  "w s" #'evil-window-split
  "w v" #'evil-window-vsplit
  "w o" #'delete-other-windows
  "w '" 'spacemacs/alternate-window)

;; revert to substitute/surround keys
(evil-define-key 'visual evil-surround-mode-map
  "s" #'evil-substitute
  "S" #'evil-surround-region)

;; arrow-key scrolling for when I'm feeling lazy
(evil-define-key 'normal 'global
  (kbd "<up>") #'evil-scroll-line-up
  (kbd "<down>") #'evil-scroll-line-down)

;; unimpaired-style search highlight toggles
(evil-define-key 'normal 'global
  (kbd "[ h") (defun evil-hl-persist-off () (interactive)
                     (spacemacs/evil-search-clear-highlight)
                     (turn-off-search-highlight-persist))
  (kbd "] h") (defun evil-hl-persist-on () (interactive)
                     (turn-on-search-highlight-persist)))

(evil-define-key 'normal prog-mode-map
  (kbd "TAB") #'evil-toggle-fold)
