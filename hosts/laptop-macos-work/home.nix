{ config, pkgs, ... }:

{

    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.android_sdk.accept_license = true;

    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "sevaho";
    home.homeDirectory = "/Users/sevaho";

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages = [
    	pkgs.inetutils
        pkgs.zlib
        pkgs.hackgen-nf-font
        pkgs.nerdfonts

        pkgs.sniffnet

	# Terminal
        pkgs.htop
        pkgs.lazygit
        pkgs.helix
        pkgs.fzf
        pkgs.gopass
    ];

    home.sessionVariables = {
        PAGER = "less";
        # BROWSER = "${pkgs.qutebrowser}/bin/qutebrowser";
        # DEFAULT_BROWSER = "${pkgs.qutebrowser}/bin/qutebrowser";

        XDG_CACHE_HOME = "$HOME/.cache";
        XDG_CONFIG_DIRS = "/etc/xdg";
        XDG_CONFIG_HOME = "$HOME/.config";
        XDG_DATA_HOME = "$HOME/.local/share";
        XDG_STATE_HOME = "$HOME/.local/state";
    };




    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    programs.yazi = {
        enable = true;
    	enableFishIntegration = true;
    };

    programs.atuin = {
        enable = true;
    	enableFishIntegration = true;
	flags = [
		"--disable-up-arrow"
        ];
    };

    programs.broot = {
        enable = true;
    	enableFishIntegration = true;
    };


    programs.gpg.enable = true;

    # Fuzzy finder
    programs.fzf = {
        enable = true;
    	enableFishIntegration = true;
    };

    # Golang
    programs.go = {
        enable = true;
        goPath = ".go";
        goBin = ".go/bin";
    };

    # Use tmux
    programs.tmux = {
      enable = true;
    };


    # Neovim
    programs.neovim = {
      enable = true;
      defaultEditor = true;

      plugins = with pkgs.vimPlugins; [
        vim-git
      ];

    };

    programs.alacritty.enable = true;
    programs.alacritty.settings = {
        terminal.shell.program = "${pkgs.fish}/bin/fish";

        mouse.hide_when_typing = true;
        window.opacity = 0.94;
        keyboard.bindings = [
        { key = "p"; mods = "Super"; action = "Paste"; }
        { key = "c"; mods = "Super"; action = "Copy"; }
        { key = "k"; mods = "Super|Shift"; action = "IncreaseFontSize"; }
        { key = "j"; mods = "Super|Shift"; action = "DecreaseFontSize"; }
        { key = "Return"; mods = "Alt|Shift"; action = "SpawnNewInstance"; }
        ];

	hints.enabled = [
	  # {regex = "(ipfs:|ipns:|magnet:|mailto:|gemini://|gopher://|https://|http://|news:|file:|git://|ssh:|ftp://)[^\\u0000-\\u001F\\u007F-\\u009F<>\"\\\\s{-}\\\\^⟨⟩`]+";}
	  # { command = { program = "code", args = [ "--goto" ] }; }
	  # {mouse = { enabled = true; }; }
	];

	# Colors (Nordic)

	font = {
	  normal = {
	    family = "Hack Nerd Font";
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
 	    green = "#A3D6A9";
 	    yellow = "#F0DFAF";
 	    blue = "#8FB4D8";
 	    magenta = "#C7A9D9";
 	    cyan = "#B6D7A8";
 	    white = "#BDC5BD";
          };
	  bright = {
 	    black = "#727C7C";
 	    red = "#D18FAF";
 	    green = "#B7CEB0";
 	    yellow = "#BCBCBC";
 	    blue = "#E0CF9F";
 	    magenta = "#C7A9D9";
 	    cyan = "#BBDA97";
 	    white = "#BDC5BD";
          };
	  selection = {
            text = "#000000";
            background = "#F0DFAF";
          };
        };
    };

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            ll = "ls -l";
            vim = "nvim";
            v = "nvim";
        };
        history = {
                size = 10000;
                path = "${config.xdg.dataHome}/zsh/history";
        };
    };
    programs.fish = {
        enable = true;
        # enableCompletion = true;
        # autosuggestion.enable = true;
        # syntaxHighlighting.enable = true;

	interactiveShellInit = ''
	    set -g fish_key_bindings fish_default_key_bindings
	      bind \cc kill-whole-line repaint
	      bind \ck up-or-search
	      bind \cj down-or-search
	'';

        shellAliases = {
            ll = "ls -l";
            vim = "nvim";
            v = "nvim";
            gp = "git pull";
            gits = "git status";
            gda = "git diff -a";
            lg = "lazygit";
            lf = "yazi";
        };
        # history = {
        #         size = 10000;
        #         path = "${config.xdg.dataHome}/fish/history";
        # };
    };

    programs.zoxide = {
	enable = true;
	enableFishIntegration = true;
	options = [
	    "--cmd c"
	];
    };


    programs.nix-index.enable = true;



    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "24.05"; # Please read the comment before changing.

}
