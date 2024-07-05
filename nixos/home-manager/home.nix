{ config, pkgs, ... }:

{

    nixpkgs.config.allowUnfree = true;

    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "sevaho";
    home.homeDirectory = "/home/sevaho";

    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "application/pdf" = "zathura.desktop";
            "text/html" = "org.qutebrowser.qutebrowser.desktop";
            "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
            "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
            "x-scheme-handler/about" = "org.qutebrowser.qutebrowser.desktop";
            "x-scheme-handler/unknown" = "org.qutebrowser.qutebrowser.desktop";
        };
    };


    # environment.sessionVariables.DEFAULT_BROWSER = "${pkgs.qutebrowser}/bin/qutebrowser";

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages = [
        # # Adds the 'hello' command to your environment. It prints a friendly
        # # "Hello, world!" when run.
        # pkgs.polybar
        (pkgs.polybar.override { i3Support = true;  alsaSupport = true; })

        pkgs.tmux
        pkgs.zlib
        pkgs.pciutils
        pkgs.hack-font
        pkgs.redshift
        pkgs.dunst
        pkgs.feh
        pkgs.picom
        pkgs.lm_sensors
        pkgs.atuin
        pkgs.eza
        pkgs.bat
        pkgs.neovim
        pkgs.brave
        pkgs.wget
        pkgs.mesa-demos
        pkgs.amdgpu_top
        pkgs.autorandr
        pkgs.arandr
        pkgs.htop
        pkgs.lshw
        pkgs.alacritty
        pkgs.bluez
        pkgs.gnumake
        pkgs.nvme-cli
        pkgs.tree
        pkgs.unzip
        pkgs.findutils
        pkgs.coreutils
        pkgs.atuin
        pkgs.udiskie
        pkgs.redshift
        pkgs.libnotify
        pkgs.gopass
        pkgs.killall
        pkgs.rofi
        pkgs.docker-compose
        pkgs.insync
        pkgs.openvpn
        pkgs.obsidian
        pkgs.jetbrains.datagrip
        pkgs.prismlauncher
        pkgs.libuv
        pkgs.fastfetch
        pkgs.bind
        pkgs.qutebrowser
        pkgs.lf
        pkgs.pinentry-curses
        pkgs.gnupg
        pkgs.mpv
        pkgs.dmidecode
        pkgs.helix
        pkgs.scrot
        pkgs.lazygit
        pkgs.zathura
        pkgs.maim
        pkgs.ripgrep
        pkgs.entr
        pkgs.tig
        pkgs.libreoffice
        pkgs.kubectl
        pkgs.kubectx
        pkgs.pgcli
        pkgs.pavucontrol
        pkgs.pstree
        pkgs.drone
        pkgs.zoxide
        pkgs.jq
        pkgs.i2c-tools
        pkgs.inetutils
        pkgs.gopls
        pkgs.xournalpp
        pkgs.httpie
        pkgs.mprocs
        pkgs.woeusb-ng
        pkgs.age



        # # It is sometimes useful to fine-tune packages, for example, by applying
        # # overrides. You can do that directly here, just don't forget the
        # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
        # # fonts?
        # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

        # # You can also create simple shell scripts directly inside your
        # # configuration. For example, this adds a command 'my-hello' to your
        # # environment:
        # (pkgs.writeShellScriptBin "my-hello" ''
        #   echo "Hello, ${config.home.username}!"
        # '')
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.file = {
        # # Building this configuration will create a copy of 'dotfiles/screenrc' in
        # # the Nix store. Activating the configuration will then make '~/.screenrc' a
        # # symlink to the Nix store copy.
        # ".screenrc".source = dotfiles/screenrc;

        # # You can also set the file content immediately.
        # ".gradle/gradle.properties".text = ''
        #   org.gradle.console=verbose
        #   org.gradle.daemon.idletimeout=3600000
        # '';
    };

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. These will be explicitly sourced when using a
    # shell provided by Home Manager. If you don't want to manage your shell
    # through Home Manager then you have to manually source 'hm-session-vars.sh'
    # located at either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/sevaho/etc/profile.d/hm-session-vars.sh
    #
    # ENVIRONMENT VARIABLES
    home.sessionVariables = {
        EDITOR = "neovim";
        PAGER = "less";
        BROWSER = "${pkgs.qutebrowser}/bin/qutebrowser";
        DEFAULT_BROWSER = "${pkgs.qutebrowser}/bin/qutebrowser";
    };


    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    # Fuzzy finder
    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
    };

    # Golang
    programs.go = {
        enable = true;
        goPath = ".go";
    };

    # GPG config
    programs.gpg.enable = true;

    # But of course
    programs.git = import ./git.nix { inherit pkgs; };

    # helix
    programs.helix = import ./helix.nix { inherit pkgs; };

    # zsh
    # TODO:  <12-06-24, Sebastiaan Van Hoecke> -Fix me
    # programs.zsh = import ./zsh.nix { inherit pkgs; };


    programs.alacritty.enable = true;
    programs.alacritty.settings = {
        mouse.hide_when_typing = true;
        live_config_reload = true;
        window.opacity = 0.9;
        keyboard.bindings = [
        { key = "p"; mods = "Super"; action = "Paste"; }
        { key = "c"; mods = "Super"; action = "Copy"; }
        { key = "k"; mods = "Super|Shift"; action = "IncreaseFontSize"; }
        { key = "j"; mods = "Super|Shift"; action = "DecreaseFontSize"; }
        ];
    };

    programs.lazygit.enable = true;
    programs.lazygit.settings = {
        services = {"gitlab.wegroup.io" = "gitlab:gitlab.wegroup.io"; };
    };



    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "24.05"; # Please read the comment before changing.

}
