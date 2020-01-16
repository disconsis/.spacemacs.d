(defconst theme-config-packages
  '(doom-themes
    green-screen-theme
    gruvbox-theme
    sublime-themes
    ))

(defun theme-config/init-doom-themes ()
  (use-package doom-themes
    :defer t
    :config
    (add-to-list 'theming-modifications
                 '(doom-one
                   (outline-1 :background nil)
                   (font-latex-verbatim-face :italic nil)))))

(defun theme-config/init-green-screen-theme ()
  ;; adding a `use-package' form enables the theme

  (add-to-list 'theming-modifications
               '(green-screen
                 (linum :background nil))))

(defun theme-config/post-init-gruvbox-theme ()
  (add-to-list 'theming-modifications
               '(gruvbox-light-soft
                 (line-number-current-line :foreground nil))))

(defun theme-config/post-init-sublime-themes ()
  (add-to-list 'theming-modifications
               '(mccarthy
                 (hl-line :background "white" :underline nil)
                 (show-paren-match :background nil :foreground nil :inherit 'diff-hl-change)
                 )))
