{ config, pkgs, ... }:
{

    # Options can be found here:
    # https://daiderd.com/nix-darwin/manual/index.html

	# List packages installed in system profile. To search by name, run:
      	# $ nix-env -qaP | grep wget
      	environment.systemPackages =
        [ 
	   	pkgs.vim
		pkgs.just
        ];

      	# Auto upgrade nix package and the daemon service.
      	services.nix-daemon.enable = true;
      	# nix.package = pkgs.nix;


      	# Necessary for using flakes on this system.
      	nix.settings.experimental-features = "nix-command flakes";

	# Create /etc/zshrc that loads the nix-darwin environment.
	programs.zsh.enable = true;  # default shell on catalina

	# programs.fish.enable = true;

        # Set Git commit hash for darwin-version.
        # system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 5;

    services.yabai.enable = true;
    services.yabai.config = {
        focus_follows_mouse = "off";
        layout = "bsp";
    };

    services.skhd.enable = true;
    services.skhd.skhdConfig = "
        # focus window
        lcmd - return : open -n /Applications/Alacritty.app
        lcmd - h : yabai -m window --focus west
        lcmd - j : yabai -m window --focus south
        lcmd - k : yabai -m window --focus north
        lcmd - l : yabai -m window --focus east

        shift + lcmd  - h : yabai -m window --swap west
        shift + lcmd  - j : yabai -m window --swap south
        shift + lcmd  - k : yabai -m window --swap north
        shift + lcmd  - l : yabai -m window --swap east

        shift + lcmd - f : yabai -m window --toggle native-fullscreen
        shift + lcmd - e : yabai -m window --toggle split

        lcmd - s : scratchpad --toggle alacritty
        lcmd - y : scratchpad --toggle alacritty
        alt - t : scratchpad --toggle alacritty
    ";
    # services.spacebar.enable = true;
    # services.spacebar.config = {
    #     clock_format     = "%R";
    #     background_color = "0xff202020";
    #     foreground_color = "0xffa8a8a8";
    # };

  	fonts.packages = [
    		pkgs.monaspace
  	];

	homebrew = {
		enable = true;

	    casks = [
	      "google-drive"
	      "brave-browser"
	      "obsidian"
	      "raycast"
	      "alacritty"
	      "qutebrowser"
	      "iterm2"
	      "windows-app"
	      "spotify"
	      "visual-studio-code"
	      "desktoppr"
	      "karabiner-elements"
	    ];
	  };

      # set background

      system.activationScripts.postUserActivation.enable = true;
      system.activationScripts.postUserActivation.text = "
        skhd -r
        /usr/local/bin/desktoppr /Users/sevaho/Pictures/background.png
      ";

	  system.defaults = {
	    dock = {
	      autohide = true;
	      orientation = "bottom";
	      show-process-indicators = true;
	      show-recents = false;
	      static-only = true;
	    };
	    finder = {
	      AppleShowAllExtensions = true;
	      ShowPathbar = true;
	      FXEnableExtensionChangeWarning = false;
	    };
	    NSGlobalDomain = {
	      AppleKeyboardUIMode = 3;
	      "com.apple.keyboard.fnState" = true;
	    };
	  };


        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";

	users.users.sevaho = {
        	name = "sevaho";
        	home = "/Users/sevaho";
    	};

}

