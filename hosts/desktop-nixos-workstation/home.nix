
{ config, pkgs, outputs, ... }:

{

    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "sevaho";
    home.homeDirectory = "/home/sevaho";

    imports = [
        ../../programs/git.nix
    ];

    # xdg.portal = {
    #     enable = false;
    #     config.common.default = "*";
    #     extraPortals = with pkgs; [
    #         xdg-desktop-portal-gtk
    #     ];
    # };

    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "application/pdf" = "zathura.desktop";
            "text/html" = "firefox.desktop";
            "x-scheme-handler/http" = "firefox.desktop";
            "x-scheme-handler/https" = "firefox.desktop";
            "x-scheme-handler/about" = "firefox.desktop";
            "x-scheme-handler/unknown" = "firefox.desktop";
        };
    };


    nixpkgs = {
        overlays = [
            outputs.overlays.unstable-packages
        ];

        config = {
            allowUnfree = true;
            android_sdk.accept_license = true;
        };
  };


    # environment.sessionVariables.DEFAULT_BROWSER = "${pkgs.qutebrowser}/bin/qutebrowser";

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages = [
        # Add packages like pkgs.mypackage or pkgs.stable.mypackage to rely on stable branch

        (pkgs.polybar.override { i3Support = true;  alsaSupport = true; })

        pkgs.tmux
        pkgs.zlib
        pkgs.pciutils
        pkgs.hackgen-nf-font
        pkgs.nerd-fonts.hack
        pkgs.nerd-fonts.zed-mono
        pkgs.font-awesome
        pkgs.nerd-fonts.jetbrains-mono
        pkgs.nerd-fonts.fira-mono
        pkgs.nerd-fonts.symbols-only
        pkgs.redshift
        pkgs.dunst
        pkgs.feh
        pkgs.picom
        pkgs.brave
        pkgs.mesa-demos
        pkgs.amdgpu_top
        pkgs.autorandr
        pkgs.arandr
        pkgs.htop
        pkgs.lshw
        pkgs.bluez
        pkgs.gnumake
        pkgs.just
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
        pkgs.bind
        pkgs.qutebrowser
        pkgs.pinentry-curses
        pkgs.gnupg
        pkgs.dmidecode
        pkgs.scrot
        pkgs.zathura
        pkgs.maim
        pkgs.libreoffice
        pkgs.kubectl
        pkgs.krew
        pkgs.pavucontrol
        pkgs.jq
        pkgs.i2c-tools
        pkgs.inetutils
        pkgs.xournalpp
        pkgs.unstable.httpie
        pkgs.mprocs
        pkgs.gcc
        pkgs.killall
        pkgs.arc-theme
        pkgs.mpv
        pkgs.ffmpeg_7-full
        pkgs.freerdp3
        pkgs.sysstat

        pkgs.xdotool

        # ID CARD READER
        pkgs.eid-mw

        pkgs.unstable.uv

        pkgs.python3
        pkgs.python3Packages.pipx
        pkgs.python3Packages.distutils

        # android
        pkgs.usbutils
        pkgs.android-tools
        pkgs.android-studio

        # reverse engineering android
        pkgs.jadx
        pkgs.frida-tools
        pkgs.apktool

        # temporary mail
        pkgs.tmpmail

	    # LANGUAGE SERVERS
        pkgs.pyright
        pkgs.gopls
        pkgs.zls
        pkgs.nil
        pkgs.nixd
        pkgs.pgformatter
        pkgs.dprint
        pkgs.html-tidy

	    # TERMINAL
        pkgs.alacritty
        pkgs.kubectx
        pkgs.pstree
        pkgs.zoxide
        pkgs.pgcli
        pkgs.fastfetch
        pkgs.age
        pkgs.lm_sensors
        pkgs.wget
        pkgs.atuin
        pkgs.eza
        pkgs.bat
        pkgs.fd
        pkgs.neovim
        pkgs.serpl
        pkgs.hurl
        pkgs.unstable.wiremix

        pkgs.ripgrep
        pkgs.ripgrep-all
        pkgs.entr
        pkgs.tig
        pkgs.atac
        pkgs.unstable.yazi
        pkgs.ueberzugpp
        pkgs.peek
        pkgs.openssl
        pkgs.ueberzugpp
        pkgs.ttyper
        pkgs.pre-commit
        pkgs.dfc
        pkgs.ncdu
        pkgs.tree-sitter
        pkgs.devbox
        pkgs.unstable.claude-code

	    # Security testing tools
        pkgs.nmap
        pkgs.rustscan # faster nmap)
        pkgs.burpsuite
        pkgs.zap
        pkgs.wireshark
        pkgs.metasploit
        # pkgs.ida-free

	    # AI
        pkgs.ollama

	    # GAMES
        # pkgs.zeroad
        pkgs.zulu17 # required for some minecraft mods
        pkgs.prismlauncher # minecraft


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

    fonts.fontconfig = {
      enable = true;
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
    # THIS WONT TAKE EFFECT IF HOME MANAGER IS NOT MANAGING ZSH
    home.sessionVariables = {
        EDITOR = "neovim";
        PAGER = "less";
        # BROWSER = "${pkgs.qutebrowser}/bin/qutebrowser";
        # DEFAULT_BROWSER = "${pkgs.qutebrowser}/bin/qutebrowser";

        XDG_CACHE_HOME = "$HOME/.cache";
        XDG_CONFIG_DIRS = "/etc/xdg";
        XDG_CONFIG_HOME = "$HOME/.config";
        XDG_DATA_HOME = "$HOME/.local/share";
        XDG_STATE_HOME = "$HOME/.local/state";
    };

    dconf.enable = true;

    # Direnv
    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;

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
        goBin = ".go/bin";
    };

    # GPG config
    programs.gpg.enable = true;

    # Atuin
    programs.atuin = {
        enable = true;
    	enableZshIntegration = true;
        flags = [
            "--disable-up-arrow"
        ];
    };

    # But of course
    # programs.git = import ../../programs/git.nix { inherit pkgs; };

    # helix
    programs.helix = import ../../configs/helix.nix { inherit pkgs; };


    programs.k9s = {
        enable = true;
    };

    programs.alacritty.enable = true;

    programs.alacritty.settings = {
        mouse.hide_when_typing = true;
        general.live_config_reload = true;
        window.opacity = 0.9;
        keyboard.bindings = [
            { key = "p"; mods = "Super"; action = "Paste"; }
            { key = "c"; mods = "Super"; action = "Copy"; }
            { key = "v"; mods = "Super"; action = "ToggleViMode"; }
            { key = "k"; mods = "Super|Shift"; action = "IncreaseFontSize"; }
            { key = "j"; mods = "Super|Shift"; action = "DecreaseFontSize"; }
            { key = "Return"; mods = "Alt|Shift"; action = "SpawnNewInstance"; }
        ];

        hints.enabled = [
            {
                binding = { key = "o"; mods = "Super"; };
                regex = "(ipfs:|ipns:|magnet:|mailto:|gemini://|gopher://|https://|http://|news:|file:|git://|ssh:|ftp://)[^\\u0000-\\u001F\\u007F-\\u009F<>\"\\\\s{-}\\\\^⟨⟩`]+";
                command = "xdg-open";
                hyperlinks = true;
                mouse = { enabled = true; };
            }
        ];

	# Colors (Nordic)
        font = {
            normal = {
                family = "Hack";
                style = "Regular";
            };
        };
	    colors = {
            primary = {
                    # background = "#242933";
                    foreground = "#BBBDAF";
            };
            normal = {
                black = "#191C1D";
                red = "#BD6062";
                green = "#92c098";
                yellow = "#F0DFAF";
                blue = "#80a2c2";
                magenta = "#C7A9D9";
                cyan = "#B6D7A8";
                white = "#BDC5BD";
                };
            bright = {
                black = "#727C7C";
                red = "#bb5988";
                green = "#B7CEB0";
                yellow = "#BCBCBC";
                blue = "#E0CF9F";
                magenta = "#C7A9D9";
                cyan = "#BBDA97";
                white = "#f8f9f8";
                };
            selection = {
                text = "#000000";
                background = "#F0DFAF";
            };
        };
    };

    programs.lazygit.enable = true;
    programs.lazygit.package = pkgs.unstable.lazygit;
    programs.lazygit.settings = {
        services = {"gitlab.wegroup.io" = "gitlab:gitlab.wegroup.io"; };
    };


    programs.nix-index.enable = true;

    programs.firefox.enable = true;
    # programs.firefox.nativeMessagingHosts.packages = [ "pkgs.web-eid-app" ];


    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "24.05"; # Please read the comment before changing.

}
