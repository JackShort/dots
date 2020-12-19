;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Short"
      user-mail-address "john.short.tj@gmail.com"

      doom-scratch-inital-major-mode 'org-mode
      doom-theme 'doom-nord
      treemacs-width 32

      display-line-numbers-type 'relative

      lsp-ui-sideline-enable nil
      lsp-enable-symbol-highlighting nil

      evil-ex-substitute-global t)

;;
;;; ORG

(setq org-directory "~/org/")

;;
;;; UI

;; "monospace" means use the system default. However, the default is usually two
;; points larger than I'd like, so I specify size 12 here.
(setq doom-font (font-spec :family "Fira Code" :size 14))

;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;;
;;; Modules

(after! ivy
  ;; I prefer search matching to be ordered; it's more precise
  (add-to-list 'ivy-re-builders-alist '(counsel-projectile-find-file . ivy--regex-plus)))

;; Switch to the new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; Tide
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;;
;;; Language customizations

(custom-theme-set-faces! 'doom-dracula
  `(markdown-code-face :background ,(doom-darken 'bg 0.075))
  `(font-lock-variable-name-face :foreground ,(doom-lighten 'magenta 0.6)))

;;
;;; Mappings
(setq x-super-keysym 'meta)

;; unmapping
(map! :after evil
      "C-e" nil)

(map! :after evil
      :map evil-motion-state-map
      "C-f" nil)

(map! "C-e" #'end-of-line)

(map! :prefix "C-f"
   :desc "New workspace" :n "c" #'+workspace/new
   :desc "Delete workspace" :n "x" #'+workspace/delete
   :desc "Rename workspace" :n "r" #'+workspace:rename
   :desc "Switch workspace" :n "." #'+workspace/switch-to
      :desc "Next workspace" :n "n" #'+workspace/switch-right
      :desc "Previous workspace" :n "p" #'+workspace/switch-left
      :desc "Switch to 1st workspace"  :n "0"   (λ! (+workspace/switch-to 0))
      :desc "Switch to 2nd workspace"  :n "1"   (λ! (+workspace/switch-to 1))
      :desc "Switch to 3rd workspace"  :n "2"   (λ! (+workspace/switch-to 2))
      :desc "Switch to 4th workspace"  :n "3"   (λ! (+workspace/switch-to 3))
      :desc "Switch to 5th workspace"  :n "4"   (λ! (+workspace/switch-to 4))
      :desc "Switch to 6th workspace"  :n "5"   (λ! (+workspace/switch-to 5))
      :desc "Switch to 7th workspace"  :n "6"   (λ! (+workspace/switch-to 6))
      :desc "Switch to 8th workspace"  :n "7"   (λ! (+workspace/switch-to 7))
      :desc "Switch to 9th workspace"  :n "8"   (λ! (+workspace/switch-to 8)))
