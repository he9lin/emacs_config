;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Load path etc.

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Load up ELPA, the package manager

(add-to-list 'load-path dotfiles-dir)

(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))

(require 'package)
(dolist (source '(("technomancy" . "http://repo.technomancy.us/emacs/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)
(require 'starter-kit-elpa)

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; backport some functionality to Emacs 22 if needed
(require 'dominating-file)

;; Load up starter kit customizations

(require 'starter-kit-defuns)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)
(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-perl)
(require 'starter-kit-ruby)
(require 'starter-kit-js)

(regen-autoloads)
(load custom-file 'noerror)

;; You can keep system- or user-specific customizations here
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-dir (concat dotfiles-dir user-login-name))
(add-to-list 'load-path user-specific-dir)

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))
(if (file-exists-p user-specific-dir)
  (mapc #'load (directory-files user-specific-dir nil ".*el$")))

;; General plugin load path
(add-to-list 'load-path "~/.emacs.d/vendor")

;; textmate mode
(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
(require 'peepopen) ;; use peepopen
(setq ns-pop-up-frames nil) ;; for peepopen
(textmate-mode)

;; cucumber feature mode
(add-to-list 'load-path "~/.emacs.d/vendor/cucumber.el")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; haml mode
(add-to-list 'load-path "~/.emacs.d/vendor/haml-mode.el")
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\.haml$" . haml-mode))

;; sass mode
(add-to-list 'load-path "~/.emacs.d/vendor/scss-mode.el")
(require 'scss-mode)

;; rspec mode
(add-to-list 'load-path "~/.emacs.d/vendor/rspec-mode.el")
(require 'rspec-mode)

;; yasnippet plugin
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet.el")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet.el/snippets")

;; coffeescript
(add-to-list 'load-path "~/.emacs.d/vendor/coffee.el")
(require 'coffee-mode)

(add-to-list 'load-path "~/.emacs.d/jump-2.el")
;;rinari
(add-to-list 'load-path "~/.emacs.d/vendor/rinari.el")
(require 'rinari)

;; (add-to-list 'load-path "~/.emacs.d/vendor/android-mode.el")
;; n(require 'android-mode)
;; (setq android-mode-sdk-dir "~/Projects/android-sdk-macosx")

;; (add-hook 'gud-mode-hook
;;   (lambda ()
;;     (add-to-list
;;      'gud-jdb-classpath "~/Projects/android-sdk-macosx/platforms/android-15/android.jar")))

;; color theme
(add-to-list 'load-path "~/.emacs.d/themes/color-theme.el")
(add-to-list 'load-path "~/.emacs.d/themes/color-theme.el/themes")
(require 'color-theme)

;; (load-file "~/.emacs.d/themes/color-theme-railscasts.el")
;; (color-theme-zenburn)
;; (color-theme-railscasts)

;; Default fonts and window size
;; (set-face-attribute 'default nil :font "Inconsolata-14")
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 210))

;; Magit
;; (require 'magit)

;;; Setup git for magit
;; (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH"))) 
;; (setq exec-path (append exec-path '("/usr/local/bin")))

;; My key bindings
(global-set-key (kbd "C-o") 'other-window)
(define-key global-map (kbd "<M-RET>") 'cua-set-rectangle-mark)

(setq default-tab-width 2)
;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
;(set-frame-parameter (selected-frame) 'alpha '(95 50))
;(add-to-list 'default-frame-alist '(alpha 95 50))

;;; init.el ends here

