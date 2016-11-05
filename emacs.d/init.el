;; MELPA
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; install packages
(defvar packages
  '(elixir-mode
    elpy
    flycheck
    go-mode
    haskell-mode
    markdown-mode
    py-autopep8
    salt-mode
    terraform-mode))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
            packages)

;; basic customization
(setq inhibit-startup-message t)
(global-linum-mode t) ;; Turn line numbers on
(menu-bar-mode -1)    ;; Turn the menu bar off
(tool-bar-mode -1)
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(setq-default indent-tabs-mode nil) ;; Use spaces instead of tabs
(setq tab-stop-list (number-sequence 2 60 2))
(load-theme 'seti t)

;; add brew installed stuff to path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; backup files
(setq
 backup-by-copying t
 backup-directory-alist
 '(("." . "~/.saves"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;; golang
(add-hook 'before-save-hook #'gofmt-before-save)

;; python
(elpy-enable)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c4d3da0593914fff8fd2fbea89452f1a767893c578b219e352c763680d278762" "810ab30a73c460f5c49ede85d1b9af3429ff2dff652534518fa1de7adc83d0f6" "f9574c9ede3f64d57b3aa9b9cef621d54e2e503f4d75d8613cbcc4ca1c962c21" default)))
 '(package-selected-packages
   (quote
    (seti-theme naquadah-theme abyss-theme terraform-mode salt-mode py-autopep8 markdown-mode flycheck elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
