(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings
                                  clojure-mode clojure-test-mode
                                  markdown-mode nrepl paredit
                                  auto-complete ac-nrepl)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; (setq auto-mode-alist (cons '("\\.cljs" . clojure-mode) auto-mode-alist))
;; (setq inferior-lisp-program "lein-cljs-repl")

;; Set up Solarized
(add-to-list 'custom-theme-load-path
             "/Users/paulcarey/.emacs.d/paulcarey/emacs-color-theme-solarized")

(load-theme 'solarized-dark t)

;; Set the default font if not in a terminal  
(if window-system
    (set-face-attribute 'default nil :font "Inconsolata-15"))

;; Disable the right meta key
;; Also see http://stackoverflow.com/questions/6344389/osx-emacs-unbind-just-the-right-alt
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

;; The starter-kit-bindings bind decrease font size to C--
;; Typing C-_ sucks
;; Apparently the default binding for C-z is Suspend Frame. Whatever.
(global-set-key (kbd "C-z") 'undo)

;; Switch between window using Shift-ArrowKey rather than having to repeat C-x o
(when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings))

;; Enable auto-completion
(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
 '(add-to-list 'ac-modes 'nrepl-mode))

;; Not sure the following is necessary
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; End auto-completion

;; Scroll a line at a time - causes error in Emacs 24
;; (set-variable scroll-conservatively 1000)

; Try this out to auto save on lose focus, from
; http://stackoverflow.com/questions/1413837/emacs-auto-save-on-switch-buffer
; (defadvice switch-to-buffer (before save-buffer-now activate)
;              (when buffer-file-name (save-buffer)))
; (defadvice other-window (before other-window-now activate)
;              (when buffer-file-name (save-buffer)))
; (defadvice other-frame (before other-frame-now activate)
;              (when buffer-file-name (save-buffer)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1056c413dd792adddc4dec20e8c9cf1907e164ae" "b0950b032aa3c8faab4864ae288296dd66b92eca" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


                                        ; nrepl config

;; Enable eldoc in clojure buffers 
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)

;; Stop the error buffer from popping up while working in the REPL buffer:
(setq nrepl-popup-stacktraces nil)

;; Make C-c C-z switch to the *nrepl* buffer in the current window:
(add-to-list 'same-window-buffer-names "*nrepl*")
