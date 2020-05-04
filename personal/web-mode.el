;; configures web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.l?eex\\'" . web-mode))

(defun customize-web-mode-hook ()
  "Hooks for custom web mode"
  (setq web-mode-markup-indent-offset 2)
)

(add-hook 'web-mode-hook 'customize-web-mode-hook)
