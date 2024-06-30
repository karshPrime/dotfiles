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
    networking.networkmanager.enable = true;

    # Tailscale
    services.tailscale.enable = true;

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

    # Enable sound with pipewire
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    # Define a user account
    users.users.karsh = {
        isNormalUser = true;
        description = "karsh";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

    # Set up virt-manager
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;

    # Set ZSH as default Shell
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;
    users.users.karsh.shell = pkgs.zsh;

    # SystemD service: Limit battery charge over 80%
    systemd.services.battery-limit = {
        enable = true;
        description = "Set the battery charge threshold";
        serviceConfig = {
            ExecStart = "/run/current-system/sw/bin/bash -c 'echo 80 > /sys/class/power_supply/BAT1/charge_control_end_threshold'";
        };
        wantedBy = [ "multi-user.target" ];
    };


# --------------------------------------------------------------------------------------
# --# PACKAGES #------------------------------------------------------------------------

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        # Level Zero
        firejail wget curl zsh gnupg file qemu tailscale

        # Compression
        unzip zip 

        # Dev Utils
        git neovim tmux bat eza xxd gnumake lf lazygit gdb
        rustup cargo go gcc clang-tools

        # General Purpose Utils
        btop wl-clipboard bandwhich starship firefox

        # Security
        chkrootkit
    ];

    services.xserver.enable = true;
    services.xserver.layout = "au";
    services.xserver.xkbVariant = "";

    # Remove default xorg packages
    programs.nano.enable = false;
    services.xserver.excludePackages = [ pkgs.xterm ];

    # Enable LightDM and XFCE instead of GDM and GNOME
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.displayManager.lightdm.greeters.gtk.enable = true;
    services.xserver.desktopManager.xfce.enable = true;

    # Ensure GNOME and GDM are disabled
    services.xserver.displayManager.gdm.enable = false;
    services.xserver.desktopManager.gnome.enable = false;


# --------------------------------------------------------------------------------------
# --# ENABLE SERVICES #-----------------------------------------------------------------

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;
    # services.openssh.settings.permitRootLogin = "no";
    # services.openssh.settings.gatewayPorts = "yes";

    networking.firewall = {
        enable = true;
        allowedTCPPorts = [ 22 ];
        extraCommands = ''
            iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 22
        '';
    };

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
# --# VERSION & CHANNEL #---------------------------------------------------------------

    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "23.11";     # Did you read the comment?
}

