(add-to-list 'load-path "~/.nix-profile/share/emacs/site-lisp/")

(setq
 package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
                    ("melpa"        . "https://melpa.org/packages/")
                    ("gnu"          . "https://elpa.gnu.org/packages/"))

 package-selected-packages '(bitbake
                             calfw
                             calfw-cal
                             company-ghci
                             counsel
                             dante
                             editorconfig
                             elfeed
                             flycheck-haskell
                             flycheck-rust
                             forecast
                             german-holidays
                             haskell-mode
                             hl-todo
                             ivy
                             ivy-historian
                             ivy-hydra
                             ivy-rich
                             ivy-rtags
                             json-mode
                             magit
                             magit-annex
                             ;;magit-todos
                             markdown-mode
                             modalka
                             nix-mode
                             pdf-tools
                             rtags
                             rust-mode
                             ;;scion
                             undo-tree
                             yaml-mode))

(package-refresh-contents)
(package-install-selected-packages)
