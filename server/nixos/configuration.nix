# configuration.nix

# --------------------------------------------------------------------------------------
# --# INIT SETUP & SERVICES #-----------------------------------------------------------

{ config, pkgs, ... }:

{
    # Include the results of the hardware scan
    imports = [ ./hardware-configuration.nix ];

    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Support NTFS drives
    boot.supportedFilesystems = [ "ntfs" ];

    # Enable networking
    networking.hostName = "nixos";
    # networking.wireless.enable = true;
    networking.networkmanager.enable = true;

    # Locale 
    time.timeZone = "Australia/Melbourne";
    i18n.defaultLocale = "en_AU.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_AU.UTF-8";
        LC_IDENTIFICATION = "en_AU.UTF-8";
        LC_MEASUREMENT = "en_AU.UTF-8";
        LC_MONETARY = "en_AU.UTF-8";
        LC_NAME = "en_AU.UTF-8";
        LC_NUMERIC = "en_AU.UTF-8";
        LC_PAPER = "en_AU.UTF-8";
        LC_TELEPHONE = "en_AU.UTF-8";
        LC_TIME = "en_AU.UTF-8";
    };

    # X11 Services 
    services.xserver.enable = true;     # Enable the X11 windowing system 
    services.xserver = {                # Configure keymap in X11
        layout = "au";
        xkbVariant = "";
    };

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;
        # use the example session manager (no others are packaged yet so this is 
        # enabled by default,no need to redefine it in your config for now)
        #media-session.enable = true;
    };

    # Define a user account
    users.users.karsh = {
        isNormalUser = true;
        description = "karsh";
        extraGroups = [ "networkmanager" "wheel" ]; #"docker" ];
        packages = with pkgs; [
        ];
    };

    # Set up docker 
    # users.extraGroups.docker.members = [ "username-with-access-to-socket" ];
    # virtualisation.docker.enable = true;

    # Set up virt-manager. not required for when just qemu is required
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;

    # Set ZSH as default Shell
    programs.zsh.enable = true;
    users.defaultUserShell=pkgs.zsh; 
    users.users.karsh.shell = pkgs.zsh; 

    # SystemD service: Limit battery charge over 80%
    systemd.services.battery-limit = {
        enable = true;
        description = "Set the battery charge threshold";
        unitConfig = {
            Type = "oneshot";
            Restart = "on-failure";
        };
        serviceConfig = {
            ExecStart = "/run/current-system/sw/bin/bash -c 'echo 80 >> /sys/class/power_supply/BAT1/charge_control_end_threshold'";
        };
        wantedBy = [ "multi-user.target" ];
    };
    

# --------------------------------------------------------------------------------------
# --# PACKAGES #------------------------------------------------------------------------

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    services.flatpak.enable = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        # Level Zero
        firejail wget curl zsh flatpak gnupg file pinentry-gnome

        # Compression
        unzip zip 

        # Config Tools 
        # gnome.gnome-tweaks xdg-ninja gradience

        # Dev Utils
        git neovim tmux bat eza xxd gnumake lf lazygit gdb # docker docker-compose
		rustup cargo go gcc clang-tools ghidra-bin 
        xfce.mousepad mate.mate-terminal onefetch
        qemu virt-manager

        # System Tools
        bitwarden libreoffice brave tor-browser btop wl-clipboard bandwhich starship

        # Security
        chkrootkit sherlock

        # Media & Communication
        minecraft gimp vlc yt-dlp-light armcord
    ];

    # Remove default Gnome packages 
    environment.gnome.excludePackages = with pkgs.gnome; [
		eog epiphany gedit simple-scan totem yelp geary gnome-characters gnome-contacts
		pkgs.gnome-console pkgs.gnome-text-editor gnome-logs gnome-maps gnome-music 
		gnome-weather gnome-software
    ];

    # Remove default xorg packages
    services.xserver.excludePackages = [ pkgs.xterm ];

    # Remove Nano
    # programs.nano.enable = false

# --------------------------------------------------------------------------------------
# --# FIREJAIL CONFIG #-----------------------------------------------------------------

    # Enable Firejail globally
    # programs.firejail.enable = true;

    programs.firejail = {
        enable = true;
        wrappedBinaries = {
            signal-desktop = {
                executable = "${pkgs.signal-desktop}/bin/signal-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland";
                profile = "${pkgs.firejail}/etc/firejail/signal-desktop.profile";
                extraArgs = [ "--env=GTK_THEME=Adwaita:dark" ];
            };

            vesktop = {
                executable = "${pkgs.vesktop}/bin/vesktop";
                profile = "${pkgs.firejail}/etc/firejail/discord.profile";
            };
        };
    };

# --------------------------------------------------------------------------------------
# --# ENABLE SERVICES #-----------------------------------------------------------------

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #     enable = true;
    #   enableSSHSupport = true;
    # };

    # Enable GNU GPG
    programs.gnupg = {
        agent = {
            enable = true;
            pinentryFlavor = "tty";
        };
    };

    # Enable garbage collection
    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
    };


# --------------------------------------------------------------------------------------
# --# NIX FLAKES #----------------------------------------------------------------------

nix.settings.experimental-features = [ "nix-command" "flakes" ];


# --------------------------------------------------------------------------------------
# --# VERSION & CHANNEL #---------------------------------------------------------------

    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "23.11";     # Did you read the comment?
}

