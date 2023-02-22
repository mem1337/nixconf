{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot = { 
  loader.systemd-boot.enable = true;
  loader.efi.canTouchEfiVariables = true;
  loader.efi.efiSysMountPoint = "/boot/efi";
  kernelPackages = pkgs.linuxPackages_zen;
  };

  networking.hostName = "aleks"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  # Select internationalisation properties.
  i18n = {
  	defaultLocale = "en_US.UTF-8";
  };

  time = {
    timeZone = "Europe/Istanbul";
    hardwareClockInLocalTime = true;
  };

  # Enable the X11 windowing system and drivers (and misc)
  zramSwap.enable = true;
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;
  hardware.opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
      };
      
  # Enable the Gnome Desktop Environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

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
    jack.enable = true;
  };

  services.tailscale.enable = true;
  programs.gamemode.enable = true;
  programs.dconf.enable = true;
  networking = {
    nameservers = [ "100.100.100.100" "1.1.1.1" ];
    search = [ "tail47254.ts.net" ];
    firewall.checkReversePath = "loose";
  };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aleks = {
    isNormalUser = true;
    description = "aleks";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  system.stateVersion = "23.05"; # Did you read the comment?
}
