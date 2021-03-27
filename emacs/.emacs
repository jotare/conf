;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs                                                           ;;
;; Author: jare                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Uncomment next line or set SPACEMACS env var to "1" to boot emacs
;; with .spacemacs configuration

;; (setenv "SPACEMACS" "1")
(when (string= (getenv "SPACEMACS") "1")
  (setq user-emacs-directory "~/.spacemacs.d/")
  (load (expand-file-name "init.el" user-emacs-directory))
  (with-current-buffer " *load*"
    (goto-char (point-max))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Generic configuration                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(toggle-debug-on-error)

;; line numbering
(global-linum-mode t)
(column-number-mode t)

;; enable disabled commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; hooks
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'sgml-mode-hook (lambda () (auto-fill-mode -1)))

;; major-mode for non-standard file extensions
(add-to-list 'auto-mode-alist '("\\.pt$\\'" . mhtml-mode)) ; TAL template file
(add-to-list 'auto-mode-alist '("\\.plt$\\'" . gnuplot-mode)) ; GnuPlot files
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode)) ; Octave (overwrite Obj-C)

;; (desktop-save-mode 1)			; save emacs desktop on exit
;; (setq desktop-load-locked-desktop nil)

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/" t)
(if (locate-file (concat (symbol-name 'custom-srcery) "-theme.el")
                 custom-theme-load-path '("" "c"))
    (load-theme 'custom-srcery t)
  (progn
    (message "Can't load custom-srcery theme :(")
    (load-theme 'wombat t)))


;; ---------------------------------------------------------------- ;;
;; Built-in modes                                                   ;;
;; ---------------------------------------------------------------- ;;

;; org-mode
(add-hook 'org-mode-hook (lambda () (local-set-key (kbd "C-c a") 'org-agenda)))
(setq org-agenda-start-on-weekday nil)	; don't start on a fixed day
(setq org-agenda-span 10) 		; show 10 days instead of a week

(require 'ob-shell)			; execute code in <sTAB env w/ C-c C-c
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (shell . t) (python . t) (perl . t) (octave . t) ; programming
   (ditaa . t) (dot . t)			    ; graphics
  ))

;; tramp
(setq tramp-default-method "ssh")	; faster than the default scp


;; ---------------------------------------------------------------- ;;
;; Programming languages                                            ;;
;; ---------------------------------------------------------------- ;;

;; C
(setq c-basic-offset 4)

;; LaTeX (need installing auctex)
;; turn-on reftex when auctex active
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; Python
(set-variable 'python-shell-interpreter "/usr/bin/python3") ; C-c C-p

;; SGML
;; (setq sgml-basic-offset 4)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package infraestructure                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initialize the package infraestructure. This must come before
;; configurations of installed packages.  Don't delete this line.  If
;; you don't want it, just comment it out by adding a semicolon to the
;; start of the line.

(require 'package)

(setq package-archives
      '(("melpa-stable" . "https://stable.melpa.org/packages/")
	("gnu-elpa" . "http://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")
	))

(setq package-archive-priorities
      '(("melpa-stable" . 3) ("gnu-elpa"     . 2) ("melpa"        . 1)))

;; Set the directory where you want to install the packages
(setq package-user-dir (concat user-emacs-directory "elpa/"))

(package-initialize)
;;(package-refresh-contents)


;; ---------------------------------------------------------------- ;;
;; Package configurations                                           ;;
;; ---------------------------------------------------------------- ;;

;; auto-complete
(require 'auto-complete)
(add-hook 'prog-mode-hook 'auto-complete-mode)

(define-key ac-mode-map (kbd "M-/") 'auto-complete)
;; (define-key ac-mode-map (kbd "TAB") 'auto-complete)
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-g" 'ac-stop)

(ac-linum-workaround)
(setq
 ac-auto-show-menu   0.3
 ac-auto-start       nil
 ac-auto-show-meun   nil)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; projectile
;; (require 'projectile)
;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom                                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (
     ;; languages
     bnf-mode
     cmake-mode
     dockerfile-mode
     gitignore-mode
     gnuplot
     groovy-mode
     jade-mode
     jenkinsfile-mode
     json-mode
     markdown-mode
     pug-mode
     sparql-mode
     typescript-mode
     yaml-mode

     ;; themes
     kaolin-themes
     monokai-theme
     srcery-theme

     ;; useful misc packages
     auto-complete
     flycheck
     ;; helm
     magit
     projectile
     undo-tree
     )))

  '(safe-local-variable-values
   (quote
    ((encoding . utf-8)
     (python-shell-interpreter . "~/.venv/bin/python")
     (eval TeX-run-style-hooks "beamer"))))
  )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Help and comments                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use (load "file.el") or (load "file.elc") to load additional
;; configuration files, function definitions, themes...

;; Execute this the first time to install packages
;; (package-list-packages)
;; (package-refresh-contents)
;; (package-install-selected-packages)

