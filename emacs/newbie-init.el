;; File: .emacs
;; Author: Joan Antoni RE <joanantoni.re16@gmail.com>
;;
;; Les configuracions d'aquest fitxer són un intent que l'entrada al
;; infinit univers d'Emacs sigui més senzilla pels newbies. Totes les
;; configuracions venen acompanyades d'una petita explicació per
;; introduir al lector interessat en el món de les configuracions amb
;; ELisp.
;;
;; Diverteix-te modificant i extenent el teu Emacs fins a llocs que
;; mai hauries imaginat :)
;;
;; Per qualsevol suggerència, podeu proposar-la a
;; https://github.com/jotare/conf (emacs/newbie-init.el) o enviar-me
;; un correu.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuració general                                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq
 inhibit-startup-message t
 ring-bell-function 'ignore)
(tool-bar-mode -1)

;; numeració de línies i columnes
(global-linum-mode t)
(column-number-mode t)

;; plegat i desplegat de codi, tot i que de formes poc convencials
(add-hook 'prog-mode-hook 'outline-minor-mode)

;; LaTeX (cal tenir instal·lar al sistema el paquet 'auctex')
;; turn-on reftex when auctex active
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Infraestructura de packets                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs conté un gestor de paquets accessible amb M-x
;; package-list-packages. Des d'allà es poden instal·lar, actualitzar
;; i eliminar paquets.
;; A més dels paquets per defecte, es poden afegir arxius com MELPA,
;; on s'hi troben una infinitat de paquets de la comunitat.
(require 'package)

;; workaround per problemes amb 'Bad Request' al instal·lar paquets en
;; versions antigues d'Emacs
(when (and (>= libgnutls-version 30603)
            (version<= (number-to-string emacs-major-version) "26.2"))
   (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

;; configurem el directori on s'instal·laran els paquets
(setq package-user-dir (concat user-emacs-directory "elpa/"))

;; melpa-stable conté només les versions que els mantenidors han
;; etiquetat com release. Comenta una de les línies per tenir només un
;; dels archives.
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; carrega i activa els paquets
(package-initialize)

(defvar paquets-inicials '(better-defaults company dashboard
  doom-themes undo-tree use-package which-key yasnippet
  yasnippet-snippets))

(unless package-archive-contents
  (package-refresh-contents))

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      paquets-inicials)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuració de paquets                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'use-package)

;; millores de configuracions que en un inici, poden ser una mica
;; difícils o confoses
(use-package better-defaults)

;; autocompletat activat pels modes de programació
(use-package company
  :hook (prog-mode . company-mode)
  :bind (:map company-mode-map
	      ("M-/" . company-complete))
  :init
  (setq
   company-idle-delay 0.5
   company-minimum-prefix-length 3))


;; dashboard ens aporta una pantalla inicial una mica més fancy
(use-package dashboard
  :ensure t
  :init
  (setq
   dashboard-startup-banner 'logo
   dashboard-center-content t)
  :config
  (dashboard-setup-startup-hook))


;; doom-themes ens dóna una gran quantitat de temes. Per canviar-los
;; podem fer M-x customize-themes i elegir-ne un, o més!
(use-package doom-themes
  :init
  (setq
   doom-themes-enable-bold t
   doom-themes-enable-italic t)
  :config
  (load-theme 'doom-one t nil))


;; undo-tree és un mode heretat de vim que permet veure els canvis com
;; un arbre. A partir d'ara, 'C-/' o 'C-_' per undo, 'M-_' per redo i
;; 'C-x u' per veure l'arbre
(use-package undo-tree
  :config
  (global-undo-tree-mode))


;; which-key ens mostra quines comandes podem usar a partir de la
;; combinació que portem. Prova de fer C-x i esperar un moment.
(use-package which-key
  :init
  (setq  which-key-idle-delay 0.35)
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom))


;; yasnippet ens proporciona templates per tots els llenguatges de
;; programació que et puguis imaginar. Escriu 'def' o 'class' en un
;; fitxer Python i usa TAB.
;; Per coneixer més templates, pots cotillejar la pestanya YASnippet,
;; en trobaràs més de les que recordaràs.
(use-package yasnippet
  :config
  (yas-global-mode 1))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuració de paquets                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Les variables de custom les modifica el propi emacs des dels menús
;; de Custom, que ens permeten configurar des de la interfície
;; gràfica. Millor no tocar aquestes variables si no sabem el que fem

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
