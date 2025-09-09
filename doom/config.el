(setq doom-font (font-spec :family "JetBrains Mono" :size 15))

(after! evil

  (dolist (map '(evil-normal-state-map
                 evil-visual-state-map
                 evil-motion-state-map))
    (define-key (symbol-value map) (kbd "o") nil)
    (define-key (symbol-value map) (kbd "O") nil)
    (define-key (symbol-value map) (kbd "i") nil))

  (map! :m "n" #'evil-backward-char
        :m "e" #'evil-next-line
        :m "i" #'evil-previous-line
        :m "o" #'evil-forward-char

        :n "n" #'evil-backward-char
        :n "e" #'evil-next-line
        :n "i" #'evil-previous-line
        :n "o" #'evil-forward-char

        :v "n" #'evil-backward-char
        :v "e" #'evil-next-line
        :v "i" #'evil-previous-line
        :v "o" #'evil-forward-char)

  (map! :n "gi" #'evil-insert-state
        :n "gI" #'evil-open-below))

(after! evil-org
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-define-key 'normal evil-org-mode-map (kbd "o") #'evil-forward-char)
              (evil-define-key 'normal evil-org-mode-map (kbd "O") nil)
              (evil-define-key 'visual evil-org-mode-map (kbd "o") #'evil-forward-char)
              (evil-define-key 'visual evil-org-mode-map (kbd "O") nil)
              (evil-define-key 'normal evil-org-mode-map (kbd "gi") #'evil-insert-state)
              (evil-define-key 'normal evil-org-mode-map (kbd "gI") #'evil-open-below)
              (evil-define-key 'visual evil-org-mode-map (kbd "i") #'evil-previous-line)
              (when (fboundp 'evil-normalize-keymaps)
                (evil-normalize-keymaps)))))

(after! magit
  (evil-define-key 'normal magit-status-mode-map
    "n" 'evil-next-line
    "e" 'evil-previous-line
    "i" 'evil-next-visual-line
    "o" 'evil-previous-line)
  (evil-define-key 'normal magit-log-mode-map
    "n" 'evil-next-line
    "e" 'evil-previous-line)
  (evil-define-key 'normal magit-diff-mode-map
    "n" 'evil-next-line
    "e" 'evil-previous-line))

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

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(defun my/apply-frame-settings (frame)
  (with-selected-frame frame
    (set-frame-parameter frame 'fullscreen 'maximized)
    (set-frame-parameter frame 'alpha-background 95)))
(add-hook 'after-make-frame-functions #'my/apply-frame-settings)

(setq display-line-numbers t)
(setq confirm-kill-emacs nil)
