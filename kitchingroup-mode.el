;;; kitchingroup-mode --- Summary
;;;
;;;
;;; Commentary:
;;; some utilities for the kitchingroup
;;;


(require 'easymenu)


(defvar kitchingroup-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c e") '(lambda () (ding)))
    (define-key map (kbd "s-m m") 'magit-status)
    (define-key map (kbd "s-m l") 'magit-log)
    (define-key map (kbd "s-m f") 'magit-file-log)
    (define-key map (kbd "s-m b") 'magit-blame-mode)

    map)
  "Keymap for kitchingroup mode.")


(defun find-non-ascii-characters ()
  (interactive)
  (occur "[^[:ascii:]]"))

(defun kg-open-my-org ()
  "Open my org-file

you have to define `my-kitchingroup-org-file' in your init files"
  (find-file my-kitchingroup-org-file))

(easy-menu-define my-menu kitchingroup-mode-map "My own menu"
  '("KitchinGroup"
    ("email"
    ["email region" email-region t]
    ["email org-mode heading" email-heading t])
    ("org-mode"
     ("export"
      ["manuscript PDF" ox-manuscript-export-and-build-and-open t]
      ["submission PDF" ox-manuscript-build-submission-manuscript-and-open t]
      ))
    ("bibtex"
     ["find non-ascii characters" find-non-ascii-characters t]
     ["reformat entry" bibtex-reformat t]
     ["clean entry" bibtex-clean-entry t]
     ["validate bibtex file" bibtex-validate-globally t]
     ["build bibliography pdf" jb-build-full-bibliography t])))


(define-minor-mode kitchingroup-mode
  "Minor mode for kitchingroup

\\{kitchingroup-mode-map}"
  :lighter " KG"
  :keymap kitchingroup-mode-map)

(provide 'kitchingroup-mode)
;;; kitchingroup-mode.el ends here
