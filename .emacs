(add-to-list 'load-path "~/.emacs.d/lisp")

(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(require 'package)

(add-to-list 'package-archives
             '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'cython-mode "cython-mode" "Cython Mode." t)
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxd\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxi\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(global-flycheck-mode 1)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(require 'uniquify)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq create-lockfiles nil)
(setq js-indent-level 2)
(require 'coffee-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-enabled-themes1 (quote (tango-dark)))
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "test" "tests")))
 '(js-indent-level 2 t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(x-select-enable-clipboard t))
(global-auto-revert-mode t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-9") 'delete-window)
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-i") 'previous-multiframe-window)
(fset 'settrace
   "import ipdb;ipdb.set_trace()\C-i")
(global-set-key (kbd "<f9>") 'settrace)

(add-hook 'term-mode-hook
          (lambda()
            (define-key term-raw-map (kbd "C-x") 'nil)
            (define-key term-raw-map (kbd "M-x") 'nil)
            (define-key term-raw-map (kbd "M-i") 'nil)
            (define-key term-raw-map (kbd "M-o") 'nil)
            (define-key term-raw-map (kbd "M-9") 'nil)
            (define-key term-raw-map (kbd "C-M-h") 'nil)
            (define-key term-raw-map (kbd "C-y") 'term-paste)
            )
          )
(defvar ansi-term-color-vector
  [term
   term-color-black
   term-color-red
   term-color-green
   term-color-yellow
   term-color-blue
   term-color-magenta
   term-color-cyan
   term-color-white])

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
     '(term-color-black ((t (:background "gray100" :foreground "gray100"))))
     '(term-color-blue ((t (:background "blue2" :foreground "cadet blue"))))
     '(term-color-magenta ((t (:background "color-207" :foreground "color-207"))))
     '(term-color-red ((t (:background "color-175" :foreground "OrangeRed1"))))
     '(term-color-yellow ((t (:background "color-227" :foreground "color-227")))))
