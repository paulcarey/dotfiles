(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings
                                  clojure-mode clojure-test-mode
                                  markdown-mode)
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
