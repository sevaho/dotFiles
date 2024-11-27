# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/docker.nix
      ../../modules/i18n.nix
      ../../modules/networking.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd = {
    enable = true; # this is true by default
    wantedBy = [ "multi-user.target" ]; # add this if you want the unit to auto start at boot time 
  };

  # ENV VARS
  environment.variables.XCURSOR_SIZE = "20";
 
  # Hardware
  hardware = {
    # graphics = {
    #   enable = true;
    #   # driSupport = true;
    #   enable32Bit = true;
    # };
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  # Optimize Nix-Store During Rebuilds
  # NOTE: Optimizes during builds - results in slower builds
  nix.settings.auto-optimise-store = true;

  # Purge Unused Nix-Store Entries
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  nixpkgs.config.allowUnfree = true;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];
  services.xserver.autorun = false;
  services.xserver.displayManager.startx.enable = true;


  services.xrdp.enable = true;
  # https://nixos.wiki/wiki/Remote_Deskto
  services.xrdp.defaultWindowManager = "startplasma-x11";
  services.xrdp.openFirewall = true;


  services.flatpak.enable = true;

  # Minimal configuration for NFS support with Vagrant.
  services.nfs.server.enable = true;

  # ===============================================
  # i3
  # ===============================================
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      i3lock
      i3-gaps
      dmenu

      # x specifics
      xorg.xf86videoamdgpu
      xclip
      xsel
    ];
  };


  
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable bluetooth.
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;
  services.udisks2.enable = true;


  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sevaho = {
    initialPassword = "foobar";
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "libvirtd"]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
       wget
    ];
    openssh.authorizedKeys.keyFiles = [ ./public-keys/id_rsa.pub ./public-keys/tablet.pub ./public-keys/macos.pub ];
  };

  users.users.sevaho-remote = {
    initialPassword = "foobar";
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "libvirtd"]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
       wget
    ];
    openssh.authorizedKeys.keyFiles = [ ./public-keys/id_rsa.pub ./public-keys/tablet.pub ./public-keys/macos.pub ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
    lact
    git
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    htop
    brave
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
     pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = true;
    settings = {
      default-cache-ttl = 345600000;
      max-cache-ttl = 345600000;

    };
  };


  # List services that you want to enable:
  services.fail2ban = {
    enable = true;
   # Ban IP after 3 failures
    maxretry = 3;
    ignoreIP = [
     "192.168.0.0/24"
    ];
    bantime = "1h"; # Ban IPs for one day on the first ban
    jails = {
      sshd.settings = {
	    backend = "systemd";
	    # mode = "aggressive";
      };
    };
  };

  # TEMP FIX
  # https://discourse.nixos.org/t/fail2ban-is-not-working-for-sshd-with-systemd-backend/48972/2
  services.fail2ban.package = pkgs.fail2ban.overrideAttrs(old: {
    patches = [
      (pkgs.fetchpatch {
        url = "https://github.com/fail2ban/fail2ban/commit/2fed408c05ac5206b490368d94599869bd6a056d.patch";
        hash = "sha256-uyrCdcBm0QyA97IpHzuGfiQbSSvhGH6YaQluG5jVIiI=";
      })
      (pkgs.fetchpatch {
        url = "https://github.com/fail2ban/fail2ban/commit/50ff131a0fd8f54fdeb14b48353f842ee8ae8c1a.patch";
        hash = "sha256-YGsUPfQRRDVqhBl7LogEfY0JqpLNkwPjihWIjfGdtnQ=";
      })
    ];
  });


  # Enable the OpenSSH daemon.
  services = {
    openssh = {
      ports = [ 54321 ];
      settings = {
        PasswordAuthentication = false;
	X11Forwarding = true;

        PermitRootLogin = "no";
      };
    };



    sshd = {
      enable = true;
    };
  };


  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

