(
  ;; Doom emacs
  ("doom" . ((user-emacs-directory . "~/.emacs.d.shims/doom/sources")
              (env . (("DOOMDIR" . "~/.emacs.d.shims/doom/doom.d")))))

  ;; Newbie configuration for iTIC students
  ("newbie" . ((user-emacs-directory . "~/.emacs.d.shims/newbie/newbie.d")
               (user-init-file . "~/.emacs.d.shims/newbie/newbie.d/init.el")))

  ;; Spacemacs
  ("spacemacs" . ((user-emacs-directory . "~/.emacs.d.shims/spacemacs/sources")
                  (env . (("SPACEMACSDIR" . "~/.emacs.d.shims/spacemacs/spacemacs.d")))))

  ;; Vanilla emacs (white canvas to start new configurations)
  ("vanilla" . ((user-emacs-directory . "~/.emacs.d.shims/vanilla/vanilla.d"))))
