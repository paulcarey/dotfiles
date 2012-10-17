(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings
                                  clojure-mode clojure-test-mode
                                  markdown-mode nrepl)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq auto-mode-alist (cons '("\\.cljs" . clojure-mode) auto-mode-alist))

(setq inferior-lisp-program "lein-cljs-repl")

;; Set up Solarized
(add-to-list 'custom-theme-load-path
             "/Users/paulcarey/.emacs.d/paulcarey/emacs-color-theme-solarized")

(load-theme 'solarized-light t)

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

;; Scroll a line at a time
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
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1056c413dd792adddc4dec20e8c9cf1907e164ae" "b0950b032aa3c8faab4864ae288296dd66b92eca" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
