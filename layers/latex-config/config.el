(setq
 TeX-view-program-selection '((output-pdf "PDF Tools"))
 TeX-source-correlate-start-server t
 ;; TeX-PDF-from-DVI "Dvips" ;; WARNING: using this messes up previews
 preview-auto-cache-preamble t
 )

(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

(setq-default preview-scale-function 1.2)

;; (setq latex-build-command "pdflatex -shell-escape")
