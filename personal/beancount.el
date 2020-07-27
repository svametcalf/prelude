(add-to-list 'load-path "~/lib/beancount/editors/emacs/")
(when (require 'beancount nil t)
  (add-to-list 'auto-mode-alist '("\\.beancount\\'" . beancount-mode))
  )
