(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path
     (list (expand-file-name "layers/" dotspacemacs-directory))
   dotspacemacs-configuration-layers
   '(
     ;; config helpers
     keybindings

     ;; editing
     evil-config

     ;; file system
     vinegar

     ;; terminal
     shell-config

     ;; features
     helm
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip t)
     (syntax-checking
     :enabled-for prog-mode)
     folding
     persistence
     helm-config

     ;; version control
     (version-control
      :variables
      version-control-diff-tool 'git-gutter+
      version-control-diff-side 'left)
     git
     git-config

     ;; display
     theme-config
     mode-line

     ;; languages/file-types
     org-config
     emacs-lisp
     markdown
     pdf-config
     latex-config
     python
     haskell
     racket
     sml
     csv
     coq-config
     grasshopper
     yaml
     vimscript

     ;; applications
     myleetcode)

   dotspacemacs-additional-packages '(scala-mode)
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))


(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (bookmarks . 5)
                                (projects . 5))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'emacs-lisp-mode
   dotspacemacs-themes '(
                         doom-one
                         jbeans
                         seti
                         gruvbox-light-soft
                         )
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '(
                               ("Iosevka Term SS06"
                                :size 15
                                :weight normal
                                :powerline-scale 1.2)

                               ("Victor Mono"
                                :size 12
                                :weight semi-bold
                                :powerline-scale 1.2)

                               ("curie" :powerline-scale 1.2)
                               )
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab t
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar nil
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'trailing))


(defun dotspacemacs/user-init ()
  ;; prevent hanging on start
  (setq exec-path-from-shell-arguments '("-c"))
  (setq evil-want-abbrev-expand-on-insert-exit nil)
  ;; stash customize variables elsewhere
  (setq custom-file (expand-file-name "var/custom.el" dotspacemacs-directory))
  (load custom-file 'noerror))


(defun dotspacemacs/user-config ()
  ;; frame title
  (setq frame-title-format
        '((:eval (string-join
                  `("emacs: "
                    ,(if (buffer-file-name)
                         (abbreviate-file-name (buffer-file-name))
                       "%b"))))))

  ;; apropos help
  (spacemacs/declare-prefix "h a" "help-apropos")
  (spacemacs/set-leader-keys
    "h a v" #'apropos-variable
    "h a m" #'apropos-mode
    "h a c" #'apropos-command
    "h a f" #'apropos-command
    "h a u" #'apropos-user-option
    "h a l" #'apropos-library)

  ;; ada
  (setq ada-auto-case nil)

  ;; fix line numbering
  ;; use `display-line-numbers-mode' instead of spacemacs' default
  (defun my/toggle-relative-numbering ()
    (interactive)
    (cond
     ((not display-line-numbers-mode) (progn (setq display-line-numbers-type 'visual)
                                             (display-line-numbers-mode)))
     ((equal display-line-numbers 'visual) (setq display-line-numbers t))
     (t (setq display-line-numbers 'visual))))

  (setq display-line-numbers-type t)
  (add-hook 'prog-mode-hook #'display-line-numbers-mode)

  (spacemacs/set-leader-keys
    "t n" #'display-line-numbers-mode
    "t r" #'my/toggle-relative-numbering)


  ;; set snippet directory to `.spacemacs.d/snippets'
  (push (expand-file-name "snippets" dotspacemacs-directory) yas-snippet-dirs)

  ;; snippet keys
  (evil-define-key 'insert 'global
    (kbd "TAB") #'yas-next-field
    (kbd "S-TAB") #'yas-prev-field)

  ;; remove final newline from snippets
  (add-hook 'snippet-mode-hook
            (defun my/disable-final-newline ()
                (setq-local require-final-newline nil)))

  ;; highlight matching parentheses
  (setq show-paren-delay 0)
  (show-paren-mode)

  ;; agenda
  (add-to-list 'org-agenda-files "~/tmp/todo.org")
  (add-to-list 'org-agenda-files "~/internship/notes.org")

  ;; forward/back in insert mode
  (evil-define-key 'insert 'global
     (kbd "C-b") #'left-char
     (kbd "C-f") #'right-char)
  )
