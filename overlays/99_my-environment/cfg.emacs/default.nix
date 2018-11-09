{stdenv, bash, coreutils, emacs, glibcLocales, notmuch, tzdata, writeText}:

let
  emacsService = writeText "emacs.service" ''
    [Unit]
    Description=Emacs: the extensible, self-documenting text editor

    [Service]
    Environment="LOCALE_ARCHIVE=${glibcLocales}/lib/locale/locale-archive"
    Environment="PATH=${bash}/bin:${coreutils}/bin"
    Environment="TZDIR=${tzdata}/share/zoneinfo"
    Environment=PKG_CONFIG_PATH=$HOME/.nix-profile/lib/pkgconfig/
    Environment=C_INCLUDE_PATH=$HOME/.nix-profile/include/

    ExecStart=${bash}/bin/bash -c 'source /etc/profile; exec ${emacs}/bin/emacs --daemon'
    ExecStop=${emacs}/bin/emacsclient --eval (kill-emacs)
    Restart=always
    Type=forking

    [Install]
    WantedBy=default.target
  '';
in

stdenv.mkDerivation rec {
  name = "config-emacs";

  buildInputs = [ ];

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 "$out/target-home/DOT.config/emacs"
    install -dm 755 "$out/target-home/DOT.config/systemd/user/default.target.wants"
    install -Dm 444 ${emacsService}              "$out/target-home/DOT.config/systemd/user/emacs.service"
    install -Dm 444 ${emacsService}              "$out/target-home/DOT.config/systemd/user/default.target.wants/emacs.service"
    install -Dm 444 $src/calendar.el              $out/target-home/DOT.config/emacs/calendar.el
    install -Dm 444 $src/emacs.el.ex              $out/target-home/DOT.config/emacs/emacs.el.ex
    install -Dm 444 $src/evil.el                  $out/target-home/DOT.config/emacs/evil.el
    install -Dm 444 $src/haskell.el               $out/target-home/DOT.config/emacs/haskell.el
    install -Dm 444 $src/ivy_et_al.el             $out/target-home/DOT.config/emacs/ivy_et_al.el
    install -Dm 444 $src/keybindings_and_hooks.el $out/target-home/DOT.config/emacs/keybindings_and_hooks.el
    install -Dm 444 $src/misc.el                  $out/target-home/DOT.config/emacs/misc.el
    install -Dm 444 $src/packages.el              $out/target-home/DOT.config/emacs/packages.el
    substitute $src/email.el                      $out/target-home/DOT.config/emacs/email.el \
               --subst-var-by notmuch ${notmuch}/share/emacs/site-lisp/notmuch.el
  '';
}