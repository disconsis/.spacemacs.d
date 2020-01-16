(defun mode-line/tildify-path (PATH)
  "Replace $HOME with ~ in file path PATH."
  (let ((home (getenv "HOME")))
    (if (string-prefix-p home PATH)
        (s-replace home "~" PATH)
      PATH)))
