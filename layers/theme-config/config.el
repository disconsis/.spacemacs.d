;; font
(set-face-attribute 'variable-pitch nil :family "ETBembo" :height 1.2)
(set-face-attribute 'fixed-pitch nil :family 'unspecified :slant 'normal)
(set-fontset-font "fontset-default" '(#x2500 . #x2570)
                                    (font-spec :family "Iosevka Term SS06"))

(spacemacs/add-to-hooks
 (defun theme-config/set-fringe-and-number-bg-to-nil ()
   (set-face-attribute 'fringe nil :background nil)
   (set-face-attribute 'line-number nil :background nil))
 '(spacemacs-post-user-config-hook spacemacs-post-theme-change-hook))
