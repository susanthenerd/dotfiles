(use-package evil
    :init      ;; tweak evil's configuration before loading it
    (setq evil-want-integration t  ;; This is optional since it's already set to t by default.
	  evil-want-keybinding nil
	  evil-vsplit-window-right t
	  evil-split-window-below t
	  evil-undo-system 'undo-redo)  ;; Adds vim-like C-r redo functionality
    (evil-mode))
  (use-package evil-collection
    :after evil
    :config
    (setq evil-collection-mode-list '(dashboard dired ibuffer))
    (evil-collection-init))
  (use-package evil-tutor)

(use-package general
  :config
  (general-evil-setup)

  ;; set up 'SPC' as the global leader key
  ;; (general-create-definer dt/leader-keys
  ;;  :states '(normal insert visual emacs)
  ;;  :keymaps 'override
  ;;  :prefix "SPC" ;; set leader
  ;;  :global-prefix "M-SPC") ;; access leader in insert mode

  ;; (dt/leader-keys
  ;;  "b" '(:ignore t :wk "buffer")
  ;;  "bb" '(switch-to-buffer :wk "Switch buffer")
  ;;  "bk" '(kill-this-buffer :wk "Kill this buffer")
  ;;  "bn" '(next-buffer :wk "Next buffer")
  ;;  "bp" '(previous-buffer :wk "Previous buffer")
  ;;  "br" '(revert-buffer :wk "Reload buffer"))
)

(set-face-attribute 'default nil
  :font "FiraCode Nerd Font Mono"
  :height 130
  :weight 'medium)
(set-face-attribute 'variable-pitch nil
  :font "Fira Sans"
  :height 130
  :weight 'medium)
(set-face-attribute 'fixed-pitch nil
  :font "FiraCode Nerd Font Mono"
  :height 130
  :weight 'medium)
;; Makes commented text and keywords italics.
;; This is working in emacsclient but not emacs.
;; Your font must have an italic face available.
(set-face-attribute 'font-lock-comment-face nil
  :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
  :slant 'italic)

;; This sets the default font on all graphical frames created after restarting Emacs.
;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
;; are not right unless I also add this method of setting the default font.
(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font Mono-13"))

;; Uncomment the following line if line spacing needs adjusting.
(setq-default line-spacing 0.12)

(use-package gruvbox-theme
:ensure t
:config
;; Enable the theme
(load-theme 'gruvbox-dark-medium t))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package which-key
  :init
    (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'bottom
	which-key-sort-order #'which-key-key-order-alpha
	which-key-sort-uppercase-first nil
	which-key-add-column-padding 1
	which-key-max-display-columns nil
	which-key-min-display-lines 6
	which-key-side-window-slot -10
	which-key-side-window-max-height 0.25
	which-key-idle-delay 0.8
	which-key-max-description-length 25
	which-key-allow-imprecise-window-fit t
	which-key-separator " → " ))
