;; Configuration for syntax highlighting inside elixir files
(prelude-require-package 'mmm-mode)
(require 'mmm-mode)
(require 'web-mode)

(setq mmm-global-mode 'maybe)
(setq mmm-parse-when-idle 't)
(setq mmm-set-file-name-for-modes '(web-mode))
(custom-set-faces '(mmm-default-submode-face ((t (:background nil)))))
(let ((class 'elixir-eex)
      (submode 'web-mode)
      (front "^[ ]+~L\"\"\"")
      (back "^[ ]+\"\"\""))
  (mmm-add-classes (list (list class :submode submode :front front :back back)))
  (mmm-add-mode-ext-class 'elixir-mode nil class)
  )

(define-advice web-mode-guess-engine-and-content-type (:around (f &rest r) guess-engine-by-extension)
  (if (and buffer-file-name (equal "ex" (file-name-extension buffer-file-name)))
      (progn (setq web-mode-content-type "html")
             (setq web-mode-engine "elixir")
             (web-mode-on-engine-setted))
    (apply f r)
      )
  )

;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

(add-hook 'elixir-format-hook (lambda ()
                                (if (projectile-project-p)
                                    (setq elixir-format-arguments
                                          (list "--dot-formatter"
                                                (concat (locate-dominating-file buffer-file-name ".formatter.exs") ".formatter.exs")))
                                  (setq elixir-format-arguments nil))))
