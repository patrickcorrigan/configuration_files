(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defvar my-term-shell "/bin/zsh")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(require 'package)                      
(push '("melpa" . "http://melpa.milkbox.net/packages/")
    package-archives)
(package-initialize)

(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))


; Evil
(require 'evil)
(evil-mode 1)
(evil-commentary-default-setup)

; Evil leader
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "f" 'find-file
  "b" 'switch-to-buffer
  "x" 'execute-extended-command
  "k" 'kill-buffer
  "q" 'delete-window
  "p" 'clipboard-yank
  "w"  'evil-write
  "s"  'ansi-term
  ";"  'switch-to-previous-buffer)

; Remove GUI
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

; General Emacs settings
(setq vc-follow-symlinks nil) 
(global-linum-mode t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(global-hl-line-mode 1)
(set-face-background 'hl-line "#e3e3e3")
(set-face-background 'isearch "#00BFFF")
(set-face-foreground 'isearch "#FFFFFF")
(set-face-foreground 'lazy-highlight "#FFFFFF")
(set-face-background 'lazy-highlight "#00BFFF")
(require 'ido)
(ido-mode t)
(set-default-font "Source Code Pro 10")
(setq-default truncate-lines t)
(global-font-lock-mode -1) 

; KeyChord
(require 'key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
(global-set-key (kbd "M-h") 'evil-window-left)
(global-set-key (kbd "M-l") 'evil-window-right)
(global-set-key (kbd "M-j") 'evil-window-down)
(global-set-key (kbd "M-k") 'evil-window-up)
(global-set-key (kbd "M-n") 'next-buffer)
(global-set-key (kbd "M-p") 'previous-buffer)




(sml/setup)
(sml/apply-theme 'light)

;; (require 'powerline)
;; (powerline-center-theme)

(setq menu-prompting nil)
(setq-default indent-tabs-mode nil)
(require 'whitespace)
(nyan-mode)

(ac-config-default)
