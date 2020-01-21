(prelude-require-package 'eglot)
(require 'eglot)
(add-to-list 'eglot-server-programs '(elixir-mode "/home/schuyler/elixir-ls/release/language_server.sh"))

(add-hook 'elixir-mode-hook 'eglot-ensure)

(define-key eglot-mode-map (kbd "C-c h") 'eglot-help-at-point)
(define-key eglot-mode-map (kbd "M-.") 'xref-find-definitions)
(define-key eglot-mode-map (kbd "M-RET") 'completion-at-point)
(define-key eglot-mode-map (kbd "M-<f6>") 'eglot-rename)
(define-key eglot-mode-map (kbd "M-?") 'xref-find-references)
