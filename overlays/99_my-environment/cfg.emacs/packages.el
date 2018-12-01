(add-to-list 'load-path "~/.nix-profile/share/emacs/site-lisp/")

(setq
 package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
		    ("melpa"        . "https://melpa.org/packages/")
		    ("gnu"          . "https://elpa.gnu.org/packages/"))

 package-selected-packages '(bitbake
			     company-ghci
			     counsel
			     dante
			     editorconfig
			     elfeed
			     evil
			     flycheck-haskell
			     flycheck-rust
			     haskell-mode
			     ivy
			     ivy-historian
			     ivy-hydra
			     ivy-rich
			     ivy-rtags
			     magit
			     markdown-mode
			     nix-mode
			     rtags
			     rust-mode
			     ;;scion
			     yaml-mode))

(package-refresh-contents)
(package-install-selected-packages)
