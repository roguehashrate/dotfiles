(setq doom-font (font-spec :family "JetBrains Mono" :size 15))

(after! evil
  (map! :n "n" #'evil-backward-char
        :n "e" #'evil-next-line
        :n "i" #'evil-previous-line
        :n "o" #'evil-forward-char)

  (map! :v "n" #'evil-backward-char
        :v "e" #'evil-next-line
        :v "i" #'evil-previous-line
        :v "o" #'evil-forward-char)

  (define-key evil-normal-state-map (kbd "gi") #'evil-insert-state))

(setq org-directory "~/org/")
(setq org-modern-table-vertical 1)
(setq org-modern-table t)
(add-hook 'org-mode-hook #'hl-todo-mode)

(custom-theme-set-faces!
  'doom-one
  '(org-level-8 :inherit outline-3 :height 1.0)
  '(org-level-7 :inherit outline-3 :height 1.0)
  '(org-level-6 :inherit outline-3 :height 1.1)
  '(org-level-5 :inherit outline-3 :height 1.2)
  '(org-level-4 :inherit outline-3 :height 1.3)
  '(org-level-3 :inherit outline-3 :height 1.4)
  '(org-level-2 :inherit outline-2 :height 1.5)
  '(org-level-1 :inherit outline-1 :height 1.6)
  '(org-document-title :height 1.8 :bold t :underline nil))

(map! :leader
      :desc "Comment line" "-" #'comment-line)
(map! :leader
      :desc "Eshell" "e" #'eshell)

(setq display-line-numbers t)
(setq confirm-kill-emacs nil)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
